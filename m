Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8495C4167B
	for <linux-tegra@archiver.kernel.org>; Mon, 13 Nov 2023 20:19:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbjKMUTa (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 13 Nov 2023 15:19:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbjKMUT3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Nov 2023 15:19:29 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC06210C6
        for <linux-tegra@vger.kernel.org>; Mon, 13 Nov 2023 12:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1699906741;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
        b=N5VtVlBdaqEHuY492h0JjSZZ1GoadmiXVvQacaWoxj2HA0hDf+7JoRGQmhSc6tMG8eHHxm
        Y6pRHz+Ac3Wx+fw18gXjwFpsF2ut/krpKaI3duXVxjIyACFDCoSo8ypz5URFWFPcOBsIE5
        OcHlYzvyTQZf9VYrtmBFr9xLFUuHqko=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-QqItFpUdOKKQ440iorTVog-1; Mon, 13 Nov 2023 15:18:59 -0500
X-MC-Unique: QqItFpUdOKKQ440iorTVog-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-41cdc542b56so58380481cf.0
        for <linux-tegra@vger.kernel.org>; Mon, 13 Nov 2023 12:18:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699906739; x=1700511539;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
        b=c9j3QsXBNQMF9JNOBRCy8TQqLGOSBQUUz42wOAV/3sZzN8gRorVZsKSC4M+UMvCo2z
         j+pNZQLWzV6XVghM7baVoKllIMGIWMCtpCO7ztEpg/OjySJ2KDvkI5QeA1918RmXyZSk
         Q7t7KINlmageZJZmP15Z8mQvK/uXWgFIUvCwy01fxDy3cOl6DT/Ia2e+m/9jS1+bDY0w
         Y0QuYrdhOkSANoC5LmadILRpkdykRnStJBqSgSN2RuTD8B7PDaeFBNgXHAvgzLUV8n/R
         QZSCEYc0SRYrXtXY6RhtgmYOaJdq2udZ6LLF6Re+p4otNvXy6HbDxb5RbDg1Zb/Qvnll
         Herw==
X-Gm-Message-State: AOJu0YzdEyG4949CGCt/hmfU4qZEHSbs2A/n2GjuhaTYwTc/PfQI5Lya
        NxnUU5gZ8C22X8JRcMzmtMe179Gm4cymkBZ4/2ehOtEwUgprIJivr+mhBULkrRnGtlwOSTq0JjW
        D+B0tyVLOEZr19XjMAPdHEHc=
X-Received: by 2002:a05:622a:1908:b0:41c:b6cf:a49e with SMTP id w8-20020a05622a190800b0041cb6cfa49emr292154qtc.10.1699906739319;
        Mon, 13 Nov 2023 12:18:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJ4aN/cKUvDweqjuNq1K11+iEyXGsjit6950JrTQD9aZT2d8xoiBctpmKNKw2vmVX7XqpdQA==
X-Received: by 2002:a05:622a:1908:b0:41c:b6cf:a49e with SMTP id w8-20020a05622a190800b0041cb6cfa49emr292104qtc.10.1699906739106;
        Mon, 13 Nov 2023 12:18:59 -0800 (PST)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id j5-20020ac84f85000000b00405502aaf76sm2177375qtw.57.2023.11.13.12.18.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 12:18:58 -0800 (PST)
Date:   Mon, 13 Nov 2023 13:18:57 -0700
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
Subject: Re: [PATCH RFC 14/17] iommu: Remove pointless iommu_fwspec_free()
Message-ID: <22mlpmrdftubxzr46qci26p3aqojvv5p4ffroshlzubtwcw5cr@jwcl5scuttdi>
References: <0-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
 <14-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

