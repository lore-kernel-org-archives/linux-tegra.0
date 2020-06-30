From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v8 2/3] dt-bindings: arm-smmu: Add binding for Tegra194
 SMMU
Date: Tue, 30 Jun 2020 13:27:36 +0100
Message-ID: <3e655881-bac4-f083-44ed-cfa0a61298d0@arm.com>
References: <20200630001051.12350-1-vdumpa@nvidia.com>
 <20200630001051.12350-3-vdumpa@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200630001051.12350-3-vdumpa@nvidia.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Krishna Reddy <vdumpa@nvidia.com>
Cc: joro@8bytes.org, will@kernel.org, linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, treding@nvidia.com, yhsu@nvidia.com, snikam@nvidia.com, praithatha@nvidia.com, talho@nvidia.com, bbiswas@nvidia.com, mperttunen@nvidia.com, nicolinc@nvidia.com, bhuntsman@nvidia.com, nicoleotsuka@gmail.com
List-Id: linux-tegra@vger.kernel.org

On 2020-06-30 01:10, Krishna Reddy wrote:
> Add binding for NVIDIA's Tegra194 SoC SMMU topology that is based
> on ARM MMU-500.
> 
> Signed-off-by: Krishna Reddy <vdumpa@nvidia.com>
> ---
>   Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index d7ceb4c34423b..5b2586ac715ed 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -38,6 +38,11 @@ properties:
>                 - qcom,sc7180-smmu-500
>                 - qcom,sdm845-smmu-500
>             - const: arm,mmu-500
> +      - description: NVIDIA SoCs that use more than one "arm,mmu-500"

Hmm, there must be a better way to word that to express that it only 
applies to the sets of SMMUs that must be programmed identically, and 
not any other independent MMU-500s that might also happen to be in the 
same SoC.

> +        items:
> +          - enum:
> +              - nvdia,tegra194-smmu
> +          - const: arm,mmu-500

Is the fallback compatible appropriate here? If software treats this as 
a standard MMU-500 it will only program the first instance (because the 
second isn't presented as a separate MMU-500) - is there any way that 
isn't going to blow up?

Robin.

>         - items:
>             - const: arm,mmu-500
>             - const: arm,smmu-v2
> 
