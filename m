Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A739C4332F
	for <linux-tegra@archiver.kernel.org>; Mon, 13 Nov 2023 20:13:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbjKMUND (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 13 Nov 2023 15:13:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbjKMUND (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Nov 2023 15:13:03 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DF84D5D
        for <linux-tegra@vger.kernel.org>; Mon, 13 Nov 2023 12:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1699906358;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
        b=b66pjEtOs3F0OiGf1Ys1lGuJR8+mUhGTo3FEnUfR3Q5Mp9T26m0ZpgeYu4h7lCqC8Aq1jv
        IKhl6mX+0zd8fPFIgO/lY5O8iZGuB2htK4tVOkweP8ubXdCaWS+1GLz3NlR2hHXuGOqPtT
        HTbGJ+hRbr3Hpr7ImbxQ3LHx/gfbcIE=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-bt6sDyHiMFWBK48x8uq_xQ-1; Mon, 13 Nov 2023 15:12:36 -0500
X-MC-Unique: bt6sDyHiMFWBK48x8uq_xQ-1
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-5af592fed43so56353887b3.2
        for <linux-tegra@vger.kernel.org>; Mon, 13 Nov 2023 12:12:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699906356; x=1700511156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sqWGwV812/CXYndzj2W50PA7KOMPm+tHC+e+xjD2/M0=;
        b=u0Y7RdOeJ5ICtY2LKovVqoWWxDhbfWHWIgEucnFadiIIweDLL6da7TjcFb6WDnh4Yq
         qzQtpXgfB2ExmJBgwhSsvmLkQJZM+B76A0anUubohVcXEbIZ7DG//OctmueeKtx2TCgC
         jujkrhMZn3BvsUaHyUABT6gJ1uhVnbRyFOgwpz3orfsXDwFwOdi89wFL3IuMcF29AupA
         EmxJPhsX2qXaUJ4+yibITfpk1Zo64BvnMZw8j/b9HA+YZaQXvnzk1g1bUyIo/Feb4tPi
         t/Sk069fE6tLHqcN3Db5LCVNzRCWfUmYEEQj7d/2ff/adjQhgIRWxzkONADuTrFK67et
         Yq0g==
X-Gm-Message-State: AOJu0YwLlD3HSu9nni0k2nkJCgKJ2Ih2krCja8Ig+yr1XskDVmW0jEvg
        GRWGfc8ag+3sbU7JCLaYZIadwdkeIKxGwfOZKcuhwniiCg22dEcworsFefwu6b+FzYWgeI1bT5E
        5b/RaE0CalM3oAc+M6Y1H6L4=
X-Received: by 2002:a81:a1c8:0:b0:5a7:b8e6:6441 with SMTP id y191-20020a81a1c8000000b005a7b8e66441mr5681677ywg.16.1699906356197;
        Mon, 13 Nov 2023 12:12:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8TAFaS4ERYYFs+8jp6ZPsOwc5cP1r90IboZbxfRfwy6gwcqiZWRR9jIiN36BiWY+6zJFv5g==
X-Received: by 2002:a81:a1c8:0:b0:5a7:b8e6:6441 with SMTP id y191-20020a81a1c8000000b005a7b8e66441mr5681632ywg.16.1699906355905;
        Mon, 13 Nov 2023 12:12:35 -0800 (PST)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id a10-20020a0dd80a000000b005a7ba08b2acsm1972894ywe.0.2023.11.13.12.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 12:12:35 -0800 (PST)
Date:   Mon, 13 Nov 2023 13:12:34 -0700
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
Subject: Re: [PATCH RFC 09/17] iommu: Add iommu_fwspec_append_ids()
Message-ID: <xv2544jtubq5aefvzaiabazmz5uf32alw6blcdbvsui6wn37ep@vpykzk2vvyp5>
References: <0-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
 <9-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

