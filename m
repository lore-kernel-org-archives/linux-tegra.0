Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2C3CC4332F
	for <linux-tegra@archiver.kernel.org>; Mon, 13 Nov 2023 20:03:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229816AbjKMUDN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 13 Nov 2023 15:03:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbjKMUDM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Nov 2023 15:03:12 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54BB5D5D
        for <linux-tegra@vger.kernel.org>; Mon, 13 Nov 2023 12:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1699905764;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=x5sbsbZrhM7njh7UJ8Gfj3jbjPzQiV5xODIk6atjKoU=;
        b=FC7cvOMY36DbgQF+XdGUaq5cSkrqnGGK8IZ5rJQqIIfaIxYX+Mn86Wz7CycVKWpBCKUfuz
        bcYI/a7egw3rPRjnbMrvjM4Su5TfBp0kxvoVe27CFAJ4Z3/jA18aUyGsKozAbK9ssl+Yso
        27Xgx5Y3DlLNQDeGasEJTIBsGoXsR9g=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-8Q-CjMguPTmw11G5qlKwnA-1; Mon, 13 Nov 2023 15:02:43 -0500
X-MC-Unique: 8Q-CjMguPTmw11G5qlKwnA-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-66fbd3bc8ebso63263606d6.1
        for <linux-tegra@vger.kernel.org>; Mon, 13 Nov 2023 12:02:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699905763; x=1700510563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x5sbsbZrhM7njh7UJ8Gfj3jbjPzQiV5xODIk6atjKoU=;
        b=uKP98R7MnSv7Oj99XvZICG5ryGHdD5UI1KBN9q42Xk39NY637pYlSNsmXnhWRDkYHS
         SvvMIQsWCs1T+f1spSCFDrfgFhpCFDlBP1UDUvlSeRjO7ErReM2n3jeHLSaeN58pGAqV
         vNZpqcYOL0JzL26HlosxOhPgljtBdm3/LfGAlzC77tBoGOyMs7c8ipPvQSvOJc8IsFTo
         hwHgfS+FDGBAq/zFMcWCMYTZhCpHiqTsRJ4Dixk+tAgS/Nu8xDhim6T2R13n6MjAoR0m
         POJWTSp90Hlj+UPwlsx3nW4Vc2D4dB0DneKt1o9tAq+ast0VaaRIJwqYdQOAXH2kzJn+
         VAdA==
X-Gm-Message-State: AOJu0YyKiZnm8bYm1N9Lj0rYQlZOqtecxDMcdBuCp05ttsXrn4b5E7JH
        6qwzDhueAx2hlhvM20v+vdMNTc4BzMz8v8kpQyy7R2agP4nTA/1FiEdzmzVQSdJYP/k/I706/mp
        CfOEF0YBd4TYGg2Gir/J1Vxg=
X-Received: by 2002:a0c:f9d2:0:b0:66d:9970:6464 with SMTP id j18-20020a0cf9d2000000b0066d99706464mr233529qvo.13.1699905762793;
        Mon, 13 Nov 2023 12:02:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHVvfJ/8QycB4sitSkyNc9BJr+XhgbESVoJGYkT8lKAjf1cMgXzof7Oqc5lCEmlPE1oL2APNQ==
X-Received: by 2002:a0c:f9d2:0:b0:66d:9970:6464 with SMTP id j18-20020a0cf9d2000000b0066d99706464mr233490qvo.13.1699905762358;
        Mon, 13 Nov 2023 12:02:42 -0800 (PST)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id vr2-20020a05620a55a200b007757fefea79sm2097337qkn.130.2023.11.13.12.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 12:02:41 -0800 (PST)
Date:   Mon, 13 Nov 2023 13:02:40 -0700
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
Subject: Re: [PATCH RFC 12/17] iommu: Make iommu_ops_from_fwnode() static
Message-ID: <gg6ecoukkia32t33vjfunny4y54pulz6k6zfkfpp6nahav4otj@z6e62pbavceb>
References: <0-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
 <12-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Nov 03, 2023 at 01:44:57PM -0300, Jason Gunthorpe wrote:
...
> @@ -1044,11 +1043,6 @@ static inline int iommu_fwspec_add_ids(struct device *dev, u32 *ids,
>  }
>  
>  static inline

   ^ was missed in the deletion below

> -const struct iommu_ops *iommu_ops_from_fwnode(struct fwnode_handle *fwnode)
> -{
> -	return NULL;
> -}
> -
>  static inline int
>  iommu_dev_enable_feature(struct device *dev, enum iommu_dev_features feat)
>  {
> -- 
> 2.42.0
> 

