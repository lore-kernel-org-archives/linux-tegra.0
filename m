From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 3/7] ASoC: WM8903: Handle micdet_cfg more safely
Date: Fri, 11 Feb 2011 11:11:44 +0000
Message-ID: <20110211111144.GC7180@opensource.wolfsonmicro.com>
References: <1297377439-27382-1-git-send-email-swarren@nvidia.com>
 <1297377439-27382-3-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1297377439-27382-3-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Feb 10, 2011 at 03:37:15PM -0700, Stephen Warren wrote:

> Specifically, if WM8903_MICDET_ENA and WM8903_MICBIAS_ENA are both part of
> micdet_cfg, and a mic is plugged in when the driver initializes, the interrupt
> will fire almost immediately. However, at that point, the micdet interrupt is
> probably still masked, and hence wm8903_irq does not handle it. However, the
> act of reading the interrupt status register in the ISR clears the micdet
> interrupt status, so it is lost.

> To avoid this, refuse to write any fields from micdet_cfg to the register
> except those simply configuring detection thresholds; actual enabling of mic
> detecion should always be implemented by calling wm8903_mic_detect().

As well as being detected via the main interrupt of the WM8903 the
detection signals can also be brought out to the WM8903 GPIOs directly,
allowing detection to operate without any I2C I/O.  That mode can be
configured via platform data only and the WM8903 microphone detection
functions will never be called so the user needs to be able to enable
detection via platform data.

I'll have a think and send something out later today; the easiest thing
is to add more documentation and possibly some sanity checking code in
the platform data parsing.
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
