Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 047A5C07533
	for <linux-tegra@archiver.kernel.org>; Wed, 15 Nov 2023 15:09:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344320AbjKOPJo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 15 Nov 2023 10:09:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344364AbjKOPJn (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 15 Nov 2023 10:09:43 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4FFD19B
        for <linux-tegra@vger.kernel.org>; Wed, 15 Nov 2023 07:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1700060980;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
        b=TE0BjkblIJxd273sku6M5cmgSJahzXo0uMO76VlcnMw2mrREa9lW1byVg+lmXntCN9Ba+B
        CNu/2AA/ohgSHKI7a8V5JTPA1wt2hfhjxhFbxED19csmQJ6Z0Dj+MOVSr0aDS1nOwSx9eg
        SV67K9jIwuT5SQS5oQKoqZv13qx4XxA=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-UmwREaeMNcuhvPsfnTcuBw-1; Wed, 15 Nov 2023 10:09:38 -0500
X-MC-Unique: UmwREaeMNcuhvPsfnTcuBw-1
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-421af801578so52975161cf.3
        for <linux-tegra@vger.kernel.org>; Wed, 15 Nov 2023 07:09:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700060978; x=1700665778;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
        b=mvZcupMRnXXx8ee0RE05wJPh8HeHDH2PrphNtG3q9zApiB8RNWEgZV1yL03CXyJZnR
         8di6IsTnPZ+4SQ3nSXNUb6qALFrcl5yJ8cDTvxhMqbmHSEhP+8QjTawRHptByjL8XJni
         0yrCvJFmXM1iXEKPerNxg9OlliDDmOYiVatFQLvOP+RUifKpcVRCX6Xg62S0jqLMZYNY
         QrrVLsKWHH7USQIveZ7Qr1jNvW5CQyEEwo56YRIbbl7yX89UwJdx4k86FAVG5fQg3h+X
         kOvfIcGNbznrBOhTfSLcUKZP8l+e0ML2Ws2KRt/Gvn15sZJkP9tSjjvOQkX0D6IRanJ5
         9lGw==
X-Gm-Message-State: AOJu0YzgVtDQzme8HL0nC5tXZFXhb1Tlsotw1DZgTSdMFsEVoqYYVBdn
        KdAMMdFDVQM4niRXnKWEATK0YlZpAy0p20lNSzNo2azqmLxXiHkETY/TDAERHMI9FWeSHfVHkBq
        B45uxPRGyA89k3hUNUXh1Zp4=
X-Received: by 2002:ac8:570f:0:b0:418:a58:1cd2 with SMTP id 15-20020ac8570f000000b004180a581cd2mr6938294qtw.51.1700060978307;
        Wed, 15 Nov 2023 07:09:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFJQ4sai83VgKMNcVk7LBkPO+lmGyR543b/SO2885Ys+XYhGZt/IKDco0l9338e20RsJ7UBFA==
X-Received: by 2002:ac8:570f:0:b0:418:a58:1cd2 with SMTP id 15-20020ac8570f000000b004180a581cd2mr6938210qtw.51.1700060977944;
        Wed, 15 Nov 2023 07:09:37 -0800 (PST)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id b3-20020ac85403000000b0041ea59e639bsm3597148qtq.70.2023.11.15.07.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Nov 2023 07:09:37 -0800 (PST)
Date:   Wed, 15 Nov 2023 08:09:36 -0700
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
Subject: Re: [PATCH v2 12/17] iommu: Make iommu_ops_from_fwnode() static
Message-ID: <fc3a6krgqyi7awvm6dcjg5edbem5lead66b4tyi5ttetkcfdpp@iaya3ijkywwv>
References: <0-v2-36a0088ecaa7+22c6e-iommu_fwspec_jgg@nvidia.com>
 <12-v2-36a0088ecaa7+22c6e-iommu_fwspec_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12-v2-36a0088ecaa7+22c6e-iommu_fwspec_jgg@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

