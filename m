From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC v2 5/5] drm: Add NVIDIA Tegra support
Date: Tue, 21 Aug 2012 12:42:35 -0600
Message-ID: <5033D69B.8020104@wwwdotorg.org>
References: <1335347102-14905-1-git-send-email-thierry.reding@avionic-design.de> <1335347102-14905-6-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1335347102-14905-6-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/25/2012 03:45 AM, Thierry Reding wrote:
> This commit adds a very basic DRM driver for NVIDIA Tegra SoCs. It
> currently has rudimentary GEM support and can run a console on the
> framebuffer as well as X using the xf86-video-modesetting driver. Only
> the RGB output is supported.
> 
> HDMI support was taken from NVIDIA's Linux kernel tree but it doesn't
> quite work. EDID data can be retrieved but the output doesn't properly
> activate the connected TV.
> 
> The DSI and TVO outputs and the HOST1X driver are just stubs that setup
> the corresponding resources but don't do anything useful yet.

> diff --git a/drivers/gpu/drm/tegra/tegra-dc.c b/drivers/gpu/drm/tegra/tegra-dc.c

> +	switch (crtc->fb->pixel_format) {
> +	case DRM_FORMAT_XRGB8888:
> +		win.fmt = WIN_COLOR_DEPTH_R8G8B8A8;

I think that should be WIN_COLOR_DEPTH_B8G8R8A8 instead. At least,
making that change solves the R/B color swap on my Springbank(Seaboard)
board. The component ordering in the names matches better, so it seems
likely this is generally applicable.

The same comment applies in the default case below.

BTW, I added these patches to a kernel based on next-20120820, and will
be using a netbook running with them to take notes at the conference
next week. It's awesome to be running a Tegra system with graphics using
100% Open-Source and nearly 100% upstream SW (even all the
BCT/bootloader/flashing tools too).
