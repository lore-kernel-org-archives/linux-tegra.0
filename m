From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2 2/4] staging: iio: light: of: Fix vendor prefix of isl29018/isl29028
Date: Mon, 23 Apr 2012 17:41:35 +0530
Message-ID: <1335183097-21104-4-git-send-email-ldewangan@nvidia.com>
References: <1335183097-21104-1-git-send-email-ldewangan@nvidia.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1335183097-21104-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

ISL29018/ISL29028 is from Intersil Corporation and making the
vendor prefix for this part as "isil" for OF compatibity.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Changes from V1:
- Vendor prefix is now "isil"

 drivers/staging/iio/light/isl29018.c |    2 +-
 drivers/staging/iio/light/isl29028.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/iio/light/isl29018.c b/drivers/staging/iio/light/isl29018.c
index 073e899..1ec2dac 100644
--- a/drivers/staging/iio/light/isl29018.c
+++ b/drivers/staging/iio/light/isl29018.c
@@ -596,7 +596,7 @@ static const struct i2c_device_id isl29018_id[] = {
 MODULE_DEVICE_TABLE(i2c, isl29018_id);
 
 static const struct of_device_id isl29018_of_match[] = {
-	{ .compatible = "invn,isl29018", },
+	{ .compatible = "isil,isl29018", },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, isl29018_of_match);
diff --git a/drivers/staging/iio/light/isl29028.c b/drivers/staging/iio/light/isl29028.c
index 4ac49aa..7057d9b 100644
--- a/drivers/staging/iio/light/isl29028.c
+++ b/drivers/staging/iio/light/isl29028.c
@@ -542,7 +542,7 @@ static const struct i2c_device_id isl29028_id[] = {
 MODULE_DEVICE_TABLE(i2c, isl29028_id);
 
 static const struct of_device_id isl29028_of_match[] = {
-	{ .compatible = "isl,isl29028", },
+	{ .compatible = "isil,isl29028", },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, isl29028_of_match);
-- 
1.7.1.1
