Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEEC0C4167D
	for <linux-tegra@archiver.kernel.org>; Mon, 13 Nov 2023 20:12:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbjKMUMZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 13 Nov 2023 15:12:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbjKMUMY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Nov 2023 15:12:24 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3F89D72
        for <linux-tegra@vger.kernel.org>; Mon, 13 Nov 2023 12:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1699906320;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
        b=Xg7duv6lPJlORQ/b7cIdTFxaF53Wdn6hQyuiVSIGOQvMpjUM69+07MB4afhyFNq0YdBPwp
        9up0UqctJcWoCbILnK2r3RBrNwRLLcskl9f6awYA1VI6+LIcEcZktI0ZDETzq0AbdkCc9V
        oWOs5kFi82V3EFBJ0FAexhDKDQoBXnA=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-372-2B1Qa9ZdOSaAIyrgKzTuKg-1; Mon, 13 Nov 2023 15:11:58 -0500
X-MC-Unique: 2B1Qa9ZdOSaAIyrgKzTuKg-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-41e58a33efaso58021751cf.2
        for <linux-tegra@vger.kernel.org>; Mon, 13 Nov 2023 12:11:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699906318; x=1700511118;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
        b=qMAvfV9/XfKsCZk+92FtNpXVpkAFX82vW4tO5sxCIWDzm2M6whr0UEX8rG+TLxx+PU
         oRKAHnb5yFhrmsdTSHlKU4oSgSM9Wzw3u+6m6s+HLiagIrBzkgSFc0rnSsltTwDUoQ1k
         spgiOiE9YKO25PoIXfSrJ5aC1P8xWRAsDZ+eojSnAjyLnSX6Ke4aqa8pkYDbCdYRh6Xh
         7y1XlYGRYA1BpwEGfTS/ET2aBt3lRUf7dHj6SzPAdkTxnVr2pfCZ0fjk+YucpJq0fdOL
         Jz/OGL7q8dJNJaVxdePS8x7geTJ1T87OD//MvNUkeEHjN+ILzN6IuShIU3TCi+xcivGR
         5cow==
X-Gm-Message-State: AOJu0YyCZiKMwKSh8aC2YGlO4t7IV885S4sGqzq6lItflLZTgkEaRF1E
        ChbWKfNie9Rcyj6JScjcnnAjGOb64Sz0vT+oicKqRkSezqwskSYq4nDvZplTPsgZ5AOMJrjawBm
        Cpe1vTgnQHxnsClymSDKYWs0=
X-Received: by 2002:ac8:5f0c:0:b0:41c:e02c:858 with SMTP id x12-20020ac85f0c000000b0041ce02c0858mr147774qta.49.1699906318371;
        Mon, 13 Nov 2023 12:11:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFswPYZrUE+iHPpixm0usY52QHAZzAKPKkAbEgaDvDovqU3DEFNzLkKbZFJyBFwEre9EilUMA==
X-Received: by 2002:ac8:5f0c:0:b0:41c:e02c:858 with SMTP id x12-20020ac85f0c000000b0041ce02c0858mr147719qta.49.1699906318082;
        Mon, 13 Nov 2023 12:11:58 -0800 (PST)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id f19-20020ac840d3000000b0041cb8732d57sm2169319qtm.38.2023.11.13.12.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 12:11:57 -0800 (PST)
Date:   Mon, 13 Nov 2023 13:11:56 -0700
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
Subject: Re: [PATCH RFC 08/17] of: Do not use dev->iommu within
 of_iommu_configure()
Message-ID: <ciuy76347ki3xb5jzyji5fbzpsm2ssvcyvfgm6q7fqbneaoj7y@v5fpadftudhm>
References: <0-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
 <8-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

