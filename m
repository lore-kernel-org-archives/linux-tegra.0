From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v3 06/10] pwm: Add NVIDIA Tegra SoC support
Date: Tue, 28 Feb 2012 13:14:35 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF17BDDF1E63@HQMAIL01.nvidia.com>
References: <1329923841-32017-1-git-send-email-thierry.reding@avionic-design.de>
 <1329923841-32017-7-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1329923841-32017-7-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Thierry Reding wrote at Wednesday, February 22, 2012 8:17 AM:
> This commit adds a generic PWM framework driver for the PWFM controller
> found on NVIDIA Tegra SoCs. The driver is based on code from the
> Chromium kernel tree and was originally written by Gary King (NVIDIA)
> and later modified by Simon Que (Chromium).

> diff --git a/drivers/pwm/pwm-tegra.c b/drivers/pwm/pwm-tegra.c

> +static int tegra_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,

> +	/*
> +	 * Convert from duty_ns / period_ns to a fixed number of duty
> +	 * ticks per (1 << PWM_DUTY_WIDTH) cycles.
> +	 */
> +	c = duty_ns * ((1 << PWM_DUTY_WIDTH) - 1);

The driver in ChromeOS has the following extra line here:

    c += (period_ns / 2);

and the following extra line in the comment above:

    Also, make sure to round to the nearest integer during division.

I don't know the HW well enough to know if that line should be present?

Otherwise, this looks similar enough to the ChromeOS driver, so:

Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

-- 
nvpublic
