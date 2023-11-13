Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BFD7C4332F
	for <linux-tegra@archiver.kernel.org>; Mon, 13 Nov 2023 20:06:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbjKMUGh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 13 Nov 2023 15:06:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbjKMUGg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Nov 2023 15:06:36 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B7DDD72
        for <linux-tegra@vger.kernel.org>; Mon, 13 Nov 2023 12:06:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1699905968;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
        b=GzyzED5HYzF4rvyrbEXuum1zn5kLd+ca4p2b9B2YPFJXo/eG+/WFvae3SribMTd/gNLQZU
        wZpIJKkOCKqLpk/8/3il0yaEjGdTxJQ4TWAH5amwcrV+t8I8rjuKHp2Rte9KvvF8KYWpTY
        tFCv6cVrXg2T6AwXA9oYZRNpRQALSoM=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-542-nVWsL6UnNG6KGq9fGDkUvw-1; Mon, 13 Nov 2023 15:06:07 -0500
X-MC-Unique: nVWsL6UnNG6KGq9fGDkUvw-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-66d03dcdc6bso59368566d6.1
        for <linux-tegra@vger.kernel.org>; Mon, 13 Nov 2023 12:06:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699905966; x=1700510766;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
        b=tY+H33owlQjspo1o9k+WwCKlnX7TUzMuwaj79i02D3PimX3g4Vcdbof7XzSRfaIS52
         ABwV6H0sBSUfHMjzUZY5Gk9hEyF45BGk2ZR5IB1/d6/U/Peq1izrpAINrBgsI96++1wO
         sget9ilz3U2qw3LyI5WYMFzhXVve/zR7Nar/gNCULJPDFOnW+NOjtI3plTylw9HECdtw
         37yZ9ZyGAYLCtVnKAfV2R6kmS+mO5fQx5k0DnuUbzUWnQ6fugdLr/MuRNo9lTDSq4fMZ
         9E+JR4Ja5CJSfMXQEGV7IsqsNydZuPxwfDm18s9AnlOz/XOmGmUz4Yeebx7xn0LehLyL
         6uOg==
X-Gm-Message-State: AOJu0YwFP0ucw+pzLJEnjOn7pHlJ594or9m8c+pkNXAQbYbsHGobrGLs
        +KSpRO+7sl9ZWqvHiW/Vnof0d/rv2ryw0oB5/UzpuWP+4RYwMtdtAemSucOUvr+UGQQdj7CHY+c
        4x0KtA6cW9zogF4GGySU7Jr4=
X-Received: by 2002:ad4:53c6:0:b0:63f:80a0:4eea with SMTP id k6-20020ad453c6000000b0063f80a04eeamr283871qvv.24.1699905966603;
        Mon, 13 Nov 2023 12:06:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHU546dToL/RnbvSEEgGYhgfAOuTUeuUj6W3IfV3UEMZ3+1fSCYuM0AW5xrguKdlx+xfhHm1A==
X-Received: by 2002:ad4:53c6:0:b0:63f:80a0:4eea with SMTP id k6-20020ad453c6000000b0063f80a04eeamr283817qvv.24.1699905966425;
        Mon, 13 Nov 2023 12:06:06 -0800 (PST)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id q8-20020a0ce208000000b00647386a3234sm2299097qvl.85.2023.11.13.12.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 12:06:06 -0800 (PST)
Date:   Mon, 13 Nov 2023 13:06:04 -0700
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
Subject: Re: [PATCH RFC 13/17] iommu: Remove dev_iommu_fwspec_set()
Message-ID: <fussoe3f2shd222d2lwvcts3odhnyuvfxpgv6c3k2d4udxu3uv@db53jszpgq7v>
References: <0-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
 <13-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <13-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

