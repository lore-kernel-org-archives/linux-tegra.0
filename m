From: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH V6 3/9] irqdomain: Don't set type when mapping an IRQ
Date: Fri, 29 Jul 2016 09:10:20 +0100
Message-ID: <579B0F6C.9070806@arm.com>
References: <1465312354-27778-1-git-send-email-jonathanh@nvidia.com>
 <1465312354-27778-4-git-send-email-jonathanh@nvidia.com>
 <CAK7LNASBpym341Yz57LPa5z81aLX0xmhEVvoY+q5zfiQkFSxwg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK7LNASBpym341Yz57LPa5z81aLX0xmhEVvoY+q5zfiQkFSxwg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kevin Hilman <khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 29/07/16 04:53, Masahiro Yamada wrote:
> Hi.
> 
> 
> I noticed my board would not work any more
> when pulling recent updates.
> 
> 
> I did "git-bisect" and I found the following commit is it.

It would help if you did post the log showing the failure.

What if you apply the following patch:

https://git.kernel.org/cgit/linux/kernel/git/maz/arm-platforms.git/diff/arch/arm64/boot/dts/socionext/uniphier-ph1-ld20.dtsi?h=timers/level-trigger&id=95e1fd920fcadce81626cfa9bd6af1a361f17e58

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
