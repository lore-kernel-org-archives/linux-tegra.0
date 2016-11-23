From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V3 2/2] pinctrl: tegra: Add driver to configure voltage
 and power of io pads
Date: Wed, 23 Nov 2016 17:12:37 +0530
Message-ID: <583580AD.60803@nvidia.com>
References: <1479810013-29894-1-git-send-email-ldewangan@nvidia.com> <1479810013-29894-3-git-send-email-ldewangan@nvidia.com> <CACRpkdZK34QfbSBJvshfZekk5TJBU5sZog-9uszLSmFPOGJgiw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdZK34QfbSBJvshfZekk5TJBU5sZog-9uszLSmFPOGJgiw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Joe Perches <joe-6d6DIl74uiNBDgjK7y7TUQ@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On Tuesday 22 November 2016 06:28 PM, Linus Walleij wrote:
> On Tue, Nov 22, 2016 at 11:20 AM, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>
>> +               rinfo->regulator = devm_regulator_get_optional(dev,
>> +                                               soc_data->cfg[i].vsupply);
> Please just use devm_regulator_get().
>
> As has been discussed at lenth elsewhere "optional" in regulator_get_optional
> does *not* mean "software optional", it means "hardware optional".
>
> Such as a terminal that may have a voltage connected or not be
> connected to anything at all.
>
> If the system does not define a regulator you will anyway get a
> dummy regulator.
>
The issue with dummy regulator is that the other regulator APIs with 
dummy regulator fails.
Once we get the dummy regulator, there is no way to know whether the 
returned regulator is actual or dummy and when calling the 
regulator_get_voltage() it failed.

[    2.917176] pinctrl-t210-io-pad.0 supply vddio-audio-hv not found, 
using dummy regulator
[    2.925510] pinctrl-tegra-io-pad pinctrl-t210-io-pad.0: Failed to get 
voltage for rail vddio-aud2


Here, we need the regulator handle which can support the other regulator 
APIs.

In some of platforms, we do not use some of the io-pins and on this 
case, we do not connect the IO rail supply for these pins. So this is 
like a hardware optional.

If the IO pins are used then it need to have the proper regulator handle.
Missing regulator handle on DT will be like that IO pads are not used.


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
