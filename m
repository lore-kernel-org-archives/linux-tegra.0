From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH] arm: rpi: Device tree modifications for U-Boot
Date: Wed, 12 Aug 2015 07:21:32 -0600
Message-ID: <CAPnjgZ3ztXnkxZJvitiXiKMzq5+x46hbv0PW4HcF7yGgsXUV+Q@mail.gmail.com>
References: <1439303153-12171-1-git-send-email-sjg@chromium.org> <1439312701.2451.3.camel@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1439312701.2451.3.camel-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, lak <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Lee Jones <lee-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Devicetree Discuss <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, lk <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-rpi-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Lucas,

On 11 August 2015 at 11:05, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org> wrote:
> Hi Simon,
>
> why did you send this to the Tegra ML?
>
> Am Dienstag, den 11.08.2015, 08:25 -0600 schrieb Simon Glass:
>> This updates the device tree from the kernel version to something suitable
>> for U-Boot:
>>
>> - Add stdout-path alias for console
>> - Mark the /soc node to be available pre-relocation so that the early
>> serial console works (we need the 'ranges' property to be available)
>>
>> Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
>> ---
>>
>>  arch/arm/boot/dts/bcm2835.dtsi | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/bcm2835.dtsi b/arch/arm/boot/dts/bcm2835.dtsi
>> index 301c73f..bd6bff6 100644
>> --- a/arch/arm/boot/dts/bcm2835.dtsi
>> +++ b/arch/arm/boot/dts/bcm2835.dtsi
>> @@ -8,6 +8,7 @@
>>
>>       chosen {
>>               bootargs = "earlyprintk console=ttyAMA0";
>> +             stdout-path = &uart;
>>       };
>>
>>       soc {
>> @@ -16,6 +17,7 @@
>>               #size-cells = <1>;
>>               ranges = <0x7e000000 0x20000000 0x02000000>;
>>               dma-ranges = <0x40000000 0x00000000 0x20000000>;
>> +             u-boot,dm-pre-reloc;
>
> Why do you need this and why should upstream carry your favourite
> bootloaders configuration? This is in no way hardware description.

I'm not sure how much you know about U-Boot, so let me know if you
need more info.

U-Boot normally starts up by setting up its serial UART and displaying
a banner message. At this stage typically only a few devices are
initialised (e.g. maybe just the UART). It then relocates itself to
the top of memory and starts up all the devices. It throws away any
previous devices that it set up before relocation and starts again.

U-Boot uses a thing called driver model (dm) which handles driver
binding and probing. Driver model has the device tree and would
normally scan through it and create devices for everything it finds.

Before relocation we don't need every device. Also the CPU is often
running slowly, perhaps without the cache enabled. SDRAM may not be
available yet so space is short. We want to avoid starting up things
that will not be used.

So this property indicates that the device is needed before relocation
and should be set up by driver model. We need it to avoid a very slow
and memory-hungry startup.

As to why upstream should accept it, my understanding of upstream is
that people can send patches to it and in fact are encouraged to do
so, to avoid misunderstandings and duplication. The device tree files
are stored in Linux so any binding or source file changes should end
up there. Otherwise the files tend to diverge and we end up with
multiple bindings and multiple versions of the same source file.

Regards,
Simon
