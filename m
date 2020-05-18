From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 2/7] mmc: block: Add mmc_bdev_to_card() helper
Date: Mon, 18 May 2020 10:51:34 +0300
Message-ID: <41f4739f-5fd4-b6d8-9b3b-953411d31b97@gmail.com>
References: <20200517021225.22890-1-digetx@gmail.com>
 <20200517021225.22890-3-digetx@gmail.com>
 <7bddacf1-5fe0-5119-48ac-6a0cc65c5af0@gmail.com>
 <CAPDyKFrGbKSx=afZCNBN_r_6iNm_TX0tZVRLK05ZUTDBGvAuyA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <CAPDyKFrGbKSx=afZCNBN_r_6iNm_TX0tZVRLK05ZUTDBGvAuyA@mail.gmail.com>
Content-Language: en-US
Sender: linux-mmc-owner@vger.kernel.org
To: Ulf Hansson <ulf.hansson@linaro.org>, Jens Axboe <axboe@kernel.dk>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, David Heidelberg <david@ixit.cz>, Peter Geis <pgwipeout@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Nicolas Chauvet <kwizart@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, Billy Laws <blaws05@gmail.com>, =?UTF-8?Q?Nils_=c3=96stlund?= <nils@naltan.com>, Christoph Hellwig <hch@infradead.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Davidlohr Bueso <dave@stgolabs.net>, Randy Dunlap <rdunlap@infradead.org>, linux-tegra <linux-tegra@vger.kernel.org>, linux-block <linux-block@vger.kernel.org>, Andrey Danin <danindrey@mail.ru>, Gilles Grandou <gilles@grandou.net>, Ryan Grachek <ryan@edit>
List-Id: linux-tegra@vger.kernel.org

18.05.2020 10:24, Ulf Hansson пишет:
> On Mon, 18 May 2020 at 01:55, Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> 17.05.2020 05:12, Dmitry Osipenko пишет:
>>> NVIDIA Tegra Partition Table takes into account MMC card's BOOT_SIZE_MULT
>>> parameter, and thus, the partition parser needs to retrieve that EXT_CSD
>>> value from the block device.  There are also some other parts of struct
>>> mmc_card that are needed for the partition parser in order to calculate
>>> the eMMC offset and verify different things.  This patch introduces new
>>> helper which takes block device for the input argument and returns the
>>> corresponding MMC card.
>>>
>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>> ---
>>>  drivers/mmc/core/block.c   | 15 +++++++++++++++
>>>  include/linux/mmc/blkdev.h | 13 +++++++++++++
>>>  2 files changed, 28 insertions(+)
>>>  create mode 100644 include/linux/mmc/blkdev.h
>>>
>>> diff --git a/drivers/mmc/core/block.c b/drivers/mmc/core/block.c
>>> index c5367e2c8487..99298e888381 100644
>>> --- a/drivers/mmc/core/block.c
>>> +++ b/drivers/mmc/core/block.c
>>> @@ -40,6 +40,7 @@
>>>  #include <linux/debugfs.h>
>>>
>>>  #include <linux/mmc/ioctl.h>
>>> +#include <linux/mmc/blkdev.h>
>>>  #include <linux/mmc/card.h>
>>>  #include <linux/mmc/host.h>
>>>  #include <linux/mmc/mmc.h>
>>> @@ -305,6 +306,20 @@ static ssize_t force_ro_store(struct device *dev, struct device_attribute *attr,
>>>       return ret;
>>>  }
>>>
>>> +struct mmc_card *mmc_bdev_to_card(struct block_device *bdev)
>>> +{
>>> +     struct mmc_blk_data *md;
>>> +
>>> +     if (bdev->bd_disk->major != MMC_BLOCK_MAJOR)
>>> +             return NULL;
>>> +
>>> +     md = mmc_blk_get(bdev->bd_disk);
>>> +     if (!md)
>>> +             return NULL;
>>> +
>>> +     return md->queue.card;
>>> +}
>>> +
>>>  static int mmc_blk_open(struct block_device *bdev, fmode_t mode)
>>>  {
>>>       struct mmc_blk_data *md = mmc_blk_get(bdev->bd_disk);
>>> diff --git a/include/linux/mmc/blkdev.h b/include/linux/mmc/blkdev.h
>>> new file mode 100644
>>> index 000000000000..67608c58de70
>>> --- /dev/null
>>> +++ b/include/linux/mmc/blkdev.h
>>> @@ -0,0 +1,13 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +/*
>>> + *  linux/include/linux/mmc/blkdev.h
>>> + */
>>> +#ifndef LINUX_MMC_BLOCK_DEVICE_H
>>> +#define LINUX_MMC_BLOCK_DEVICE_H
>>> +
>>> +struct block_device;
>>> +struct mmc_card;
>>> +
>>> +struct mmc_card *mmc_bdev_to_card(struct block_device *bdev);
>>> +
>>> +#endif /* LINUX_MMC_BLOCK_DEVICE_H */
>>>
>>
>> Hello Ulf / Jens and everyone,
> 
> Hi Dmitry,
> 
>>
>> Guys, what do you think about this change?
> 
> As I stated in an earlier reply, I am deferring the review from mmc
> point of view, until I see some confirmation from Jens that he is okay
> with adding a new partition format.
> 
> Otherwise I may just waste my time on reviews. I hope you understand.

Hello Ulf,

I understand yours concerns. However, since the v6 of this series, the
information about MMC card is also needed if we'll want to support
devices that have GPT entry and use an older bootloader version.

Jens, could you please let us know whether we aren't wasting our time
here? :) If it's not desirable to support hacks that are needed for
consumer-grade Tegra-based Android devices in upstream kernel for the
case of the eMMC storage, then I'll stop this effort and won't bother
you again with these patches.
