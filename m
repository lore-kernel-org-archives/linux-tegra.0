Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6292AC5ACB3
	for <linux-tegra@archiver.kernel.org>; Wed, 15 Nov 2023 14:45:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234980AbjKOOpq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 15 Nov 2023 09:45:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235048AbjKOOpa (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 15 Nov 2023 09:45:30 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E3D044A5
        for <linux-tegra@vger.kernel.org>; Wed, 15 Nov 2023 06:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1700059382;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
        b=SxmaRbj2UI7wyR4yRDkXPPbSFume3DPXj7iBSaRrChzCcyMUxrRk56D6qBBcBjNti+o+sk
        z2EVJ0JhvAceSnAswTu72CVeIrcvh1n+Mzy/OTx27APEsFNjbMjeEedABWSTXKs3CAn9VC
        3pSVHSmoo2m9KIJ5q611LilLLaf1XKQ=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-306-9O1Zo5nzOIO0Z86lwERcRw-1; Wed, 15 Nov 2023 09:43:01 -0500
X-MC-Unique: 9O1Zo5nzOIO0Z86lwERcRw-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-66d412e2450so81299456d6.2
        for <linux-tegra@vger.kernel.org>; Wed, 15 Nov 2023 06:43:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700059381; x=1700664181;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
        b=fZcQp0vk3GsIrzJkT4op/jPrOxfNE0OyuQF8limg3HPlN5A8ADvaYsABkkHjvtTxnZ
         qN4ZPY3gesLszVBoNMTI4ymGa5ezDritKpsyWCp08lxE52VTuoQJPP7M9tjK3JFvbnXd
         ydtSno7axwPYRqGdKJ6cfCoBpxBHH3hajty+1MKPggJAfIdYuKE1aEVbSfy9fLzt6COa
         qXCs/SqG7kq/op333pZdfX2ExOLaHFW4YDa38i9tmPG/g/iQMc100mYK8FJiNXNj8DuG
         Eb2pWChL+8ZyTYtJ8TRtmaMbPHYK9E5GblbawD/zMRjH7FvE+7iiLzi4jrd1KYtp7nKp
         S/og==
X-Gm-Message-State: AOJu0YxhRm7jtx6Xpz37ER9i+EdvGbCaRHOJb6gyRFUZRugMPZEAFkio
        /OPeeme9JR3cZGnDsG+VmTiHji5whhUNpcBEk3nDdCvj5qiUqaQ42U3wWeYBDafa6GwHVop9dEZ
        3Gv1Cp2AGVcubFEJnnW7gIMI=
X-Received: by 2002:a0c:c3cf:0:b0:66d:1100:7b81 with SMTP id p15-20020a0cc3cf000000b0066d11007b81mr5491041qvi.18.1700059380980;
        Wed, 15 Nov 2023 06:43:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0jpQrK9oJO86ojMSo1dc0KOCSp7+RBS164Fh6GwHlgBAjmWNWgSHBdIgtMHXFSNVSzkNNdA==
X-Received: by 2002:a0c:c3cf:0:b0:66d:1100:7b81 with SMTP id p15-20020a0cc3cf000000b0066d11007b81mr5491005qvi.18.1700059380669;
        Wed, 15 Nov 2023 06:43:00 -0800 (PST)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id u2-20020a05621411a200b00674a45499dcsm578681qvv.88.2023.11.15.06.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 06:43:00 -0800 (PST)
Date:   Wed, 15 Nov 2023 07:42:58 -0700
From:   Jerry Snitselaar <jsnitsel@redhat.com>
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     acpica-devel@lists.linux.dev,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dexuan Cui <decui@microsoft.com>, devicetree@vger.kernel.org,
        David Woodhouse <dwmw2@infradead.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Hanjun Guo <guohanjun@huawei.com>,
        Haiyang Zhang <haiyangz@microsoft.com>, iommu@lists.linux.dev,
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
        Palmer Dabbelt <palmer@dabbelt.com>, patches@lists.linux.dev,
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
        virtualization@lists.linux.dev, Wei Liu <wei.liu@kernel.org>,
        Will Deacon <will@kernel.org>,
        =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Christoph Hellwig <hch@lst.de>,
        Moritz Fischer <mdf@kernel.org>,
        Zhenhua Huang <quic_zhenhuah@quicinc.com>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 03/17] iommu/of: Use -ENODEV consistently in
 of_iommu_configure()
Message-ID: <jtgj4qfpqzj5zowqwmcniaxd77kqvirspm2a7jkgg6vgmo2scy@5jpoatxkrkid>
References: <0-v2-36a0088ecaa7+22c6e-iommu_fwspec_jgg@nvidia.com>
 <3-v2-36a0088ecaa7+22c6e-iommu_fwspec_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3-v2-36a0088ecaa7+22c6e-iommu_fwspec_jgg@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

