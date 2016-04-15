From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 7/7] pinctrl: tegra: Add driver to configure voltage and
 power state of io pads
Date: Fri, 15 Apr 2016 17:17:46 +0530
Message-ID: <5710D4E2.2030801@nvidia.com>
References: <1460473007-11535-1-git-send-email-ldewangan@nvidia.com>	<1460473007-11535-8-git-send-email-ldewangan@nvidia.com>	<CACRpkdZyYiNJfuiTPeivvgVTZwdwh64nkf=f8JczSAVvnT7QeA@mail.gmail.com>	<5710A8A4.90309@nvidia.com>	<CACRpkdZLEozAmv6REcb7ubCNSLxGsYj1whZEKUkdiodZoS=vzg@mail.gmail.com>	<5710BA75.2010503@nvidia.com> <CACRpkdbr-9Z1JKMVmwNFyMq+Pg+3hT5c9rKZ1y4wZecnidW9Cg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdbr-9Z1JKMVmwNFyMq+Pg+3hT5c9rKZ1y4wZecnidW9Cg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On Friday 15 April 2016 04:45 PM, Linus Walleij wrote:
> On Fri, Apr 15, 2016 at 11:55 AM, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> On Friday 15 April 2016 02:55 PM, Linus Walleij wrote:
>>> If the pin could actually set a voltage level it would have a regulator.
>>> I don't believe that. I think it is selecting one of two rails which
>>> could theoretically hold two totally different voltages.
>>>
>>> And that is what power-source is about.
>> The IO rails connected to PMIC rail and connection does not get change.
>> We change the voltage of PMIC rails via regulator calls. And then configure
>> pads for the new voltage.
> Aha I get it! So you adjust something in the I/O-cell so that it is adapted
> for the new voltage.
>
> OK that seems to be something new. I suspect
> power-voltage-select = <n>; where N i in uV would solve this?
> (We should use uV since regulators use this.)

Thanks for new property. I will make the unit and type same as the 
regulator framework.



>
> But to be sure we would like to know what is actually happening,
> electronically speaking, when you set this up. Do you have any
> idea?
>


 From electronic point of view, the value of VIL, VIH, VOL, VOH 
(Input/output voltage level for low and high state) are different when 
talking for 0 t 1.8V and 0 to 3.3V.
