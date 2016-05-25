From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] arm64: defconfig: Enable cros-ec and battery driver
Date: Wed, 25 May 2016 17:10:29 +0100
Message-ID: <5745CE75.7010603@nvidia.com>
References: <1462290318-9074-1-git-send-email-rklein@nvidia.com>
 <5744609A.1000008@nvidia.com>
 <324dfe74-4fc0-d500-91ac-2a802562e92f@nvidia.com>
 <5745853B.1040304@nvidia.com> <57458693.3050700@nvidia.com>
 <20160525154618.GD13765@ulmo.ba.sec>
 <9411ff33-e375-8286-8690-fe7fcac1c14b@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9411ff33-e375-8286-8690-fe7fcac1c14b-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 25/05/16 16:55, Rhyland Klein wrote:
> On 5/25/2016 11:46 AM, Thierry Reding wrote:
>> On Wed, May 25, 2016 at 12:03:47PM +0100, Jon Hunter wrote:
>>>
>>> On 25/05/16 11:58, Jon Hunter wrote:
>>>
>>> ...
>>>
>>>> Looking at this a bit more I am wondering if we should prevent the
>>>> battery for being polled before the registration has completed ...
>>>>
>>>> diff --git a/drivers/power/bq27xxx_battery.c
>>>> b/drivers/power/bq27xxx_battery.c
>>>> index 45f6ebf88df6..32649183ecd9 100644
>>>> --- a/drivers/power/bq27xxx_battery.c
>>>> +++ b/drivers/power/bq27xxx_battery.c
>>>> @@ -871,12 +871,14 @@ static int bq27xxx_battery_get_property(struct
>>>> power_supply *psy,
>>>>         int ret = 0;
>>>>         struct bq27xxx_device_info *di = power_supply_get_drvdata(psy);
>>>>
>>>> -       mutex_lock(&di->lock);
>>>> -       if (time_is_before_jiffies(di->last_update + 5 * HZ)) {
>>>> -               cancel_delayed_work_sync(&di->work);
>>>> -               bq27xxx_battery_poll(&di->work.work);
>>>> +       if (di->bat) {
>>>> +               mutex_lock(&di->lock);
>>>> +               if (time_is_before_jiffies(di->last_update + 5 * HZ)) {
>>>> +                       cancel_delayed_work_sync(&di->work);
>>>> +                       bq27xxx_battery_poll(&di->work.work);
>>>> +               }
>>>> +               mutex_unlock(&di->lock);
>>>>         }
>>>> -       mutex_unlock(&di->lock);
>>>
>>> Alternatively, maybe the following is simpler ...
>>>
>>> diff --git a/drivers/power/bq27xxx_battery.c
>>> b/drivers/power/bq27xxx_battery.c
>>> index 45f6ebf88df6..8a713b52e9f6 100644
>>> --- a/drivers/power/bq27xxx_battery.c
>>> +++ b/drivers/power/bq27xxx_battery.c
>>> @@ -733,7 +733,8 @@ static void bq27xxx_battery_poll(struct work_struct
>>> *work)
>>>                         container_of(work, struct bq27xxx_device_info,
>>>                                      work.work);
>>>
>>> -       bq27xxx_battery_update(di);
>>> +       if (di->bat)
>>> +               bq27xxx_battery_update(di);
>>
>> How about this, which should be the most minimal to fix it (though it's
>> completely untested) and still update the internal cache (it just won't
>> signal an supply change, which wouldn't work at this point anyway). The
>> patch makes up for the supply change notification by doing that instead
>> of a full bq27xxx_battery_update() at the end of ->probe(). This should
>> take care of always sending out a uevent on successful probe, whereas a
>> bq27xxx_battery_update() at the end of ->probe() may not send one if it
>> is presented with the same data.
>>
> 
> The problem I see with this is that this only fixes this for the bq27xxx
> driver. The real problem is that during the registration for (di->bat =
> power_supply_register...) the core is calling back into the driver being
> registered passing it an incomplete struct. As far as I can tell, the
> call should never be made in the first place. In fact, for all drivers
> that register and support thermal, this should be happening.

So power_supply_read_temp() calls ->get_property() and passes the
power_supply psy struct which is initialised. The problem is that inside
the bq27xxx driver, this then kicks off the worker thread to update the
bq27xxx state and when this worker thread runs it attempts to access the
same psy struct but by dereferencing a pointer to it from the
bq27xxx_device_info where the pointer has not been initialised yet.
Therefore, IMO it seems that we should not allow this worker thread to
start until the registration has completed and hence the pointer is
initialised.

I don't see why the temperature could not be read during the
registration to get the initial temp and it does seem to work fine if we
prevent this worker thread from running. I am sure there are lot of
other devices that have the POWER_SUPPLY_PROP_TEMP property and so I
would have thought if this is a generic problem it would have come up
before now? Plus this worker thread that triggers the crash is specific
to the bq27xxx.

Cheers
Jon

-- 
nvpublic
