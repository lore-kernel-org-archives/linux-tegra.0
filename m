From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 1/3] mmc: core: Add raw_boot_mult field to mmc_ext_csd
Date: Mon, 2 Mar 2020 02:09:08 +0300
Message-ID: <0fb5f6ec-8aa0-3bc8-e6cc-8e061c401839@gmail.com>
References: <20200224231841.26550-1-digetx@gmail.com>
 <20200224231841.26550-2-digetx@gmail.com>
 <MN2PR04MB699121991FCB80BE39FC106FFCE60@MN2PR04MB6991.namprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <MN2PR04MB699121991FCB80BE39FC106FFCE60-lFdnouXQuT6w2H5UOYkxGlM8qxBPnqtHvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Avri Altman <Avri.Altman-Sjgp3cTcYWE@public.gmane.org>, Jens Axboe <axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, David Heidelberg <david-W22tF5X+A20@public.gmane.org>, Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Adrian Hunter <adrian.hunter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Billy Laws <blaws05-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-block-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-block-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, Gilles Grandou <gilles-4LeZiQkTMnPR7s880joybQ@public.gmane.org>, Ryan Grachek <ryan-JnT2LfGw4MD1P9xLtpHBDw@public.gmane.org>, "linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-mmc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

01.03.2020 13:50, Avri Altman пишет:
> Hi,
>>
>>
>> In order to support parsing of NVIDIA Tegra Partition Table format, we
>> need to know the BOOT_SIZE_MULT value of the Extended CSD register
>> because
>> NVIDIA's bootloader linearizes the boot0/boot1/main partitions into a
>> single virtual space, and thus, all partition addresses are shifted by
>> the size of boot0 + boot1 partitions.
>>
>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>>  drivers/mmc/core/mmc.c   | 2 ++
>>  include/linux/mmc/card.h | 1 +
>>  2 files changed, 3 insertions(+)
>>
>> diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
>> index f6912ded652d..88e5b4224d3c 100644
>> --- a/drivers/mmc/core/mmc.c
>> +++ b/drivers/mmc/core/mmc.c
>> @@ -417,6 +417,8 @@ static int mmc_decode_ext_csd(struct mmc_card
>> *card, u8 *ext_csd)
>>                 ext_csd[EXT_CSD_ERASE_TIMEOUT_MULT];
>>         card->ext_csd.raw_hc_erase_grp_size =
>>                 ext_csd[EXT_CSD_HC_ERASE_GRP_SIZE];
>> +       card->ext_csd.raw_boot_mult =
>> +               ext_csd[EXT_CSD_BOOT_MULT];
> You might want at this point multiply it by 128K,
> And get rid of: part_size = ext_csd[EXT_CSD_BOOT_MULT] << 17;
> Below...

But it's not a *raw* _boot_mult anymore then. I'm not sure that it will
be a worthwhile change.
