From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 6/7] arm64: tegra: Add DT node for T194 SMMU
Date: Fri, 30 Aug 2019 18:45:34 +0100
Message-ID: <da30773d-5831-7cc6-4d82-b304d9b8a29b@arm.com>
References: <1567118827-26358-1-git-send-email-vdumpa@nvidia.com>
 <1567118827-26358-7-git-send-email-vdumpa@nvidia.com>
 <b834ceb2-b296-0a52-c913-5a8923466cf2@arm.com>
 <BYAPR12MB2710BDF98FA472A77D106814B3BD0@BYAPR12MB2710.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR12MB2710BDF98FA472A77D106814B3BD0@BYAPR12MB2710.namprd12.prod.outlook.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Krishna Reddy <vdumpa@nvidia.com>
Cc: Sachin Nikam <Snikam@nvidia.com>, "Thomas Zeng (SW-TEGRA)" <thomasz@nvidia.com>, Juha Tukkinen <jtukkinen@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Pritesh Raithatha <praithatha@nvidia.com>, "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Timo Alho <talho@nvidia.com>, Yu-Huan Hsu <YHsu@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Thierry Reding <treding@nvidia.com>, Alexander Van Brunt <avanbrunt@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "will.deacon@arm.com" <will.deacon@arm.com>, "joro@8bytes.org" <joro@8bytes.org>
List-Id: linux-tegra@vger.kernel.org

On 30/08/2019 18:25, Krishna Reddy wrote:
>>> +		#global-interrupts = <1>;
> 
>> Shouldn't that be 3?
> 
> Interrupt line is shared between global and all context faults for each SMMU instance.
> Nvidia implementation checks for both Global and context faults on each interrupt to an SMMU instance.
> It can be either 1 or 3.  If we make it 3, we need to add two more irq entries in node for context faults.

The number of global interrupts has never been related to the number of 
context interrupts :/

> In the future, we can update arm-smmu.c to support shared interrupt line between global and all context faults.

Clearly you have one combined interrupt output per SMMU - describing 
those as one global interrupt and the first two context bank interrupts 
respectively makes far less sense than calling them 3 global interrupts, 
not least because the latter is strictly true. Yes, the binding prevents 
us from describing the context bank interrupts for more than one 
instance, but at that point the fact that it *is* the combined output 
saves us - because the driver is aware of this specific integration it 
knows it can just register the "secondary" global interrupts as 
"secondary" context interrupts too. If we had separate IRQ lines per 
context bank per instance, then we'd have a really big problem and might 
have to redefine the binding, but as it is it happens to work out pretty 
neatly.

Robin.
