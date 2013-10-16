From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 1/2] spi/tegra20-slink: Crude refactoring to use core message parsing
Date: Wed, 16 Oct 2013 22:00:54 +0100
Message-ID: <1381957255-24344-1-git-send-email-broonie@kernel.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

This is a half done conversion with minimal code reorganisation provided
for bisection purposes. A further patch will move the first transfer
preparation into tegra_slink_prepare_message().

Signed-off-by: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/spi/spi-tegra20-slink.c | 88 +++++++++++++++++++++--------------------
 1 file changed, 46 insertions(+), 42 deletions(-)

diff --git a/drivers/spi/spi-tegra20-slink.c b/drivers/spi/spi-tegra20-slink.c
index f8d4ef5..bb28033 100644
--- a/drivers/spi/spi-tegra20-slink.c
+++ b/drivers/spi/spi-tegra20-slink.c
@@ -196,6 +196,7 @@ struct tegra_slink_data {
 	u32					rx_status;
 	u32					status_reg;
 	bool					is_packed;
+	bool                                    is_first_msg;
 	unsigned long				packed_size;
 
 	u32					command_reg;
@@ -823,55 +824,56 @@ static int tegra_slink_setup(struct spi_device *spi)
 	return 0;
 }
 
-static int tegra_slink_transfer_one_message(struct spi_master *master,
-			struct spi_message *msg)
+static int tegra_slink_prepare_message(struct spi_master *master,
+				       struct spi_message *msg)
 {
-	bool is_first_msg = true;
 	struct tegra_slink_data *tspi = spi_master_get_devdata(master);
-	struct spi_transfer *xfer;
-	struct spi_device *spi = msg->spi;
-	int ret;
 
-	msg->status = 0;
-	msg->actual_length = 0;
+	tspi->is_first_msg = true;
 
-	list_for_each_entry(xfer, &msg->transfers, transfer_list) {
-		INIT_COMPLETION(tspi->xfer_completion);
-		ret = tegra_slink_start_transfer_one(spi, xfer, is_first_msg);
-		if (ret < 0) {
-			dev_err(tspi->dev,
-				"spi can not start transfer, err %d\n", ret);
-			goto exit;
-		}
-		is_first_msg = false;
-		ret = wait_for_completion_timeout(&tspi->xfer_completion,
-						SLINK_DMA_TIMEOUT);
-		if (WARN_ON(ret == 0)) {
-			dev_err(tspi->dev,
-				"spi trasfer timeout, err %d\n", ret);
-			ret = -EIO;
-			goto exit;
-		}
+	return 0;
+}
 
-		if (tspi->tx_status ||  tspi->rx_status) {
-			dev_err(tspi->dev, "Error in Transfer\n");
-			ret = -EIO;
-			goto exit;
-		}
-		msg->actual_length += xfer->len;
-		if (xfer->cs_change && xfer->delay_usecs) {
-			tegra_slink_writel(tspi, tspi->def_command_reg,
-					SLINK_COMMAND);
-			udelay(xfer->delay_usecs);
-		}
+static int tegra_slink_transfer_one(struct spi_master *master,
+				    struct spi_device *spi,
+				    struct spi_transfer *xfer)
+{
+	struct tegra_slink_data *tspi = spi_master_get_devdata(master);
+	int ret;
+
+	INIT_COMPLETION(tspi->xfer_completion);
+	ret = tegra_slink_start_transfer_one(spi, xfer, tspi->is_first_msg);
+	if (ret < 0) {
+		dev_err(tspi->dev,
+			"spi can not start transfer, err %d\n", ret);
+		return ret;
 	}
-	ret = 0;
-exit:
+	tspi->is_first_msg = false;
+	ret = wait_for_completion_timeout(&tspi->xfer_completion,
+					  SLINK_DMA_TIMEOUT);
+	if (WARN_ON(ret == 0)) {
+		dev_err(tspi->dev,
+			"spi trasfer timeout, err %d\n", ret);
+		return -EIO;
+	}
+
+	if (tspi->tx_status)
+		return tspi->tx_status;
+	if (tspi->rx_status)
+		return tspi->rx_status;
+
+	return 0;
+}
+
+static int tegra_slink_unprepare_message(struct spi_master *master,
+					 struct spi_message *msg)
+{
+	struct tegra_slink_data *tspi = spi_master_get_devdata(master);
+
 	tegra_slink_writel(tspi, tspi->def_command_reg, SLINK_COMMAND);
 	tegra_slink_writel(tspi, tspi->def_command2_reg, SLINK_COMMAND2);
-	msg->status = ret;
-	spi_finalize_current_message(master);
-	return ret;
+
+	return 0;
 }
 
 static irqreturn_t handle_cpu_based_xfer(struct tegra_slink_data *tspi)
@@ -1074,7 +1076,9 @@ static int tegra_slink_probe(struct platform_device *pdev)
 	/* the spi->mode bits understood by this driver: */
 	master->mode_bits = SPI_CPOL | SPI_CPHA | SPI_CS_HIGH;
 	master->setup = tegra_slink_setup;
-	master->transfer_one_message = tegra_slink_transfer_one_message;
+	master->prepare_message = tegra_slink_prepare_message;
+	master->transfer_one = tegra_slink_transfer_one;
+	master->unprepare_message = tegra_slink_unprepare_message;
 	master->auto_runtime_pm = true;
 	master->num_chipselect = MAX_CHIP_SELECT;
 	master->bus_num = -1;
-- 
1.8.4.rc3
