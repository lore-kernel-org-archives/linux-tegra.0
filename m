From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V12 3/5] i2c: tegra: Add DMA support
Date: Wed, 6 Feb 2019 16:05:56 +0300
Message-ID: <304c1916-e836-fa95-5cec-887fef8f3eb2@gmail.com>
References: <1549406769-27544-1-git-send-email-skomatineni@nvidia.com>
 <1549406769-27544-3-git-send-email-skomatineni@nvidia.com>
 <85b77477-3175-0501-8753-f39d3b60538e@gmail.com>
 <c4f67e39-df72-cc56-216b-8e6014891b52@gmail.com>
 <BYAPR12MB3398E50ED1C6909D6BCB0DDFC26F0@BYAPR12MB3398.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR12MB3398E50ED1C6909D6BCB0DDFC26F0@BYAPR12MB3398.namprd12.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

06.02.2019 16:03, Sowjanya Komatineni пишет:
>> BTW, I'm seeing "atmel_mxt_ts 0-004c: Warning: Info CRC error - device=0xF436DC file=0x000000" whithout making any modifications to the original patch as well and it shall not happen, hence there is bug somewhere. Probably FIFO triggers are still not set up correctly... ?
>>
>>
> In snippet you sent, I see you are forcing dma_burst to 1 always which is what set for fifo trigger levels as well and also you are forcing dma all the time.
> So always it will be 1 word dma burst and 1 word trigger level and that should not be an issue.
> 

I reverted that snippet, this log is collected with the yours original patch.
