From: "Bedia, Vaibhav" <vaibhav.bedia-l0cyMroinI0@public.gmane.org>
Subject: RE: [PATCH v1 3/3] ARM: tegra: cpuidle driver for tegra
Date: Fri, 27 Jan 2012 06:59:03 +0000
Message-ID: <B5906170F1614E41A8A28DE3B8D1214331791EA6@DBDE01.ent.ti.com>
References: <1327594923-21822-1-git-send-email-pdeschrijver@nvidia.com>
 <1327594923-21822-4-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1327594923-21822-4-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jan 26, 2012 at 21:52:03, Peter De Schrijver wrote:
[...]
> +static int tegra_idle_enter_lp3(struct cpuidle_device *dev,
> +	struct cpuidle_driver *drv, int index)
> +{
> +	ktime_t enter, exit;
> +	s64 us;
> +
> +	local_irq_disable();
> +	local_fiq_disable();
> +
> +	enter = ktime_get();
> +
> +	tegra_cpu_wfi();
> +
> +	exit = ktime_sub(ktime_get(), enter);
> +	us = ktime_to_us(exit);
> +
> +	local_fiq_enable();
> +	local_irq_enable();
> +
> +	dev->last_residency = us;
> +
> +	return index;
> +}

You can probably drop local_irq_disable() and local_irq_enable().
