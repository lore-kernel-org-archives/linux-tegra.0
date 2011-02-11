From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [alsa-devel] [PATCH 3/7] ASoC: WM8903: Handle micdet_cfg more
 safely
Date: Fri, 11 Feb 2011 18:09:03 +0000
Message-ID: <20110211180903.GB901@opensource.wolfsonmicro.com>
References: <1297377439-27382-1-git-send-email-swarren@nvidia.com>
 <1297377439-27382-3-git-send-email-swarren@nvidia.com>
 <20110211111144.GC7180@opensource.wolfsonmicro.com>
 <74CDBE0F657A3D45AFBB94109FB122FF0310F605F3@HQMAIL01.nvidia.com>
 <74CDBE0F657A3D45AFBB94109FB122FF0310F60628@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF0310F60628-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Feb 11, 2011 at 09:29:06AM -0800, Stephen Warren wrote:

> Strangely, modifying wm8903_mic_detect() to:

> * Unconditionally clear MICDET_ENA
> * Update the IRQ mask like it does today
> * Re-enable MICDET_ENA if det||shrt

> Doesn't actually solve the problem. I guess disabling MICDET_ENA doesn't
> actually reset the mic detection state machine.

That's kind of what I expect - remember that the microphone detection
interrupst doesn't report the microphone status directly, they report
deltas in the reported microphone status after debouncing.

> Anyway, as you said, perhaps just documenting how to set up micdet_cfg
> in the platform_data header is indeed the best way, since everything
> works without any code changes if I simply don't set MICDET_ENA in
> micdet_cfg.

Yes, and it's not a particularly useful thing to do so I'm pretty
comfortable just telling people not do do that.
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
