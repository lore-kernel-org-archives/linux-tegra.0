From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] spi/tegra-slink: Factor runtime PM out into transfer prepare/unprepare
Date: Sat, 27 Jul 2013 12:35:01 +0100
Message-ID: <1374924901-32499-1-git-send-email-broonie@kernel.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Currently the tegra slink driver acquires a runtime PM reference for the
duration of each transfer. This may result in the IP being powered down
between transfers which would be at best wasteful. Instead it is better
to do this in the callbacks that are generated before and after starting
a series of transfers, keeping the IP powered throughout.

Signed-off-by: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/spi/spi-tegra20-slink.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/spi/spi-tegra20-slink.c b/drivers/spi/spi-tegra20-slink.c
index 80490cc..b2fb115 100644
--- a/drivers/spi/spi-tegra20-slink.c
+++ b/drivers/spi/spi-tegra20-slink.c
@@ -824,6 +824,20 @@ static int tegra_slink_setup(struct spi_device *spi)
 	return 0;
 }
 
+static int tegra_slink_prepare_transfer(struct spi_master *spi)
+{
+	struct tegra_slink_data *tspi = spi_master_get_devdata(spi);
+	int ret;
+
+	ret = pm_runtime_get_sync(tspi->dev);
+	if (ret < 0) {
+		dev_err(tspi->dev, "runtime PM get failed: %d\n", ret);
+		return ret;
+	}
+
+	return ret;
+}
+
 static int tegra_slink_transfer_one_message(struct spi_master *master,
 			struct spi_message *msg)
 {
@@ -836,11 +850,6 @@ static int tegra_slink_transfer_one_message(struct spi_master *master,
 
 	msg->status = 0;
 	msg->actual_length = 0;
-	ret = pm_runtime_get_sync(tspi->dev);
-	if (ret < 0) {
-		dev_err(tspi->dev, "runtime get failed: %d\n", ret);
-		goto done;
-	}
 
 	single_xfer = list_is_singular(&msg->transfers);
 	list_for_each_entry(xfer, &msg->transfers, transfer_list) {
@@ -878,13 +887,20 @@ static int tegra_slink_transfer_one_message(struct spi_master *master,
 exit:
 	tegra_slink_writel(tspi, tspi->def_command_reg, SLINK_COMMAND);
 	tegra_slink_writel(tspi, tspi->def_command2_reg, SLINK_COMMAND2);
-	pm_runtime_put(tspi->dev);
-done:
 	msg->status = ret;
 	spi_finalize_current_message(master);
 	return ret;
 }
 
+static int tegra_slink_unprepare_transfer(struct spi_master *spi)
+{
+	struct tegra_slink_data *tspi = spi_master_get_devdata(spi);
+
+	pm_runtime_put(tspi->dev);
+
+	return 0;
+}
+
 static irqreturn_t handle_cpu_based_xfer(struct tegra_slink_data *tspi)
 {
 	struct spi_transfer *t = tspi->curr_xfer;
@@ -1085,7 +1101,9 @@ static int tegra_slink_probe(struct platform_device *pdev)
 	/* the spi->mode bits understood by this driver: */
 	master->mode_bits = SPI_CPOL | SPI_CPHA | SPI_CS_HIGH;
 	master->setup = tegra_slink_setup;
+	master->prepare_transfer_hardware = tegra_slink_prepare_transfer;
 	master->transfer_one_message = tegra_slink_transfer_one_message;
+	master->unprepare_transfer_hardware = tegra_slink_unprepare_transfer;
 	master->num_chipselect = MAX_CHIP_SELECT;
 	master->bus_num = -1;
 
-- 
1.8.3.2
