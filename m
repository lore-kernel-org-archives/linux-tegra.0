From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V1] mfd: tps65910: Add wakeup support
Date: Sat, 21 Jan 2012 13:40:00 +0530
Message-ID: <4F1A72D8.90202@nvidia.com>
References: <1327057770-6688-1-git-send-email-ldewangan@nvidia.com> <20120120125152.GE18297@opensource.wolfsonmicro.com> <4F196568.1080503@nvidia.com> <20120120130201.GF18297@opensource.wolfsonmicro.com> <4F19671E.7030003@nvidia.com> <20120120131355.GG18297@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120120131355.GG18297-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: "sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "jedu-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <jedu-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, "lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <lrg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, "gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Friday 20 January 2012 06:43 PM, Mark Brown wrote:
> On Fri, Jan 20, 2012 at 06:37:42PM +0530, Laxman Dewangan wrote:
>
>>> No, that's it - when you call those userspace will get control via sysfs
>>> for turning on and off the wakeup support.
>> So should I call them in driver by default without taking parameter
>> from platform data?
> That's the normal behaviour for drivers unless there's some specific
> reason for doing something different.  The choice may well depend on the
> application software running on the system rather than the kernel.
Ok, going through the details of documentation under 
/sys/devices/.../power/wakeup files of
power/device.txt, i think following should be the change if we want to 
control the wakeup control
through user sapce:
During initialization of device, we need to tell that device is wakeup 
capable and hence we need to
call the: device_wakeup_init() and device_set_wakeup_capable(dev, true).

Then it exposes the required sysfs to userspace to select the wakeup 
enable or not i.e. power/wakeup
to be written as enabled or disabled.

Based on user selection, the function device_may_wakeup() will return 
true/false based on
power/wakeup enabled/disabled.
So before entering into the suspend, we need to check this function and 
call enable_irq_wakeup() to
have the wakeup enabled actually in the soc. In resume we need to call 
disable_irq_wake() again.

If this is correct approach then I can push the another patch.
