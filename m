From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] arm/dt: Add SoC detection macros
Date: Mon, 19 Sep 2011 13:08:13 -0700
Message-ID: <CAOesGMjkYecYH=+YawN=v10C+Ciu-6HuWgei-d3_8ByYLSZ9rg@mail.gmail.com>
References: <1315555339-12685-1-git-send-email-amartin@nvidia.com>
	<20110917102811.GC16381@n2100.arm.linux.org.uk>
	<20110917103457.GP28104@game.jcrosoft.org>
	<20110917112321.GE16381@n2100.arm.linux.org.uk>
	<3C7A7ACA8617D24290826EC008B5CD083E17B00988@HQMAIL03.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3C7A7ACA8617D24290826EC008B5CD083E17B00988-lR+7xdUAJVNDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Sep 19, 2011 at 10:26 AM, Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wro=
te:
>> What I'm saying is that in that scenario it should not be necessary =
to edit the
>> kernel to invent new SoC types, and then teach it that Tegra4 is mos=
tly the
>> same as Tegra3. =A0That information should all be encoded into the D=
T rather
>> than the C code in the kernel.
>>
>> So, I think adding this SoC type stuff is the wrong approach to the =
problem.
>
> What ends up happening in practice for a lot of hw blocks inside the =
SoC, is that tegra4 is mostly the same as tegra3 with a few new registe=
rs and bug fixes that slightly change the programming model. =A0So eith=
er we have to add device quirks to teach device tree about the differen=
ces, and pass those in as flags to the driver, or we can do SoC detecti=
on at runtime in the driver. =A0It sounds like the consensus from you a=
nd Olof is that the first is preferable.

Well, my fear of making a performance-optimized implementation of this
is that it will be overused at runtime. As an example on how it should
not look when starting out on a new driver today, look at the gpio
driver for omap. It looks the way it does because they merged the 3
separate implementations together, but they have a bunch of functions
in there that have three completely different code paths depending on
which platform they are on. For those, having three different
functions, and a function pointer to reach it through, makes more
sense.

But for to-be-upstreamed SoC support for, for example, tegra3 -- a
platform that has device-tree support -- it would be better to do a
new compatible field in the device tree for it, and thus at the time
of probing of the device (in the driver) you will know if it's a
tegra2 or tegra3 gpio controller you are configuring. Based on that,
you can setup your driver to behave appropriately -- some of that
might of course still be runtime checks, but hopefully not too much of
it.

The SoC detection-at-runtime doesn't scale and map to drivers all that
cleanly either. Today you have a linear roadmap of devices where
development happens on the "family number" field. What if there is a
future T32 that is an evolution of T30 but with tegra4's gpio
controller, for example [assuming numbering is similar to today's
tegra2 t20/t25/etc]?   It's better to do the versioning per
IP/device/driver, than trying to map a global version/product number
per-driver to different behavior.


-Olof
