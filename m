From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 4/7] soc/tegra: pmc: Add interface to set voltage of IO
 rails
Date: Fri, 15 Apr 2016 13:55:39 +0530
Message-ID: <5710A583.2010102@nvidia.com>
References: <1460473007-11535-1-git-send-email-ldewangan@nvidia.com> <1460473007-11535-5-git-send-email-ldewangan@nvidia.com> <CACRpkdbueJ=0+WtNefQ7GHoqU5HY7WFYjL2geFq4vkpTbZesZA@mail.gmail.com> <20160415080027.GB3217@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160415080027.GB3217-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On Friday 15 April 2016 01:30 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Fri, Apr 15, 2016 at 09:54:34AM +0200, Linus Walleij wrote:
>> On Tue, Apr 12, 2016 at 4:56 PM, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>>> NVIDIA Tegra210 supports some of the IO interface which can operate
>>> at 1.8V or 3.3V I/O rail voltage levels. SW needs to configure
>>> Tegra PMC register to set different voltage level of IO interface based
>>> on IO rail voltage from power supply i.e. power regulators.
>> Nobody seems to mention the elephant in the room: why is this
>> not using the regulator subsystem and instead using custom
>> code under drivers/soc? We have worried before about drivers/soc
>> becoming a dumping ground akin to drivers/misc
> The above changelog sounds like a regulator consumer not a regulator -
> based on what I'm reading there it's a driver that looks at the voltage
> being supplied to the device and sets some configuration in the device
> based on that voltage.  This isn't that unusual for analogue circuits
> but it's definitely not something that's actually doing voltage
> regulation.

Yes, this is not the voltage regulation or supply the voltage and hence 
can not be in regulator.


The IO pads voltage need to be configure by SW based on voltage level on 
this it is connected.
Some of tegra IO pads design like that they do not have auto detect for 
voltage level and SW needs to explicitly  set.

Because this is for making IO interface to be proper functioning, I put 
this in the pin controller rather than some other folder.
Other place my be soc/tegra but as the interfaces are from pin control 
framework, it is here.

Hope I have not confused  with APIs, tegra_io_rail_voltage_set(). 
Otherwise, tegra_io_rail_voltage_configure()??

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
