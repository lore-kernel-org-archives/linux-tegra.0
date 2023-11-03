Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03478C4332F
	for <linux-tegra@archiver.kernel.org>; Fri,  3 Nov 2023 22:04:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230440AbjKCWEp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 3 Nov 2023 18:04:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230366AbjKCWEo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 3 Nov 2023 18:04:44 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69D401BF
        for <linux-tegra@vger.kernel.org>; Fri,  3 Nov 2023 15:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1699049037;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=rXpne+78UGenenxYxx9+jLWMRynS8s68tp81l2tHoL4=;
        b=IdMprQ0xA6T2hFeeeHJ/9kuegBHcZEq9WQghye+QUoGISj7MhFS2ac3iN0QPXa4Qr1AvQ5
        nqnn47VW8E0VFHpQZrOT7QuC7MHQTIyBt21Y3CRYuTNko1Y25x2R1f6EdgBaW4K9Ai937D
        YJu5CGC0iJYdSPBRJ9cFbBwSTmELh4c=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-i-6iYAFjPwyaAVcGHbB5Aw-1; Fri, 03 Nov 2023 18:03:56 -0400
X-MC-Unique: i-6iYAFjPwyaAVcGHbB5Aw-1
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-280740f54b9so2089411a91.3
        for <linux-tegra@vger.kernel.org>; Fri, 03 Nov 2023 15:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699049035; x=1699653835;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rXpne+78UGenenxYxx9+jLWMRynS8s68tp81l2tHoL4=;
        b=kDQq7SCGCgKbMsHqRjIatn4ycKon51GVaVzNOdgi33fcA5duV+P7b4Hss3rcP83oDS
         LAylkPwGNpb1g74JCr0XgtPe7BeAT8ngaFd3/+9Cl7vCaUq45UcZkiPOdjBPL7VhjBG2
         qCPULcIbWhqUAimLuxPMcnzfCJ50NZCLTcvOuB517rCuE/L9cfuc/uSg2OZwNMgnTKAr
         cWlgNhoJYR51sF4seT+ffpNhfFrJoDkKzChcjC0YlVTbc28OkApSuhqv7NPiiDkjMqO2
         QFlNJCq3DR8JlG1JaucWxFTkxYs8bmv8gtnriHhxglB+UCCqO+a+IxqB0TrdlTQCzMdl
         pwAw==
X-Gm-Message-State: AOJu0YwDB1G3SJGEC9TlYyvwmksDeAtdsywMu5Q95qc3SlUHpoU2Ya97
        0IvmOBIt1LXEX91FM0alXayw3UDrC/9FuOEPV+5VFUFjaL1KYQQAgMEF8Udvz7cSbtR7We0oB5W
        fQo1XIRgjx6hjwZknr6AbBFc=
X-Received: by 2002:a17:90a:7547:b0:280:2609:6d47 with SMTP id q65-20020a17090a754700b0028026096d47mr15580962pjk.19.1699049035274;
        Fri, 03 Nov 2023 15:03:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFS5Dh794kn050Jmor3G/4m9PpE2w1GtTAul8MncDw85TpgTEhPbh0ocZRGWoVXSassV2SO7A==
X-Received: by 2002:a17:90a:7547:b0:280:2609:6d47 with SMTP id q65-20020a17090a754700b0028026096d47mr15580944pjk.19.1699049034936;
        Fri, 03 Nov 2023 15:03:54 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id v3-20020a17090ad58300b00280976d4ce3sm1815162pju.37.2023.11.03.15.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 15:03:54 -0700 (PDT)
Date:   Fri, 3 Nov 2023 15:03:53 -0700
From:   Jerry Snitselaar <jsnitsel@redhat.com>
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     acpica-devel@lists.linuxfoundation.org,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dexuan Cui <decui@microsoft.com>, devicetree@vger.kernel.org,
        David Woodhouse <dwmw2@infradead.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Hanjun Guo <guohanjun@huawei.com>,
        Haiyang Zhang <haiyangz@microsoft.com>,
        Christoph Hellwig <hch@lst.de>, iommu@lists.linux.dev,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Joerg Roedel <joro@8bytes.org>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-hyperv@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-snps-arc@lists.infradead.org, linux-tegra@vger.kernel.org,
        Russell King <linux@armlinux.org.uk>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Hector Martin <marcan@marcan.st>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Robert Moore <robert.moore@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Sven Peter <sven@svenpeter.dev>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Vineet Gupta <vgupta@kernel.org>,
        virtualization@lists.linux-foundation.org,
        Wei Liu <wei.liu@kernel.org>, Will Deacon <will@kernel.org>,
        Zhenhua Huang <quic_zhenhuah@quicinc.com>
Subject: Re: [PATCH RFC 03/17] of: Use -ENODEV consistently in
 of_iommu_configure()
Message-ID: <4iktbjhxkddukf7vywxquz5ffgik73wdw7p7rdqhsbsumhzhsl@y6u7tjbczafc>
References: <0-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
 <3-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Nov 03, 2023 at 01:44:48PM -0300, Jason Gunthorpe wrote:
> Instead of returning 1 and trying to handle positive error codes just
> stick to the convention of returning -ENODEV. Remove references to ops
> from of_iommu_configure(), a NULL ops will already generate an error code.
> 
> There is no reason to check dev->bus, if err=0 at this point then the
> called configure functions thought there was an iommu and we should try to
> probe it. Remove it.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/of_iommu.c | 42 +++++++++++++---------------------------
>  1 file changed, 13 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> index e2fa29c16dd758..4f77495a2543ea 100644
> --- a/drivers/iommu/of_iommu.c
> +++ b/drivers/iommu/of_iommu.c
> @@ -17,7 +17,7 @@
>  #include <linux/slab.h>
>  #include <linux/fsl/mc.h>
>  
> -#define NO_IOMMU	1
> +#define NO_IOMMU	-ENODEV
>  

With this the following can be simplified in of_iommu_configure_dev_id:

diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index 4f77495a2543..b9b995712029 100644
--- a/drivers/iommu/of_iommu.c
+++ b/drivers/iommu/of_iommu.c
@@ -61,7 +61,7 @@ static int of_iommu_configure_dev_id(struct device_node *master_np,
 			 "iommu-map-mask", &iommu_spec.np,
 			 iommu_spec.args);
 	if (err)
-		return err == -ENODEV ? NO_IOMMU : err;
+		return err;
 
 	err = of_iommu_xlate(dev, &iommu_spec);
 	of_node_put(iommu_spec.np);


