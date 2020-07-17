From: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v10 5/5] iommu/arm-smmu: Add global/context fault
 implementation hooks
Date: Fri, 17 Jul 2020 12:58:05 +0100
Message-ID: <616235dc-c290-d5c4-47c2-19402213dc11@arm.com>
References: <20200708050017.31563-1-vdumpa@nvidia.com>
 <20200708050017.31563-6-vdumpa@nvidia.com>
 <20200713134450.GC2739@willie-the-truck>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200713134450.GC2739@willie-the-truck>
Content-Language: en-GB
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Will Deacon <will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: snikam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bhuntsman-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, nicolinc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yhsu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, bbiswas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 2020-07-13 14:44, Will Deacon wrote:
> On Tue, Jul 07, 2020 at 10:00:17PM -0700, Krishna Reddy wrote:
>> Add global/context fault hooks to allow vendor specific implementations
>> override default fault interrupt handlers.
>>
>> Update NVIDIA implementation to override the default global/context fault
>> interrupt handlers and handle interrupts across the two ARM MMU-500s that
>> are programmed identically.
>>
>> Signed-off-by: Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>   drivers/iommu/arm-smmu-nvidia.c | 99 +++++++++++++++++++++++++++++++++
>>   drivers/iommu/arm-smmu.c        | 17 +++++-
>>   drivers/iommu/arm-smmu.h        |  3 +
>>   3 files changed, 117 insertions(+), 2 deletions(-)
> 
> Given that faults shouldn't occur during normal operation, is this patch
> actually necessary?

Indeed they shouldn't, but if something *does* happen to go wrong then I 
think it's worth having proper handling in place, since the consequences 
otherwise include a screaming "spurious" fault or just silently losing 
some transactions and possibly locking up part of the system altogether 
(depending on HUPCF at least - I recall MMU-500 also behaving funnily 
WRT TLB maintenance while an IRQ is outstanding, but that was long 
enough ago that it might have been related to the old CFCFG behaviour).

Until we sort out the reserved memory regions thing (the new IORT spec 
is due Real Soon Now(TM)...) some systems are going to keep suffering 
transient context faults during boot - those may make the display 
unhappy until it gets reset, but we certainly don't want to invite the 
possibility of them wedging the SMMU itself.

Robin.
