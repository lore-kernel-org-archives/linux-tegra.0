From: Rhyland Klein <rklein@nvidia.com>
Subject: Re: [PATCH] arm64: defconfig: Enable cros-ec and battery driver
Date: Wed, 25 May 2016 11:55:06 -0400
Message-ID: <9411ff33-e375-8286-8690-fe7fcac1c14b@nvidia.com>
References: <1462290318-9074-1-git-send-email-rklein@nvidia.com>
 <5744609A.1000008@nvidia.com>
 <324dfe74-4fc0-d500-91ac-2a802562e92f@nvidia.com>
 <5745853B.1040304@nvidia.com> <57458693.3050700@nvidia.com>
 <20160525154618.GD13765@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160525154618.GD13765@ulmo.ba.sec>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <treding@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 5/25/2016 11:46 AM, Thierry Reding wrote:
> On Wed, May 25, 2016 at 12:03:47PM +0100, Jon Hunter wrote:
>>
>> On 25/05/16 11:58, Jon Hunter wrote:
>>
>> ...
>>
>>> Looking at this a bit more I am wondering if we should prevent the
>>> battery for being polled before the registration has completed ...
>>>
>>> diff --git a/drivers/power/bq27xxx_battery.c
>>> b/drivers/power/bq27xxx_battery.c
>>> index 45f6ebf88df6..32649183ecd9 100644
>>> --- a/drivers/power/bq27xxx_battery.c
>>> +++ b/drivers/power/bq27xxx_battery.c
>>> @@ -871,12 +871,14 @@ static int bq27xxx_battery_get_property(struct
>>> power_supply *psy,
>>>         int ret = 0;
>>>         struct bq27xxx_device_info *di = power_supply_get_drvdata(psy);
>>>
>>> -       mutex_lock(&di->lock);
>>> -       if (time_is_before_jiffies(di->last_update + 5 * HZ)) {
>>> -               cancel_delayed_work_sync(&di->work);
>>> -               bq27xxx_battery_poll(&di->work.work);
>>> +       if (di->bat) {
>>> +               mutex_lock(&di->lock);
>>> +               if (time_is_before_jiffies(di->last_update + 5 * HZ)) {
>>> +                       cancel_delayed_work_sync(&di->work);
>>> +                       bq27xxx_battery_poll(&di->work.work);
>>> +               }
>>> +               mutex_unlock(&di->lock);
>>>         }
>>> -       mutex_unlock(&di->lock);
>>
>> Alternatively, maybe the following is simpler ...
>>
>> diff --git a/drivers/power/bq27xxx_battery.c
>> b/drivers/power/bq27xxx_battery.c
>> index 45f6ebf88df6..8a713b52e9f6 100644
>> --- a/drivers/power/bq27xxx_battery.c
>> +++ b/drivers/power/bq27xxx_battery.c
>> @@ -733,7 +733,8 @@ static void bq27xxx_battery_poll(struct work_struct
>> *work)
>>                         container_of(work, struct bq27xxx_device_info,
>>                                      work.work);
>>
>> -       bq27xxx_battery_update(di);
>> +       if (di->bat)
>> +               bq27xxx_battery_update(di);
> 
> How about this, which should be the most minimal to fix it (though it's
> completely untested) and still update the internal cache (it just won't
> signal an supply change, which wouldn't work at this point anyway). The
> patch makes up for the supply change notification by doing that instead
> of a full bq27xxx_battery_update() at the end of ->probe(). This should
> take care of always sending out a uevent on successful probe, whereas a
> bq27xxx_battery_update() at the end of ->probe() may not send one if it
> is presented with the same data.
> 

The problem I see with this is that this only fixes this for the bq27xxx
driver. The real problem is that during the registration for (di->bat =
power_supply_register...) the core is calling back into the driver being
registered passing it an incomplete struct. As far as I can tell, the
call should never be made in the first place. In fact, for all drivers
that register and support thermal, this should be happening.

Adding Krzysztof Kozlowski who has looked into similar issues recently
it appears.

-rhyland

-- 
nvpublic
