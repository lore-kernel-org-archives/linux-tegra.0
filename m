From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 0/2] Add memcpy support for tegra210-adma
Date: Tue, 6 Sep 2016 17:27:05 +0300
Message-ID: <3a06dec1-882a-03f1-d826-212918dfa893@gmail.com>
References: <cover.1472857934.git.nicoleotsuka@gmail.com>
 <319ca097-4b10-83b9-841c-52adccbb48ad@nvidia.com>
 <5db4d7db-b1f4-c6af-de56-e8bb13ebc465@gmail.com>
 <6f45ff6e-5fa7-7aca-154c-85cf235aa62f@nvidia.com>
 <cad2c99c-3eee-3fa1-4559-e60f7f4a22c7@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cad2c99c-3eee-3fa1-4559-e60f7f4a22c7@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Nicolin Chen <nicoleotsuka@gmail.com>, vinod.koul@intel.com
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, dmaengine@vger.kernel.org, gnurou@gmail.com, thierry.reding@gmail.com, swarren@wwwdotorg.org, ldewangan@nvidia.com
List-Id: linux-tegra@vger.kernel.org

On 06.09.2016 16:46, Jon Hunter wrote:
> 
> On 06/09/16 14:04, Jon Hunter wrote:
>>
>> On 06/09/16 13:03, Dmitry Osipenko wrote:
>>> On 06.09.2016 14:33, Jon Hunter wrote:
>>>>
>>>> On 03/09/16 01:32, Nicolin Chen wrote:
>>>>> This series of patches add memcpy support for tegra210 ADMA engine.
>>>>
>>>> Thanks. Any reason you choose this DMA and not the APB DMA? The APB DMA
>>>> is more of a generic DMA and so for memcpy it would seem to be a good
>>>> choice and it is available on all Tegras not just Tegra210.
>>>>
>>>
>>> Just a small clarification:
>>>
>>> If I'm not mistaken, APB DMA is mem-to-device, while AHB DMA is mem-to-mem. So,
>>> you probably meant AHB and not the APB.
>>
>> Description from the Tegra TRM:
>>
>> "The APB DMA Controller is placed between the AHB Bus and the APB Bus
>> and is a master on both buses.
>>
>> The APB DMA Controller is used for block data transfers from a source
>> location to the destination location. The source may be
>> DRAM or IRAM, and the destination location could be devices placed on
>> APB Bus; or vice versa."
> 
> Sorry this appears to be a completely worthless response :-(
> 
> I had made the assumption that if the DMA can transfer from APB-to-AHB
> and AHB-to-APB, it could also do AHB to AHB. However, now I look closely
> at the registers I see that it cannot and therefore, cannot support
> memcpy at all! Ok, so ignore my comment here, as it appears only the
> ADMA can support memcpy. Weird.
> 

On older Tegra's there is AHB DMA controller for mem-to-mem transfers. The K1
manual states that it's been deprecated, however there is an interrupt dedicated
to it (probably wrong TRM?). X1 TRM also states the deprecation, doesn't have
the interrupt mention that K1 has and has ADMA.

-- 
Dmitry
