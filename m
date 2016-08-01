From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: Re: [PATCH V6 3/9] irqdomain: Don't set type when mapping an IRQ
Date: Mon, 1 Aug 2016 10:28:44 +0900
Message-ID: <CAK7LNARR3WmaPbri3xWmFLJw3gpwgdEPKZw9GvXyVzoiub8Wew@mail.gmail.com>
References: <1465312354-27778-1-git-send-email-jonathanh@nvidia.com>
 <1465312354-27778-4-git-send-email-jonathanh@nvidia.com> <CAK7LNASBpym341Yz57LPa5z81aLX0xmhEVvoY+q5zfiQkFSxwg@mail.gmail.com>
 <579B0F6C.9070806@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <579B0F6C.9070806-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

2016-07-29 17:10 GMT+09:00 Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>:
> On 29/07/16 04:53, Masahiro Yamada wrote:
>> Hi.
>>
>>
>> I noticed my board would not work any more
>> when pulling recent updates.
>>
>>
>> I did "git-bisect" and I found the following commit is it.
>
> It would help if you did post the log showing the failure.
>
> What if you apply the following patch:
>
> https://git.kernel.org/cgit/linux/kernel/git/maz/arm-platforms.git/diff/arch/arm64/boot/dts/socionext/uniphier-ph1-ld20.dtsi?h=timers/level-trigger&id=95e1fd920fcadce81626cfa9bd6af1a361f17e58
>

Hi Mark,

Yes, it worked.

But I did not understand why you changed the 3rd cell to 0xf08.


The binding of arm,gic-v3.txt says as follows:


  The 3rd cell is the flags, encoded as follows:
        bits[3:0] trigger type and level flags.
                1 = edge triggered
                4 = level triggered


Only 1 and 4 are defined for the bits[3:0].




0xf04 worked, too.

Which is correct?






Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
