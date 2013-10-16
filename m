From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH 2/2] spi/tegra20-slink: Move first transfer preparation to prepare_message
Date: Wed, 16 Oct 2013 22:00:55 +0100
Message-ID: <1381957255-24344-2-git-send-email-broonie@kernel.org>
References: <1381957255-24344-1-git-send-email-broonie@kernel.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381957255-24344-1-git-send-email-broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

This is more idiomatic for the factored out message processing and gives a
small simplification of the code since we always set the per-transfer
parameters in the same fashion.

Signed-off-by: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/spi/spi-tegra20-slink.c | 55 +++++++++++++++++++----------------------
 1 file changed, 25 insertions(+), 30 deletions(-)

diff --git a/drivers/spi/spi-tegra20-slink.c b/drivers/spi/spi-tegra20-slink.c
index bb28033..175a2ff 100644
--- a/drivers/spi/spi-tegra20-slink.c
+++ b/drivers/spi/spi-tegra20-slink.c
@@ -196,7 +196,6 @@ struct tegra_slink_data {
 	u32					rx_status;
 	u32					status_reg;
 	bool					is_packed;
-	bool                                    is_first_msg;
 	unsigned long				packed_size;
 
 	u32					command_reg;
@@ -708,7 +707,7 @@ static void tegra_slink_deinit_dma_param(struct tegra_slink_data *tspi,
 }
 
 static int tegra_slink_start_transfer_one(struct spi_device *spi,
-		struct spi_transfer *t, bool is_first_of_msg)
+		struct spi_transfer *t)
 {
 	struct tegra_slink_data *tspi = spi_master_get_devdata(spi->master);
 	u32 speed;
@@ -732,32 +731,12 @@ static int tegra_slink_start_transfer_one(struct spi_device *spi,
 	tspi->curr_xfer = t;
 	total_fifo_words = tegra_slink_calculate_curr_xfer_param(spi, tspi, t);
 
-	if (is_first_of_msg) {
-		tegra_slink_clear_status(tspi);
+	command = tspi->command_reg;
+	command &= ~SLINK_BIT_LENGTH(~0);
+	command |= SLINK_BIT_LENGTH(bits_per_word - 1);
 
-		command = tspi->def_command_reg;
-		command |= SLINK_BIT_LENGTH(bits_per_word - 1);
-		command |= SLINK_CS_SW | SLINK_CS_VALUE;
-
-		command2 = tspi->def_command2_reg;
-		command2 |= SLINK_SS_EN_CS(spi->chip_select);
-
-		command &= ~SLINK_MODES;
-		if (spi->mode & SPI_CPHA)
-			command |= SLINK_CK_SDA;
-
-		if (spi->mode & SPI_CPOL)
-			command |= SLINK_IDLE_SCLK_DRIVE_HIGH;
-		else
-			command |= SLINK_IDLE_SCLK_DRIVE_LOW;
-	} else {
-		command = tspi->command_reg;
-		command &= ~SLINK_BIT_LENGTH(~0);
-		command |= SLINK_BIT_LENGTH(bits_per_word - 1);
-
-		command2 = tspi->command2_reg;
-		command2 &= ~(SLINK_RXEN | SLINK_TXEN);
-	}
+	command2 = tspi->command2_reg;
+	command2 &= ~(SLINK_RXEN | SLINK_TXEN);
 
 	tegra_slink_writel(tspi, command, SLINK_COMMAND);
 	tspi->command_reg = command;
@@ -828,8 +807,24 @@ static int tegra_slink_prepare_message(struct spi_master *master,
 				       struct spi_message *msg)
 {
 	struct tegra_slink_data *tspi = spi_master_get_devdata(master);
+	struct spi_device *spi = msg->spi;
 
-	tspi->is_first_msg = true;
+	tegra_slink_clear_status(tspi);
+
+	tspi->command_reg = tspi->def_command_reg;
+	tspi->command_reg |= SLINK_CS_SW | SLINK_CS_VALUE;
+
+	tspi->command2_reg = tspi->def_command2_reg;
+	tspi->command2_reg |= SLINK_SS_EN_CS(spi->chip_select);
+
+	tspi->command_reg &= ~SLINK_MODES;
+	if (spi->mode & SPI_CPHA)
+		tspi->command_reg |= SLINK_CK_SDA;
+
+	if (spi->mode & SPI_CPOL)
+		tspi->command_reg |= SLINK_IDLE_SCLK_DRIVE_HIGH;
+	else
+		tspi->command_reg |= SLINK_IDLE_SCLK_DRIVE_LOW;
 
 	return 0;
 }
@@ -842,13 +837,13 @@ static int tegra_slink_transfer_one(struct spi_master *master,
 	int ret;
 
 	INIT_COMPLETION(tspi->xfer_completion);
-	ret = tegra_slink_start_transfer_one(spi, xfer, tspi->is_first_msg);
+	ret = tegra_slink_start_transfer_one(spi, xfer);
 	if (ret < 0) {
 		dev_err(tspi->dev,
 			"spi can not start transfer, err %d\n", ret);
 		return ret;
 	}
-	tspi->is_first_msg = false;
+
 	ret = wait_for_completion_timeout(&tspi->xfer_completion,
 					  SLINK_DMA_TIMEOUT);
 	if (WARN_ON(ret == 0)) {
-- 
1.8.4.rc3
