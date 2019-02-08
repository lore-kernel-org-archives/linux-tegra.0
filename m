From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V16 4/6] i2c: tegra: Add DMA support
Date: Fri, 8 Feb 2019 21:01:37 +0300
Message-ID: <b7d3655d-288a-ac5f-a2ec-b49d150f0357@gmail.com>
References: <1549644314-1481-1-git-send-email-skomatineni@nvidia.com>
 <1549644314-1481-4-git-send-email-skomatineni@nvidia.com>
 <dd2899ab-1a5f-834c-ab97-1654845c7de2@gmail.com>
 <BYAPR12MB33980494FB2E5C439210124FC2690@BYAPR12MB3398.namprd12.prod.outlook.com>
 <BYAPR12MB33987BF143F5903AE5DA196AC2690@BYAPR12MB3398.namprd12.prod.outlook.com>
 <4ba38a07-1953-9393-8756-ce555557017a@gmail.com>
 <BYAPR12MB33984E76B8BE19ED0CB0BE17C2690@BYAPR12MB3398.namprd12.prod.outlook.com>
 <3ac41d68-976d-4674-9a31-708195d58eeb@gmail.com>
 <a4cfa59f-39d0-4a80-bbdd-d558d2d09dcc@gmail.com>
 <BYAPR12MB33987C73B01ACDC11CFAFE6DC2690@BYAPR12MB3398.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR12MB33987C73B01ACDC11CFAFE6DC2690@BYAPR12MB3398.namprd12.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

08.02.2019 20:53, Sowjanya Komatineni пишет:
>>>>>>
>>>>>>> I'm still also suggesting to squash "fix maximum transfer size" into this patch because it is really part of DMA-support enabling.
>>>>>>
>>>>>> Max transfer length limits apply to PIO also but for DMA its more needed to prevent crash.
>>>>>> So had this as patch before DMA as its applicable for both DMA & PIO.
>>>>>
>>>>> Oh, so the packet_header size also shall be excluded for the PIO as well, really? It looked to me that PIO doesn't have that restriction and we only need to exclude the header size for DMA..
>>>>>
>>>>>> We exchanged on this yesterday, so thought the reason you want to squash separate patch and include in this is due to max msg len limit and when moved into hw feature.
>>>>>
>>>>> If PIO limits are incorrect, then it's absolutely fine to do it in the separate patch. I probably just misunderstood your point.
>>>>>
>>>>>> Sorry should have verified before sending. Please confirm if I leave max transfer as separate patch or add to this DMA support. Will update along with dma buf size fix.
>>>>>>
>>>>>> But max transfer limit applied to PIO also and that’s why added it before DMA patch to show its dependency
>>>>>>
>>>>>
>>>>> And then you need to explicitly tell in the commit message that PIO limits are incorrect.
>>>> Commit message says Tegra I2C max limit per packets transfer meaning that’s interface transfer limit so applies to both PIO & DMA.
>>>> Will add explicitly indicating applicable for both PIO & DMA to be more clear
>>>
>>> Thank you.
>>>
>>>>>
>>>>> It also probably worth to add a stable-tag to the commit message to request backporting of the limits-fixing patch to the stable kernels:
>>>>>
>>>>> Cc: stable@vger.kernel.org
>>>>>
>>>> Sorry I am new to upstream submissions. By adding stable-tag to commit message, do you mean explicitly mentioning this patch applicable to old kernel and adding in patch CC stable@vger.kernel.org?
>>>>
>>>
>>> You just need to add "Cc: stable@vger.kernel.org" to the commit message, like you did for the "Reviewed-by:". Don't add "stable@vger.kernel.org" to the email recipients. See for example [0]. 
>>>
>>> [0] https://lore.kernel.org/patchwork/patch/1001991/
>>>
>>
>> And yes, it will mean that patch is applicable for older kernels.
> 
> Thanks Dmitry. Added Cc: stable@vger.kernel.org
> Also has to use 65535 instead of 64K because when buf size is computed using max_write_len with addition of packet header it will be exact 64K but max msg len is 65535
> So 1 byte less 64K should be OK

It is absolutely fine for dma_buf size to be larger than the message len. The max_write_len is off by one byte from the correct value by using 65535 - PACKET_HEADER_SIZE, I'd recommend to keep the SZ_64K.
