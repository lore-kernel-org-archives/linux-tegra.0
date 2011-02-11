From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [alsa-devel] [PATCH 3/7] ASoC: WM8903: Handle micdet_cfg more
	safely
Date: Fri, 11 Feb 2011 09:29:06 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF0310F60628@HQMAIL01.nvidia.com>
References: <1297377439-27382-1-git-send-email-swarren@nvidia.com>
	<1297377439-27382-3-git-send-email-swarren@nvidia.com>
	<20110211111144.GC7180@opensource.wolfsonmicro.com>
 <74CDBE0F657A3D45AFBB94109FB122FF0310F605F3@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF0310F605F3-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Stephen Warren wrote at Friday, February 11, 2011 9:06 AM:
> 
> Mark Brown wrote at Friday, February 11, 2011 4:12 AM:
> > ...
> > As well as being detected via the main interrupt of the WM8903 the
> > detection signals can also be brought out to the WM8903 GPIOs directly,
> > allowing detection to operate without any I2C I/O.  That mode can be
> > configured via platform data only and the WM8903 microphone detection
> > functions will never be called so the user needs to be able to enable
> > detection via platform data.
> 
> Probably the best thing is to disable, then immediately re-enable the
> relevant fields (micdet_ena) in the register during wm8903_mic_detect.
> That will turn off the HW mic detection module, then start detection
> afresh, hence causing the "initial" interrupt to fire when desired.

Strangely, modifying wm8903_mic_detect() to:

* Unconditionally clear MICDET_ENA
* Update the IRQ mask like it does today
* Re-enable MICDET_ENA if det||shrt

Doesn't actually solve the problem. I guess disabling MICDET_ENA doesn't
actually reset the mic detection state machine.

Anyway, as you said, perhaps just documenting how to set up micdet_cfg
in the platform_data header is indeed the best way, since everything
works without any code changes if I simply don't set MICDET_ENA in
micdet_cfg.

-- 
nvpublic

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
