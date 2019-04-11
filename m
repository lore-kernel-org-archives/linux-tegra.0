From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH] gpu: host1x: fix compile error when IOMMU API is not
 available
Date: Thu, 11 Apr 2019 14:31:48 +0300
Message-ID: <ff7e06b6-587c-6098-92ab-ff2fbab6e651@gmail.com>
References: <4c3d021c73c001f633803e364cfbc6ace3381205.1554936354.git.stefan@agner.ch>
 <7371b1573ddd0b127713724ef5051a6f@codethink.co.uk>
 <20190411083017.GB4633@ulmo> <c73bb650-7175-150b-a678-c707e5f0e7e7@kapsi.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c73bb650-7175-150b-a678-c707e5f0e7e7@kapsi.fi>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mikko Perttunen <cyndis@kapsi.fi>, Thierry Reding <thierry.reding@gmail.com>, Ben Dooks <ben.dooks@codethink.co.uk>, Stefan Agner <stefan@agner.ch>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-tegra-owner@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

11.04.2019 13:06, Mikko Perttunen пишет:
> On 11.4.2019 11.30, Thierry Reding wrote:
>> On Thu, Apr 11, 2019 at 09:23:13AM +0100, Ben Dooks wrote:
>>>
>>>
>>> On 2019-04-10 23:47, Stefan Agner wrote:
>>>> In case the IOMMU API is not available compiling host1x fails with
>>>> the following error:
>>>>    In file included from drivers/gpu/host1x/hw/host1x06.c:27:
>>>>    drivers/gpu/host1x/hw/channel_hw.c: In function
>>>> ‘host1x_channel_set_streamid’:
>>>>    drivers/gpu/host1x/hw/channel_hw.c:118:30: error: implicit
>>>> declaration of function
>>>>      ‘dev_iommu_fwspec_get’; did you mean ‘iommu_fwspec_free’?
>>>> [-Werror=implicit-function-declaration]
>>>>    struct iommu_fwspec *spec =
>>>> dev_iommu_fwspec_get(channel->dev->parent);
>>>>                                ^~~~~~~~~~~~~~~~~~~~
>>>>                                iommu_fwspec_free
>>>>
>>>> Fixes: de5469c21ff9 ("gpu: host1x: Program the channel stream ID")
>>>> Signed-off-by: Stefan Agner <stefan@agner.ch>
>>>
>>> would it be better to provide something like this i nthe header that
>>> defines dev_iommu_fwspec_get() to be:
>>>
>>> static inline struct iommu_fwspec *dev_iommu_fwspec_get(struct device *dev)
>>> { return NULL; }
>>>
>>> although returning an PTR_ERR would have been better.
>>
>> I don't think there's really a large number of failures here. Either
>> your device has an IOMMU fwspec or it doesn't.
>>
>> But yes, I think it'd be better to have the above static inline dummy in
>> iommu.h, but I'll apply this for now in the hopes of getting it in
>> before v5.1 final.
> 
> A similar patch was already sent before by someone. That one also programs the bypass stream ID (0x7f) even if IOMMU is disabled. We should pick that patch instead.

For the record.. here is that patch https://patchwork.ozlabs.org/patch/1052364/
