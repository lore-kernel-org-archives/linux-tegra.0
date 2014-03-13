From: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>
Subject: Re: [PATCH v2 6/6] PCI: designware: use new OF interrupt mapping when possible
Date: Thu, 13 Mar 2014 10:41:45 -0700
Message-ID: <CAJ+vNU2XrAL+BTTB8i4hQhkZ_NfcS0VrWuHUjeFfU9hhGjNXbg@mail.gmail.com>
References: <1394025951-32438-1-git-send-email-l.stach@pengutronix.de>
	<1394025951-32438-7-git-send-email-l.stach@pengutronix.de>
	<000201cf38e6$5b02d6e0$110884a0$%han@samsung.com>
	<201403061633.31260.marex@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201403061633.31260.marex-ynQEQJNshbs@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Cc: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Troy Kisky <troy.kisky-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sh <linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Mohit KUMAR DCG <Mohit.KUMAR-qxv4g6HH51o@public.gmane.org>, Pratyush Anand <pratyush.anand-qxv4g6HH51o@public.gmane.org>, Richard Zhu <r65037@fr>
List-Id: linux-tegra@vger.kernel.org

On Thu, Mar 6, 2014 at 7:33 AM, Marek Vasut <marex-ynQEQJNshbs@public.gmane.org> wrote:
> On Thursday, March 06, 2014 at 03:47:03 AM, Jingoo Han wrote:
>> On Wednesday, March 05, 2014 10:26 PM, Lucas Stach wrote:
>> > This is the recommended method of doing the IRQ
>> > mapping. For old devicetrees we fall back to the
>> > previous practice.
>> >
>> > Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
>> > Acked-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
>>
>> (+cc Mohit KUMAR, Richard Zhu, Pratyush Anand, Marek Vasut,
>>        Kishon Vijay Abraham I)
>>
>> Acked-by: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
>>
>> It works properly on Exynos platform.
>> Thank you.
>
> Looks reasonable,
>
> Reviewed-by: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
>

I've tested this on the Gateworks Ventana products with P2P bridges
and with the patch I just submitted here:
http://thread.gmane.org/gmane.linux.kernel.pci/30017

Tested-by: Tim Harvey <tharvey-UMMOYl/HMS+akBO8gow8eQ@public.gmane.org>

Tim
