From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v3 00/13] NVIDIA Tegra APB DMA driver fixes and
 improvements
Date: Wed, 8 Jan 2020 18:07:46 +0300
Message-ID: <c68cde59-0571-f58f-bf3c-8ce1cbdcc387@gmail.com>
References: <20200106011708.7463-1-digetx@gmail.com>
 <85d8ea335734417081399a082d44024c@HQMAIL105.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <85d8ea335734417081399a082d44024c@HQMAIL105.nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <treding@nvidia.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCIGF3?= <mirq-linux@rere.qmqm.pl>, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

08.01.2020 15:51, Thierry Reding пишет:
> On Mon, 06 Jan 2020 04:16:55 +0300, Dmitry Osipenko wrote:
>> Hello,
>>
>> This is series fixes some problems that I spotted recently, secondly the
>> driver's code gets a cleanup. Please review and apply, thanks in advance!
>>
>> Changelog:
>>
>> v3: - In the review comment to v1 Michał Mirosław suggested that "Prevent
>>       race conditions on channel's freeing" does changes that deserve to
>>       be separated into two patches. I factored out and improved tasklet
>>       releasing into this new patch:
>>
>>         dmaengine: tegra-apb: Clean up tasklet releasing
>>
>>     - The "Fix use-after-free" patch got an improved commit message.
>>
>> v2: - I took another look at the driver and spotted few more things that
>>       could be improved, which resulted in these new patches:
>>
>>         dmaengine: tegra-apb: Remove runtime PM usage
>>         dmaengine: tegra-apb: Clean up suspend-resume
>>         dmaengine: tegra-apb: Add missing of_dma_controller_free
>>         dmaengine: tegra-apb: Allow to compile as a loadable kernel module
>>         dmaengine: tegra-apb: Remove MODULE_ALIAS
>>
>> Dmitry Osipenko (13):
>>   dmaengine: tegra-apb: Fix use-after-free
>>   dmaengine: tegra-apb: Implement synchronization callback
>>   dmaengine: tegra-apb: Prevent race conditions on channel's freeing
>>   dmaengine: tegra-apb: Clean up tasklet releasing
>>   dmaengine: tegra-apb: Prevent race conditions of tasklet vs free list
>>   dmaengine: tegra-apb: Use devm_platform_ioremap_resource
>>   dmaengine: tegra-apb: Use devm_request_irq
>>   dmaengine: tegra-apb: Fix coding style problems
>>   dmaengine: tegra-apb: Remove runtime PM usage
>>   dmaengine: tegra-apb: Clean up suspend-resume
>>   dmaengine: tegra-apb: Add missing of_dma_controller_free
>>   dmaengine: tegra-apb: Allow to compile as a loadable kernel module
>>   dmaengine: tegra-apb: Remove MODULE_ALIAS
>>
>>  drivers/dma/Kconfig           |   2 +-
>>  drivers/dma/tegra20-apb-dma.c | 481 ++++++++++++++++------------------
>>  2 files changed, 220 insertions(+), 263 deletions(-)
> 
> Test results:
>   13 builds: 13 pass, 0 fail
>   12 boots:  11 pass, 1 fail

I'm not sure how to interpret this result. Could you please explain what
that fail means?

>   38 tests:  38 pass, 0 fail
> 
> Linux version: 5.5.0-rc5-gf9d40c056c0f
> Boards tested: tegra20-ventana, tegra30-cardhu-a04, tegra124-jetson-tk1,
>                tegra186-p2771-0000, tegra194-p2972-0000,
>                tegra210-p2371-2180
> 

Will be awesome to see the detailed testing results, at least console
log like it was with NVTB.
