From: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC 9/9] dts: tegra: WIP: hack dts to test new dt flags for i2c
Date: Mon, 20 Jul 2015 11:10:11 -0500
Message-ID: <CAL_JsqKAoydzJ5KOKJTByB9kOQ8KrSX99hVYNkm6FnOZ33xN1w@mail.gmail.com>
References: <1437142109-31975-1-git-send-email-wsa@the-dreams.de>
 <1437142109-31975-10-git-send-email-wsa@the-dreams.de> <3764937.mMMXIHUnrR@avalon>
 <20150720084557.GA2551@katana>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150720084557.GA2551@katana>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, SH-Linux <linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jul 20, 2015 at 3:45 AM, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org> wrote:
>
>> > +
>> > +           eeprom@42 {
>> > +                   compatible = "linux,slave-24c02";
>> > +                   //FIXME: Should be I2C_OWN_SLAVE_ADDRESS | 0x42
>> > +                   reg = <0xc0000042>;
>>
>> The node name doesn't match the reg property anymore. Isn't that considered as
>> a problem ?
>
> Hmm, true. So far, Rob (CCed) was fine with this approach:
> http://www.spinics.net/lists/linux-tegra/msg22760.html
>
> @Rob: If we introduce flag bits in the MSBs of an I2C address, the reg
> property is different from the node name. Is this a problem?

No, I don't it is a problem.

Rob
