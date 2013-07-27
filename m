From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] spi/tegra-sflash: Factor runtime PM out into transfer prepare/unprepare
Date: Sat, 27 Jul 2013 12:31:01 +0100
Message-ID: <1374924661-31306-1-git-send-email-broonie@kernel.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Currently the tegra sflash driver acquires a runtime PM reference for the
duration of each transfer. This may result in the IP being powered down
between transfers which would be at best wasteful. Instead it is better
to do this in the callbacks that are generated before and after starting
a series of transfers, keeping the IP powered throughout.

Signed-off-by: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/spi/spi-tegra20-sflash.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/spi/spi-tegra20-sflash.c b/drivers/spi/spi-tegra20-sflash.c
index c1d5d95..f871c4e 100644
--- a/drivers/spi/spi-tegra20-sflash.c
+++ b/drivers/spi/spi-tegra20-sflash.c
@@ -325,6 +325,20 @@ static int tegra_sflash_setup(struct spi_device *spi)
 	return 0;
 }
 
+static int tegra_sflash_prepare_transfer(struct spi_master *spi)
+{
+	struct tegra_sflash_data *tsd = spi_master_get_devdata(spi);
+	int ret;
+
+	ret = pm_runtime_get_sync(tsd->dev);
+	if (ret < 0) {
+		dev_err(tsd->dev, "runtime PM get failed: %d\n", ret);
+		return ret;
+	}
+
+	return ret;
+}
+
 static int tegra_sflash_transfer_one_message(struct spi_master *master,
 			struct spi_message *msg)
 {
@@ -335,12 +349,6 @@ static int tegra_sflash_transfer_one_message(struct spi_master *master,
 	struct spi_device *spi = msg->spi;
 	int ret;
 
-	ret = pm_runtime_get_sync(tsd->dev);
-	if (ret < 0) {
-		dev_err(tsd->dev, "pm_runtime_get() failed, err = %d\n", ret);
-		return ret;
-	}
-
 	msg->status = 0;
 	msg->actual_length = 0;
 	single_xfer = list_is_singular(&msg->transfers);
@@ -380,10 +388,18 @@ exit:
 	tegra_sflash_writel(tsd, tsd->def_command_reg, SPI_COMMAND);
 	msg->status = ret;
 	spi_finalize_current_message(master);
-	pm_runtime_put(tsd->dev);
 	return ret;
 }
 
+static int tegra_sflash_unprepare_transfer(struct spi_master *spi)
+{
+	struct tegra_sflash_data *tsd = spi_master_get_devdata(spi);
+
+	pm_runtime_put(tsd->dev);
+
+	return 0;
+}
+
 static irqreturn_t handle_cpu_based_xfer(struct tegra_sflash_data *tsd)
 {
 	struct spi_transfer *t = tsd->curr_xfer;
@@ -476,7 +492,9 @@ static int tegra_sflash_probe(struct platform_device *pdev)
 	/* the spi->mode bits understood by this driver: */
 	master->mode_bits = SPI_CPOL | SPI_CPHA;
 	master->setup = tegra_sflash_setup;
+	master->prepare_transfer_hardware = tegra_sflash_prepare_transfer;
 	master->transfer_one_message = tegra_sflash_transfer_one_message;
+	master->unprepare_transfer_hardware = tegra_sflash_unprepare_transfer;
 	master->num_chipselect = MAX_CHIP_SELECT;
 	master->bus_num = -1;
 
-- 
1.8.3.2
