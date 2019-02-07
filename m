From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V14 3/5] i2c: tegra: Add DMA support
Date: Thu, 7 Feb 2019 19:17:42 +0300
Message-ID: <0b7963a4-ee9c-7296-1478-38235af7cd40@gmail.com>
References: <1549480569-24860-1-git-send-email-skomatineni@nvidia.com>
 <1549480569-24860-3-git-send-email-skomatineni@nvidia.com>
 <32b0b694-f912-044e-1a50-55b9c355d0c3@gmail.com>
 <BYAPR12MB3398350797241F90AE347FB5C2680@BYAPR12MB3398.namprd12.prod.outlook.com>
 <0a7d62c4-9dcd-08dd-4e3f-877184848daa@gmail.com>
 <20190207160630.GB17445@ulmo>
 <BYAPR12MB3398D9CA36FCFF81BBC8E7B5C2680@BYAPR12MB3398.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR12MB3398D9CA36FCFF81BBC8E7B5C2680@BYAPR12MB3398.namprd12.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

07.02.2019 19:08, Sowjanya Komatineni пишет:
> 
>>>>> It became apparent to me that there is a problem here. The size of dma_buf is 4096 bytes and maximum message length is 4096 too, we have pushed 12 bytes packet_header to the buffer >and now there are 4084 bytes left for the message in the buffer. Hence transfer of 4KB will cause buffer overflow and either crash kernel or corrupt memory. One solution is to just always >push packet_header using PIO, other to reduce max_write_len or increase dma_buf size.
>>>>
>>>> Yes, This is known to me and I will add separate patch for this to 
>>>> update quirks to take care for t186 and t194 to exclude packet hdr lengths There was separate patch when quirks were added and it got merged already from 5.0-rc1 but don’t want to sneak that here. Will send separate patch to take care of this.
>>>> Need to update quirk to exclude packet header
>>>>
>>>
>>> No. This is a bug of this patch, it must be fixed in this patch as well. 
>>>
>>
>>
>> I'm not sure we actually need this. My understanding is that it's really the payload size that's 4 KiB and 64 KiB, respectively. I don't think that includes the header.
>>
>> Thierry
> 
> As per the design, Yes that’s including the HEADER. Its total transfer per packet including header.
> 

My understanding that I2C's max read/write sizes quirks are the payload limits, and so excluding the header size. Hence I'm not sure what you are trying to say, Thierry.

Sowjanya, also.. it should be fine if you'll include the separate patch into this series, placing it before this DMA-patch. I just read your message as "patch separately from this series".
