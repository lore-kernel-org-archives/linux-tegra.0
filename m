From: Robin Murphy <robin.murphy-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v3 0/7] Nvidia Arm SMMUv2 Implementation
Date: Tue, 22 Oct 2019 18:52:11 +0100
Message-ID: <6d9e6425-fa69-9b76-b477-1fe50c459ca5@arm.com>
References: <1571441492-21919-1-git-send-email-vdumpa@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
In-Reply-To: <1571441492-21919-1-git-send-email-vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-GB
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>
List-Help: <mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
	<mailto:iommu-request-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org?subject=subscribe>
Sender: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
Errors-To: iommu-bounces-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org
To: Krishna Reddy <vdumpa-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: snikam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, thomasz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, jtukkinen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, nicolinc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, yhsu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, avanbrunt-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Krishna,

On 19/10/2019 00:31, Krishna Reddy wrote:
> Changes in v3:
> Rebased on top of https://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git/ next.
> Resolved compile error seen with tegra194.dtsi changes after rebase.

Apologies for crossed wires, but I had a series getting rid of 
arm_smmu_flush_ops which was also meant to end up making things a bit 
easier for you:

https://lore.kernel.org/linux-iommu/cover.1568820087.git.robin.murphy-5wv7dgnIgG8@public.gmane.org/

Will, did you have any plans to push out an updates or iommu/devel 
branch for Krishna to base on?

Robin.

> 
> v2 - https://lkml.org/lkml/2019/9/2/980
> v1 - https://lkml.org/lkml/2019/8/29/1588
> 
> Krishna Reddy (7):
>    iommu/arm-smmu: prepare arm_smmu_flush_ops for override
>    iommu/arm-smmu: add NVIDIA implementation for dual ARM MMU-500 usage
>    dt-bindings: arm-smmu: Add binding for Tegra194 SMMU
>    iommu/arm-smmu: Add global/context fault implementation hooks
>    arm64: tegra: Add Memory controller DT node on T194
>    arm64: tegra: Add DT node for T194 SMMU
>    arm64: tegra: enable SMMU for SDHCI and EQOS on T194
> 
>   .../devicetree/bindings/iommu/arm,smmu.txt         |   4 +
>   MAINTAINERS                                        |   2 +
>   arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi     |   4 +
>   arch/arm64/boot/dts/nvidia/tegra194.dtsi           |  88 +++++++
>   drivers/iommu/Makefile                             |   2 +-
>   drivers/iommu/arm-smmu-impl.c                      |   3 +
>   drivers/iommu/arm-smmu-nvidia.c                    | 287 +++++++++++++++++++++
>   drivers/iommu/arm-smmu.c                           |  27 +-
>   drivers/iommu/arm-smmu.h                           |   8 +-
>   9 files changed, 413 insertions(+), 12 deletions(-)
>   create mode 100644 drivers/iommu/arm-smmu-nvidia.c
> 
