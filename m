From: Andrzej Pietrasiewicz <andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: Re: [PATCHv2 0/7] Support inhibiting input devices
Date: Tue, 2 Jun 2020 18:56:40 +0200
Message-ID: <88f939cd-1518-d516-59f2-8f627a6a70d2@collabora.com>
References: <20200506002746.GB89269@dtor-ws>
 <20200515164943.28480-1-andrzej.p@collabora.com>
 <842b95bb-8391-5806-fe65-be64b02de122@redhat.com>
 <e6030957-97dc-5b04-7855-bc14a78164c8@collabora.com>
 <6d9921fc-5c2f-beda-4dcd-66d6970a22fe@redhat.com>
 <09679de4-75d3-1f29-ec5f-8d42c84273dd@collabora.com>
 <f674ba4f-bd83-0877-c730-5dc6ea09ae4b@redhat.com>
 <2d224833-3a7e-bc7c-af15-1f803f466697@collabora.com>
 <aa2ce2ab-e5bc-9cb4-8b53-c1ef9348b646@redhat.com>
 <20200527063430.GJ89269@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200527063430.GJ89269@dtor-ws>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-input-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-acpi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AA4QjBA90+/kJqQE7yCjDx5@public.gmane.org, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Rafael J . Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Len Brown <lenb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Pengutronix Kernel Team <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, NXP
List-Id: linux-tegra@vger.kernel.org

Hi Dmitry,

