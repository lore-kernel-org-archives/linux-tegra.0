From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 3/6] partitions: Introduce NVIDIA Tegra Partition Table
Date: Fri, 15 May 2020 05:02:40 +0300
Message-ID: <821ae388-07b2-5883-95b8-c551ddc7bdea@gmail.com>
References: <20200515014143.12984-1-digetx@gmail.com>
 <20200515014143.12984-4-digetx@gmail.com>
 <055fc187-6181-6ccb-04a8-ab4324270ed7@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <055fc187-6181-6ccb-04a8-ab4324270ed7@infradead.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>, Jens Axboe <axboe@kernel.dk>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, David Heidelberg <david@ixit.cz>, Peter Geis <pgwipeout@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, Nicolas Chauvet <kwizart@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, Adrian Hunter <adrian.hunter@intel.com>, Billy Laws <blaws05@gmail.com>, =?UTF-8?Q?Nils_=c3=96stlund?= <nils@naltan.com>, Christoph Hellwig <hch@infradead.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Davidlohr Bueso <dave@stgolabs.net>
Cc: linux-tegra@vger.kernel.org, linux-block@vger.kernel.org, Andrey Danin <danindrey@mail.ru>, Gilles Grandou <gilles@grandou.net>, Ryan Grachek <ryan@edited.us>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-efi <linux-efi@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

15.05.2020 04:58, Randy Dunlap пишет:
> On 5/14/20 6:41 PM, Dmitry Osipenko wrote:
>> diff --git a/block/partitions/Kconfig b/block/partitions/Kconfig
>> index 702689a628f0..2c1408cba1a6 100644
>> --- a/block/partitions/Kconfig
>> +++ b/block/partitions/Kconfig
>> @@ -268,3 +268,11 @@ config CMDLINE_PARTITION
>>  	help
>>  	  Say Y here if you want to read the partition table from bootargs.
>>  	  The format for the command line is just like mtdparts.
>> +
>> +config TEGRA_PARTITION
>> +	bool "NVIDIA Tegra Partition support" if PARTITION_ADVANCED
>> +	default y if ARCH_TEGRA
>> +	depends on (ARCH_TEGRA && MMC_BLOCK) || COMPILE_TEST
> 
> That looks odd. Such depends are more often like:
> 	depends on MMC_BLOCK && (ARCH_TEGRA || COMPILE_TEST)
> 
> but that's just my experience. If this works when ARCH_TEGRA and MMC_BLOCK
> are not set and COMPILE_TEST is set, that's fine.

Ah, right! It shouldn't work since mmc_bdev_to_card() will be undefined
if MMC_BLOCK=n. Good catch, thank you! :)
