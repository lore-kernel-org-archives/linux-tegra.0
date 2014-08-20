From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH v2] ARM: tegra: add Acer Chromebook 13 device tree
Date: Wed, 20 Aug 2014 06:37:48 -0700
Message-ID: <CAOesGMhDe0zFYkUWqBOTunK76wccdKOQ8b+EFAzeTr+oOUQyWA@mail.gmail.com>
References: <1407957267-3258-1-git-send-email-dgreid@chromium.org>
	<53EF76CF.9050808@suse.de>
	<53F2255E.7090208@wwwdotorg.org>
	<CAL1qeaH-WfA-DLKwuXA_hBPHYuXksAibLq__zisrT9ALaRGdAw@mail.gmail.com>
	<53F28F90.3000004@wwwdotorg.org>
	<CAL1qeaFnfLDOXq07fY4xLfdRpG8FQ63ya+-0Hk+ewA1wXkLOLw@mail.gmail.com>
	<53F3C5FD.4050808@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53F3C5FD.4050808-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Aug 19, 2014 at 2:47 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>=
 wrote:
> On 08/18/2014 06:11 PM, Andrew Bresticker wrote:
>>
>> On Mon, Aug 18, 2014 at 4:43 PM, Stephen Warren <swarren@wwwdotorg.o=
rg>
>> wrote:
>>>
>>> On 08/18/2014 05:24 PM, Andrew Bresticker wrote:
>>>>
>>>>
>>>> On Mon, Aug 18, 2014 at 9:10 AM, Stephen Warren <swarren@wwwdotorg=
=2Eorg>
>>>> wrote:
>>>>>
>>>>>
>>>>> On 08/16/2014 09:20 AM, Andreas F=C3=A4rber wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> Am 13.08.2014 21:14, schrieb Dylan Reid:
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> The Acer Chromebook 13, codenamed Big, contains an NVIDIA tegra=
124
>>>>>>> processor and is similar to the Venice2 reference platform.
>>>>>>>
>>>>>>> The keyboard, USB 2, audio, HDMI, sdcard, and emmc have been te=
sted
>>>>>>> and work on the 1266x768 models.  The HD models haven't yet bee=
n
>>>>>>> tested.
>>>>>>>
>>>>>>> WiFi does not work yet, it needs at least some PMIC changes to =
enable
>>>>>>> the 32k clock.
>>>>>>>
>>>>>>> The elan trackpad is not yet functional but hopefully will be s=
oon as
>>>>>>> there are patches under review.
>>>>>>>
>>>>>>> There is also an issue on reboot because the TPM isn't reset.  =
It
>>>>>>> will
>>>>>>> cause the stock firmware to enter recovery mode.  This can be w=
orked
>>>>>>> around by an EC-reset, press the refresh and power keys at the =
same
>>>>>>> time.
>>>>>
>>>>>
>>>>>
>>>>>
>>>>>>> diff --git a/arch/arm/boot/dts/tegra124-nyan-big.dts
>>>>>>> b/arch/arm/boot/dts/tegra124-nyan-big.dts
>>>>>>> new file mode 100644
>>>>>>> index 0000000..79f1852
>>>>>>> --- /dev/null
>>>>>>> +++ b/arch/arm/boot/dts/tegra124-nyan-big.dts
>>>>>>> @@ -0,0 +1,1136 @@
>>>>>>> +/dts-v1/;
>>>>>>> +
>>>>>>> +#include <dt-bindings/input/input.h>
>>>>>>> +#include "tegra124.dtsi"
>>>>>>> +
>>>>>>> +/ {
>>>>>>> +       model =3D "Acer Chromebook 13";
>>>>>>> +       compatible =3D "google,nyan-big", "nvidia,tegra124";
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>> In light of v1 and the above commit message referring to this as
>>>>>> Google
>>>>>> Big, shouldn't this be "google,big", "nvidia,tegra124" and optio=
nally
>>>>>> "google,nyan" as secondary string, independent of the new file n=
ame?
>>>>>
>>>>>
>>>>>
>>>>>
>>>>> Despite this board having been derived from Nyan, it isn't Nyan, =
so I
>>>>> don't
>>>>> think Nyan should be part of any compatible value, nor a separate
>>>>> compatible
>>>>> value.
>>>>
>>>>
>>>>
>>>> "google,nyan-big" is the compatible string that the bootloader on
>>>> these devices looks for.  It's also the convention we are now usin=
g
>>>> for our ARM devices, as Olof has already mentioned.
>>>
>>>
>>> I don't understand "that the bootloader looks for"; why is the boot=
loader
>>> doing anything w.r.t the compatible value in the DT that's passed t=
o the
>>> kernel.
>>
>>
>> The ChromeOS bootloader ("depthcharge") boots FIT images and selects
>> the appropriate device-tree from the image based on the compatible
>> string.  On Big boards, it looks for "google,nyan-big".  This only
>> becomes an issue if there are multiple device-trees in the FIT image=
=2E
>> If there's only a single configuration (or you chain-load U-Boot),
>> then the bootloader will boot with that configuration.  If you build=
 a
>> kernel image in the ChromiumOS environment, however, you'll end up
>> with multiple device-trees (all those built by the kernel config at
>> least) in the FIT image - this is what allows us to boot the same
>> binary on different boards.
>
>
> This just makes me dislike FIT (and DT ABIs) even more, although I su=
ppose
> the same issue would arise if the DTBs were stored in separate files =
and
> looked up by filename.

Yes, or stored in separate files and looked up by compatible field.

Do you have a suggestion on a better way to solve it, btw? Definitely
not one of those things we can fix retroactively, but if it works
poorly for you upstream we'll consider improvements if we can for
future products.

I'm not a huge fan of fitImage myself, but it gets the work done.

> I have to say this sucks, because it means that a downstream bootload=
er is
> imposing an ABI on the mainline kernel without a chance to fix things=
 during
> upstreaming. For all other boards, we've concentrated on mainline U-B=
oot as
> the bootloader precisely so that strange behaviour of our downstream =
product
> kernels don't force the hand of the mainline kernel design.
>
> Still, I suppose I have no choice but to drop my objection here.

Thanks for being pragmatic on this one, Stephen!


-Olof