W dniu 27.05.2020 o 08:34, Dmitry Torokhov pisze:
> On Tue, May 19, 2020 at 11:36:34AM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 5/19/20 11:02 AM, Andrzej Pietrasiewicz wrote:
>>> Hi Hans, Hi Dmitry,
>>>
>>> W dniu 18.05.2020 o 16:23, Hans de Goede pisze:
>>>> Hi,
>>>
>>> <snip>
>>>
>>>>>>>>
>>>>>>>> So I wonder what this series actually adds for functionality for
>>>>>>>> userspace which can not already be achieved this way?
>>>>>>>>
>>>>>>>> I also noticed that you keep the device open (do not call the
>>>>>>>> input_device's close callback) when inhibited and just throw away
>>>>>>>
>>>>>>> I'm not sure if I understand you correctly, it is called:
>>>>>>>
>>>>>>> +static inline void input_stop(struct input_dev *dev)
>>>>>>> +{
>>>>>>> +    if (dev->poller)
>>>>>>> +        input_dev_poller_stop(dev->poller);
>>>>>>> +    if (dev->close)
>>>>>>> +        dev->close(dev);
>>>>>>>                   ^^^^^^^^^^^^^^^^
>>>>>>> +static int input_inhibit(struct input_dev *dev)
>>>>>>> +{
>>>>>>> +    int ret = 0;
>>>>>>> +
>>>>>>> +    mutex_lock(&dev->mutex);
>>>>>>> +
>>>>>>> +    if (dev->inhibited)
>>>>>>> +        goto out;
>>>>>>> +
>>>>>>> +    if (dev->users) {
>>>>>>> +        if (dev->inhibit) {
>>>>>>> +            ret = dev->inhibit(dev);
>>>>>>> +            if (ret)
>>>>>>> +                goto out;
>>>>>>> +        }
>>>>>>> +        input_stop(dev);
>>>>>>>                   ^^^^^^^^^^^^^^^^
>>>>>>>
>>>>>>> It will not be called when dev->users is zero, but if it is zero,
>>>>>>> then nobody has opened the device yet so there is nothing to close.
>>>>>>
>>>>>> Ah, I missed that.
>>>>>>
>>>>>> So if the device implements the inhibit call back then on
>>>>>> inhibit it will get both the inhibit and close callback called?
>>>>>>
>>>>>
>>>>> That's right. And conversely, upon uninhibit open() and uninhibit()
>>>>> callbacks will be invoked. Please note that just as with open()/close(),
>>>>> providing inhibit()/uninhibit() is optional.
>>>>
>>>> Ack.
>>>>
>>>>>> And what happens if the last user goes away and the device
>>>>>> is not inhibited?
>>>>>
>>>>> close() is called as usually.
>>>>
>>>> But not inhibit, hmm, see below.
>>>>
>>>>>> I'm trying to understand here what the difference between the 2
>>>>>> is / what the goal of having a separate inhibit callback ?
>>>>>>
>>>>>
>>>>> Drivers have very different ideas about what it means to suspend/resume
>>>>> and open/close. The optional inhibit/uninhibit callbacks are meant for
>>>>> the drivers to know that it is this particular action going on.
>>>>
>>>> So the inhibit() callback triggers the "suspend" behavior ?
>>>> But shouldn't drivers which are capable of suspending the device
>>>> always do so on close() ?
>>>>
>>>> Since your current proposal also calls close() on inhibit() I
>>>> really see little difference between an inhibit() and the last
>>>> user of the device closing it and IMHO unless there is a good
>>>> reason to actually differentiate the 2 it would be better
>>>> to only stick with the existing close() and in cases where
>>>> that does not put the device in a low-power mode yet, fix
>>>> the existing close() callback to do the low-power mode
>>>> setting instead of adding a new callback.
>>>>
>>>>> For inhibit() there's one more argument: close() does not return a value,
>>>>> so its meaning is "do some last cleanup" and as such it is not allowed
>>>>> to fail - whatever its effect is, we must deem it successful. inhibit()
>>>>> does return a value and so it is allowed to fail.
>>>>
>>>> Well, we could make close() return an error and at least in the inhibit()
>>>> case propagate that to userspace. I wonder if userspace is going to
>>>> do anything useful with that error though...
> 
> It really can't do anything. Have you ever seen userspace handling
> errors from close()? And what can be done? A program is terminating, but
> the kernel says "no, you closing input device failed, you have to
> continue running indefinitely..."
> 
>>>>
>>>> In my experience errors during cleanup/shutdown are best logged
>>>> (using dev_err) and otherwise ignored, so that we try to clean up
>>>> as much possible. Unless the very first step of the shutdown process
>>>> fails the device is going to be in some twilight zone state anyways
>>>> at this point we might as well try to cleanup as much as possible.
>>>
>>> What you say makes sense to me.
>>> @Dmitry?
> 
> I will note here, that inhibit is closer to suspend() than to close(),
> and we do report errors for suspend(). Therefore we could conceivably
> try to handle errors if driver really wants to be fancy. But I think
> majority of cases will be quite happy with using close() and simply
> logging errors, as Hans said.
> 
> That said, I think the way we should handle inhibit/uninhibit, is that
> if we have the callback defined, then we call it, and only call open and
> close if uninhibit or inhibit are _not_ defined.
> 

If I understand you correctly you suggest to call either inhibit,
if provided or close, if inhibit is not provided, but not both,
that is, if both are provided then on the inhibit path only
inhibit is called. And, consequently, you suggest to call either
uninhibit or open, but not both. The rest of my mail makes this
assumption, so kindly confirm if I understand you correctly.

In my opinion this idea will not work.

The first question is should we be able to inhibit a device
which is not opened? In my opinion we should, in order to be
able to inhibit a device in anticipation without needing to
open it first.

Then what does opening (with input_open_device()) an inhibited
device mean? Should it succeed or should it fail? If it is not
the first opening then effectively it boils down to increasing
device's and handle's counters, so we can allow it to succeed.
If, however, the device is being opened for the first time,
the ->open() method wants to be called, but that somehow
contradicts the device's inhibited state. So a logical thing
to do is to either fail input_open_device() or postpone ->open()
invocation to the moment of uninhibiting - and the latter is
what the patches in this series currently do.

Failing input_open_device() because of the inhibited state is
not the right thing to do. Let me explain. Suppose that a device
is already inhibited and then a new matching handler appears
in the system. Most handlers (apm-power.c, evbug.c, input-leds.c,
mac_hid.c, sysrq.c, vt/keyboard.c and rfkill/input.c) don't create
any character devices (only evdev.c, joydev.c and mousedev.c do),
so for them it makes no sense to delay calling input_open_device()
and it is called in handler's ->connect(). If input_open_device()
now fails, we have lost the only chance for this ->connect() to
succeed.

Summarizing, IMO the uninhibit path should be calling both
->open() and ->uninhibit() (if provided), and conversely, the inhibit
path should be calling both ->inhibit() and ->close() (if provided).

What's your opinion?

Regards,

Andrzej
