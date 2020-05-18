From: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v6 2/7] mmc: block: Add mmc_bdev_to_card() helper
Date: Mon, 18 May 2020 09:24:42 +0200
Message-ID: <CAPDyKFrGbKSx=afZCNBN_r_6iNm_TX0tZVRLK05ZUTDBGvAuyA@mail.gmail.com>
References: <20200517021225.22890-1-digetx@gmail.com> <20200517021225.22890-3-digetx@gmail.com>
 <7bddacf1-5fe0-5119-48ac-6a0cc65c5af0@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <7bddacf1-5fe0-5119-48ac-6a0cc65c5af0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jens Axboe <axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, David Heidelberg <david-W22tF5X+A20@public.gmane.org>, Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Adrian Hunter <adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Billy Laws <blaws05-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?Q?Nils_=C3=96stlund?= <nils-ElENwYY5mljQT0dZR+AlfA@public.gmane.org>, Christoph Hellwig <hch-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Davidlohr Bueso <dave-h16yJtLeMjHk1uMJSBkQmQ@public.gmane.org>, Randy Dunlap <rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-block <linux-block-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, Gilles Grandou <gilles@grandou>
List-Id: linux-tegra@vger.kernel.org

On Mon, 18 May 2020 at 01:55, Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> 17.05.2020 05:12, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > NVIDIA Tegra Partition Table takes into account MMC card's BOOT_SIZE_MU=
LT
> > parameter, and thus, the partition parser needs to retrieve that EXT_CS=
D
> > value from the block device.  There are also some other parts of struct
> > mmc_card that are needed for the partition parser in order to calculate
> > the eMMC offset and verify different things.  This patch introduces new
> > helper which takes block device for the input argument and returns the
> > corresponding MMC card.
> >
> > Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  drivers/mmc/core/block.c   | 15 +++++++++++++++
> >  include/linux/mmc/blkdev.h | 13 +++++++++++++
> >  2 files changed, 28 insertions(+)
> >  create mode 100644 include/linux/mmc/blkdev.h
> >
> > diff --git a/drivers/mmc/core/block.c b/drivers/mmc/core/block.c
> > index c5367e2c8487..99298e888381 100644
> > --- a/drivers/mmc/core/block.c
> > +++ b/drivers/mmc/core/block.c
> > @@ -40,6 +40,7 @@
> >  #include <linux/debugfs.h>
> >
> >  #include <linux/mmc/ioctl.h>
> > +#include <linux/mmc/blkdev.h>
> >  #include <linux/mmc/card.h>
> >  #include <linux/mmc/host.h>
> >  #include <linux/mmc/mmc.h>
> > @@ -305,6 +306,20 @@ static ssize_t force_ro_store(struct device *dev, =
struct device_attribute *attr,
> >       return ret;
> >  }
> >
> > +struct mmc_card *mmc_bdev_to_card(struct block_device *bdev)
> > +{
> > +     struct mmc_blk_data *md;
> > +
> > +     if (bdev->bd_disk->major !=3D MMC_BLOCK_MAJOR)
> > +             return NULL;
> > +
> > +     md =3D mmc_blk_get(bdev->bd_disk);
> > +     if (!md)
> > +             return NULL;
> > +
> > +     return md->queue.card;
> > +}
> > +
> >  static int mmc_blk_open(struct block_device *bdev, fmode_t mode)
> >  {
> >       struct mmc_blk_data *md =3D mmc_blk_get(bdev->bd_disk);
> > diff --git a/include/linux/mmc/blkdev.h b/include/linux/mmc/blkdev.h
> > new file mode 100644
> > index 000000000000..67608c58de70
> > --- /dev/null
> > +++ b/include/linux/mmc/blkdev.h
> > @@ -0,0 +1,13 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + *  linux/include/linux/mmc/blkdev.h
> > + */
> > +#ifndef LINUX_MMC_BLOCK_DEVICE_H
> > +#define LINUX_MMC_BLOCK_DEVICE_H
> > +
> > +struct block_device;
> > +struct mmc_card;
> > +
> > +struct mmc_card *mmc_bdev_to_card(struct block_device *bdev);
> > +
> > +#endif /* LINUX_MMC_BLOCK_DEVICE_H */
> >
>
> Hello Ulf / Jens and everyone,

Hi Dmitry,

>
> Guys, what do you think about this change?

As I stated in an earlier reply, I am deferring the review from mmc
point of view, until I see some confirmation from Jens that he is okay
with adding a new partition format.

Otherwise I may just waste my time on reviews. I hope you understand.

Kind regards
Uffe

>
> Currently it's not allowed to compile MMC_BLOCK as a loadable kernel
> module if TEGRA_PARTITION is enabled because it depends on MMC_BLOCK
> presence. I'm curious if this situation could be improved by moving
> mmc_bdev_to_card() to linux/mmc/blkdev.h and then:
>
> 1. Moving all private mmc/core/block.c structs to the public
> linux/mmc/blkdev.h.
>
> 2. Or adding a "private opaque" pointer to a struct block_device and
> setting it to md->queue.card, for example.
>
> 3. I see that struct block_device already has some bd_private field, but
> I'm not sure whether it could be used for what I'm trying to achieve.
> Actually I don't see where bd_private is used in kernel at all.
>
> I'd like get yours feedback, thanks in advance.
