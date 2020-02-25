From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v1 2/3] mmc: block: Add mmc_bdev_to_card() helper
Date: Tue, 25 Feb 2020 15:53:04 +0100
Message-ID: <CAPDyKFoSwjkOX85jjA-Q-ScdC0aUozroOu3_-FO4yBE8pgtCow@mail.gmail.com>
References: <20200224231841.26550-1-digetx@gmail.com> <20200224231841.26550-3-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200224231841.26550-3-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, David Heidelberg <david@ixit.cz>, Peter Geis <pgwipeout@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Nicolas Chauvet <kwizart@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, Billy Laws <blaws05@gmail.com>, linux-tegra <linux-tegra@vger.kernel.org>, linux-block <linux-block@vger.kernel.org>, Andrey Danin <danindrey@mail.ru>, Gilles Grandou <gilles@grandou.net>, Ryan Grachek <ryan@edited.us>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, 25 Feb 2020 at 00:22, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> NVIDIA Tegra Partition Table takes into account MMC card's BOOT_SIZE_MULT
> parameter, and thus, the partition parser needs to retrieve that EXT_CSD
> value from the block device. This patch introduces new helper which takes
> block device for the input argument and returns corresponding MMC card.

Rather than returning the card, why not return the value you are
looking for instead? That sound more straightforward, but also allows
mmc core code to stay closer to the mmc core.

Kind regards
Uffe

>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/mmc/core/block.c | 14 ++++++++++++++
>  include/linux/mmc/card.h |  3 +++
>  2 files changed, 17 insertions(+)
>
> diff --git a/drivers/mmc/core/block.c b/drivers/mmc/core/block.c
> index 663d87924e5e..5d853450c764 100644
> --- a/drivers/mmc/core/block.c
> +++ b/drivers/mmc/core/block.c
> @@ -301,6 +301,20 @@ static ssize_t force_ro_store(struct device *dev, struct device_attribute *attr,
>         return ret;
>  }
>
> +struct mmc_card *mmc_bdev_to_card(struct block_device *bdev)
> +{
> +       struct mmc_blk_data *md;
> +
> +       if (bdev->bd_disk->major != MMC_BLOCK_MAJOR)
> +               return NULL;
> +
> +       md = mmc_blk_get(bdev->bd_disk);
> +       if (!md)
> +               return NULL;
> +
> +       return md->queue.card;
> +}
> +
>  static int mmc_blk_open(struct block_device *bdev, fmode_t mode)
>  {
>         struct mmc_blk_data *md = mmc_blk_get(bdev->bd_disk);
> diff --git a/include/linux/mmc/card.h b/include/linux/mmc/card.h
> index 90b1d83ce675..daccb0cc25f8 100644
> --- a/include/linux/mmc/card.h
> +++ b/include/linux/mmc/card.h
> @@ -7,6 +7,7 @@
>  #ifndef LINUX_MMC_CARD_H
>  #define LINUX_MMC_CARD_H
>
> +#include <linux/blkdev.h>
>  #include <linux/device.h>
>  #include <linux/mod_devicetable.h>
>
> @@ -324,4 +325,6 @@ bool mmc_card_is_blockaddr(struct mmc_card *card);
>  #define mmc_card_sd(c)         ((c)->type == MMC_TYPE_SD)
>  #define mmc_card_sdio(c)       ((c)->type == MMC_TYPE_SDIO)
>
> +struct mmc_card *mmc_bdev_to_card(struct block_device *bdev);
> +
>  #endif /* LINUX_MMC_CARD_H */
> --
> 2.24.0
>
