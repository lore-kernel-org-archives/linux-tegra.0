From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: ASoC HDMI codec location
Date: Tue, 15 Feb 2011 23:58:33 +0000
Message-ID: <20110215235832.GB2462@opensource.wolfsonmicro.com>
References: <74CDBE0F657A3D45AFBB94109FB122FF03112A51BE@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF03112A51BE-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Feb 15, 2011 at 12:29:59PM -0800, Stephen Warren wrote:

> I see that a Samsung chip has such a codec in drivers/video/sh_mobile_hdmi.c.

That's not Samsung, that's Renesas' SuperH.

> The equivalent for Tegra would be drivers/video/tegra/dc/hdmi.c. Note that
> this location doesn't yet exist upstream. I just wanted to confirm that this
> location makes sense to you, vs. implementing a codec in sound/soc/tegra/hdmi.c,
> and having that call functions exposed by the Tegra dc/hdmi.c driver?

Note that the SH code has code in *both* locations - there's an ASoC
driver that calls into the video driver as well under sound/soc/sh.

> Note that the SPDIF controller isn't involved in the Tegra Digital Audio
> Switch muxing/switching module at all.

Is the DMA shared?
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
