From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] regulator: Fix deadlock during regulator registration
Date: Wed, 30 Mar 2016 17:46:05 +0100
Message-ID: <56FC02CD.60107@nvidia.com>
References: <1459354153-6352-1-git-send-email-jonathanh@nvidia.com>
 <20160330161831.GE2350@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160330161831.GE2350-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 30/03/16 17:18, Mark Brown wrote:
> * PGP Signed by an unknown key
> 
> On Wed, Mar 30, 2016 at 05:09:13PM +0100, Jon Hunter wrote:
> 
>>  INFO: task swapper/0:1 blocked for more than 120 seconds.
>>  Not tainted 4.6.0-rc1-00001-g5e3ca2b-dirty #290
>>  "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>>  swapper/0 D c07daeac 0 1 0 0x00000000
>>  [<c07daeac>] (__schedule) from [<c07db454>] (schedule+0x50/0xc0)
>>  [<c07db454>] (schedule) from [<c07db6b0>] (schedule_preempt_disabled+0x24/0x40)
> 
> Please don't paste entire backlogs into changelogs, they're *enormous*,
> mostly noise and obscure any actual content that's in there through
> denial of service.  If they're useful then include edited subsets that
> highlight the relevant sections of the backtrace so your changelog is
> more legible.

Ok, no problem. Are you happy with the patch otherwise? If so, do you want me to resend or do you wish to trim the backlog? I think that this part is interesting ...

INFO: task swapper/0:1 blocked for more than 120 seconds.
 Not tainted 4.6.0-rc1-00001-g5e3ca2b-dirty #290
 "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
 swapper/0 D c07daeac 0 1 0 0x00000000
 [<c07daeac>] (__schedule) from [<c07db454>] (schedule+0x50/0xc0)
 [<c07db454>] (schedule) from [<c07db6b0>] (schedule_preempt_disabled+0x24/0x40)
 [<c07db6b0>] (schedule_preempt_disabled) from [<c07ddd48>] (__mutex_lock_slowpath+0x17c/0x3e4)
 [<c07ddd48>] (__mutex_lock_slowpath) from [<c07ddfbc>] (mutex_lock+0xc/0x24)
 [<c07ddfbc>] (mutex_lock) from [<c03ab5f0>] (regulator_dev_lookup+0x130/0x208)
 [<c03ab5f0>] (regulator_dev_lookup) from [<c03aedd0>] (regulator_resolve_supply+0x94/0x2bc)
 [<c03aedd0>] (regulator_resolve_supply) from [<c04364e4>] (class_for_each_device+0x54/0xa8)
 [<c04364e4>] (class_for_each_device) from [<c03ae0a4>] (regulator_register+0x8cc/0xd10)
 [<c03ae0a4>] (regulator_register) from [<c03b0000>] (devm_regulator_register+0x40/0x74)
 [<c03b0000>] (devm_regulator_register) from [<c03b2ef0>] (palmas_smps_registration+0x254/0x3fc)
 [<c03b2ef0>] (palmas_smps_registration) from [<c03b3400>] (palmas_regulators_probe+0x368/0x424)
 [<c03b3400>] (palmas_regulators_probe) from [<c0436b1c>] (platform_drv_probe+0x50/0xb0)
 ...

Jon
