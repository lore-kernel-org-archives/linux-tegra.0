From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] arm64: defconfig: Enable cros-ec and battery driver
Date: Tue, 31 May 2016 18:24:55 +0100
Message-ID: <574DC8E7.3040707@nvidia.com>
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
 <5748073F.1030704@samsung.com> <57482162.20306@nvidia.com>
 <5748339E.9080504@samsung.com> <57483AC8.6010007@nvidia.com>
 <574843D4.4080303@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <574843D4.4080303-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sebastian Reichel <sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 27/05/16 13:55, Krzysztof Kozlowski wrote:
> On 05/27/2016 02:17 PM, Jon Hunter wrote:
>>
>> On 27/05/16 12:46, Krzysztof Kozlowski wrote:
>>> On 05/27/2016 12:28 PM, Jon Hunter wrote:
>>>> Hi Krzysztof,
>>>>
>>>> On 27/05/16 09:37, Krzysztof Kozlowski wrote:
>>>>
>>>> ...
>>>>
>>>>> Indeed I was struggling with similar issue in bq27x00_battery. The issue
>>>>> was introduced by... me :(  when moving the ownership of power supply
>>>>> structure from driver to the core. However IMHO my change exposed the
>>>>> fundamental problem with power supply.
>>>>>
>>>>> Anyway a fix for this issue was:
>>>>> 7f1a57fdd6cb6e7b (power_supply: Fix possible NULL pointer dereference on
>>>>> early uevent)
>>>>> AFAIU, this fix no longer fixes all the issues, right?
>>>>>
>>>>> As for the fundamental problem, the power supply core should not call
>>>>> back the driver (get_property()) until the probe ends. Even if the
>>>>> di->bat was initialized, some other fields of driver could not be set
>>>>> yet. In general, the probe did not end so we should avoid calling driver
>>>>> internal functions.
>>>>
>>>> For my understanding, can you elaborate why the power-supply core should
>>>> not call back to the drivers ->get_property() before the probe ends? I
>>>> assume that registering the power-supply should be the last thing done
>>>> in the probe and so the power-supply should be configured at that point.
>>>
>>> It is not only about power supply but other resources allocated by the
>>> driver. If the power_supply_register() is a last call, then no problem.
>>> But if not, then these resources won't be available.
>>>
>>> Actually I exaggerated a little bit as a fundamental problem as this is
>>> quite common pattern. When driver provides something (like power supply)
>>> then after registration it should be ready for calls coming from the
>>> core or user space. It does not have to be power supply. It might be
>>> exposing sysfs entries or file operations (exposed before calling
>>> power_supply_register()).
>>
>> Right, exactly when you register with the power-supply core the device
>> better be ready so that handle any incoming calls.
> 
> Yes, the unusual thing here is that the device is called back directly
> from the power_supply_register() call.
> 
>>
>>>> The problems with the bq27xxx seem to stem from the periodic update of
>>>> the bq27xxx status and so it is not clear to me that this is a generic
>>>> problem for all power-supply devices.
>>>
>>> Initially, the generic problem was that the core would call back the
>>> driver from power_supply_register() in a synchronous way through
>>> power_supply_changed(). The commit 7f1a57fdd6c changed it to an
>>> asynchronous call. Here it looks like the same problem - the
>>> power_supply_register() calls thermal which calls
>>> thermal_zone_device_update() and we are back at the driver... before
>>> finishing power_supply_register() call.
>>
>> So I am still not convinced this is a generic problem but a problem with
>> the bq27xxx. In fact, I think that commit 7f1a57fdd6c could be avoided
>> if we did something like ...
>>
>> http://marc.info/?l=linux-kernel&m=146425896332433&w=2
>>
>> AFAICT in most cases, in ->get_property() you should have no need to
>> access a driver's equivalent of di->bat, because you have already been
>> passed a pointer to this via the *psy argument.
> 
> I agree that get_property() shouldn't access di->bat. However if it is
> not forbidden (at least by documentation) then someone might just do it
> because he does not know about such requirement.

In that case, shouldn't the driver should check that di->bat is valid
before anyone attempts to dereference it? However, if you and/or Rhyland
have a generic fix for preventing this, please go ahead and propose it.

Cheers
Jon

-- 
nvpublic
