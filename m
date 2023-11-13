Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B4EC4167D
	for <linux-tegra@archiver.kernel.org>; Mon, 13 Nov 2023 20:11:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230000AbjKMULx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 13 Nov 2023 15:11:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbjKMULw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Nov 2023 15:11:52 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BD9C10A
        for <linux-tegra@vger.kernel.org>; Mon, 13 Nov 2023 12:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1699906284;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
        b=Ad4b1lZtd61Vuf5abjVAKldS78A63DVRnlTajGp5zX+H+Nag7ZYs6prr/HvWLA4QSSIDFa
        Ut0Goxb5lYeVCqMfpV7xQXKWfctqgN0Yy68GiQUW1l0Iteu04QSRIcCp3bdb/YlFo798E0
        GulQpfe+Pftp+oCCJXX8diIV8ih7Wuc=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-haVhrPbMNa6m0347oWv6jQ-1; Mon, 13 Nov 2023 15:11:23 -0500
X-MC-Unique: haVhrPbMNa6m0347oWv6jQ-1
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-5afa86b8d66so66502627b3.3
        for <linux-tegra@vger.kernel.org>; Mon, 13 Nov 2023 12:11:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699906282; x=1700511082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
        b=Tgm8mOnhVm7YF5RuWbutpV/+dl+fwyB1XW+OVrzt6yiiGsR8wZFqsNXb+e2gODsZ8a
         4UfDQNfq2SI1+C57hUJwxIoLQz5piVmN2HmTs8RaCsFPnrUStCV6KFJerDmTOeAiniOl
         Y/pvXCEc4uCa/oxCit4+CpRXdPvEvuWkwa5zlb8bJLFzUrglL+1S2RsFLXZNZNjfskNE
         EAUvq2kMmaonZiwhNuH6wvLSAyMsCYXz3pXRGvAMtPp8kyVnedwgJgb0DhjTsVD1lxo3
         9/7jlDM+BnY4Kh7gAf2Zxni4vEox4Ewqj5aDils8EOWl9P49vqWlDQ1o/DNWcIXWrwZI
         YTXQ==
X-Gm-Message-State: AOJu0YwfJl77OpuxJr6MG4TTXM4w8Y4BY70MDsPm8xf+b0+bPlK2PwMZ
        qo67yUGeM4eP/M2x07yX1HffFzqBLvekhlrsFVxuCm3JaQsBn9XqldQY8yq/oedzxZV1fYcSElW
        1GgG9Rh3ELHKTdlikjHGvYaA=
X-Received: by 2002:a0d:ce45:0:b0:5a8:1d2e:e3e4 with SMTP id q66-20020a0dce45000000b005a81d2ee3e4mr8477336ywd.35.1699906282683;
        Mon, 13 Nov 2023 12:11:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPvmsC2qHDAh0Qw02m6ztA4jHl4uXRCi8o2kOZJlZ5OQtATt5oXfPPiPdyIMyU/zTa6M8O2g==
X-Received: by 2002:a0d:ce45:0:b0:5a8:1d2e:e3e4 with SMTP id q66-20020a0dce45000000b005a81d2ee3e4mr8477311ywd.35.1699906282465;
        Mon, 13 Nov 2023 12:11:22 -0800 (PST)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id z10-20020ac8710a000000b004196a813639sm2170954qto.17.2023.11.13.12.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 12:11:22 -0800 (PST)
Date:   Mon, 13 Nov 2023 13:11:20 -0700
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
Subject: Re: [PATCH RFC 06/17] iommu: Add iommu_fwspec_alloc/dealloc()
Message-ID: <qc6zidfhp2x6jmkteemyvi55wnaxlnqyfurdmdft2huxjh26ar@ffbwr7yaa3dl>
References: <0-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
 <6-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

