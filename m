From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH V1] mfd: tps65910: Add wakeup support
Date: Sat, 21 Jan 2012 12:51:23 +0000
Message-ID: <20120121125123.GB10206@opensource.wolfsonmicro.com>
References: <1327057770-6688-1-git-send-email-ldewangan@nvidia.com>
 <20120120125152.GE18297@opensource.wolfsonmicro.com>
 <4F196568.1080503@nvidia.com>
 <20120120130201.GF18297@opensource.wolfsonmicro.com>
 <4F19671E.7030003@nvidia.com>
 <20120120131355.GG18297@opensource.wolfsonmicro.com>
 <4F1AA084.9080502@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F1AA084.9080502-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "jedu-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <jedu-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, "lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, "gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sat, Jan 21, 2012 at 04:54:52PM +0530, Laxman Dewangan wrote:

> During initialization of device, we need to tell that device is
> wakeup capable and hence we need to call the: device_wakeup_init()
> and device_set_wakeup_capable(dev, true).
> Then it exposes the required sysfs to userspace to select the wakeup
> enable or not i.e. power/wakeup to be written as enabled or
> disabled.
> Based on user selection, the function device_may_wakeup() will
> return true/false based on  power/wakeup enabled/disabled. So before
> entering into the suspend, we need to check this function and call
> enable_irq_wakeup() to have the wakeup enabled actually in the soc.
> In resume we need to call disable_irq_wake() again.

Yes, that sounds about right.  You don't strictly need to worry about
the wake setup except when suspending but it tends to be easier to
implement that way.
