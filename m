From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v3] platform/chrome: Use proper protocol transfer function
Date: Tue, 10 Oct 2017 09:52:59 -0700
Message-ID: <CAD=FV=VobwsHyo96JxAgEPqG2ji5gMoNz6JJxQaQmZ3MD+dxRg@mail.gmail.com>
References: <20170908205011.77986-1-briannorris@chromium.org>
 <02aa65e7-e967-055b-2af3-2e9b6ef77935@nvidia.com> <CALaWCOMj0wQk5OfYOYqU_sZUt2SQBhy=HaP-qOiB5aMf9G8inw@mail.gmail.com>
 <c3c5d08b-2df2-2e5b-cb09-bd4b3011e3df@nvidia.com> <20170919171401.GA10968@google.com>
 <CALaWCOPzT-BWu-YcMY+xEAWGRmvvVEoA64ceEK3zG3K-wajskQ@mail.gmail.com>
 <20170920061317.GB13616@google.com> <CALaWCOPEiWHMeOb-9_fpbyYuNzGdy0favnPS37u5_zz1AG_86w@mail.gmail.com>
 <CALaWCOM87ikjzK-zFJ7WT37L_w58AwZwC_nq0hNXuzh5x87n5w@mail.gmail.com>
 <6beb7b8c-f602-112b-73b2-22188dcea28e@nvidia.com> <CALaWCOP=0O7AMobu4YX0z=fJLopcQwv1Vm1_Bbp3XTaty1y6fA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALaWCOP=0O7AMobu4YX0z=fJLopcQwv1Vm1_Bbp3XTaty1y6fA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn N <shawnn-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Benson Leung <bleung-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Brian Norris <briannorris-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Gwendal Grignou <gwendal-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Enric Balletbo <enric.balletbo-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alexandru M Stan <amstan-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi,

On Tue, Oct 10, 2017 at 8:33 AM, Shawn N <shawnn-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org> wrote:
>> diff --git a/arch/arm/boot/dts/tegra124-nyan.dtsi b/arch/arm/boot/dts/tegra124-nyan.dtsi
>> index 5cf987b5401e..0baa6bfc0f36 100644
>> --- a/arch/arm/boot/dts/tegra124-nyan.dtsi
>> +++ b/arch/arm/boot/dts/tegra124-nyan.dtsi
>> @@ -317,6 +317,7 @@
>>                         interrupts = <TEGRA_GPIO(C, 7) IRQ_TYPE_LEVEL_LOW>;
>>                         reg = <0>;
>>
>> +                       google,cros-ec-spi-pre-delay = <10>;
>>                         google,cros-ec-spi-msg-delay = <2000>;
>>
>>                         i2c-tunnel {
>>
>> I have tried 50 boots with the above and I have seen no SPI failures
>> on boot.
>>
>> I did look to see if it is possible to probe the SPI signals with a
>> scope but from the schematics I am not sure if they are accessible or
>> buried in the PCB.
>>
>> Is it possible that Tegra is sending the SPI message too soon for the
>> EC?
>
> I have not worked much with the cros_ec stm32 SPI host interface, but
> I think it's possible. Also note that we define
> "google,cros-ec-spi-pre-delay = <30>;" for the veyron family of
> devices, which also use an stm32-family embedded controller. Some of
> the folks on cc worked more on veyron and may have more insight.

Alex is the expert here, but basically we enabled hibernation on the
EC for veyron so it needed a bunch of extra time to wakeup.  Before
hibernation there was no known case where the delay was needed as far
as I understand.  I don't think we had hibernation on tegra.

It's _possible_ that we sometimes need a delay even on tegra, but I'm
not sure.  It's also possible that the extra delay just shifts things
around a little bit and changes the timing.  Possibly at boot the
system is always extra busy and adding the 10 us delay is enough to
"reliably" get your transfer to happen at a non-busy time.  It would
be interesting to see of a 10us delay _before_ asserting chip select
fixed things just as well.  If a delay before asserting chip select
fixes things as well as a delay after asserting chip select then
you're probably just pushing things around and not doing a real fix.

One issue I _know_ we have is that we sometimes drop EC packets on the
floor because we get interrupted midway through the transfer and the
EC gives up on us before we get context switched back in.  I think
this is more common at suspend/resume and at boot when the system is
typically very busy.  That case can actually be made _worse_ by the
"cros-ec-spi-pre-delay", as described in
<https://chromium-review.googlesource.com/439713>.  Even when we
removed delay on rk3399-gru-* we could still sometimes see transfer
errors and the agreed upon "fix" for this is to do the transfer in a
higher priority context.  Some details are in the (unfortunately
private) <https://issuetracker.google.com/35579351>, but to copy the
important bits from the bug::

From Mark Brown (upstream SPI maintainer) as long as there is no
contention on this SPI bus (there isn't for us) the transfer will
happen in the context of the calling process.  That means "bumping"
the priority would work.  ...but as per Brian bumping the priority is
ugly and we need to make sure we don't conflict with userspace.   One
solution (inspired by Guenter) is to just _always_ use a high priority
worker to do the transfer and just block waiting for the worker to
finish.  This should be easy, reliable, and clean even if it is
slightly awkward.  This also shouldn't be too hard to do, we think.


NOTE: a really truly long term fix for this is to change the protocol
to have reliably retries.  That's planned but (as far as I can tell)
stalled.  Details in the bug
<https://bugs.chromium.org/p/chromium/issues/detail?id=678675>


> I'm still not clear on why we see an error only on the first
> transaction after boot. In this case, the embedded controller
> previously handled host commands from firmware just fine, and the
> handoff between firmware and the kernel shouldn't be significant, from
> the EC point of view. If host command timing is consistent from the
> master, I would expect to see some constant error rate, eg. some
> chance any host command will fail, rather than the first host command
> always failing.

The AP itself is often quite busy at boot and so the timings for
everything change.  That could easily explain the problems.

-Doug
