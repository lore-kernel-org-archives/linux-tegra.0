From: Samuel Zou <zou_wei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH -next] media: tegra: Make tegra210_video_formats static
Date: Mon, 11 May 2020 19:20:15 +0800
Message-ID: <1589196015-8945-1-git-send-email-zou_wei@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Samuel Zou <zou_wei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Fix the following sparse warning:

drivers/staging/media/tegra-video/tegra210.c:589:33: warning: symbol 'tegra210_video_formats' was not declared.

The tegra210_video_formats has only call site within tegra210.c
It should be static

Fixes: 423d10a99b30 ("media: tegra: Add Tegra210 Video input driver")
Reported-by: Hulk Robot <hulkci-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Signed-off-by: Samuel Zou <zou_wei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
---
 drivers/staging/media/tegra-video/tegra210.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/tegra210.c b/drivers/staging/media/tegra-video/tegra210.c
index 2045609..3baa4e3 100644
--- a/drivers/staging/media/tegra-video/tegra210.c
+++ b/drivers/staging/media/tegra-video/tegra210.c
@@ -586,7 +586,7 @@ enum tegra210_image_format {
 }
 
 /* Tegra210 supported video formats */
-const struct tegra_video_format tegra210_video_formats[] = {
+static const struct tegra_video_format tegra210_video_formats[] = {
 	/* RAW 8 */
 	TEGRA210_VIDEO_FMT(RAW8, 8, SRGGB8_1X8, 1, T_L8, SRGGB8),
 	TEGRA210_VIDEO_FMT(RAW8, 8, SGRBG8_1X8, 1, T_L8, SGRBG8),
-- 
2.6.2
