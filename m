Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F995C48BE5
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Jun 2021 18:01:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 550B76109D
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Jun 2021 18:01:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbhFOSDk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 15 Jun 2021 14:03:40 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:34410 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229981AbhFOSDj (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Jun 2021 14:03:39 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20210615180134euoutp0255e9fd73e7727cf51bc2b4e996243209~I02R2CjfE0663206632euoutp02_
        for <linux-tegra@vger.kernel.org>; Tue, 15 Jun 2021 18:01:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20210615180134euoutp0255e9fd73e7727cf51bc2b4e996243209~I02R2CjfE0663206632euoutp02_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1623780094;
        bh=E+n70SH/mp+q74hDOLn9X38jNA6sbHhYFHefyJPtpdU=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=TYnkXO05LudYlygxo5LiNIwHhFPMDUfnccXELwEKPi2Qw8Vo+5tfGDzY/t+1Tv1zK
         aMmCGcArbdp9gCABk8bC7X00k2kmg85tWF3ol7TsWPyAXLJLIuPDSwwc6bDTQIsa9R
         WMoOc9QM8O18GYxGrbljRu7YjG708DlRFOKBgBhE=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20210615180133eucas1p1fda4b5521f1763303539db8aaddac31b~I02Rf-HMd0307703077eucas1p1G;
        Tue, 15 Jun 2021 18:01:33 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 78.8C.09444.DFAE8C06; Tue, 15
        Jun 2021 19:01:33 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20210615180133eucas1p2563c2a173eca1fb5a1c5ccf654c23778~I02RBcmLC2199621996eucas1p2w;
        Tue, 15 Jun 2021 18:01:33 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20210615180133eusmtrp18275842baba8b3dfdb048d0fe2fe8446~I02RArGYB1681416814eusmtrp1H;
        Tue, 15 Jun 2021 18:01:33 +0000 (GMT)
X-AuditID: cbfec7f4-dd5ff700000024e4-e0-60c8eafd3570
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 9A.FD.08696.CFAE8C06; Tue, 15
        Jun 2021 19:01:33 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20210615180132eusmtip236541bd28737246e0a32fb15d582bc8d~I02QUSe4L0976609766eusmtip25;
        Tue, 15 Jun 2021 18:01:32 +0000 (GMT)
Subject: Re: [PATCH v3 3/9] iommu/arm-smmu: Implement ->probe_finalize()
To:     Thierry Reding <thierry.reding@gmail.com>,
        Will Deacon <will@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>, linux-tegra@vger.kernel.org,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <46e65ade-49cb-5437-5863-1f11ccc2205e@samsung.com>
Date:   Tue, 15 Jun 2021 20:01:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210603164632.1000458-4-thierry.reding@gmail.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIKsWRmVeSWpSXmKPExsWy7djP87p/X51IMNjXoGyxYL+1RcusRSwW
        nbM3sFtsfPuDyWLT42usFp1fZrFZ7H36mM3i4IcnrBY/d81jsejbG2TRcsfUgdvjycF5TB5r
        5q1h9JjV0MvmsXPWXXaPTas62Tw2L6n3mHxjOaNHb/M7No/Pm+QCOKO4bFJSczLLUov07RK4
        Mo4/ecNWcNKiYsHBH0wNjIcNuhg5OSQETCTOzd3M3sXIxSEksIJRYtK05VDOF0aJ2d+WsUA4
        nxklzv0+yw7T0j6/mQkisZxRYt2aR1DOR0aJP2v+MXYxcnAIC3hItLVmgMRFBNoZJc48/s8M
        4jALzGGS+PJjDtgoNgFDia63XWwgNq+AncTJL9+ZQWwWAVWJtruvmUBsUYFkiffzZrBC1AhK
        nJz5hAXE5hRwkFg7/QxYL7OAvETz1tnMELa4xK0n85kgTp3MKbHsYinIQRICLhInnzpDhIUl
        Xh3fAvWNjMTpyT1gb0oINDNKPDy3lh3C6WGUuNw0gxGiylrizrlfbCCDmAU0Jdbv0oeY6Shx
        r6sQwuSTuPFWEOICPolJ26YzQ4R5JTrahCBmqEnMOr4ObuvBC5eYJzAqzULy1ywkv8xC8sss
        hLULGFlWMYqnlhbnpqcWG+WllusVJ+YWl+al6yXn525iBKay0/+Of9nBuPzVR71DjEwcjIcY
        JTiYlUR4dYtPJAjxpiRWVqUW5ccXleakFh9ilOZgURLnTdqyJl5IID2xJDU7NbUgtQgmy8TB
        KdXAFPmkgWHrZdnXMx1W7sgWfTjp8QPh8D37313rlI9UmT2lo+4uZyFTWVDkdLad4fu8Ds79
        bBall9x/PtirMO793jNMO1Yc3ts7yy34yVzzVTwn79zwE79+u+STqd3iGzOOvZgbM3XR/y+W
        BZf8J1VMzV027ZLwOr2zH2KWz+M7olEw54bEnFenjwsUbVYwj9j33nSreN4yk8Q/uVZSgYev
        7Y1boxD7R/l7zk8Phv25ph+yHuwx/8PWFMKx7tClTr8NofZb2s6qSgU7L129x9M3/d4kzlm+
        05kfm2X55S5+USq3jHvV1klv4qyZDbx5OqSqEs7u2vF+VXqb47mr82oavnbem/jx2cruR0yP
        Np/qrOtQYinOSDTUYi4qTgQAAvc1ztQDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRmVeSWpSXmKPExsVy+t/xe7p/X51IMNi4ksliwX5ri5ZZi1gs
        OmdvYLfY+PYHk8Wmx9dYLTq/zGKz2Pv0MZvFwQ9PWC1+7prHYtG3N8ii5Y6pA7fHk4PzmDzW
        zFvD6DGroZfNY+esu+wem1Z1snlsXlLvMfnGckaP3uZ3bB6fN8kFcEbp2RTll5akKmTkF5fY
        KkUbWhjpGVpa6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXoZRx/8oat4KRFxYKDP5gaGA8b
        dDFyckgImEi0z29m6mLk4hASWMoo8ejmanaIhIzEyWkNrBC2sMSfa11sEEXvGSVeHOgHKuLg
        EBbwkGhrzQCJiwi0M0q8WzkPrIhZYA6TxM+O2Uwg3UICpRLrWg+A2WwChhJdb0EmcXLwCthJ
        nPzynRnEZhFQlWi7+xqsRlQgWeLn+naoGkGJkzOfsIDYnAIOEmunnwGLMwuYSczb/JAZwpaX
        aN46G8oWl7j1ZD7TBEahWUjaZyFpmYWkZRaSlgWMLKsYRVJLi3PTc4uN9IoTc4tL89L1kvNz
        NzEC43fbsZ9bdjCufPVR7xAjEwfjIUYJDmYlEV7d4hMJQrwpiZVVqUX58UWlOanFhxhNgf6Z
        yCwlmpwPTCB5JfGGZgamhiZmlgamlmbGSuK8JkfWxAsJpCeWpGanphakFsH0MXFwSjUwaT9X
        UUxc8+fYks+vma3bBfOO5G/L9bHme/DduCrqoXHbg65VrsLWKmHe7kl39y+5dcOmd+Ofwj3T
        r1vLCMbxHi++KSnscDXI5ozr7d3rfn22++1UXyDpc/TxlZhP/Yt2XG+ZqLVkzep9Wx0mbXfo
        UvyjZPCtS4DFXD5NfW9nadi/R135u4PUJkrl9y2f8+3L5CdikUvEsloOWwo6bguYtihnxgzO
        xyceTFtb/K5Idtfq6XPbvu5MZc7fwJn9piZcnzHeQdXb4sCD9MfvXFor7M6VavZY/bZ7mfVj
        2sHbnQa3pwpv+uEiJxl54nGdlMOj7bpX59bLn/VqYXn4fV/W95cLFjjf6G5j6nlYuS+ST4ml
        OCPRUIu5qDgRAM6AnWVoAwAA
X-CMS-MailID: 20210615180133eucas1p2563c2a173eca1fb5a1c5ccf654c23778
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20210615180133eucas1p2563c2a173eca1fb5a1c5ccf654c23778
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20210615180133eucas1p2563c2a173eca1fb5a1c5ccf654c23778
References: <20210603164632.1000458-1-thierry.reding@gmail.com>
        <20210603164632.1000458-4-thierry.reding@gmail.com>
        <CGME20210615180133eucas1p2563c2a173eca1fb5a1c5ccf654c23778@eucas1p2.samsung.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi,

On 03.06.2021 18:46, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>
> Implement a ->probe_finalize() callback that can be used by vendor
> implementations to perform extra programming necessary after devices
> have been attached to the SMMU.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

This patch landed recently in linux-next as commit 0d97174aeadf 
("iommu/arm-smmu: Implement ->probe_finalize()"). It causes the 
following issue on ARM Juno R1 board:

arm-smmu 2b500000.iommu: probing hardware configuration...
arm-smmu 2b500000.iommu: SMMUv1 with:
arm-smmu 2b500000.iommu:         stage 2 translation
arm-smmu 2b500000.iommu:         coherent table walk
arm-smmu 2b500000.iommu:         stream matching with 32 register groups
arm-smmu 2b500000.iommu:         4 context banks (4 stage-2 only)
arm-smmu 2b500000.iommu:         Supported page sizes: 0x60211000
arm-smmu 2b500000.iommu:         Stage-2: 40-bit IPA -> 40-bit PA
arm-smmu 7fb00000.iommu: probing hardware configuration...
arm-smmu 7fb00000.iommu: SMMUv1 with:
arm-smmu 7fb00000.iommu:         stage 2 translation
arm-smmu 7fb00000.iommu:         coherent table walk
arm-smmu 7fb00000.iommu:         stream matching with 16 register groups
arm-smmu 7fb00000.iommu:         4 context banks (4 stage-2 only)
arm-smmu 7fb00000.iommu:         Supported page sizes: 0x60211000
arm-smmu 7fb00000.iommu:         Stage-2: 40-bit IPA -> 40-bit PA
arm-smmu 7fb10000.iommu: probing hardware configuration...
arm-smmu 7fb10000.iommu: SMMUv1 with:
arm-smmu 7fb10000.iommu:         stage 2 translation
arm-smmu 7fb10000.iommu:         non-coherent table walk
arm-smmu 7fb10000.iommu:         (IDR0.CTTW overridden by FW configuration)
arm-smmu 7fb10000.iommu:         stream matching with 2 register groups
arm-smmu 7fb10000.iommu:         1 context banks (1 stage-2 only)
arm-smmu 7fb10000.iommu:         Supported page sizes: 0x60211000
arm-smmu 7fb10000.iommu:         Stage-2: 40-bit IPA -> 40-bit PA
arm-smmu 7fb20000.iommu: probing hardware configuration...
arm-smmu 7fb20000.iommu: SMMUv1 with:
arm-smmu 7fb20000.iommu:         stage 2 translation
arm-smmu 7fb20000.iommu:         non-coherent table walk
arm-smmu 7fb20000.iommu:         (IDR0.CTTW overridden by FW configuration)
arm-smmu 7fb20000.iommu:         stream matching with 2 register groups
arm-smmu 7fb20000.iommu:         1 context banks (1 stage-2 only)
arm-smmu 7fb20000.iommu:         Supported page sizes: 0x60211000
arm-smmu 7fb20000.iommu:         Stage-2: 40-bit IPA -> 40-bit PA
arm-smmu 7fb30000.iommu: probing hardware configuration...
arm-smmu 7fb30000.iommu: SMMUv1 with:
arm-smmu 7fb30000.iommu:         stage 2 translation
arm-smmu 7fb30000.iommu:         coherent table walk
arm-smmu 7fb30000.iommu:         stream matching with 2 register groups
arm-smmu 7fb30000.iommu:         1 context banks (1 stage-2 only)
arm-smmu 7fb30000.iommu:         Supported page sizes: 0x60211000
arm-smmu 7fb30000.iommu:         Stage-2: 40-bit IPA -> 40-bit PA
tda998x 0-0070: found TDA19988
tda998x 0-0071: found TDA19988
brd: module loaded
loop: module loaded
megasas: 07.714.04.00-rc1
sata_sil24 0000:03:00.0: Adding to iommu group 0
Unable to handle kernel NULL pointer dereference at virtual address 
0000000000000070
Mem abort info:
   ESR = 0x96000004
   EC = 0x25: DABT (current EL), IL = 32 bits
   SET = 0, FnV = 0
   EA = 0, S1PTW = 0
Data abort info:
   ISV = 0, ISS = 0x00000004
   CM = 0, WnR = 0
[0000000000000070] user address but active_mm is swapper
Internal error: Oops: 96000004 [#1] PREEMPT SMP
Modules linked in:
CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.13.0-rc1+ #3466
Hardware name: ARM Juno development board (r1) (DT)
pstate: 20000005 (nzCv daif -PAN -UAO -TCO BTYPE=--)
pc : arm_smmu_probe_finalize+0x14/0x48
lr : iommu_probe_device+0x74/0x120
...
Call trace:
  arm_smmu_probe_finalize+0x14/0x48
  of_iommu_configure+0xe4/0x1b8
  of_dma_configure_id+0xf8/0x2d8
  pci_dma_configure+0x44/0x88
  really_probe+0xc0/0x3c0
  driver_probe_device+0x60/0xc0
  device_driver_attach+0x6c/0x78
  __driver_attach+0xc0/0x100
  bus_for_each_dev+0x68/0xc8
  driver_attach+0x20/0x28
  bus_add_driver+0x168/0x1f8
  driver_register+0x60/0x110
  __pci_register_driver+0x5c/0x68
  sil24_pci_driver_init+0x20/0x28
  do_one_initcall+0x84/0x450
  kernel_init_freeable+0x2dc/0x334
  kernel_init+0x10/0x110
  ret_from_fork+0x10/0x18
Code: b40001e1 f9405821 f9400023 f9401461 (f9403822)
---[ end trace 561eda4b855861d1 ]---
Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
SMP: stopping secondary CPUs
Kernel Offset: disabled
CPU features: 0x00240022,25006086
Memory Limit: none
---[ end Kernel panic - not syncing: Attempted to kill init! 
exitcode=0x0000000b ]---

> ---
> Changes in v2:
> - remove unnecessarily paranoid check
>
>   drivers/iommu/arm/arm-smmu/arm-smmu.c | 13 +++++++++++++
>   drivers/iommu/arm/arm-smmu/arm-smmu.h |  1 +
>   2 files changed, 14 insertions(+)
>
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> index 6f72c4d208ca..d20ce4d57df2 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
> @@ -1450,6 +1450,18 @@ static void arm_smmu_release_device(struct device *dev)
>   	iommu_fwspec_free(dev);
>   }
>   
> +static void arm_smmu_probe_finalize(struct device *dev)
> +{
> +	struct arm_smmu_master_cfg *cfg;
> +	struct arm_smmu_device *smmu;
> +
> +	cfg = dev_iommu_priv_get(dev);
> +	smmu = cfg->smmu;
> +
> +	if (smmu->impl->probe_finalize)
> +		smmu->impl->probe_finalize(smmu, dev);
> +}
> +
>   static struct iommu_group *arm_smmu_device_group(struct device *dev)
>   {
>   	struct arm_smmu_master_cfg *cfg = dev_iommu_priv_get(dev);
> @@ -1569,6 +1581,7 @@ static struct iommu_ops arm_smmu_ops = {
>   	.iova_to_phys		= arm_smmu_iova_to_phys,
>   	.probe_device		= arm_smmu_probe_device,
>   	.release_device		= arm_smmu_release_device,
> +	.probe_finalize		= arm_smmu_probe_finalize,
>   	.device_group		= arm_smmu_device_group,
>   	.enable_nesting		= arm_smmu_enable_nesting,
>   	.set_pgtable_quirks	= arm_smmu_set_pgtable_quirks,
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> index c31a59d35c64..147c95e7c59c 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
> @@ -439,6 +439,7 @@ struct arm_smmu_impl {
>   				  struct device *dev, int start);
>   	void (*write_s2cr)(struct arm_smmu_device *smmu, int idx);
>   	void (*write_sctlr)(struct arm_smmu_device *smmu, int idx, u32 reg);
> +	void (*probe_finalize)(struct arm_smmu_device *smmu, struct device *dev);
>   };
>   
>   #define INVALID_SMENDX			-1

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

