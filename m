From: Sameer Pujar <spujar@nvidia.com>
Subject: Re: [PATCH] dmaengine: tegra210-adma: fix transfer failure
Date: Fri, 21 Jun 2019 08:36:26 +0530
Message-ID: <bcd31292-4caf-19fa-c4ea-d85c5fd77861@nvidia.com>
References: <1561047348-14413-1-git-send-email-spujar@nvidia.com>
 <bf478236-9aa7-68cc-4a56-296db2fc4379@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <bf478236-9aa7-68cc-4a56-296db2fc4379@nvidia.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, vkoul@kernel.org, dan.j.williams@intel.com
Cc: thierry.reding@gmail.com, ldewangan@nvidia.com, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 6/20/2019 10:13 PM, Jon Hunter wrote:
> On 20/06/2019 17:15, Sameer Pujar wrote:
>>  From Tegra186 onwards OUTSTANDING_REQUESTS field is added in channel
>> configuration register (bits 7:4). ADMA allows a maximum of 8 reads
>> to source and that many writes to target memory be outstanding at any
>> given point of time. If this field is not programmed, DMA transfers
>> fail to happen.
> BTW, I am not sure I follow the above. You say a max of 8 reads to the
> source, however, the field we are programming can have a value of up to
> 15. So does that mean this field should only be programmed with a max of 8?
Yes. As per spec. ADMA allows max value of 8.
> Thanks
> Jon
>
