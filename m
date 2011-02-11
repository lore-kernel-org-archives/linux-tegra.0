From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 3/7] ASoC: WM8903: Handle micdet_cfg more safely
Date: Fri, 11 Feb 2011 08:06:29 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF0310F605F3@HQMAIL01.nvidia.com>
References: <1297377439-27382-1-git-send-email-swarren@nvidia.com>
 <1297377439-27382-3-git-send-email-swarren@nvidia.com>
 <20110211111144.GC7180@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110211111144.GC7180-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: "lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Mark Brown wrote at Friday, February 11, 2011 4:12 AM:
> 
> On Thu, Feb 10, 2011 at 03:37:15PM -0700, Stephen Warren wrote:
> 
> > Specifically, if WM8903_MICDET_ENA and WM8903_MICBIAS_ENA are both part
> > of micdet_cfg, and a mic is plugged in when the driver initializes, the
> > interrupt will fire almost immediately. However, at that point, the
> > micdet interrupt is probably still masked, and hence wm8903_irq does
> > not handle it. However, the act of reading the interrupt status
> > register in the ISR clears the micdet interrupt status, so it is lost.
> 
> > To avoid this, refuse to write any fields from micdet_cfg to the
> > register except those simply configuring detection thresholds; actual
> > enabling of mic detecion should always be implemented by calling
> > wm8903_mic_detect().
> 
> As well as being detected via the main interrupt of the WM8903 the
> detection signals can also be brought out to the WM8903 GPIOs directly,
> allowing detection to operate without any I2C I/O.  That mode can be
> configured via platform data only and the WM8903 microphone detection
> functions will never be called so the user needs to be able to enable
> detection via platform data.

Oh yes, of course.

Probably the best thing is to disable, then immediately re-enable the
relevant fields (micdet_ena) in the register during wm8903_mic_detect.
That will turn off the HW mic detection module, then start detection
afresh, hence causing the "initial" interrupt to fire when desired.

I'll take a crack at getting that working.

-- 
nvpublic

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
