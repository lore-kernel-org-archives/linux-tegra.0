From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2] ARM: tegra: add Acer Chromebook 13 device tree
Date: Mon, 18 Aug 2014 16:24:24 -0700
Message-ID: <CAL1qeaH-WfA-DLKwuXA_hBPHYuXksAibLq__zisrT9ALaRGdAw@mail.gmail.com>
References: <1407957267-3258-1-git-send-email-dgreid@chromium.org>
	<53EF76CF.9050808@suse.de>
	<53F2255E.7090208@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53F2255E.7090208-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Aug 18, 2014 at 9:10 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>=
 wrote:
> On 08/16/2014 09:20 AM, Andreas F=C3=A4rber wrote:
>>
>> Hi,
>>
>> Am 13.08.2014 21:14, schrieb Dylan Reid:
>>>
>>> The Acer Chromebook 13, codenamed Big, contains an NVIDIA tegra124
>>> processor and is similar to the Venice2 reference platform.
>>>
>>> The keyboard, USB 2, audio, HDMI, sdcard, and emmc have been tested
>>> and work on the 1266x768 models.  The HD models haven't yet been
>>> tested.
>>>
>>> WiFi does not work yet, it needs at least some PMIC changes to enab=
le
>>> the 32k clock.
>>>
>>> The elan trackpad is not yet functional but hopefully will be soon =
as
>>> there are patches under review.
>>>
>>> There is also an issue on reboot because the TPM isn't reset.  It w=
ill
>>> cause the stock firmware to enter recovery mode.  This can be worke=
d
>>> around by an EC-reset, press the refresh and power keys at the same
>>> time.
>
>
>>> diff --git a/arch/arm/boot/dts/tegra124-nyan-big.dts
>>> b/arch/arm/boot/dts/tegra124-nyan-big.dts
>>> new file mode 100644
>>> index 0000000..79f1852
>>> --- /dev/null
>>> +++ b/arch/arm/boot/dts/tegra124-nyan-big.dts
>>> @@ -0,0 +1,1136 @@
>>> +/dts-v1/;
>>> +
>>> +#include <dt-bindings/input/input.h>
>>> +#include "tegra124.dtsi"
>>> +
>>> +/ {
>>> +       model =3D "Acer Chromebook 13";
>>> +       compatible =3D "google,nyan-big", "nvidia,tegra124";
>>
>>
>> In light of v1 and the above commit message referring to this as Goo=
gle
>> Big, shouldn't this be "google,big", "nvidia,tegra124" and optionall=
y
>> "google,nyan" as secondary string, independent of the new file name?
>
>
> Despite this board having been derived from Nyan, it isn't Nyan, so I=
 don't
> think Nyan should be part of any compatible value, nor a separate com=
patible
> value.

"google,nyan-big" is the compatible string that the bootloader on
these devices looks for.  It's also the convention we are now using
for our ARM devices, as Olof has already mentioned.
