Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E240DC77B7D
	for <linux-tegra@archiver.kernel.org>; Mon, 15 May 2023 13:08:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242183AbjEONI2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 15 May 2023 09:08:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242288AbjEONIL (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 15 May 2023 09:08:11 -0400
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C11E2107
        for <linux-tegra@vger.kernel.org>; Mon, 15 May 2023 06:07:39 -0700 (PDT)
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-3f4de077aaaso60900391cf.1
        for <linux-tegra@vger.kernel.org>; Mon, 15 May 2023 06:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1684156049; x=1686748049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r52VsGt7pCD5MqwU7Iz5hhf7etBKNWqtKNN+QQL4Wbs=;
        b=c+5jOYw/nbV0ulxcZUPP/BwmGfGabE0GudFc4Pxot2MDSxnZOMjQBHanidAXv8AN4s
         wCtL4vKPT/NQuQtyRosfY1v+Cc4PX94PKhH/K4vGQkh8BXrOSCykMzDtIWTaHdinMTlL
         GTd1vPbd7jdhMb9Xp18vHEaSJ5oykF8Q18Co+JrFWfrSsGa06ytgp5MPhg2lAuMcBHY9
         +cXuTSEKaaD6FCDHfVc+wlq2TFUxcMNkM8xdx//DfRqBb1wXlbXwUaZ0w2XcKKmJCXYm
         rNhNdyMFvde5Wj2WqbjDnUEci9/JLzGroYUlyOEdGT2Q14DOTFUq69HjSZo3vkt1aQ7q
         pxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684156049; x=1686748049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r52VsGt7pCD5MqwU7Iz5hhf7etBKNWqtKNN+QQL4Wbs=;
        b=TeNXnAhEZeHa2Z559wmDgn8Ooc9yI1e6r5T8zLHk+arSWpIh5r14GpF8e2eJ3YsFCh
         nUB0nc15U3/qjkZAuG9XnKguftIOAUjidTcjdxuyO3YchWm/Pr5KdHBQxI4wLUNJJIT6
         tkp8Piddbsu9XKuOuC5SVVJoHwx1XD9jSFDEpj2cqomJiWWQz78+wQtE43VVmHBLYpQH
         E4wb/89YkJcUAIJZbmXtZA1iuixvhhgieiVyna+40h0EojF6g4BoJmMovSQhmfROQkji
         WSu3ZZnmFFsuOaU1qpH3pGFGQJQ5s/fKPtvJe99QMXuw9TQIIHpOEW5k5mdO941ktTH8
         tV2g==
X-Gm-Message-State: AC+VfDybue/p4A/RbzcaliblFgENgGR8ERSImz6NkhXZWBMIuf+m+XLt
        smNHnI56LN/8tDMa6LpYPpbHCw==
X-Google-Smtp-Source: ACHHUZ6oq1rgsxAhha/L8rTgUYSyK7wV0xG3BSAlCLbWHRWP4j4vcs+gZ2cT74Vr/sFz2mlpsmeCpA==
X-Received: by 2002:ac8:7f44:0:b0:3f3:928a:eae2 with SMTP id g4-20020ac87f44000000b003f3928aeae2mr42158943qtk.4.1684156049337;
        Mon, 15 May 2023 06:07:29 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-25-194.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.25.194])
        by smtp.gmail.com with ESMTPSA id n27-20020ac81e1b000000b003e388264753sm5328251qtl.65.2023.05.15.06.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 06:07:28 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
        (envelope-from <jgg@ziepe.ca>)
        id 1pyXvD-000xlt-MR;
        Mon, 15 May 2023 10:07:27 -0300
Date:   Mon, 15 May 2023 10:07:27 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Niklas Schnelle <schnelle@linux.ibm.com>,
        Robin Murphy <robin.murphy@arm.com>
Cc:     Joerg Roedel <joro@8bytes.org>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Will Deacon <will@kernel.org>,
        Wenjia Zhang <wenjia@linux.ibm.com>,
        Gerd Bayer <gbayer@linux.ibm.com>,
        Julian Ruess <julianr@linux.ibm.com>,
        Pierre Morel <pmorel@linux.ibm.com>,
        Alexandra Winter <wintera@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Hector Martin <marcan@marcan.st>,
        Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Yong Wu <yong.wu@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-s390@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, asahi@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v9 5/6] iommu/dma: Allow a single FQ in addition to
 per-CPU FQs
Message-ID: <ZGIuj2pRjOPffqZZ@ziepe.ca>
References: <20230310-dma_iommu-v9-0-65bb8edd2beb@linux.ibm.com>
 <20230310-dma_iommu-v9-5-65bb8edd2beb@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230310-dma_iommu-v9-5-65bb8edd2beb@linux.ibm.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, May 15, 2023 at 11:15:55AM +0200, Niklas Schnelle wrote:

> +/**
> + * struct dma_iommu_options - Options for dma-iommu
> + *
> + * @flags: Flag bits for enabling/disabling dma-iommu settings
> + *
> + * This structure is intended to provide IOMMU drivers a way to influence the
> + * behavior of the dma-iommu DMA API implementation. This allows optimizing for
> + * example for a virtualized environment with slow IOTLB flushes.
> + */
> +struct dma_iommu_options {
> +#define IOMMU_DMA_OPTS_PER_CPU_QUEUE	(0L << 0)
> +#define IOMMU_DMA_OPTS_SINGLE_QUEUE	(1L << 0)
> +	u64	flags;
> +};

You need to hash it out with robin if we do something like this or use
more untyped caps as he put in this series:

https://lore.kernel.org/linux-iommu/cover.1683233867.git.robin.murphy@arm.com/

Jason
