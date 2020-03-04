From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 3/3] partitions: Introduce NVIDIA Tegra Partition Table
Date: Wed, 4 Mar 2020 20:09:14 +0300
Message-ID: <824a4d5f-8280-8860-3e80-68188a13aa3d@gmail.com>
References: <20200224231841.26550-1-digetx@gmail.com>
 <20200224231841.26550-4-digetx@gmail.com>
 <44c22925-a14e-96d0-1f93-1979c0c60525@wwwdotorg.org>
 <CAPDyKFoXnoukjH_2cM=f0DGHBHS6kVUQSYOa_5ffQppC7VOn2A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <CAPDyKFoXnoukjH_2cM=f0DGHBHS6kVUQSYOa_5ffQppC7VOn2A@mail.gmail.com>
Content-Language: en-US
Sender: linux-mmc-owner@vger.kernel.org
To: Ulf Hansson <ulf.hansson@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>
Cc: Jens Axboe <axboe@kernel.dk>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, David Heidelberg <david@ixit.cz>, Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, Billy Laws <blaws05@gmail.com>, linux-tegra <linux-tegra@vger.kernel.org>, linux-block <linux-block@vger.kernel.org>, Andrey Danin <danindrey@mail.ru>, Gilles Grandou <gilles@grandou.net>, Ryan Grachek <ryan@edited.us>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

04.03.2020 19:36, Ulf Hansson пишет:
> On Tue, 25 Feb 2020 at 01:20, Stephen Warren <swarren@wwwdotorg.org> wrote:
>>
>> On 2/24/20 4:18 PM, Dmitry Osipenko wrote:
>>> All NVIDIA Tegra devices use a special partition table format for the
>>> internal storage partitioning. Most of Tegra devices have GPT partition
>>> in addition to TegraPT, but some older Android consumer-grade devices do
>>> not or GPT is placed in a wrong sector, and thus, the TegraPT is needed
>>> in order to support these devices properly in the upstream kernel. This
>>> patch adds support for NVIDIA Tegra Partition Table format that is used
>>> at least by all NVIDIA Tegra20 and Tegra30 devices.
>>
>>> diff --git a/arch/arm/mach-tegra/tegra.c b/arch/arm/mach-tegra/tegra.c
>>
>>> +static void __init tegra_boot_config_table_init(void)
>>> +{
>>> +     void __iomem *bct_base;
>>> +     u16 pt_addr, pt_size;
>>> +
>>> +     bct_base = IO_ADDRESS(TEGRA_IRAM_BASE) + TEGRA_IRAM_BCT_OFFSET;
>>
>> This shouldn't be hard-coded. IIRC, the boot ROM writes a BIT (Boot
>> Information Table) to a fixed location in IRAM, and there's some value
>> in the BIT that points to where the BCT is in IRAM. In practice, it
>> might work out that the BCT is always at the same place in IRAM, but
>> this certainly isn't guaranteed. I think there's code in U-Boot which
>> extracts the BCT location from the BIT? Yes, see
>> arch/arm/mach-tegra/ap.c:get_odmdata().
> 
> So, have you considered using the command line partition option,
> rather than adding yet another partition scheme to the kernel?
> 
> In principle, you would let the boot loader scan for the partitions,
> likely from machine specific code in U-boot. Then you append these to
> the kernel command line and let block/partitions/cmdline.c scan for
> it.

The bootloader is usually locked-down on a consumer Tegra machines (it's
signed / encrypted).

Technically, it should be possible to chain-load some custom secondary
bootloader instead of a kernel image, but this is not very practical
because now:

1. There is a need to make a custom bootloader and it is quite a lot of
work.

2. You'll have to tell everybody that a custom booloader may need to be
used in order to get a working eMMC.

3. NVIDIA's bootloader already passes a command line parameter to kernel
for locating GPT entry, but this hack is not acceptable for the upstream
kernel.
