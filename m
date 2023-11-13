Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99C1FC4332F
	for <linux-tegra@archiver.kernel.org>; Mon, 13 Nov 2023 20:36:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229677AbjKMUgK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 13 Nov 2023 15:36:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbjKMUgJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Nov 2023 15:36:09 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28D4C1B2
        for <linux-tegra@vger.kernel.org>; Mon, 13 Nov 2023 12:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1699907741;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
        b=hu1Agh8g6+1yUEwZ2/+ba7XbcHBhpAE3pVolPKyy/pMuqCzYrruK25qWT8ypCYozDP8oBE
        ZszB/3CxEAY5hvz9bJKNctsR7421IlJkudTpmsk0uUToiZ9erNrHR519u/Rf900A2eXfOx
        SMw7yO618XmPjAcOfHyVW0hcTToR5JI=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-597-lwb5gd5jNdSsWbO6_FWbHg-1; Mon, 13 Nov 2023 15:35:40 -0500
X-MC-Unique: lwb5gd5jNdSsWbO6_FWbHg-1
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-7b9b269f05cso1429271241.3
        for <linux-tegra@vger.kernel.org>; Mon, 13 Nov 2023 12:35:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699907740; x=1700512540;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
        b=ErCpgJtvyxYVoSKUqUiZZCVpUPA/C26bmXLlDhX3GQShWezfrL/LcWFHTS1ebPotKC
         B865flAJaVyhFM5FcvTWeiTZIUR4MX16/vDNrARXidoQ4V6MLgzS4Lf/t8tj39iFEo7D
         JiOiHMrifFIeXc0H2LLGrEdHvahsJn80/qsq2P+hHAQ9VRIsnc5DwT5HCuMDOgg+k3Sp
         ExslOGBD8gOU8o1/S+T9RaAYVkUxsXWI1QNwqONV3qkPtHKmd2qT+7qNYt2YjPrlXdL0
         3BRkdm7sSDEevjKB82CUsOYqn6y4ucaZvc+NgBgnjSYFl/6ADCcq8EzfeHaZrUUJHMbd
         LNUg==
X-Gm-Message-State: AOJu0Yz5KgEyjI7e2rocH0QQo3Wfz8+26L0IP9QLMD4p5K59z9gx9/3h
        ZQRSH8AIH4nYeExgVrUUhWGX1qPmhdy5FHYnhObAfZGp/yoKZJlPZj+W6nxZy6qT19UKk8coc8Z
        u+F9gn8BibO/jVNeDXh6shkA=
X-Received: by 2002:a67:c999:0:b0:45f:1d2:30d7 with SMTP id y25-20020a67c999000000b0045f01d230d7mr6099915vsk.8.1699907739765;
        Mon, 13 Nov 2023 12:35:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFHxuNWEMeMyEEwh/zP9ymoIFo7xdEdta/98xN6QQh3vfUdvtg1LEuvGc/ZAJ7YHFiZylBuHw==
X-Received: by 2002:a67:c999:0:b0:45f:1d2:30d7 with SMTP id y25-20020a67c999000000b0045f01d230d7mr6099883vsk.8.1699907739491;
        Mon, 13 Nov 2023 12:35:39 -0800 (PST)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id dx9-20020a05620a608900b007789072e445sm2145267qkb.31.2023.11.13.12.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 12:35:39 -0800 (PST)
Date:   Mon, 13 Nov 2023 13:35:37 -0700
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
Subject: Re: [PATCH RFC 17/17] iommu: Mark dev_iommu_priv_set() with a lockdep
Message-ID: <ytwi5fmrlwmbl5trepczcy6on2sknr43yrym53c4ychhagrlr5@vdvgw5zpgjds>
References: <0-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
 <17-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

