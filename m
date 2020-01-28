From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Regression 5.5-rc1] Extremely low GPU performance on NVIDIA
 Tegra20/30
Date: Tue, 28 Jan 2020 18:43:36 +0300
Message-ID: <8b1a4006-d680-e4a7-dc91-a746c30681e4@gmail.com>
References: <a2c9eb65-c600-bf49-2c32-bddf7b44f784@gmail.com>
 <20191213151045.GB222809@ulmo>
 <d03876b8-b0d1-850b-7ae8-a61302e23843@gmail.com>
 <2f5c6fda-adf9-c6c3-7601-fa912813ce1f@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2f5c6fda-adf9-c6c3-7601-fa912813ce1f-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

20.01.2020 05:53, Dmitry Osipenko пишет:
> 13.12.2019 18:35, Dmitry Osipenko пишет:
>> 13.12.2019 18:10, Thierry Reding пишет:
>>> On Fri, Dec 13, 2019 at 12:25:33AM +0300, Dmitry Osipenko wrote:
>>>> Hello Thierry,
>>>>
>>>> Commit [1] introduced a severe GPU performance regression on Tegra20 and
>>>> Tegra30 using.
>>>>
>>>> [1]
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=v5.5-rc1&id=fa6661b7aa0b52073681b0d26742650c8cbd30f3
>>>>
>>>> Interestingly the performance is okay on Tegra30 if
>>>> CONFIG_TEGRA_HOST1X_FIREWALL=n, but that doesn't make difference for
>>>> Tegra20.
>>>>
>>>> I was telling you about this problem on the #tegra IRC sometime ago and
>>>> you asked to report it in a trackable form, so finally here it is.
>>>>
>>>> You could reproduce the problem by running [2] like this
>>>> `grate/texture-filter -f -s` which should produce over 100 FPS for 720p
>>>> display resolution and currently it's ~11 FPS.
>>>>
>>>> [2]
>>>> https://github.com/grate-driver/grate/blob/master/tests/grate/texture-filter.c
>>>>
>>>> Previously I was seeing some memory errors coming from Host1x DMA, but
>>>> don't see any errors at all right now.
>>>>
>>>> I don't see anything done horribly wrong in the offending commit.
>>>>
>>>> Unfortunately I couldn't dedicate enough time to sit down and debug the
>>>> problem thoroughly yet. Please let me know if you'll find a solution,
>>>> I'll be happy to test it. Thanks in advance!
>>>
>>> I suspect that the problem here is that we're now using the DMA API,
>>> which causes the 32-bit ARM DMA/IOMMU glue to be used. I vaguely recall
>>> that that code doesn't coalesce entries in the SG table, so we may end
>>> up calling iommu_map() a lot of times, and miss out on much of the
>>> advantages that the ->iotlb_sync_map() gives us on Tegra20.
>>>
>>> At the same time dma_map_sg() will flush caches, which we didn't do
>>> before. This we should be able to improve by passing the attribute
>>> DMA_ATTR_SKIP_CPU_SYNC to dma_map_sg() when we know that the cache
>>> maintenance isn't needed.
>>>
>>> And while thinking about it, one other difference is that with the DMA
>>> API we actually map/unmap the buffers for every submission. This is
>>> because the DMA API semantics require that buffers be mapped/unmapped
>>> every time you use them. Previously we would basically only map each
>>> buffer once (at allocation time) and only have to deal with cache
>>> maintenance, so the overhead per submission was drastically lower.
>>>
>>> If DMA_ATTR_SKIP_CPU_SYNC doesn't give us enough of an improvement, we
>>> may want to restore explicit IOMMU usage, at least on anything prior to
>>> Tegra124 where we're unlikely to ever use different IOMMU domains anyway
>>> (because they are such a scarce resource).
>>
>> Tegra20 doesn't use IOMMU in a vanilla upstream kernel (yet), so I don't
>> think that it's the root of the problem. Disabling IOMMU for Tegra30
>> also didn't help (IIRC).
>>
>> The offending patch shouldn't change anything in regards to the DMA API,
>> if I'm not missing something. Strange..
>>
>> Please keep me up-to-date!
>>
> 
> Hello Thierry,
> 
> I took another look at the problem and here what was found:
> 
> 1) The "Optionally attach clients to the IOMMU" patch is wrong because:
> 
>     1. host1x_drm_probe() is invoked *before* any of the
>        host1x_client_iommu_attach() happens, so there is no way
>        on earth the 'use_explicit_iommu' could ever be true.
> 
>     2. Not attaching DRM clients to IOMMU if HOST1x isn't
>        attached is wrong because it never attached in the case
>        of CONFIG_TEGRA_HOST1X_FIREWALL=y [1] and this also
>        makes no sense for T20/30 that do not support LPAE.
> 
> [1]
> https://elixir.bootlin.com/linux/v5.5-rc6/source/drivers/gpu/host1x/dev.c#L205
> 
> 2) Because of the above problems, the DRM clients are erroneously not
> getting attached to IOMMU at all and thus CMA is getting used for the BO
> allocations. Here comes the problems introduced by the "gpu: host1x:
> Support DMA mapping of buffers" patch, which makes DMA API to perform
> CPU cache maintenance on each job submission and apparently this is
> super bad for performance. This also makes no sense in comparison to the
> case of enabled IOMMU, where cache maintenance isn't performed at all
> (like it should be).
> 
> Please let me know if you're going to fix the problems or if you'd
> prefer me to create the patches.
> 
> Here is a draft of the fix for #2, it doesn't cover case of imported
> buffers (which should be statically mapped, IIUC):
...

The v5.5 is released now with the unusable GPU driver. Thierry, could
please let me know if you're planning to do something about it? Should I
help?
