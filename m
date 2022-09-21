Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7BD5ECAAD8
	for <linux-tegra@archiver.kernel.org>; Wed, 21 Sep 2022 08:55:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229729AbiIUIzX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 21 Sep 2022 04:55:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229970AbiIUIzK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 21 Sep 2022 04:55:10 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 997AD3868F
        for <linux-tegra@vger.kernel.org>; Wed, 21 Sep 2022 01:55:08 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id az6so3921197wmb.4
        for <linux-tegra@vger.kernel.org>; Wed, 21 Sep 2022 01:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=NMm6vbupuNg3e8G1erinu7XgiIOmdNdtykV6wWBx/V8=;
        b=cs5Dvxfm7fd7aaUwKHNDAnKWcNrqMyWvSpCFhYmNjRwKQjf697cP12ef2JVhzS+nTr
         rBiEPfFCAvK18V0b4TPU93sWl3nBICTtuO2MuXRVpLAsvrnPMrSMT8utfj6qRBivTxti
         BXRo7n7yiwy1VFEU65sNSMFb9wbJX0Y01wSWLKT5xxq4/13Ub6Q0C+MSyK+vNliqzKv7
         7DJIhCBeCbjUg+pZttjuEgYoPhQn5piUM0+uqu6ez9uuEzMnz+dnjzErRDjuyGOk/BYS
         UkhbQnQFMY8EjTuZOsOAEbzscpTOQfKIqXeSfDZd9sFya7VbVqAP+h8BvB+DFZ+Idka/
         wnnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=NMm6vbupuNg3e8G1erinu7XgiIOmdNdtykV6wWBx/V8=;
        b=eRmTrApaHQVUPvyQabuVX4NznlF/inEfFXFpHyJjCxYVi7byrgPxyWE2hZOxcSPzPy
         4hsSgpMKWTI+CFZogG8p9wfwblmlF9P6DC1a2z4aASD36XbyZGZJw6LjMQ+1OgT3fAnQ
         HQC/DD+u8MkoL6ALdaZWs6CBW4zVg+/sOKw/ewDtc9YVui7Ft9MDtIGKsYPrW71mGJzH
         hwhqGXYUT8rcMXAWUNSwoFN8W9AmPaoEy02Ve6FEUblBsyBCZz6qparyq7XSqQPJmTrf
         fkpZXSAUoK0PdYTFxVYdZ+vycdUBZVwMmrETalcEJgN/yNnzYNvgeTysQGF+jCA4QWAi
         JAPw==
X-Gm-Message-State: ACrzQf1CBMsU7ePccUChIeQ4CG9He0ytqgwC+/tvmiHktfX+Sr6X+C2k
        j311yoop5YWLpU/DXewS8Or80Q==
X-Google-Smtp-Source: AMsMyM5v4ccQB/sVn2S/zJDFsH4keJ/VCqNp428gK8IV32RalM87u6d3xbyo/Rp+qs75y4SGFW5eBA==
X-Received: by 2002:a1c:202:0:b0:3a8:4197:eec0 with SMTP id 2-20020a1c0202000000b003a84197eec0mr5125375wmc.83.1663750506995;
        Wed, 21 Sep 2022 01:55:06 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
        by smtp.gmail.com with ESMTPSA id p14-20020a5d48ce000000b0022afbd02c69sm1949060wrs.56.2022.09.21.01.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 01:55:06 -0700 (PDT)
Date:   Wed, 21 Sep 2022 09:55:01 +0100
From:   Jean-Philippe Brucker <jean-philippe@linaro.org>
To:     Nicolin Chen <nicolinc@nvidia.com>
Cc:     joro@8bytes.org, suravee.suthikulpanit@amd.com, will@kernel.org,
        robin.murphy@arm.com, robdclark@gmail.com, dwmw2@infradead.org,
        baolu.lu@linux.intel.com, agross@kernel.org,
        bjorn.andersson@linaro.org, matthias.bgg@gmail.com,
        orsonzhai@gmail.com, baolin.wang@linux.alibaba.com,
        zhang.lyra@gmail.com, sricharan@codeaurora.org, jgg@nvidia.com,
        kevin.tian@intel.com, konrad.dybcio@somainline.org,
        yong.wu@mediatek.com, thierry.reding@gmail.com, vdumpa@nvidia.com,
        jonathanh@nvidia.com, tglx@linutronix.de,
        shameerali.kolothum.thodi@huawei.com,
        christophe.jaillet@wanadoo.fr, thunder.leizhen@huawei.com,
        quic_saipraka@quicinc.com, jon@solid-run.com,
        yangyingliang@huawei.com, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-tegra@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v4 0/6] Define EINVAL as device/domain incompatibility
Message-ID: <YyrRZXVWWxBhW3ST@myrica>
References: <cover.1663744983.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1663744983.git.nicolinc@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Sep 21, 2022 at 01:22:31AM -0700, Nicolin Chen wrote:
> This series is to replace the previous EMEDIUMTYPE patch in a VFIO series:
> https://lore.kernel.org/kvm/Yxnt9uQTmbqul5lf@8bytes.org/
> 
> The purpose is to regulate all existing ->attach_dev callback functions to
> use EINVAL exclusively for an incompatibility error between a device and a
> domain. This allows VFIO and IOMMUFD to detect such a soft error, and then
> try a different domain with the same device.
[...]
>  drivers/iommu/amd/iommu.c                   | 12 +----
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 11 +---
>  drivers/iommu/arm/arm-smmu/arm-smmu.c       |  3 --
>  drivers/iommu/arm/arm-smmu/qcom_iommu.c     |  7 +--
>  drivers/iommu/fsl_pamu.c                    |  2 +-
>  drivers/iommu/fsl_pamu_domain.c             |  4 +-
>  drivers/iommu/intel/iommu.c                 | 10 ++--
>  drivers/iommu/intel/pasid.c                 |  6 ++-
>  drivers/iommu/iommu.c                       | 22 ++++++++
>  drivers/iommu/ipmmu-vmsa.c                  |  2 -
>  drivers/iommu/msm_iommu.c                   | 59 +++++++++++----------
>  drivers/iommu/mtk_iommu.c                   |  4 +-
>  drivers/iommu/omap-iommu.c                  |  6 +--
>  drivers/iommu/sprd-iommu.c                  |  4 +-
>  drivers/iommu/tegra-gart.c                  |  2 +-
>  drivers/iommu/virtio-iommu.c                |  7 ++-

For virtio-iommu:

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

>  include/linux/iommu.h                       | 12 +++++
>  17 files changed, 90 insertions(+), 83 deletions(-)
> 
> -- 
> 2.17.1
> 
