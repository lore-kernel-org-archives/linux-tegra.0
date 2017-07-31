From: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Select appropriate DMA options for LPAE
Date: Mon, 31 Jul 2017 15:39:06 +0200
Message-ID: <CACRpkdYqWesH6nRJboUuF1w512f9nSjce8X4G1dRP9rKNVXY0g@mail.gmail.com>
References: <20170424225946.19425-1-contact@paulk.fr> <1499178545.12420.4.camel@paulk.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1499178545.12420.4.camel-W9ppeneeCTY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jul 4, 2017 at 4:29 PM, Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org> wrote:
> On Tue, 2017-04-25 at 00:59 +0200, Paul Kocialkowski wrote:
>> This automatically selects options for zone DMA and 64 bit DMA addresses
>> when LPAE is enabled on ARM Tegra platforms. These options are required
>> for proper operation with LPAE enabled.
>
> Bumping this one since it did not get any review yet.
>
> It should be a good candidate for inclusion now that the merge window is open.

If you don't get any reply still, send it to the ARM SoC maintainers
directly at arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org and request it to be applied.

Yours,
Linus Walleij
