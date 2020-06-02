From: Andrzej Pietrasiewicz <andrzej.p-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
Subject: Re: [PATCHv2 0/7] Support inhibiting input devices
Date: Tue, 2 Jun 2020 20:50:07 +0200
Message-ID: <82e9f2ab-a16e-51ee-1413-bedf0122026a@collabora.com>
References: <20200515164943.28480-1-andrzej.p@collabora.com>
 <842b95bb-8391-5806-fe65-be64b02de122@redhat.com>
 <e6030957-97dc-5b04-7855-bc14a78164c8@collabora.com>
 <6d9921fc-5c2f-beda-4dcd-66d6970a22fe@redhat.com>
 <09679de4-75d3-1f29-ec5f-8d42c84273dd@collabora.com>
 <f674ba4f-bd83-0877-c730-5dc6ea09ae4b@redhat.com>
 <2d224833-3a7e-bc7c-af15-1f803f466697@collabora.com>
 <aa2ce2ab-e5bc-9cb4-8b53-c1ef9348b646@redhat.com>
 <20200527063430.GJ89269@dtor-ws>
 <88f939cd-1518-d516-59f2-8f627a6a70d2@collabora.com>
 <20200602175241.GO89269@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200602175241.GO89269@dtor-ws>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-input-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-acpi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, patches-yzvPICuk2AA4QjBA90+/kJqQE7yCjDx5@public.gmane.org, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Rafael J . Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Len Brown <lenb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Hartmut Knaack <knaack.h-Mmb7MZpHnFY@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Peter Meerwald-Stadler <pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Pengutronix Kernel Team <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio
List-Id: linux-tegra@vger.kernel.org

Hi Dmitry,

W dniu 02.06.2020 o 19:52, Dmitry Torokhov pisze:
> Hi Andrzej,
> 
> On Tue, Jun 02, 2020 at 06:56:40PM +0200, Andrzej Pietrasiewicz wrote:
>> Hi Dmitry,
>>
>> W dniu 27.05.2020 o 08:34, Dmitry Torokhov pisze:
>>> That said, I think the way we should handle inhibit/uninhibit, is that
>>> if we have the callback defined, then we call it, and only call open and
>>> close if uninhibit or inhibit are _not_ defined.
>>>
>>
>> If I understand you correctly you suggest to call either inhibit,
>> if provided or close, if inhibit is not provided, but not both,
>> that is, if both are provided then on the inhibit path only
>> inhibit is called. And, consequently, you suggest to call either
>> uninhibit or open, but not both. The rest of my mail makes this
>> assumption, so kindly confirm if I understand you correctly.
> 
> Yes, that is correct. If a driver wants really fine-grained control, it
> will provide inhibit (or both inhibit and close), otherwise it will rely
> on close in place of inhibit.
> 
>>
>> In my opinion this idea will not work.
>>
>> The first question is should we be able to inhibit a device
>> which is not opened? In my opinion we should, in order to be
>> able to inhibit a device in anticipation without needing to
>> open it first.
> 
> I agree.
> 
>>
>> Then what does opening (with input_open_device()) an inhibited
>> device mean? Should it succeed or should it fail?
> 
> It should succeed.
> 
>> If it is not
>> the first opening then effectively it boils down to increasing
>> device's and handle's counters, so we can allow it to succeed.
>> If, however, the device is being opened for the first time,
>> the ->open() method wants to be called, but that somehow
>> contradicts the device's inhibited state. So a logical thing
>> to do is to either fail input_open_device() or postpone ->open()
>> invocation to the moment of uninhibiting - and the latter is
>> what the patches in this series currently do.
>>
>> Failing input_open_device() because of the inhibited state is
>> not the right thing to do. Let me explain. Suppose that a device
>> is already inhibited and then a new matching handler appears
>> in the system. Most handlers (apm-power.c, evbug.c, input-leds.c,
>> mac_hid.c, sysrq.c, vt/keyboard.c and rfkill/input.c) don't create
>> any character devices (only evdev.c, joydev.c and mousedev.c do),
>> so for them it makes no sense to delay calling input_open_device()
>> and it is called in handler's ->connect(). If input_open_device()
>> now fails, we have lost the only chance for this ->connect() to
>> succeed.
>>
>> Summarizing, IMO the uninhibit path should be calling both
>> ->open() and ->uninhibit() (if provided), and conversely, the inhibit
>> path should be calling both ->inhibit() and ->close() (if provided).
> 
> So what you are trying to say is that you see inhibit as something that
> is done in addition to what happens in close. But what exactly do you
> want to do in inhibit, in addition to what close is doing?

See below (*).

> 
> In my view, if we want to have a dedicated inhibit callback, then it
> will do everything that close does, they both are aware of each other
> and can sort out the state transitions between them. For drivers that do
> not have dedicated inhibit/uninhibit, we can use open and close
> handlers, and have input core sort out when each should be called. That
> means that we should not call dev->open() in input_open_device() when
> device is inhibited (and same for dev->close() in input_close_device).
> And when uninhibiting, we should not call dev->open() when there are no
> users for the device, and no dev->close() when inhibiting with no users.
> 
> Do you see any problems with this approach?

My concern is that if e.g. both ->open() and ->uninhibit() are provided,
then in certain circumstances ->open() won't be called:

1. users == 0
2. inhibit happens
3. input_open_device() happens, ->open() not called
4. uninhibit happens
5. as part of uninhibit ->uninhibit() is only called, but ->open() is not.

They way I understand your answer is that we implicitly impose requirements
on drivers which choose to implement e.g. both ->open() and ->uninhibit():
in such a case ->uninhibit() should be doing exactly the same things as
->open() does. Which leads to a conclusion that in practice no drivers
should choose to implement both, otherwise they must be aware that
->uninhibit() can be sometimes called instead of ->open(). Then ->open()
becomes synonymous with ->uninhibit(), and ->close() with ->inhibit().
Or, maybe, then ->inhibit() can be a superset of ->close() and
->uninhibit() a superset of ->open().

If such an approach is ok with you, it is ok with me, too.

(*)
Calling both ->inhibit() and ->close() (if they are provided) allows
drivers to go fancy and fail inhibiting (which is impossible using
only ->close() as it does not return a value, but ->inhibit() by design
does). Then ->uninhibit() is mostly for symmetry.

Regards,

Andrzej
