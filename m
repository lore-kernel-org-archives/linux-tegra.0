Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4469CC3DA6F
	for <linux-tegra@archiver.kernel.org>; Fri, 25 Aug 2023 20:26:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231183AbjHYU0L (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 25 Aug 2023 16:26:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231202AbjHYUZe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 25 Aug 2023 16:25:34 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15F041BF1
        for <linux-tegra@vger.kernel.org>; Fri, 25 Aug 2023 13:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692995086;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=T9GaVO4jGruWR+C5Izp9D7v0Lmi9Kx5kTKgCOaeAvTc=;
        b=IDd6u/bxPMMd/XqntEkhW+tOAJ32+VWKm2RwBYkHBfHyEgZVEeSsWOORss4PIUhNTunztZ
        PtrJYNEQVp0KdqQjF8/ijZCuKmMV94jlEJMBftFX7kEQjr33y7OACQhTStsV3j+ArhLHh3
        NQ833s66DeYr6JW5vkomdjFn6uaQAgQ=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-tBRdaX3wOieTMy_P4UY6Nw-1; Fri, 25 Aug 2023 16:24:28 -0400
X-MC-Unique: tBRdaX3wOieTMy_P4UY6Nw-1
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-76d84238f37so138021985a.0
        for <linux-tegra@vger.kernel.org>; Fri, 25 Aug 2023 13:24:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692995068; x=1693599868;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T9GaVO4jGruWR+C5Izp9D7v0Lmi9Kx5kTKgCOaeAvTc=;
        b=E3QGVWDe/2S5yIY+gLP9YCMHyvejvvWmUUAbqSdcnIsTye9ggnfIP7+1GXXX6pBWIP
         sc9E4MMrEWDt6NFFHdt7yk6IvRksgwZO3av2ox5YVBh0dektu8hxSx75676saXsv+XIk
         u18CPGnlEJCa82OGBVMvAQlcvOArdKOdIm/oVrMtZCo9gpIPENfOjljVRnnhj6xwI7vO
         jLQW21wdLd9vUObWlEGwQLhRinFIUirzZm+dS+eeW6Sh6M/6epzBZ6MgeHNzNCVSjxN3
         n8GX8kLqp5UL0lG8h88FGyCScrC+5JjmF9WEiBy9yS0AQBgfH+flswGS0FwKXoNWl6D1
         DDpg==
X-Gm-Message-State: AOJu0Yz3knv1VTsLA2eb1GB+C7WL2XBE42K6AvbBJeVWjQc0v6cuNWEx
        wAlIuIq5ykHN3LICloPZFJ/QBnHibeUTWe0QCkcFdPjhVyqE0QrNR918LcsTgLaIlzd410ID7zo
        0M957oJr6e4EPLvWW/vwal0A=
X-Received: by 2002:a05:620a:4009:b0:76e:eeaa:a079 with SMTP id h9-20020a05620a400900b0076eeeaaa079mr7880720qko.10.1692995067934;
        Fri, 25 Aug 2023 13:24:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLBKI1XGw7s6CbX7jhIzTvhmgnGyxca1Jm6YHCiJ3dxbM+m70gQmthLg44868T29Hr/JESWg==
X-Received: by 2002:a05:620a:4009:b0:76e:eeaa:a079 with SMTP id h9-20020a05620a400900b0076eeeaaa079mr7880679qko.10.1692995067632;
        Fri, 25 Aug 2023 13:24:27 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id g7-20020a37e207000000b0075cd80fde9esm741104qki.89.2023.08.25.13.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 13:24:27 -0700 (PDT)
Date:   Fri, 25 Aug 2023 13:24:25 -0700
From:   Jerry Snitselaar <jsnitsel@redhat.com>
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     Andy Gross <agross@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bjorn Andersson <andersson@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Joerg Roedel <joro@8bytes.org>,
        Kevin Tian <kevin.tian@intel.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        linuxppc-dev@lists.ozlabs.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
        Yong Wu <yong.wu@mediatek.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Steven Price <steven.price@arm.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v7 03/24] powerpc/iommu: Setup a default domain and
 remove set_platform_dma_ops
Message-ID: <zbmf64fbpp5zsolyqd74px3hpgvvorc3xal6pvaxdw3uoccb6c@epcqhetd6n6l>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <3-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Aug 23, 2023 at 01:47:17PM -0300, Jason Gunthorpe wrote:
> POWER is using the set_platform_dma_ops() callback to hook up its private
> dma_ops, but this is buired under some indirection and is weirdly
> happening for a BLOCKED domain as well.
> 
> For better documentation create a PLATFORM domain to manage the dma_ops,
> since that is what it is for, and make the BLOCKED domain an alias for
> it. BLOCKED is required for VFIO.
> 
> Also removes the leaky allocation of the BLOCKED domain by using a global
> static.
> 
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  arch/powerpc/kernel/iommu.c | 38 +++++++++++++++++--------------------
>  1 file changed, 17 insertions(+), 21 deletions(-)
> 

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

