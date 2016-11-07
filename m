From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/2] pinctrl: tegra: Add driver to configure voltage and
 power of io pads
Date: Mon, 7 Nov 2016 11:11:21 +0530
Message-ID: <58201401.8050805@nvidia.com>
References: <1478077742-25437-1-git-send-email-ldewangan@nvidia.com> <1478077742-25437-3-git-send-email-ldewangan@nvidia.com> <CACRpkdb4DQLzQWHxuZi=TDaeigNzVJV8TN1jsQfOHKF7yPLrUg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdb4DQLzQWHxuZi=TDaeigNzVJV8TN1jsQfOHKF7yPLrUg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On Saturday 05 November 2016 03:54 AM, Linus Walleij wrote:
> On Wed, Nov 2, 2016 at 10:09 AM, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>
>> NVIDIA Tegra124 and later SoCs support the multi-voltage level and
>> low power state of some of its IO pads. The IO pads can work in
>> the voltage of the 1.8V and 3.3V of IO power rail sources. When IO
>> interface are not used then IO pads can be configure in low power
>> state to reduce the power from that IO pads.
>>
>> On Tegra124, the IO power rail source is auto detected by SoC and hence
>> it is only require to configure in low power mode if IO pads are not
>> used.
>>
>> On T210 onwards, the auto-detection is removed from SoC and hence SW
>> must configure the PMC register explicitly to set proper voltage in
>> IO pads based on IO rail power source voltage.
>>
>> This driver adds the IO pad driver to configure the power state and
>> IO pad voltage based on the usage and power tree via pincontrol
>> framework. The configuration can be static and dynamic.
>>
>> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Looking for an ACK from Stephen &| Thierry.

This driver depends on some new APIs from tegra pmc driver. The new APIs 
are integrated in Thierry's branch and he wanted to push the changes to 
linux-next/main path if there is any client driver for this.

This series is the client driver for tegra PMC.

So if you are fine, then you can ACK and Thierry can take this in his 
branch.

Or I will leave to you/Thierry to propose if some other idea for 
discussion/acceptance.

>
>> ---
>> On top of the branch from Thierry's T186 work
>>          https://github.com/thierryreding/linux/tree/tegra186
> But it's an orthogonal patch right?
>
> The build robot seems to have problems with it so pls fix these.
The driver built in pinctrl branch and so this is expected. The APIs are 
in the above branch.

>
>> +static const struct pinconf_generic_params tegra_io_pads_cfg_params[] = {
>> +       {
>> +               .property = "nvidia,power-source-voltage",
>> +               .param = TEGRA_IO_PAD_POWER_SOURCE_VOLTAGE,
>> +       },
>> +};
> Why can you not use the standard power-source binding
> from Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> instead of inventing this nvidia,* variant?

Per binding doc,
power-source            - select between different power supplies

So actually it selects the different source of power supply.
In my case, I will have same supply but voltage of that supply get changed.
So here property is for the power-supply-voltage.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
