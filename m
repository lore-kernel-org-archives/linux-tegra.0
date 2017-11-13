From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 08/10] drm/tegra: Implement dynamic channel allocation
 model
Date: Mon, 13 Nov 2017 14:49:00 +0300
Message-ID: <ce92a134-a18f-1337-f7f6-031f46ce6fcd@gmail.com>
References: <20171105110118.15142-1-mperttunen@nvidia.com>
 <20171105110118.15142-9-mperttunen@nvidia.com>
 <429d9b2b-8797-adc6-c767-d5bcf735c947@gmail.com>
 <38fcf947-0d5d-e2c7-f49f-9efce5eeb1a3@kapsi.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <38fcf947-0d5d-e2c7-f49f-9efce5eeb1a3-/1wQRMveznE@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07.11.2017 15:29, Mikko Perttunen wrote:
> On 05.11.2017 19:43, Dmitry Osipenko wrote:
>> On 05.11.2017 14:01, Mikko Perttunen wrote:
>>> In the traditional channel allocation model, a single hardware channel
>>> was allocated for each client. This is simple from an implementation
>>> perspective but prevents use of hardware scheduling.
>>>
>>> This patch implements a channel allocation model where when a user
>>> submits a job for a context, a hardware channel is allocated for
>>> that context. The same channel is kept for as long as there are
>>> incomplete jobs for that context. This way we can use hardware
>>> scheduling and channel isolation between userspace processes, but
>>> also prevent idling contexts from taking up hardware resources.
>>>
>>
>> The dynamic channels resources (pushbuf) allocation is very expensive,
>> neglecting all benefits that this model should bring at least in non-IOMMU case.
>> We could have statically preallocated channels resources or defer resources
>> freeing.
> 
> This is true. I'll try to figure out a nice way to keep the pushbuf allocations.

One variant could be to have all channels resources statically preallocated in a
non-IOMMU case because CMA is expensive. Then you should measure the allocations
impact in a case of IOMMU allocations and if it is significant, maybe implement
Host1x PM autosuspend, releasing all channels when Host1x become idle.

I think the above should be efficient and easy to implement.
