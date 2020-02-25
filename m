From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 2/3] mmc: block: Add mmc_bdev_to_card() helper
Date: Tue, 25 Feb 2020 18:46:44 +0300
Message-ID: <62a4e5ac-40c2-7fb2-60eb-e465c665270f@gmail.com>
References: <20200224231841.26550-1-digetx@gmail.com>
 <20200224231841.26550-3-digetx@gmail.com>
 <CAPDyKFoSwjkOX85jjA-Q-ScdC0aUozroOu3_-FO4yBE8pgtCow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-block-owner@vger.kernel.org>
In-Reply-To: <CAPDyKFoSwjkOX85jjA-Q-ScdC0aUozroOu3_-FO4yBE8pgtCow@mail.gmail.com>
Content-Language: en-US
Sender: linux-block-owner@vger.kernel.org
To: Ulf Hansson <ulf.hansson@linaro.org>, Jens Axboe <axboe@kernel.dk>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, David Heidelberg <david@ixit.cz>, Peter Geis <pgwipeout@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Nicolas Chauvet <kwizart@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, Billy Laws <blaws05@gmail.com>, linux-tegra <linux-tegra@vger.kernel.org>, linux-block <linux-block@vger.kernel.org>, Andrey Danin <danindrey@mail.ru>, Gilles Grandou <gilles@grandou.net>, Ryan Grachek <ryan@edited.us>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

25.02.2020 17:53, Ulf Hansson пишет:
> On Tue, 25 Feb 2020 at 00:22, Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> NVIDIA Tegra Partition Table takes into account MMC card's BOOT_SIZE_MULT
>> parameter, and thus, the partition parser needs to retrieve that EXT_CSD
>> value from the block device. This patch introduces new helper which takes
>> block device for the input argument and returns corresponding MMC card.
> 
> Rather than returning the card, why not return the value you are
> looking for instead? That sound more straightforward, but also allows
> mmc core code to stay closer to the mmc core.

Please take a look at patch #3, in particular see the
tegra_partition_table_emmc_boot_offset(). We already need more than just
the BOOT_SIZE_MULT from the struct mmc_card, in the the v2 of this
series we will probably need even a bit more.

I'll adjust the commit's message of this patch in v2, saying that more
than BOOT_SIZE_MULT is needed from the struct mmc_card. Are you okay
with this variant?

----

BTW, do you have any idea how partition table scanning of MMC's boot0/1
partitions potentially could be implemented?

It's not uncommon for Tegra devices that partition table could reside in
one of the MMC's boot partitions (Nexus 7 is one example). For now I
don't see how the scanning could be implemented easily because all
boot0/boot1/main partitions are very separated from each other in the
kernel's MMC_BLOCK.

One potential hack that comes into my mind is that the boot0/1
partitions could be always registered before the main MMC partition and
then they always will be scanned first, i.e. before the main partition.
This will allow to read out partition table from the boot partitions and
stash it for the main.
