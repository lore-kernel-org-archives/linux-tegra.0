From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] arm64: defconfig: Enable cros-ec and battery driver
Date: Wed, 25 May 2016 11:58:03 +0100
Message-ID: <5745853B.1040304@nvidia.com>
References: <1462290318-9074-1-git-send-email-rklein@nvidia.com>
 <5744609A.1000008@nvidia.com>
 <324dfe74-4fc0-d500-91ac-2a802562e92f@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <324dfe74-4fc0-d500-91ac-2a802562e92f-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 24/05/16 20:08, Rhyland Klein wrote:
>> On 03/05/16 16:45, Rhyland Klein wrote:
>>> Enable the ChromeOS Embedded Controller, its I2C tunnel driver, and
>>> the BA27XXX battery driver. These are all used on the Tegra210 Smaug
>>> platform.
>>>
>>> Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> I tried booting with this patch with next-20160523 on the Tegra210 Smaug and I am seeing the following panic ...
>>
>> [    1.258116] i2c /dev entries driver
>> [    1.278519] Unable to handle kernel NULL pointer dereference at virtual address 00000378
>> [    1.286605] pgd = ffff000008cb6000
>> [    1.290000] [00000378] *pgd=000000013fffe003, *pud=000000013fffd003, *pmd=0000000000000000
>> [    1.298277] Internal error: Oops: 96000004 [#1] PREEMPT SMP
>> [    1.303839] Modules linked in:
>> [    1.306898] CPU: 3 PID: 1 Comm: swapper/0 Not tainted 4.6.0-next-20160523+ #1047
>> [    1.314284] Hardware name: Google Pixel C (DT)
>> [    1.318719] task: ffff8000bc0b0000 ti: ffff8000bc0b8000 task.ti: ffff8000bc0b8000
>> [    1.326199] PC is at _raw_spin_lock_irqsave+0x1c/0x50
>> [    1.331245] LR is at power_supply_changed+0x1c/0x60
>> [    1.336114] pc : [<ffff0000087a19a0>] lr : [<ffff000008613114>] pstate: 800000c5
>> [    1.343498] sp : ffff8000bc0bb8d0
>> [    1.346805] x29: ffff8000bc0bb8d0 x28: ffff000008c39a40 
>> [    1.352120] x27: 0000000000000000 x26: 0000000000000000 
>> [    1.357434] x25: ffff00000888a818 x24: ffff8000709d1800 
>> [    1.362747] x23: ffff800071006270 x22: 0000000000000000 
>> [    1.368061] x21: 0000000000000019 x20: 0000000000000378 
>> [    1.373373] x19: 0000000000000000 x18: ffff00000885d138 
>> [    1.378685] x17: 000000000000000e x16: 0000000000000007 
>> [    1.383998] x15: 0000000000000001 x14: ffffffffffffffff 
>> [    1.389310] x13: ffffffffffffffff x12: 0000000000000018 
>> [    1.394625] x11: 0101010101010101 x10: 0000000000000850 
>> [    1.399939] x9 : ffff8000bc0b8000 x8 : ffff8000bc0b08b0 
>> [    1.405253] x7 : 0000000002480a08 x6 : ffff8000bff9c740 
>> [    1.410567] x5 : ffff8000709d1058 x4 : 0000000000000000 
>> [    1.415880] x3 : 0000000000000001 x2 : 0000000000000040 
>> [    1.421192] x1 : ffff8000bc0b8000 x0 : 0000000000000378 
>> [    1.426506] 
>> [    1.427992] Process swapper/0 (pid: 1, stack limit = 0xffff8000bc0b8020)
>> [    1.434683] Stack: (0xffff8000bc0bb8d0 to 0xffff8000bc0bc000)
>> [    1.440419] b8c0:                                   ffff8000bc0bb900 ffff000008614984
>> [    1.448239] b8e0: ffff800071006218 0000000000000096 ffff000200010055 ffff8000bc0bb8d8
>> [    1.456059] b900: ffff8000bc0bb960 ffff000008615084 ffff800071006270 ffff000008c3a338
>> [    1.463879] b920: ffff8000710062d8 ffff8000bc0bb9f8 00097c2000000bb9 0000000000000000
>> [    1.471699] b940: 0000002300863b48 0000000000000051 0000009600000019 ffff000000000001
>> [    1.479519] b960: ffff8000bc0bb990 ffff000008615180 ffff800071006218 000000000000002e
>> [    1.487339] b980: ffff8000710062d8 ffff000008615178 ffff8000bc0bb9d0 ffff0000086133d8
>> [    1.495158] b9a0: ffff8000bc0bba7c ffff8000709d1800 ffff8000709d1800 ffff8000709d1b80
>> [    1.502977] b9c0: ffff8000bc0bba7c ffff0000082282f4 ffff8000bc0bba00 ffff000008616508
>> [    1.510797] b9e0: ffff8000709d1800 ffff0000086164f4 ffff8000709d1800 ffff00000847ecc4
>> [    1.518617] ba00: ffff8000bc0bba50 ffff0000086183b0 0000000000000000 ffff8000709d1800
>> [    1.526436] ba20: ffff8000709d1800 ffff000008c3ab50 ffff000008c3a000 ffff8000709d1818
>> [    1.534255] ba40: ffff8000709d1b48 000000007fffffff ffff8000bc0bba80 ffff0000086193b4
>> [    1.542075] ba60: 0000000000000000 ffff8000709d1818 ffff8000bc0bba80 ffff0000086191e0
>> [    1.549894] ba80: ffff8000bc0bbb20 ffff000008613b6c ffff8000bb9ca400 ffff8000bb9ca438
>> [    1.557714] baa0: ffff8000bc0bbbc0 ffff8000bb9ca020 ffff80007138e898 ffff8000bb9ca020
>> [    1.565532] bac0: ffff000008ca4000 0000000000000000 ffff000008c76000 0000000000000000
>> [    1.573352] bae0: ffff8000bb9ca400 ffff000008c3ab50 ffff80007138e898 ffff8000bb9ca020
>> [    1.581171] bb00: ffff8000709d1804 0000000000000000 ffff8000bb9ca400 0000000000000000
>> [    1.588991] bb20: ffff8000bc0bbb90 ffff000008613c54 ffff800071006218 ffff000008888e20
>> [    1.596810] bb40: ffff8000bb9ca000 ffff000008ca5000 ffff000008c3a000 ffff8000bb9ca020
>> [    1.604630] bb60: ffff000008889f18 ffff80007138e818 ffff000008c76000 0000000000000000
>> [    1.612451] bb80: ffff8000bc0bbba0 ffff8000bb9ca718 ffff8000bc0bbba0 ffff000008614f1c
>> [    1.620270] bba0: ffff8000bc0bbbe0 ffff000008615668 0000000000000000 ffff800071006218
>> [    1.628091] bbc0: 0000000000000000 ffff800071006218 0000000000000000 0000000000000000
>> [    1.635910] bbe0: ffff8000bc0bbc30 ffff0000085ffff4 ffff000008889f18 ffff8000bb9ca020
>> [    1.643730] bc00: ffff8000bb9ca004 ffff8000bb9ca000 ffff000008615598 ffff000008acb0d0
>> [    1.651549] bc20: ffff000008b2fba0 0000000000000101 ffff8000bc0bbc70 ffff0000084836dc
>> [    1.659369] bc40: ffff8000bb9ca020 0000000000000000 ffff000008ca2000 ffff000008c3a698
>> [    1.667189] bc60: 0000000000000000 0000000000000000 ffff8000bc0bbcb0 ffff000008483820
>> [    1.675009] bc80: ffff8000bb9ca020 ffff000008c3a698 ffff8000bb9ca080 0000000000000000
>> [    1.682828] bca0: ffff000008c21000 0000000000000000 ffff8000bc0bbce0 ffff000008481804
>> [    1.690647] bcc0: 0000000000000000 ffff000008c3a698 ffff00000848377c ffff8000bc0bbd30
>> [    1.698466] bce0: ffff8000bc0bbd20 ffff000008483008 ffff000008c3a698 ffff80007134fe00
>> [    1.706286] bd00: ffff000008c389f8 ffff000008799b08 ffff8000bc2f2ca8 ffff80007134fb68
>> [    1.714105] bd20: ffff8000bc0bbd30 ffff000008482c28 ffff8000bc0bbd70 ffff0000084840b8
>> [    1.721924] bd40: ffff000008c3a698 ffff8000bc0b8000 0000000000000000 ffff000008c76000
>> [    1.729743] bd60: ffff000008ae048c ffff00000833b0fc ffff8000bc0bbda0 ffff000008601f14
>> [    1.737564] bd80: ffff000008b0ffa4 ffff8000bc0b8000 0000000000000000 ffff000008485218
>> [    1.745384] bda0: ffff8000bc0bbdd0 ffff000008b0ffbc ffff000008b0ffa4 ffff000008081a54
>> [    1.753203] bdc0: ffff8000bc0bbdd0 ffff000008c3a660 ffff8000bc0bbde0 ffff000008081a54
>> [    1.761021] bde0: ffff8000bc0bbe50 ffff000008ae0ce0 ffff000008b96740 ffff000008b2fb00
>> [    1.768842] be00: 0000000000000006 ffff000008c76000 ffff8000bc0bbe00 ffff0000089d2b78
>> [    1.776662] be20: ffff000008be8b10 0000000600000006 0000000000000000 0000000000000000
>> [    1.784481] be40: ffff000008ae048c ffff000008acb0d0 ffff8000bc0bbeb0 ffff00000879b9c4
>> [    1.792300] be60: ffff00000879b9b4 0000000000000000 0000000000000000 0000000000000000
>> [    1.800120] be80: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> [    1.807940] bea0: 0000000000000000 0000000000000000 0000000000000000 ffff000008084e10
>> [    1.815759] bec0: ffff00000879b9b4 0000000000000000 0000000000000000 0000000000000000
>> [    1.823577] bee0: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> [    1.831396] bf00: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> [    1.839215] bf20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> [    1.847034] bf40: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> [    1.854853] bf60: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> [    1.862671] bf80: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> [    1.870491] bfa0: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> [    1.878310] bfc0: 0000000000000000 0000000000000000 0000000000000000 0000000000000005
>> [    1.886129] bfe0: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> [    1.893948] Call trace:
>> [    1.896389] Exception stack(0xffff8000bc0bb710 to 0xffff8000bc0bb830)
>> [    1.902818] b700:                                   0000000000000000 0000000000000378
>> [    1.910637] b720: ffff8000bc0bb8d0 ffff0000087a19a0 ffff000e0001001e ffff8000709a8018
>> [    1.918456] b740: ffff8000bc0bb780 ffff00000866a21c ffff8000bc0bb7c0 ffff00000860ffd8
>> [    1.926276] b760: 0000000000000020 ffff8000bc0bb8f0 0000000000000020 ffff80007138e398
>> [    1.934095] b780: ffff80007138e380 0000000000000002 0000000000000002 0000000000000004
>> [    1.941915] b7a0: ffff80007138e394 ffff8000bc0bb8e0 0000000000000378 ffff8000bc0b8000
>> [    1.949735] b7c0: 0000000000000040 0000000000000001 0000000000000000 ffff8000709d1058
>> [    1.957554] b7e0: ffff8000bff9c740 0000000002480a08 ffff8000bc0b08b0 ffff8000bc0b8000
>> [    1.965374] b800: 0000000000000850 0101010101010101 0000000000000018 ffffffffffffffff
>> [    1.973193] b820: ffffffffffffffff 0000000000000001
>> [    1.978064] [<ffff0000087a19a0>] _raw_spin_lock_irqsave+0x1c/0x50
>> [    1.984150] [<ffff000008614984>] bq27xxx_battery_update+0x88/0x51c
>> [    1.990321] [<ffff000008615084>] bq27xxx_battery_poll+0x24/0x70
>> [    1.996231] [<ffff000008615180>] bq27xxx_battery_get_property+0xb0/0x3b4
>> [    2.002923] [<ffff0000086133d8>] power_supply_read_temp+0x2c/0x54
>> [    2.009005] [<ffff000008616508>] thermal_zone_get_temp+0x5c/0x11c
>> [    2.015089] [<ffff0000086183b0>] thermal_zone_device_update+0x34/0xb4
>> [    2.021518] [<ffff0000086193b4>] thermal_zone_device_register+0x87c/0x8cc
>> [    2.028295] [<ffff000008613b6c>] __power_supply_register+0x370/0x430
>> [    2.034638] [<ffff000008613c54>] power_supply_register_no_ws+0x10/0x18
>> [    2.041155] [<ffff000008614f1c>] bq27xxx_battery_setup+0x104/0x15c
>> [    2.047325] [<ffff000008615668>] bq27xxx_battery_i2c_probe+0xd0/0x1b0
>> [    2.053757] [<ffff0000085ffff4>] i2c_device_probe+0x174/0x240
>> [    2.059498] [<ffff0000084836dc>] driver_probe_device+0x1fc/0x29c
>> [    2.065493] [<ffff000008483820>] __driver_attach+0xa4/0xa8
>> [    2.070969] [<ffff000008481804>] bus_for_each_dev+0x58/0x98
>> [    2.076531] [<ffff000008483008>] driver_attach+0x20/0x28
>> [    2.081832] [<ffff000008482c28>] bus_add_driver+0x1c8/0x22c
>> [    2.087395] [<ffff0000084840b8>] driver_register+0x68/0x108
>> [    2.092958] [<ffff000008601f14>] i2c_register_driver+0x38/0x7c
>> [    2.098784] [<ffff000008b0ffbc>] bq27xxx_battery_i2c_driver_init+0x18/0x20
>> [    2.105650] [<ffff000008081a54>] do_one_initcall+0x38/0x12c
>> [    2.111215] [<ffff000008ae0ce0>] kernel_init_freeable+0x148/0x1ec
>> [    2.117299] [<ffff00000879b9c4>] kernel_init+0x10/0x100
>> [    2.122516] [<ffff000008084e10>] ret_from_fork+0x10/0x40
>> [    2.127819] Code: b9401823 11000463 b9001823 f9800011 (885ffc01) 
>> [    2.133927] ---[ end trace 9759cbbac2b2ba9b ]---
>> [    2.138547] note: swapper/0[1] exited with preempt_count 1
>> [    2.144061] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
>> [    2.144061] 
>> [    2.153187] SMP: stopping secondary CPUs
>> [    2.157104] Kernel Offset: disabled
>> [    2.160584] Memory Limit: none
>> [    2.163633] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
>> [    2.163633] 
>>
>> Have you tried this recently? I have not had chance to dig into this.
>>
> 
> I haven't, but looking now, its another case where a callback triggered
> during power_supply registration was using an uninitialized pointer for
> the power_supply. This patch works for me locally, do you want to test
> it out?

Yes it does avoid the crash but ...

> diff --git a/drivers/power/power_supply_core.c
> b/drivers/power/power_supply_core.c
> index 456987c88baa..1e02eae6e4b4 100644
> --- a/drivers/power/power_supply_core.c
> +++ b/drivers/power/power_supply_core.c
> @@ -561,11 +561,15 @@ static int power_supply_read_temp(struct
> thermal_zone_device *tzd,
>  {
>  	struct power_supply *psy;
>  	union power_supply_propval val;
> -	int ret;
> +	int ret = 0;
> 
>  	WARN_ON(tzd == NULL);
> +
>  	psy = tzd->devdata;
> -	ret = psy->desc->get_property(psy, POWER_SUPPLY_PROP_TEMP, &val);
> +	WARN_ON(atomic_read(&psy->use_cnt) == 0);

... this now generates a large splat on boot.

> +
> +	if (atomic_read(&psy->use_cnt) > 0)
> +		ret = psy->desc->get_property(psy, POWER_SUPPLY_PROP_TEMP, &val);

Did you verify if this prevents the temp being read later when the
battery is polled?

Looking at this a bit more I am wondering if we should prevent the
battery for being polled before the registration has completed ...

diff --git a/drivers/power/bq27xxx_battery.c
b/drivers/power/bq27xxx_battery.c
index 45f6ebf88df6..32649183ecd9 100644
--- a/drivers/power/bq27xxx_battery.c
+++ b/drivers/power/bq27xxx_battery.c
@@ -871,12 +871,14 @@ static int bq27xxx_battery_get_property(struct
power_supply *psy,
        int ret = 0;
        struct bq27xxx_device_info *di = power_supply_get_drvdata(psy);

-       mutex_lock(&di->lock);
-       if (time_is_before_jiffies(di->last_update + 5 * HZ)) {
-               cancel_delayed_work_sync(&di->work);
-               bq27xxx_battery_poll(&di->work.work);
+       if (di->bat) {
+               mutex_lock(&di->lock);
+               if (time_is_before_jiffies(di->last_update + 5 * HZ)) {
+                       cancel_delayed_work_sync(&di->work);
+                       bq27xxx_battery_poll(&di->work.work);
+               }
+               mutex_unlock(&di->lock);
        }
-       mutex_unlock(&di->lock);

It seems that the di->bat pointer is not initialised until after the
registrations completes, but during the registration we try to reference
it when polling the battery. I believe the above is ok because we call
bq27xxx_battery_update() after registering.

Cheers
Jon

-- 
nvpublic
