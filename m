From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2 0/2] Add memcpy support for tegra210-adma
Date: Tue, 6 Sep 2016 14:04:20 +0100
Message-ID: <6f45ff6e-5fa7-7aca-154c-85cf235aa62f@nvidia.com>
References: <cover.1472857934.git.nicoleotsuka@gmail.com>
 <319ca097-4b10-83b9-841c-52adccbb48ad@nvidia.com>
 <5db4d7db-b1f4-c6af-de56-e8bb13ebc465@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5db4d7db-b1f4-c6af-de56-e8bb13ebc465@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, vinod.koul@intel.com
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, dmaengine@vger.kernel.org, gnurou@gmail.com, thierry.reding@gmail.com, swarren@wwwdotorg.org, ldewangan@nvidia.com
List-Id: linux-tegra@vger.kernel.org


On 06/09/16 13:03, Dmitry Osipenko wrote:
> On 06.09.2016 14:33, Jon Hunter wrote:
>>
>> On 03/09/16 01:32, Nicolin Chen wrote:
>>> This series of patches add memcpy support for tegra210 ADMA engine.
>>
>> Thanks. Any reason you choose this DMA and not the APB DMA? The APB DMA
>> is more of a generic DMA and so for memcpy it would seem to be a good
>> choice and it is available on all Tegras not just Tegra210.
>>
> 
> Just a small clarification:
> 
> If I'm not mistaken, APB DMA is mem-to-device, while AHB DMA is mem-to-mem. So,
> you probably meant AHB and not the APB.

Description from the Tegra TRM:

"The APB DMA Controller is placed between the AHB Bus and the APB Bus
and is a master on both buses.

The APB DMA Controller is used for block data transfers from a source
location to the destination location. The source may be
DRAM or IRAM, and the destination location could be devices placed on
APB Bus; or vice versa."

Cheers
Jon

-- 
nvpublic
