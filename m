From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 02/21] ARM: tegra: Add gpio-ranges property
Date: Tue, 2 Jun 2015 13:28:35 +0200
Message-ID: <CACRpkdbtCDQLaPhWFT0a7NdJmxYzRvhU_efgUh2ZXhbc+FHg3g@mail.gmail.com>
References: <1432565608-26036-1-git-send-email-tomeu.vizoso@collabora.com>
	<1432565608-26036-3-git-send-email-tomeu.vizoso@collabora.com>
	<5564CC84.1030700@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5564CC84.1030700-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, =?UTF-8?Q?St=C3=A9phane_Marchesin?= <stephane.marchesin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexander Holler <holler-SXC+2es9fhnfWeYVQQPykw@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, May 26, 2015 at 9:41 PM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 05/25/2015 08:53 AM, Tomeu Vizoso wrote:
>>
>> Specify how the GPIOs map to the pins in T124, so the dependency is
>> explicit.
>>
>> Signed-off-by: Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
>> ---
>>   arch/arm/boot/dts/tegra124.dtsi | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm/boot/dts/tegra124.dtsi
>> b/arch/arm/boot/dts/tegra124.dtsi
>> index 13cc7ca..5d1d35f 100644
>> --- a/arch/arm/boot/dts/tegra124.dtsi
>> +++ b/arch/arm/boot/dts/tegra124.dtsi
>> @@ -254,6 +254,7 @@
>>                 gpio-controller;
>>                 #interrupt-cells = <2>;
>>                 interrupt-controller;
>> +               gpio-ranges = <&pinmux 0 0 250>;
>
>
> We should be consistent between SoCs. Why not make the same change for all
> Tegra SoCs?

Agreed.

> I think this change will cause the GPIO subsystem to call into the pinctrl
> subsystem and create/add/register a new GPIO<->pinctrl range structure. The
> pinctrl driver already does this, so I think we'll end up with two duplicate
> entries in the pinctrl device's gpio_ranges list. This probably won't cause
> a problem, but I wanted to make sure you'd thought about it to make sure.

That sounds like duplication indeed, I would expect that first a patch
adds the ranges to the dts[i] files and then a second patch delete the
same ranges from the pinctrl driver then, if these shall come in from
the device tree.

With GPIO ranges being possible to register from the pin controller,
gpio chip and also the device tree, things get a bit complex
admittedly :/ sorry for this, just choose one.

Yours,
Linus Walleij
