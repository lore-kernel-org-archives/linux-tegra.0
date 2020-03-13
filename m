From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] backlight: lp855x: Ensure regulators are disabled on
 probe failure
Date: Fri, 13 Mar 2020 14:16:16 +0000
Message-ID: <6ec74817-968b-ab5e-6566-56bbb9b67599@nvidia.com>
References: <20200224140748.2182-1-jonathanh@nvidia.com>
 <20200224143732.rreev3ypou26hvx3@holly.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200224143732.rreev3ypou26hvx3-SoAo7ar8mTX/PtFMR13I2A@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Milo Kim <milo.kim-l0cyMroinI0@public.gmane.org>, Jingoo Han <jingoohan1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Lee, Daniel,

On 24/02/2020 14:37, Daniel Thompson wrote:
> On Mon, Feb 24, 2020 at 02:07:48PM +0000, Jon Hunter wrote:
>> If probing the LP885x backlight fails after the regulators have been
>> enabled, then the following warning is seen when releasing the
>> regulators ...
>>
>>  WARNING: CPU: 1 PID: 289 at drivers/regulator/core.c:2051 _regulator_put.part.28+0x158/0x160
>>  Modules linked in: tegra_xudc lp855x_bl(+) host1x pwm_tegra ip_tables x_tables ipv6 nf_defrag_ipv6
>>  CPU: 1 PID: 289 Comm: systemd-udevd Not tainted 5.6.0-rc2-next-20200224 #1
>>  Hardware name: NVIDIA Jetson TX1 Developer Kit (DT)
>>
>>  ...
>>
>>  Call trace:
>>   _regulator_put.part.28+0x158/0x160
>>   regulator_put+0x34/0x50
>>   devm_regulator_release+0x10/0x18
>>   release_nodes+0x12c/0x230
>>   devres_release_all+0x34/0x50
>>   really_probe+0x1c0/0x370
>>   driver_probe_device+0x58/0x100
>>   device_driver_attach+0x6c/0x78
>>   __driver_attach+0xb0/0xf0
>>   bus_for_each_dev+0x68/0xc8
>>   driver_attach+0x20/0x28
>>   bus_add_driver+0x160/0x1f0
>>   driver_register+0x60/0x110
>>   i2c_register_driver+0x40/0x80
>>   lp855x_driver_init+0x20/0x1000 [lp855x_bl]
>>   do_one_initcall+0x58/0x1a0
>>   do_init_module+0x54/0x1d0
>>   load_module+0x1d80/0x21c8
>>   __do_sys_finit_module+0xe8/0x100
>>   __arm64_sys_finit_module+0x18/0x20
>>   el0_svc_common.constprop.3+0xb0/0x168
>>   do_el0_svc+0x20/0x98
>>   el0_sync_handler+0xf4/0x1b0
>>   el0_sync+0x140/0x180
>>
>> Fix this by ensuring that the regulators are disabled, if enabled, on
>> probe failure.
>>
>> Finally, ensure that the vddio regulator is disabled in the driver
>> remove handler.
>>
>> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Reviewed-by: Daniel Thompson <daniel.thompson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
I received a bounce from Milo's email and so I am not sure that his
email address is still valid.

Can either of you pick this up?

Not sure if we should update the MAINTAINERS as well?

Jon

-- 
nvpublic
