From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCHv8 15/21] iommu/tegra124: smmu: add support platform data
Date: Fri, 30 May 2014 10:40:44 -0600
Message-ID: <5388B48C.8060109@wwwdotorg.org>
References: <1401448834-32659-1-git-send-email-hdoyu@nvidia.com> <1401448834-32659-16-git-send-email-hdoyu@nvidia.com> <5388B260.5000403@wwwdotorg.org> <87zjhzrzkq.fsf@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87zjhzrzkq.fsf-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/30/2014 10:39 AM, Hiroshi Doyu wrote:
> 
> Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> writes:
> 
>> On 05/30/2014 05:20 AM, Hiroshi Doyu wrote:
>>> The later Tegra SoC(>= T124) has more registers for
>>> MC_SMMU_TRANSLATION_ENABLE_*. Now those info is provided as platfrom
>>> data. If those varies a lot on SoCs in the future, we can consider
>>> putting them into DT later.
>>
>>> diff --git a/Documentation/devicetree/bindings/iommu/nvidia,tegra30-smmu.txt b/Documentation/devicetree/bindings/iommu/nvidia,tegra30-smmu.txt
>>
>>>  Required properties:
>>> -- compatible : "nvidia,tegra30-smmu"
>>> -- reg : Should contain 3 register banks(address and length) for each
>>> +- compatible : "nvidia,tegra124-smmu", "nvidia,tegra30-smmu"
>>> +- reg : Can contain multiple register banks(address and length) for each
>>>    of the SMMU register blocks.
>>
>> How many is "multiple"? This seems like rather a weak definition of how
>> many entries are expected. What are the different register banks?
> 
> SMMU registers are part of MC registers. SMMU registeres are interleaved
> by MC(non-SMMU) registeres, most likely it's about ~10 banks.
> 
> We concluded to not have SMMU as a child of MC since their features are
> so independent long time ago. This interleaved register locations are
> not so good. I requested H/W team to have them completely separated, but
> itt was too late to change.

The point of my comment was that the DT binding documentation needs to
explicitly state exactly what entries are required.
