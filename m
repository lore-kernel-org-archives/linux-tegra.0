Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5014DC54FB9
	for <linux-tegra@archiver.kernel.org>; Wed, 15 Nov 2023 14:54:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234977AbjKOOyO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 15 Nov 2023 09:54:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234954AbjKOOyN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 15 Nov 2023 09:54:13 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4275EB6
        for <linux-tegra@vger.kernel.org>; Wed, 15 Nov 2023 06:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1700060049;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=1FlIYAXhM/ERDubCadB5WwuUe+5s0MuhfY1IPTS1Qc0=;
        b=JWHStGJM88jGe/q5f8vrrxlo4hUJlOjY8I/eoB+acUopDKN1/+AMqZ4ZqsyS6y+AJfOITp
        Fhy/iyHy456Te5Sxw8yhfOhrDBRKkcvcdpsXOyIF8jDE75C0IK9zOqIdf9wA4k0fqiJEJ8
        GJtLtt6OdkCMA0aiLCestTSWcRNva5M=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-lHhsH-4ZP2O51IW7oGcI4Q-1; Wed, 15 Nov 2023 09:54:08 -0500
X-MC-Unique: lHhsH-4ZP2O51IW7oGcI4Q-1
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7789a691086so807351485a.0
        for <linux-tegra@vger.kernel.org>; Wed, 15 Nov 2023 06:54:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700060047; x=1700664847;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1FlIYAXhM/ERDubCadB5WwuUe+5s0MuhfY1IPTS1Qc0=;
        b=vUO8oeHHBgThCrPo1t7gg3qheHVOoZ7YXwS8GZ93IrY7+oJYGtdQYMoRnW+phxZhAT
         lBic8cf+q8gal8TmKg1ordIbb2CKvrHBGwGLqvSkoJZIiG1fLiwFdKd5HWfbpPPCEWXC
         qYhgY6I0FNZ73PVO9MN/Fz6/Kp2vx9QWGHDy2JE/X+/9bdFSAFa6v+jeN2iDH9VgPpF2
         qpxK+NZh9Ku54sAny0ylin7qv7Q5xkQmA+FXnx8lRpQSBNTOrD0OXSnCNh7LRiEebBnE
         mWvB1X742gH2zesrvsLLeRy6H3UTFFAr4QhN3tQ7hTLgYWujTImYxIYlqMazfrHHIDqR
         FYLQ==
X-Gm-Message-State: AOJu0Yw67qmn9gqCPqa2kZotOGYHIHTfNZqEhbD3opVqLNVuILFzOXS7
        m/BvEaQfzWesUfqiwUmvpIjDcK1mgnQrUed2HYDTnvPLkay5prOtriEaFkanbCpBPvFsSjZ2xAn
        T0yUyEXWwaM82/Go52hF7PDw=
X-Received: by 2002:a05:620a:560b:b0:77b:b34e:6262 with SMTP id vu11-20020a05620a560b00b0077bb34e6262mr6700754qkn.46.1700060047604;
        Wed, 15 Nov 2023 06:54:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8Q+hB6LwGEOpBjf0tTy48HeUIb95APpcQR8cIO4M7kaLSCpN0/vvs5U/8Y5mL2TRIxjAUaQ==
X-Received: by 2002:a05:620a:560b:b0:77b:b34e:6262 with SMTP id vu11-20020a05620a560b00b0077bb34e6262mr6700714qkn.46.1700060047365;
        Wed, 15 Nov 2023 06:54:07 -0800 (PST)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id dx8-20020a05620a608800b0076cc0a6e127sm3521399qkb.116.2023.11.15.06.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 06:54:07 -0800 (PST)
Date:   Wed, 15 Nov 2023 07:54:05 -0700
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
Subject: Re: [PATCH v2 00/17] Solve iommu probe races around iommu_fwspec
Message-ID: <ah7jh6pi5o3s47mz5y4tms46fvpbmaisw6orom6tke2vdsqejm@qvjnxhejqs5i>
References: <0-v2-36a0088ecaa7+22c6e-iommu_fwspec_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0-v2-36a0088ecaa7+22c6e-iommu_fwspec_jgg@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Did patch 12 v2 get sent? I'm not seeing it locally, nor in lore, and b4 doesn't find it when pulling then thread.

Regards,
Jerry

