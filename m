From: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 3/6] dt/bindings: Add bindings for Tegra20/30 NOR bus driver
Date: Mon, 25 Jul 2016 15:50:55 +0200
Message-ID: <CALw8SCVkAXN0GBFXKthB=bHCAiOioVE-MTg3AGsZHK3kdcEMJw@mail.gmail.com>
References: <1468935397-11926-1-git-send-email-mirza.krak@gmail.com>
 <1468935397-11926-4-git-send-email-mirza.krak@gmail.com> <434561ec-510e-a3bf-c7b6-c961db299bd6@nvidia.com>
 <20160725115923.GF21170@ulmo.ba.sec> <CALw8SCU6vWeDyoy+t53k2+tmnrZd+ieBV88Vc6FSL9x3FzSm5g@mail.gmail.com>
 <20160725133922.GK21170@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160725133922.GK21170-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

2016-07-25 15:39 GMT+02:00 Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> On Mon, Jul 25, 2016 at 03:30:34PM +0200, Mirza Krak wrote:
>> 2016-07-25 13:59 GMT+02:00 Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
>> > On Thu, Jul 21, 2016 at 10:56:44AM +0100, Jon Hunter wrote:
>> >>
>> >
>> >> > +Note that the NOR controller does not have any internal chip-select address
>> >> > +decoding and if you want to access multiple devices external chip-select
>> >> > +decoding must be provided.
>> >>
>> >> Although it is true, you do have the MIO address space and so you could
>> >> support two devices via the SNOR address space and MIO address space
>> >> (assuming that the MIO can be used for the 2nd device).
>> >
>> > Now I'm even more confused. If the GMI controller itself can't select a
>> > chip, what is the SNOR_SEL field in the SNOR_CONFIG_0 register for? Does
>> > that not select a specific chip?
>> >
>> >> Furthermore, if you do have external logic to support multiple devices
>> >> this would assume that the devices use the same timing and so are
>> >> probably the same type. It also assumes both can fit in the 256MB
>> >> address range. May be worth mentioning.
>> >
>> > Similarly if you switch between different devices, wouldn't you have to
>> > reprogram the timing registers if they are different?
>> >
>> > The way I remember this kind of interface to work (it's been a long time
>> > since I used one) is that in order to operate on a chip you need to
>> > acquire the bus first. Typically that would be an API exposed by the bus
>> > driver or some framework that the bus driver registers with. That API
>> > arbitrates between multiple devices on the bus and makes sure that the
>> > proper chip select is asserted and timing is programmed when you're
>> > granted access. A driver that has acquired the bus can then perform what
>> > operations they need and release the bus when done.
>> >
>> > SPI uses a mechanism like this, for example.
>> >
>> > Thierry
>>
>> From my experience (maybe not as long as yours :)) but these kind of
>> things would be handled by the controller. At least with previous SOCs
>> that I have used, PXA270, PXA300 and i.MX SOCs.
>>
>> That it has an address range per chip-select PIN and timing registers
>> per chip-select. And thus eliminating a need for a infrastructure or
>> framework.
>
> Okay, so the controllers have a translation table that needs to be
> programmed and which maps address ranges to chip-selects. That's a nifty
> feature, but I think it's also fairly specialized. In such a setup there
> doesn't need to be a concept of chip-selects in software because it's
> all transparently handled by the controller. Effectively the only time a
> chip-select is needed is during the initial programming of the
> controller when the translation table is set up.

Yes, and in some cases you can not "program" the map as it is fixed in hardware.
