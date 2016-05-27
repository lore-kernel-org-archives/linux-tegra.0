From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH] arm64: defconfig: Enable cros-ec and battery driver
Date: Fri, 27 May 2016 11:19:48 +0200
Message-ID: <57481134.1030404@samsung.com>
References: <1462290318-9074-1-git-send-email-rklein@nvidia.com>
 <5744609A.1000008@nvidia.com>
 <324dfe74-4fc0-d500-91ac-2a802562e92f@nvidia.com>
 <5745853B.1040304@nvidia.com> <57458693.3050700@nvidia.com>
 <20160525154618.GD13765@ulmo.ba.sec>
 <9411ff33-e375-8286-8690-fe7fcac1c14b@nvidia.com>
 <5745CE75.7010603@nvidia.com> <5745D2DD.6080300@nvidia.com>
 <1c6df907-ea1f-201b-a36e-8311c5b2b3b1@nvidia.com>
 <5745E031.7010406@nvidia.com>
 <5c03a025-f31d-fa18-b973-0b026ede9c5c@nvidia.com>
 <5748073F.1030704@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <5748073F.1030704-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/27/2016 10:37 AM, Krzysztof Kozlowski wrote:
>> And you might be completely correct, that is something that can only
>> happen specifically with the bq27xxx driver. In which case, making the
>> fix there should be the fix. I just know from the commit log (and some
>> previous work with power supply drivers) that the case of get_property
>> being called during registration has caused problems before. That's why
>> I am trying to make sure we cover the generic case if it exists. Using
>> scheduled work is common for power_supplies to regularly update their
>> status.
>>
>> As for your proposed patches for bq27xxx, I think the latest one you
>> suggested (@12:36PM EST) with the change for
>> battery_update->battery_poll as well makes the most sense for bq27xxx. I
>> would like to point out though that if we patch this, the cache won't be
>> populated for the first TEMP request, which has the same end effect as
>> the patch I proposed to power_supply_read_temp. I believe both will
>> return 0 for the temp.
>>
>> I think that patch would work just fine in place of what I suggested for
>> this specific crash.
> 
> Hello all,
> 
> Indeed I was struggling with similar issue in bq27x00_battery. The issue
> was introduced by... me :(  when moving the ownership of power supply
> structure from driver to the core. However IMHO my change exposed the
> fundamental problem with power supply.
> 
> Anyway a fix for this issue was:
> 7f1a57fdd6cb6e7b (power_supply: Fix possible NULL pointer dereference on
> early uevent)
> AFAIU, this fix no longer fixes all the issues, right?
> 
> As for the fundamental problem, the power supply core should not call
> back the driver (get_property()) until the probe ends. Even if the
> di->bat was initialized, some other fields of driver could not be set
> yet. In general, the probe did not end so we should avoid calling driver
> internal functions.
> 
> In this particular problem:
> 1. Fix for the driver (!di->bat) is okay... but it won't solve the
> problem in general.
> 2. I think the core should handle it somehow...

I was thinking about some more generic solutions for that. Few ideas:
1. Split the power_supply_register() into register + manual call to
power_supply_changed(). Each driver will have to call the
power_supply_changed() when it is ready to do it. After that call, it is
expected that driver provides everything for power supply (it can
receive callbacks).

2. Since 7f1a57fdd6cb ("power_supply: Fix possible NULL pointer
dereference on early uevent") the power_supply_changed() is called from
a deferred work. Separate thread. We can introduce (in the core only) a
mutex:
	power_supply_deferred_register_work()
	{
		psy->mutex_lock();
		power_supply_changed(psy);
		psy->mutex_unlock();
	}
and add it also to all of API:
	power_supply_get_property() {
		psy->mutex_lock();
		psy->get_property();
		psy->mutex_unlock();
	}
The changes would be limited only to the core but we will introduce
strict locking over all of the psy callbacks.

3. We can go back to previous API, leaving the allocation done by the core:
	some_drv_probe() {
		err = power_supply_register(&some_drv->psy...);
	}


I think the second solution seems to be the most self-contained and robust.

Best regards,
Krzysztof
