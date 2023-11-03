Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DA3AC4332F
	for <linux-tegra@archiver.kernel.org>; Fri,  3 Nov 2023 20:05:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234614AbjKCUFx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 3 Nov 2023 16:05:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234569AbjKCUFv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 3 Nov 2023 16:05:51 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BE63D64
        for <linux-tegra@vger.kernel.org>; Fri,  3 Nov 2023 13:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1699041902;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=1OzQ+mysgekhlmn5TVv8N1n5lIKYQ3IFVh9mWG/eO8g=;
        b=cAB/pEZmGfgydTEY9HyCkuuP1uO+0QClQGKd986+Y9iV9brP7B2l9K3Lo5GjUNQe3dmwDN
        07qjWfcY5g/DC/8CX3FGDjzV1eN/QEJDPSevJaMJDpOEJbqnhfFxtoAV4kzmZ/Vo25zT7h
        U/wMGXpwH28FRJ+S7xIXt7gU5pVF8CY=
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com
 [209.85.160.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-HGnS7ekPNsSfQzBOWeNvtQ-1; Fri, 03 Nov 2023 16:04:53 -0400
X-MC-Unique: HGnS7ekPNsSfQzBOWeNvtQ-1
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-1e987fa0d87so3167809fac.1
        for <linux-tegra@vger.kernel.org>; Fri, 03 Nov 2023 13:04:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699041890; x=1699646690;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1OzQ+mysgekhlmn5TVv8N1n5lIKYQ3IFVh9mWG/eO8g=;
        b=ltVHKBb2fIrBaxkRsgseIRzbNyWky1QO8vRUWTiJXboNqSJADNn0loGWs5w7jMQq8D
         TV+ywgnf6nqLwin6q6O8DYEcDoZpuYrylsp78oyBZ7bstaVuvYJYPdSvbv02fj20bCPV
         PaWu5eb23kPxWE+DvlcDxmXfV1e6+dAVf+VOF76o/MK3/vpCMlCBTA2YlE1MW0SZ3pcY
         fl1wiShxo2J7SQTBiETlmXZvB3VgLKQcBUCIO8E89fRiUAaQQPtzFO9jODDwcxD2ssGg
         nafA/KYO8yOEF9/1XMQyZwVAY1s/kOFxVwtFaFA7U4yG9R2tMS8dvRcd9rGMq68yLolK
         9k5A==
X-Gm-Message-State: AOJu0Yxccsn5Zf+Tu6qWcQPN0zXljBfEXKM2KaNSra0GaY+Wt3W682Ko
        oZwgRvUjoZxZPzHCjTfkxmG/QCmdfpxQ1PA/VLCGx2SZh8+q7r8YJRxvoRj6lOsz4ft2+OkCXxS
        QONTFMg6bxcX3hUD2BDtkqPY=
X-Received: by 2002:a05:6870:1183:b0:1e9:f220:ac3b with SMTP id 3-20020a056870118300b001e9f220ac3bmr22237326oau.32.1699041889967;
        Fri, 03 Nov 2023 13:04:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLi5AqLxsbuEYljInRn+NA31jis0Cd1kvF705FHYMuK6MitH6grMLWp9GtAPMIyyR4rFG8jA==
X-Received: by 2002:a05:6870:1183:b0:1e9:f220:ac3b with SMTP id 3-20020a056870118300b001e9f220ac3bmr22237291oau.32.1699041889682;
        Fri, 03 Nov 2023 13:04:49 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id q14-20020a632a0e000000b005bd3f34b10dsm1704766pgq.24.2023.11.03.13.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Nov 2023 13:04:49 -0700 (PDT)
Date:   Fri, 3 Nov 2023 13:04:47 -0700
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
Subject: Re: [PATCH RFC 01/17] iommu: Remove struct iommu_ops *iommu from
 arch_setup_dma_ops()
Message-ID: <zrelyki44xy2jfqse2op5jjddnejbg4zpysvdkfx6ty2ylcjzw@ynuastkbx4kp>
References: <0-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
 <1-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1-v1-5f734af130a3+34f-iommu_fwspec_jgg@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org



Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

