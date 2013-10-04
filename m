From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: [PATCH] spi/tegra20-slink: Remove unused is_single_xfer check
Date: Fri,  4 Oct 2013 16:42:55 +0100
Message-ID: <1380901375-9901-1-git-send-email-broonie@kernel.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Currently transfer_one_message() checks to see if the message consists of
a single spi_transfer and tells _start_transfer_one() but it just ignores
this. Don't bother.

Signed-off-by: Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 drivers/spi/spi-tegra20-slink.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-tegra20-slink.c b/drivers/spi/spi-tegra20-slink.c
index c74ee87..f8d4ef5 100644
--- a/drivers/spi/spi-tegra20-slink.c
+++ b/drivers/spi/spi-tegra20-slink.c
@@ -707,8 +707,7 @@ static void tegra_slink_deinit_dma_param(struct tegra_slink_data *tspi,
 }
 
 static int tegra_slink_start_transfer_one(struct spi_device *spi,
-		struct spi_transfer *t, bool is_first_of_msg,
-		bool is_single_xfer)
+		struct spi_transfer *t, bool is_first_of_msg)
 {
 	struct tegra_slink_data *tspi = spi_master_get_devdata(spi->master);
 	u32 speed;
@@ -828,7 +827,6 @@ static int tegra_slink_transfer_one_message(struct spi_master *master,
 			struct spi_message *msg)
 {
 	bool is_first_msg = true;
-	int single_xfer;
 	struct tegra_slink_data *tspi = spi_master_get_devdata(master);
 	struct spi_transfer *xfer;
 	struct spi_device *spi = msg->spi;
@@ -837,11 +835,9 @@ static int tegra_slink_transfer_one_message(struct spi_master *master,
 	msg->status = 0;
 	msg->actual_length = 0;
 
-	single_xfer = list_is_singular(&msg->transfers);
 	list_for_each_entry(xfer, &msg->transfers, transfer_list) {
 		INIT_COMPLETION(tspi->xfer_completion);
-		ret = tegra_slink_start_transfer_one(spi, xfer,
-					is_first_msg, single_xfer);
+		ret = tegra_slink_start_transfer_one(spi, xfer, is_first_msg);
 		if (ret < 0) {
 			dev_err(tspi->dev,
 				"spi can not start transfer, err %d\n", ret);
-- 
1.8.4.rc3
