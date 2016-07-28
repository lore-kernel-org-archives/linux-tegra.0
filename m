From: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 3/6] dt/bindings: Add bindings for Tegra20/30 NOR bus driver
Date: Thu, 28 Jul 2016 11:29:03 +0200
Message-ID: <CALw8SCX+Sktdij7AKFtkAh3To6qA16xtZNFi4GpkzHE8256N_w@mail.gmail.com>
References: <1468935397-11926-1-git-send-email-mirza.krak@gmail.com>
 <1468935397-11926-4-git-send-email-mirza.krak@gmail.com> <20160725113034.GD21170@ulmo.ba.sec>
 <CALw8SCWEFVu__8Gyr5q995h+=oMQEz1VUNB=Ne7MRb0O-tZXqg@mail.gmail.com> <20160725141544.GN21170@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160725141544.GN21170-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

2016-07-25 16:15 GMT+02:00 Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> On Mon, Jul 25, 2016 at 03:16:28PM +0200, Mirza Krak wrote:
>> 2016-07-25 13:30 GMT+02:00 Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> Yes, that clarifies many things. The presence of an external, address-
> based chip-select is essential information in order to describe this
> setup properly.
>
> Given that the external chip select is entirely invisible to software, I
> think a more accurate description of your setup would be:
>
>         gmi@70090000 {
>                 ...
>
>                 /* for the chip select */
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>
>                 /*
>                  * Technically this could be used to translate the range from
>                  * 0x48000000 to 0x4fffffff into a different range, but that
>                  * no longer works because of the #address-cells. Does this
>                  * matter?
>                  */
>                 ranges;
>
>                 bus@0 {
>                         compatible = "simple-bus";
>                         reg = <0>;
>
>                         #address-cells = <1>;
>                         #size-cells = <1>;
>
>                         can@48000000 {
>                                 reg = <0x48000000 0x100>;
>                                 ...
>                         };
>
>                         can@48040000 {
>                                 reg = <0x48040000 0x100>;
>                                 ...
>                         };
>                 };
>         };
>

Finally got around to test this. Above example had some issues, or I
am doing something wrong.

First of, the address parser does not seem to like that #size-cells =
<0> when ranges are empty. Got following warning from device tree
compiler:
Warning (ranges_format): /nor@70009000 has empty "ranges" property but
its #size-cells (0) differs from / (1)

and on boot:
[    0.399357] prom_parse: Bad cell count for /nor@70009000/bus@0

Got it to work if I changed to (also had to add an empty ranges prop
in bus node):

gmi@70009000 {
    #address-cells = <1>;
    #size-cells = <1>;
    ranges;

    bus@0,0 {
                compatible = "simple-bus";
                reg = <0 0>;
                ranges;

                #address-cells = <1>;
                #size-cells = <1>;

                can@48000000 {
                    reg = <0x48000000 0x100>;
                    ...
                };


                can@48040000 {
                    reg = <0x48040000 0x100>;
                    ...
                };
}

But I wonder is there something wrong with below example (which does
work), that is omitting the bus node:

gmi@70009000 {
    #address-cells = <1>;
    #size-cells = <1>;
    ranges;

    can@48000000 {
        reg = <0x48000000 0x100>;
        ...
    };

    can@48040000 {
        reg = <0x48040000 0x100>;
        ...
    };
}

Just feel that I need to duplicate information if add an bus node.

Best Regards,
Mirza
