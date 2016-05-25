From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] arm64: defconfig: Enable cros-ec and battery driver
Date: Wed, 25 May 2016 16:57:02 +0100
Message-ID: <5745CB4E.4030803@nvidia.com>
References: <1462290318-9074-1-git-send-email-rklein@nvidia.com>
 <5744609A.1000008@nvidia.com>
 <324dfe74-4fc0-d500-91ac-2a802562e92f@nvidia.com>
 <5745853B.1040304@nvidia.com> <57458693.3050700@nvidia.com>
 <20160525154618.GD13765@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160525154618.GD13765-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 25/05/16 16:46, Thierry Reding wrote:

...

> How about this, which should be the most minimal to fix it (though it's
> completely untested) and still update the internal cache (it just won't
> signal an supply change, which wouldn't work at this point anyway). The
> patch makes up for the supply change notification by doing that instead
> of a full bq27xxx_battery_update() at the end of ->probe(). This should
> take care of always sending out a uevent on successful probe, whereas a
> bq27xxx_battery_update() at the end of ->probe() may not send one if it
> is presented with the same data.
> 
> Thierry
> --- >8 ---
> diff --git a/drivers/power/bq27xxx_battery.c b/drivers/power/bq27xxx_battery.c
> index 45f6ebf88df6..df1b4cb2bbc2 100644
> --- a/drivers/power/bq27xxx_battery.c
> +++ b/drivers/power/bq27xxx_battery.c
> @@ -717,7 +717,13 @@ void bq27xxx_battery_update(struct bq27xxx_device_info *di)
>  			di->charge_design_full = bq27xxx_battery_read_dcap(di);
>  	}
>  
> -	if (di->cache.capacity != cache.capacity)
> +	/*
> +	 * This function ends up being called while the power supply is being
> +	 * registered, hence di->bat will be NULL on the first call, causing
> +	 * power_supply_changed() to oops. Avoid that by checking if we have
> +	 * been registered already or not.
> +	 */
> +	if (di->bat && di->cache.capacity != cache.capacity)
>  		power_supply_changed(di->bat);
>  
>  	if (memcmp(&di->cache, &cache, sizeof(cache)) != 0)
> @@ -984,7 +990,7 @@ int bq27xxx_battery_setup(struct bq27xxx_device_info *di)
>  
>  	dev_info(di->dev, "support ver. %s enabled\n", DRIVER_VERSION);
>  
> -	bq27xxx_battery_update(di);
> +	power_supply_changed(di->bat);
>  
>  	return 0;
>  }

I think that would work too, my only concern is that this assumes that
bq27xxx_battery_update() is called during the registration of the power
supply. Looking at the backtrace from the panic we have ...

[    1.984150] [<ffff000008614984>] bq27xxx_battery_update+0x88/0x51c
[    1.990321] [<ffff000008615084>] bq27xxx_battery_poll+0x24/0x70
[    1.996231] [<ffff000008615180>] bq27xxx_battery_get_property+0xb0/0x3b4
[    2.002923] [<ffff0000086133d8>] power_supply_read_temp+0x2c/0x54
[    2.009005] [<ffff000008616508>] thermal_zone_get_temp+0x5c/0x11c
[    2.015089] [<ffff0000086183b0>] thermal_zone_device_update+0x34/0xb4
[    2.021518] [<ffff0000086193b4>] thermal_zone_device_register+0x87c/0x8cc
[    2.028295] [<ffff000008613b6c>] __power_supply_register+0x370/0x430
[    2.034638] [<ffff000008613c54>] power_supply_register_no_ws+0x10/0x18
[    2.041155] [<ffff000008614f1c>] bq27xxx_battery_setup+0x104/0x15c
[    2.047325] [<ffff000008615668>] bq27xxx_battery_i2c_probe+0xd0/0x1b0

Here bq27xxx_battery_update() is being called during the thermal zone
registration and so as long as all bq27xxx devices have a
POWER_SUPPLY_PROP_TEMP property then it *should* be ok. It would only
break if there was a new bq27xxx with no temp support. May be that is
a bit fragile and we are better off explicitly calling 
bq27xxx_battery_update()?

Cheers
Jon
 
-- 
nvpublic
