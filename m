From: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Re: [PATCH 08/10] drm/tegra: Implement dynamic channel allocation
 model
Date: Tue, 7 Nov 2017 14:29:52 +0200
Message-ID: <38fcf947-0d5d-e2c7-f49f-9efce5eeb1a3@kapsi.fi>
References: <20171105110118.15142-1-mperttunen@nvidia.com>
 <20171105110118.15142-9-mperttunen@nvidia.com>
 <429d9b2b-8797-adc6-c767-d5bcf735c947@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <429d9b2b-8797-adc6-c767-d5bcf735c947@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 05.11.2017 19:43, Dmitry Osipenko wrote:
> On 05.11.2017 14:01, Mikko Perttunen wrote:
>> In the traditional channel allocation model, a single hardware channel
>> was allocated for each client. This is simple from an implementation
>> perspective but prevents use of hardware scheduling.
>>
>> This patch implements a channel allocation model where when a user
>> submits a job for a context, a hardware channel is allocated for
>> that context. The same channel is kept for as long as there are
>> incomplete jobs for that context. This way we can use hardware
>> scheduling and channel isolation between userspace processes, but
>> also prevent idling contexts from taking up hardware resources.
>>
>
> The dynamic channels resources (pushbuf) allocation is very expensive,
> neglecting all benefits that this model should bring at least in non-IOMMU case.
> We could have statically preallocated channels resources or defer resources freeing.

This is true. I'll try to figure out a nice way to keep the pushbuf 
allocations.

>
>> For now, this patch only adapts VIC to the new model.
>>
>
> I think VIC's conversion should be a distinct patch.

Sure.

Cheers,
Mikko
