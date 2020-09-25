Return-Path: <SRS0=4r7m=DC=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A28ACC4363D
	for <linux-tegra@archiver.kernel.org>; Fri, 25 Sep 2020 12:39:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 591A521D91
	for <linux-tegra@archiver.kernel.org>; Fri, 25 Sep 2020 12:39:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728395AbgIYMjN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 25 Sep 2020 08:39:13 -0400
Received: from foss.arm.com ([217.140.110.172]:44430 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726990AbgIYMjM (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 25 Sep 2020 08:39:12 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5852101E;
        Fri, 25 Sep 2020 05:39:10 -0700 (PDT)
Received: from [10.57.48.76] (unknown [10.57.48.76])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2457F3F70D;
        Fri, 25 Sep 2020 05:39:08 -0700 (PDT)
Subject: Re: [PATCH v2 1/4] dt-bindings: reserved-memory: Document "active"
 property
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Will Deacon <will@kernel.org>,
        iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <20200904130000.691933-1-thierry.reding@gmail.com>
 <d3d69cb4-b0f9-40b0-b526-52fdc1a4b876@gmail.com>
 <20200924140130.GA2527337@ulmo>
 <ba16b795-34df-8f8c-3376-3d629cc30f8b@gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <484b9e90-7395-6161-577c-4d3f3716997e@arm.com>
Date:   Fri, 25 Sep 2020 13:39:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <ba16b795-34df-8f8c-3376-3d629cc30f8b@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 2020-09-24 17:23, Dmitry Osipenko wrote:
> 24.09.2020 17:01, Thierry Reding пишет:
>> On Thu, Sep 24, 2020 at 04:23:59PM +0300, Dmitry Osipenko wrote:
>>> 04.09.2020 15:59, Thierry Reding пишет:
>>>> From: Thierry Reding <treding@nvidia.com>
>>>>
>>>> Reserved memory regions can be marked as "active" if hardware is
>>>> expected to access the regions during boot and before the operating
>>>> system can take control. One example where this is useful is for the
>>>> operating system to infer whether the region needs to be identity-
>>>> mapped through an IOMMU.
>>>>
>>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>>> ---
>>>>   .../bindings/reserved-memory/reserved-memory.txt           | 7 +++++++
>>>>   1 file changed, 7 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
>>>> index 4dd20de6977f..163d2927e4fc 100644
>>>> --- a/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
>>>> +++ b/Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt
>>>> @@ -63,6 +63,13 @@ reusable (optional) - empty property
>>>>         able to reclaim it back. Typically that means that the operating
>>>>         system can use that region to store volatile or cached data that
>>>>         can be otherwise regenerated or migrated elsewhere.
>>>> +active (optional) - empty property
>>>> +    - If this property is set for a reserved memory region, it indicates
>>>> +      that some piece of hardware may be actively accessing this region.
>>>> +      Should the operating system want to enable IOMMU protection for a
>>>> +      device, all active memory regions must have been identity-mapped
>>>> +      in order to ensure that non-quiescent hardware during boot can
>>>> +      continue to access the memory.
>>>>   
>>>>   Linux implementation note:
>>>>   - If a "linux,cma-default" property is present, then Linux will use the
>>>>
>>>
>>> Hi,
>>>
>>> Could you please explain what devices need this quirk? I see that you're
>>> targeting Tegra SMMU driver, which means that it should be some pre-T186
>>> device.
>>
>> Primarily I'm looking at Tegra210 and later, because on earlier devices
>> the bootloader doesn't consistently initialize display. I know that it
>> does on some devices, but not all of them.
> 
> AFAIK, all tablet devices starting with Tegra20 that have display panel
> are initializing display at a boot time for showing splash screen. This
> includes all T20/T30/T114 tablets that are already supported by upstream
> kernel.
> 
>> This same code should also
>> work on Tegra186 and later (with an ARM SMMU) although the situation is
>> slightly more complicated there because IOMMU translations will fault by
>> default long before these identity mappings can be established.
>>
>>> Is this reservation needed for some device that has display
>>> hardwired to a very specific IOMMU domain at the boot time?
>>
>> No, this is only used to convey information about the active framebuffer
>> to the kernel. In practice the DMA/IOMMU code will use this information
>> to establish a 1:1 mapping on whatever IOMMU domain that was picked for
>> display.
>>
>>> If you're targeting devices that don't have IOMMU enabled by default at
>>> the boot time, then this approach won't work for the existing devices
>>> which won't ever get an updated bootloader.
>>
>> If the devices don't use an IOMMU, then there should be no problem. The
>> extra reserved-memory nodes would still be necessary to ensure that the
>> kernel doesn't reuse the framebuffer memory for the slab allocator, but
>> if no IOMMU is used, then the display controller accessing the memory
>> isn't going to cause problems other than perhaps scanning out data that
>> is no longer a framebuffer.
>>
>> There should also be no problem for devices with an old bootloader
>> because this code is triggered by the presence of a reserved-memory node
>> referenced via the memory-region property. Devices with an old
>> bootloader should continue to work as they did before. Although I
>> suppose they would start faulting once we enable DMA/IOMMU integration
>> for Tegra SMMU if they have a bootloader that does initialize display to
>> actively scan out during boot.
>>
>>> I think Robin Murphy already suggested that we should simply create
>>> a dummy "identity" IOMMU domain by default for the DRM/VDE devices and
>>> then replace it with an explicitly created domain within the drivers.
>>
>> I don't recall reading about that suggestion. So does this mean that for
>> certain devices we'd want to basically passthrough by default and then
>> at some point during boot take over with a properly managed IOMMU
>> domain?
> 
> Yes, my understanding that this is what Robin suggested here:
> 
> https://lore.kernel.org/linux-iommu/cb12808b-7316-19db-7413-b7f852a6f8ae@arm.com/

Just to clarify, what I was talking about there is largely orthogonal to 
the issue here. That was about systems with limited translation 
resources letting translation be specifically opt-in by IOMMU-aware 
drivers. It probably *would* happen to obviate the issue of disrupting 
live DMA at boot time on these particular Tegra platforms, but we still 
need something like Thierry's solution in general, since IOMMU drivers 
may have no other way to determine whether devices are active at boot 
and they have to take care to avoid breaking anything - e.g. SMMUv3 will 
at a bare minimum need to set up *some* form of valid stream table entry 
for the relevant device(s) right at the beginning where we first probe 
and reset the SMMU itself, regardless of what happens with domains and 
addresses later down the line.

>> The primary goal here is to move towards using the DMA API rather than
>> the IOMMU API directly, so we don't really have the option of replacing
>> with an explicitly created domain. Unless we have code in the DMA/IOMMU
>> code that does this somehow.
>>
>> But I'm not sure what would be a good way to mark certain devices as
>> needing an identity domain by default. Do we still use the reserved-
>> memory node for that?
> 
> The reserved-memory indeed shouldn't be needed for resolving the
> implicit IOMMU problem since we could mark certain devices within the
> kernel IOMMU driver.
> 
> I haven't got around to trying to implement the implicit IOMMU support
> yet, but I suppose we could implement the def_domain_type() hook in the
> SMMU driver and then return IOMMU_DOMAIN_IDENTITY for the Display/VDE
> devices. Then the Display/VDE drivers will take over the identity domain
> and replace it with the explicit domain.

FWIW I've already cooked up identity domain support for tegra-gart; I 
was planning on tackling it for tegra-smmu as well for the next version 
of my arm default domains series (which will be after the next -rc1 now 
since I'm just about to take some long-overdue holiday).

>> That would still require some sort of flag to
>> specify which reserved-memory regions would need this identity mapping
>> because, as was pointed out in earlier review, some devices may have
>> reserved-memory regions that are not meant to be identity mapped.
> 
> Please note that the reserved-memory approach also creates problem for
> selection of a large CMA region if FB is located somewhere in a middle
> of DRAM.
> 
> I already see that the FB's reserved-memory will break CMA for Nexus 7
> and Acer A500 because CMA area overlaps with the bootloader's FB :)
> 
> Also keep in mind that initrd needs a location too and location usually
> hardwired in a bootloader. Hence it increases pressure on the CMA selection.
> 
>>> Secondly, all NVIDIA bootloaders are passing tegra_fbmem=... via
>>> kernel's cmdline with the physical location of the framebuffer in
>>> memory. Maybe we could support this option?
>>
>> I'm not a big fan of that command-line option, but I also realize that
>> for older bootloaders that's probably the only option we have. I don't
>> suppose all of the devices support U-Boot?
> 
> Majority of devices in a wild don't use u-boot and they have a
> locked-down bootloader. Still it's possible to chain-load u-boot or
> bypass the "security" and replace the bootloader, but these approaches
> aren't widely supported because they take a lot of effort to be
> implemented and maintained.
> 
> Even those devices that use proper u-boot usually never updating it and
> are running some ancient version. You can't ignore all those people :)
> 
>> Because ideally we'd just
>> translate from tegra_fbmem=... to reserved-memory region there so that
>> we don't have to carry backwards-compatibility code for these purely
>> downstream bootloaders.
> 
> IIRC, in the past Robin Murphy was suggesting to read out hardware state
> early during kernel boot in order to find what regions are in use by
> hardware.

I doubt I suggested that in general, because I've always firmly believed 
it to be a terrible idea. I've debugged too many cases where firmware or 
kexec has inadvertently left DMA running and corrupted kernel memory, so 
in general we definitely *don't* want to blindly trust random hardware 
state. Anything I may have said in relation to Qualcomm's fundamentally 
broken hypervisor/bootloader setup should not be considered outside that 
specific context ;)

Robin.

> I think it should be easy to do for the display controller since we
> could check clock and PD states in order to decide whether DC's IO could
> be accessed and then read out the FB pointer and size. I guess it should
> take about hundred lines of code.
> 
> But the easiest way should be to ignore this trouble for devices that
> have IOMMU disabled by default and simply allow display to show garbage.
> Nobody ever complained about this for the past 7+ years :)
> 
> Hence implementing the dummy-identity domain support should be enough
> for solving the problem, at least this should work for pre-T186 devices.
> 
