From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2] regulator: tps65910: Sleep control through external
 inputs
Date: Wed, 25 Jan 2012 19:37:15 +0530
Message-ID: <4F200C93.30502@nvidia.com>
References: <1327489068-9460-1-git-send-email-ldewangan@nvidia.com> <20120125124250.GH3687@opensource.wolfsonmicro.com> <4F1FF9EF.9000004@nvidia.com> <20120125125020.GI3687@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120125125020.GI3687-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: "lrg-l0cyMroinI0@public.gmane.org" <lrg-l0cyMroinI0@public.gmane.org>, "jedu-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <jedu-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, "sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org" <gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wednesday 25 January 2012 06:20 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Wed, Jan 25, 2012 at 06:17:43PM +0530, Laxman Dewangan wrote:
>> On Wednesday 25 January 2012 06:12 PM, Mark Brown wrote:
>>> This really isn't what the set_mode() API is for - especially the fact
>>> that it supports turning the regulator off which really isn't what
>>> set_mode() is supposed to do.  A generic driver using this API isn't
>>> going to play too well.
>> Then what should be the method? Is it through the macro similar to
>> patch V1 where LOW_POWER mode option come from platform data? The
>> idea  is to set the regulator in OFF or low power mode based on
>> external control.
> Like I said we've got the various suspend callbacks for setting the
> behaviour in suspend mode.
Then in this case, I will implement the
set_suspend_enable() and put the device in low power mode.
set_suspend_disable() and put the device in full power, normal mode.
set_suspend_mode(): based on mode and external control, either it will 
call existing set_mode() if it is not externally controlled otherwise 
set the mode locally for the case of externally controlled.

The board file will set the regulator_state accordingly for a given 
requirements through the constraints.

Does it make sense?


> * Unknown Key
> * 0x6E30FDDD
