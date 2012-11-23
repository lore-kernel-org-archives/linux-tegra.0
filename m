From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] drm: tegra: Use framebuffer pitch as line stride
Date: Fri, 23 Nov 2012 07:54:03 +0200
Message-ID: <50AF0F7B.7080601@nvidia.com>
References: <1353613037-15808-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1353613037-15808-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Dave Airlie <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 22.11.2012 21:37, Thierry Reding wrote:
> Instead of using the stride derived from the display mode, use the pitch
> associated with the currently active framebuffer. This fixes a bug where
> the LCD display content would be skewed when enabling HDMI with a video
> mode different from that of the LCD.

Hi

This might fix the issue we had with the stride when doing our 2D
blitting on frame buffer. I'll test with your patch instead. We were
using a different stride due to limitations of 2D unit, so we hacked
this into our code:

diff --git a/drivers/gpu/drm/drm_fb_cma_helper.c
b/drivers/gpu/drm/drm_fb_cma_he
index fd9d0af..65b12ba 100644
--- a/drivers/gpu/drm/drm_fb_cma_helper.c
+++ b/drivers/gpu/drm/drm_fb_cma_helper.c
@@ -214,7 +214,7 @@ static int drm_fbdev_cma_create(struct drm_fb_helper
*helper

        mode_cmd.width = sizes->surface_width;
        mode_cmd.height = sizes->surface_height;
-       mode_cmd.pitches[0] = sizes->surface_width * bytes_per_pixel;
+       mode_cmd.pitches[0] = roundup(sizes->surface_width *
bytes_per_pixel, 32);
        mode_cmd.pixel_format =
drm_mode_legacy_fb_format(sizes->surface_bpp,
                sizes->surface_depth);

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index b9e5a79..d70c488 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -219,7 +219,7 @@ static int tegra_crtc_mode_set(struct drm_crtc *crtc,
        }

        bpp = crtc->fb->bits_per_pixel / 8;
-       win.stride = win.outw * bpp;
+       win.stride = roundup(win.outw * bpp, 32);

        /* program window registers */
        value = tegra_dc_readl(dc, DC_CMD_DISPLAY_WINDOW_HEADER);
