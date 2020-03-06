From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 3/3] partitions: Introduce NVIDIA Tegra Partition Table
Date: Sat, 7 Mar 2020 00:56:04 +0300
Message-ID: <82974dbe-9e6c-95fd-dd4d-b1cedc33f8ea@gmail.com>
References: <20200224231841.26550-1-digetx@gmail.com>
 <20200224231841.26550-4-digetx@gmail.com>
 <44c22925-a14e-96d0-1f93-1979c0c60525@wwwdotorg.org>
 <CAPDyKFoXnoukjH_2cM=f0DGHBHS6kVUQSYOa_5ffQppC7VOn2A@mail.gmail.com>
 <824a4d5f-8280-8860-3e80-68188a13aa3d@gmail.com>
 <CAPDyKFric6pZbJ5-2qkwAFoeJ0c0kcha99zHJ12AUrWO6FQmgg@mail.gmail.com>
 <6fe6d262-c6b0-52d8-0150-4c32a4c36cbd@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <6fe6d262-c6b0-52d8-0150-4c32a4c36cbd@wwwdotorg.org>
Content-Language: en-US
Sender: linux-mmc-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Ulf Hansson <ulf.hansson@linaro.org>, Jens Axboe <axboe@kernel.dk>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, David Heidelberg <david@ixit.cz>, Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, Billy Laws <blaws05@gmail.com>, linux-tegra <linux-tegra@vger.kernel.org>, linux-block <linux-block@vger.kernel.org>, Andrey Danin <danindrey@mail.ru>, Gilles Grandou <gilles@grandou.net>, Ryan Grachek <ryan@edited.us>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

06.03.2020 19:52, Stephen Warren пишет:
> On 3/6/20 6:37 AM, Ulf Hansson wrote:
>> On Wed, 4 Mar 2020 at 18:09, Dmitry Osipenko <digetx@gmail.com> wrote:
>>>
>>> 04.03.2020 19:36, Ulf Hansson пишет:
>>>> On Tue, 25 Feb 2020 at 01:20, Stephen Warren <swarren@wwwdotorg.org>
>>>> wrote:
>>>>>
>>>>> On 2/24/20 4:18 PM, Dmitry Osipenko wrote:
>>>>>> All NVIDIA Tegra devices use a special partition table format for the
>>>>>> internal storage partitioning. Most of Tegra devices have GPT
>>>>>> partition
>>>>>> in addition to TegraPT, but some older Android consumer-grade
>>>>>> devices do
>>>>>> not or GPT is placed in a wrong sector, and thus, the TegraPT is
>>>>>> needed
>>>>>> in order to support these devices properly in the upstream kernel.
>>>>>> This
>>>>>> patch adds support for NVIDIA Tegra Partition Table format that is
>>>>>> used
>>>>>> at least by all NVIDIA Tegra20 and Tegra30 devices.
>>>>>
>>>>>> diff --git a/arch/arm/mach-tegra/tegra.c
>>>>>> b/arch/arm/mach-tegra/tegra.c
>>>>>
>>>>>> +static void __init tegra_boot_config_table_init(void)
>>>>>> +{
>>>>>> +     void __iomem *bct_base;
>>>>>> +     u16 pt_addr, pt_size;
>>>>>> +
>>>>>> +     bct_base = IO_ADDRESS(TEGRA_IRAM_BASE) + TEGRA_IRAM_BCT_OFFSET;
>>>>>
>>>>> This shouldn't be hard-coded. IIRC, the boot ROM writes a BIT (Boot
>>>>> Information Table) to a fixed location in IRAM, and there's some value
>>>>> in the BIT that points to where the BCT is in IRAM. In practice, it
>>>>> might work out that the BCT is always at the same place in IRAM, but
>>>>> this certainly isn't guaranteed. I think there's code in U-Boot which
>>>>> extracts the BCT location from the BIT? Yes, see
>>>>> arch/arm/mach-tegra/ap.c:get_odmdata().
>>>>
>>>> So, have you considered using the command line partition option,
>>>> rather than adding yet another partition scheme to the kernel?
>>>>
>>>> In principle, you would let the boot loader scan for the partitions,
>>>> likely from machine specific code in U-boot. Then you append these to
>>>> the kernel command line and let block/partitions/cmdline.c scan for
>>>> it.
>>>
>>> The bootloader is usually locked-down on a consumer Tegra machines (it's
>>> signed / encrypted).
>>
>> Right, you are you talking about this from a developer point of view,
>> not from an end product user?
>>
>> I mean, for sure you can upgrade the bootloader on Nvidia products?
>> No, really?
> 
> For developer-oriented products like Jetson developer kits, you can
> upgrade the bootloader, and luckily they haven't used this partition
> table format for many versions.
> 
> However, commercial Android products typically have secure boot enabled,
> so you can't replace the bootloader unless you know the secure boot
> keys, which only the manufacturer knows. Dmitry is working on
> re-purposing such products.

Thank you very much for the good clarification :)
