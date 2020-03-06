From: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v1 3/3] partitions: Introduce NVIDIA Tegra Partition Table
Date: Fri, 6 Mar 2020 14:37:24 +0100
Message-ID: <CAPDyKFric6pZbJ5-2qkwAFoeJ0c0kcha99zHJ12AUrWO6FQmgg@mail.gmail.com>
References: <20200224231841.26550-1-digetx@gmail.com> <20200224231841.26550-4-digetx@gmail.com>
 <44c22925-a14e-96d0-1f93-1979c0c60525@wwwdotorg.org> <CAPDyKFoXnoukjH_2cM=f0DGHBHS6kVUQSYOa_5ffQppC7VOn2A@mail.gmail.com>
 <824a4d5f-8280-8860-3e80-68188a13aa3d@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <824a4d5f-8280-8860-3e80-68188a13aa3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jens Axboe <axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, David Heidelberg <david-W22tF5X+A20@public.gmane.org>, Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Adrian Hunter <adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Billy Laws <blaws05-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-block <linux-block-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, Gilles Grandou <gilles-4LeZiQkTMnPR7s880joybQ@public.gmane.org>, Ryan Grachek <ryan-JnT2LfGw4MD1P9xLtpHBDw@public.gmane.org>, "linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, 4 Mar 2020 at 18:09, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> 04.03.2020 19:36, Ulf Hansson =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Tue, 25 Feb 2020 at 01:20, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wr=
ote:
> >>
> >> On 2/24/20 4:18 PM, Dmitry Osipenko wrote:
> >>> All NVIDIA Tegra devices use a special partition table format for the
> >>> internal storage partitioning. Most of Tegra devices have GPT partiti=
on
> >>> in addition to TegraPT, but some older Android consumer-grade devices=
 do
> >>> not or GPT is placed in a wrong sector, and thus, the TegraPT is need=
ed
> >>> in order to support these devices properly in the upstream kernel. Th=
is
> >>> patch adds support for NVIDIA Tegra Partition Table format that is us=
ed
> >>> at least by all NVIDIA Tegra20 and Tegra30 devices.
> >>
> >>> diff --git a/arch/arm/mach-tegra/tegra.c b/arch/arm/mach-tegra/tegra.=
c
> >>
> >>> +static void __init tegra_boot_config_table_init(void)
> >>> +{
> >>> +     void __iomem *bct_base;
> >>> +     u16 pt_addr, pt_size;
> >>> +
> >>> +     bct_base =3D IO_ADDRESS(TEGRA_IRAM_BASE) + TEGRA_IRAM_BCT_OFFSE=
T;
> >>
> >> This shouldn't be hard-coded. IIRC, the boot ROM writes a BIT (Boot
> >> Information Table) to a fixed location in IRAM, and there's some value
> >> in the BIT that points to where the BCT is in IRAM. In practice, it
> >> might work out that the BCT is always at the same place in IRAM, but
> >> this certainly isn't guaranteed. I think there's code in U-Boot which
> >> extracts the BCT location from the BIT? Yes, see
> >> arch/arm/mach-tegra/ap.c:get_odmdata().
> >
> > So, have you considered using the command line partition option,
> > rather than adding yet another partition scheme to the kernel?
> >
> > In principle, you would let the boot loader scan for the partitions,
> > likely from machine specific code in U-boot. Then you append these to
> > the kernel command line and let block/partitions/cmdline.c scan for
> > it.
>
> The bootloader is usually locked-down on a consumer Tegra machines (it's
> signed / encrypted).

Right, you are you talking about this from a developer point of view,
not from an end product user?

I mean, for sure you can upgrade the bootloader on Nvidia products? No, rea=
lly?

>
> Technically, it should be possible to chain-load some custom secondary
> bootloader instead of a kernel image, but this is not very practical
> because now:
>
> 1. There is a need to make a custom bootloader and it is quite a lot of
> work.
>
> 2. You'll have to tell everybody that a custom booloader may need to be
> used in order to get a working eMMC.

Yeah, I get the point. It's not an optimal situation, but I assume
it's about informing developers. They can cope with this, no?

>
> 3. NVIDIA's bootloader already passes a command line parameter to kernel
> for locating GPT entry, but this hack is not acceptable for the upstream
> kernel.

Well, I am just worried that we will end up with one partition format
per vendor/product, that wouldn't scale very well.

In any case, from mmc point of view I am less concerned, we can find a
way to support the needed bits. I just need to review the series more
carefully and provide some comments. :-)

However, before I do that, I would like to hear Jens opinion about
adding a new partition format, so I don't waste my time here.

Kind regards
Uffe
