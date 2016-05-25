From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] arm64: defconfig: Enable cros-ec and battery driver
Date: Wed, 25 May 2016 11:49:59 -0400
Message-ID: <b9f10417-d67c-7131-84dd-68cdf92e1ab5@nvidia.com>
References: <1462290318-9074-1-git-send-email-rklein@nvidia.com>
 <5744609A.1000008@nvidia.com>
 <324dfe74-4fc0-d500-91ac-2a802562e92f@nvidia.com>
 <5745853B.1040304@nvidia.com> <57458693.3050700@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <57458693.3050700-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 5/25/2016 7:03 AM, Jon Hunter wrote:
> 
> On 25/05/16 11:58, Jon Hunter wrote:
> 
> ...

I am aware of the splat, and I was considering the proper place for
working around that.

> 
>> Looking at this a bit more I am wondering if we should prevent the
>> battery for being polled before the registration has completed ...
>>
>> diff --git a/drivers/power/bq27xxx_battery.c
>> b/drivers/power/bq27xxx_battery.c
>> index 45f6ebf88df6..32649183ecd9 100644
>> --- a/drivers/power/bq27xxx_battery.c
>> +++ b/drivers/power/bq27xxx_battery.c
>> @@ -871,12 +871,14 @@ static int bq27xxx_battery_get_property(struct
>> power_supply *psy,
>>         int ret = 0;
>>         struct bq27xxx_device_info *di = power_supply_get_drvdata(psy);
>>
>> -       mutex_lock(&di->lock);
>> -       if (time_is_before_jiffies(di->last_update + 5 * HZ)) {
>> -               cancel_delayed_work_sync(&di->work);
>> -               bq27xxx_battery_poll(&di->work.work);
>> +       if (di->bat) {
>> +               mutex_lock(&di->lock);
>> +               if (time_is_before_jiffies(di->last_update + 5 * HZ)) {
>> +                       cancel_delayed_work_sync(&di->work);
>> +                       bq27xxx_battery_poll(&di->work.work);
>> +               }
>> +               mutex_unlock(&di->lock);
>>         }
>> -       mutex_unlock(&di->lock);
> 
> Alternatively, maybe the following is simpler ...
> 
> diff --git a/drivers/power/bq27xxx_battery.c
> b/drivers/power/bq27xxx_battery.c
> index 45f6ebf88df6..8a713b52e9f6 100644
> --- a/drivers/power/bq27xxx_battery.c
> +++ b/drivers/power/bq27xxx_battery.c
> @@ -733,7 +733,8 @@ static void bq27xxx_battery_poll(struct work_struct
> *work)
>                         container_of(work, struct bq27xxx_device_info,
>                                      work.work);
> 
> -       bq27xxx_battery_update(di);
> +       if (di->bat)
> +               bq27xxx_battery_update(di);
> 

While that might get around the problem, I don't think the fix should be
inside the bq27xxx driver. The problem is that the core is calling :

__power_supply_register->
	psy_register_thermal()->
		thermal_zone_device_register()->
			thermal_zone_device_update()->
				thermal_zone_get_temp()->
					power_supply_read_temp()

then power_supply_read_temp() will attempt to use the driver's callback
get_property method passing it uncompletely initialized struct.

If you notice, there are already other places inside power_supply_core.c
where use_cnt is used to block calls that would reach back to the
get_property callbacks. I don't think it would be bad to have sanity
checks in those callbacks for NULL pointers, but the main problem is
that in this path, the core should know not to call a get_property
callback during registration (before use_cnt is incremented).

This is closely related to this patch in the power_supply_core.c

commit 7f1a57fdd6cb6e7be2ed31878a34655df38e1861
Author: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Date:   Tue May 19 16:13:02 2015 +0900

 power_supply: Fix possible NULL pointer dereference on early uevent

 Don't call the power_supply_changed() from power_supply_register() when
 parent is still probing because it may lead to accessing parent too
 early.
 ...

Its just another situation where get_property is called prematurely.

-rhyland

-- 
nvpublic
