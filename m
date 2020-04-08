From: Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 6/6] ARM: tegra_defconfig: Enable options useful for
 Nexus 7 and Acer A500
Date: Tue, 7 Apr 2020 20:37:34 -0400
Message-ID: <CAMdYzYr76GUEEXgKippfCJDTU1L+A0UXTyO_B14vkOxVp_pijw@mail.gmail.com>
References: <20200406194110.21283-1-digetx@gmail.com> <20200406194110.21283-7-digetx@gmail.com>
 <20200407100829.GB1720957@ulmo> <70ad6fd6-9603-a114-2d0f-608110b68c0b@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <70ad6fd6-9603-a114-2d0f-608110b68c0b-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, David Heidelberg <david-W22tF5X+A20@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?Q?Pedro_=C3=82ngelo?= <pangelo-yxaQD43p5Qo@public.gmane.org>, Matt Merhar <mattmerhar-g/b1ySJe57IN+BqQ9rBEUg@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Apr 7, 2020 at 12:38 PM Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> 07.04.2020 13:08, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Mon, Apr 06, 2020 at 10:41:10PM +0300, Dmitry Osipenko wrote:
> >> Enable several drivers for hardware that is found on Nexus 7 and Acer =
A500
> >> tablet devices. Please note that some drivers may require firmware fil=
es
> >> extracted from original Android image.
> >>
> >> Link: https://github.com/digetx/linux-firmware
> >
> > What's the license for these files?
>
> It's either GPL (like touchscreen config) or something else
> redistributeable.
>
> > Can they be made available through the official linux-firmware reposito=
ry?
>
> Yes, but I don't know yet for sure whether it's really needed for all
> firmware files.
>
> For example, the T30 Broadcom WiFi doesn't work using stock
> linux-firmware, it's on my to-do list to try to figure out why.

I've encountered the same issue on the Ouya, only the original
firmware that came with it will work with the chip. (AW-NH660)
I wonder if it's an azurewave quirk.

I've also noticed the Ouya specific configuration txt file seems a lot
more involved than the standard brcm configs.

>
> While Bluetooth FW seems to be reusable be many different devices,
> although (AFAIK) nobody cared to upstream it to the linux-firmware.
