From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 3/3] partitions: Introduce NVIDIA Tegra Partition Table
Date: Tue, 25 Feb 2020 04:35:21 +0300
Message-ID: <69a76bbe-e088-6715-fefe-354dd4bc3ef2@gmail.com>
References: <20200224231841.26550-1-digetx@gmail.com>
 <20200224231841.26550-4-digetx@gmail.com>
 <44c22925-a14e-96d0-1f93-1979c0c60525@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-block-owner@vger.kernel.org>
In-Reply-To: <44c22925-a14e-96d0-1f93-1979c0c60525@wwwdotorg.org>
Content-Language: en-US
Sender: linux-block-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Jens Axboe <axboe@kernel.dk>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, David Heidelberg <david@ixit.cz>, Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>, Ulf Hansson <ulf.hansson@linaro.org>, Adrian Hunter <adrian.hunter@intel.com>, Billy Laws <blaws05@gmail.com>, linux-tegra@vger.kernel.org, linux-block@vger.kernel.org, Andrey Danin <danindrey@mail.ru>, Gilles Grandou <gilles@grandou.net>, Ryan Grachek <ryan@edited.us>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

25.02.2020 03:20, Stephen Warren пишет:
> On 2/24/20 4:18 PM, Dmitry Osipenko wrote:
>> All NVIDIA Tegra devices use a special partition table format for the
>> internal storage partitioning. Most of Tegra devices have GPT partition
>> in addition to TegraPT, but some older Android consumer-grade devices do
>> not or GPT is placed in a wrong sector, and thus, the TegraPT is needed
>> in order to support these devices properly in the upstream kernel. This
>> patch adds support for NVIDIA Tegra Partition Table format that is used
>> at least by all NVIDIA Tegra20 and Tegra30 devices.
> 
>> diff --git a/arch/arm/mach-tegra/tegra.c b/arch/arm/mach-tegra/tegra.c
> 
>> +static void __init tegra_boot_config_table_init(void)
>> +{
>> +    void __iomem *bct_base;
>> +    u16 pt_addr, pt_size;
>> +
>> +    bct_base = IO_ADDRESS(TEGRA_IRAM_BASE) + TEGRA_IRAM_BCT_OFFSET;
> 
> This shouldn't be hard-coded. IIRC, the boot ROM writes a BIT (Boot
> Information Table) to a fixed location in IRAM, and there's some value
> in the BIT that points to where the BCT is in IRAM. In practice, it
> might work out that the BCT is always at the same place in IRAM, but
> this certainly isn't guaranteed. I think there's code in U-Boot which
> extracts the BCT location from the BIT? Yes, see
> arch/arm/mach-tegra/ap.c:get_odmdata().

Thank you very much, I didn't know about that.

I checked whether Nexus 7 and A500 have a correct pointer in the BIT and
they have it. I'll take it into account in v2, thank you again.
