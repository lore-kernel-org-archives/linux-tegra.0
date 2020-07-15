From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH v3 08/18] media: tegra-video: Fix channel format alignment
Date: Tue, 14 Jul 2020 21:20:45 -0700
Message-ID: <1594786855-26506-9-git-send-email-skomatineni@nvidia.com>
References: <1594786855-26506-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1594786855-26506-1-git-send-email-skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, sakari.ailus-X3B1VOXEql0@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org
Cc: digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Pixel format width is mistakenly aligned to surface align bytes
and altering width to aligned value may force sensor mode change
other than the requested one and also cause mismatch in width
programmed between sensor and vi which can lead to capture errors.

This patch removes width alignment and clamps width as per Tegra
minimum and maximum limits.

Signed-off-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/staging/media/tegra-video/vi.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index a3b9b21..0ae1771 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -359,25 +359,15 @@ static void tegra_channel_fmt_align(struct tegra_vi_channel *chan,
 				    struct v4l2_pix_format *pix,
 				    unsigned int bpp)
 {
-	unsigned int align;
-	unsigned int min_width;
-	unsigned int max_width;
-	unsigned int width;
 	unsigned int min_bpl;
 	unsigned int max_bpl;
 	unsigned int bpl;
 
 	/*
-	 * The transfer alignment requirements are expressed in bytes. Compute
-	 * minimum and maximum values, clamp the requested width and convert
-	 * it back to pixels. Use bytesperline to adjust the width.
+	 * The transfer alignment requirements are expressed in bytes.
+	 * Clamp the requested width and height to the limits.
 	 */
-	align = lcm(SURFACE_ALIGN_BYTES, bpp);
-	min_width = roundup(TEGRA_MIN_WIDTH, align);
-	max_width = rounddown(TEGRA_MAX_WIDTH, align);
-	width = roundup(pix->width * bpp, align);
-
-	pix->width = clamp(width, min_width, max_width) / bpp;
+	pix->width = clamp(pix->width, TEGRA_MIN_WIDTH, TEGRA_MAX_WIDTH);
 	pix->height = clamp(pix->height, TEGRA_MIN_HEIGHT, TEGRA_MAX_HEIGHT);
 
 	/* Clamp the requested bytes per line value. If the maximum bytes per
-- 
2.7.4
