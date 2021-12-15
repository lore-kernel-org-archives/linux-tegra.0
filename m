Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1E9CC433EF
	for <linux-tegra@archiver.kernel.org>; Wed, 15 Dec 2021 19:16:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344135AbhLOTQ0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 15 Dec 2021 14:16:26 -0500
Received: from mail-oo1-f54.google.com ([209.85.161.54]:40643 "EHLO
        mail-oo1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344116AbhLOTQ0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 15 Dec 2021 14:16:26 -0500
Received: by mail-oo1-f54.google.com with SMTP id w15-20020a4a354f000000b002d85ef0533dso1535497oog.7;
        Wed, 15 Dec 2021 11:16:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xgMdRGgCuIolfRdeKGEr50tqMCz4JPztfeQpCRP8ws0=;
        b=ZOAE0v1Ze8ej4ulWmOxBEii0MvYDazfE3U5UVulg4R776izikEqLRIbe9ga4Tk0Q+3
         wCw/zLJgBORjCNS7FxKXu/729SRfPCMDKHpLVgOnHNOtD0nA7gUcJiANidLFZhHPdF8d
         Lfop5TuugrvuZjqHpeqAnOvA6YCiHfmjqJXnroV8oMUmBOzCVdLjBdJh/sQ5BJ7WVK6w
         E4wEXA4h0Ij52TNMOfFWWnRInQ/rbgSc4dIUmQNojIt/aGwW4S0osW213evb9M7gbhCy
         UF1DwDsDFvF3yF7NkhzuevTb4D9ZbVrUUS7K2hNzgVA337MLnor7siDoupFGKyMlAtRF
         pqGA==
X-Gm-Message-State: AOAM530wmy6Rke+9+2HqPZ8vJ/KVg4wA++QBuYK3SmSKgz/Ey/7kMnRc
        PCcSfArJR+n219i7mCoJWA==
X-Google-Smtp-Source: ABdhPJxsusBoa6hPOOtDxjKOQmlBNdaIhp1woTGfzH5zoLjDqu1oEoUdLzD4RkrrplFyG70u7FcjNQ==
X-Received: by 2002:a4a:c987:: with SMTP id u7mr8518064ooq.65.1639595785406;
        Wed, 15 Dec 2021 11:16:25 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id x17sm588157oot.30.2021.12.15.11.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 11:16:24 -0800 (PST)
Received: (nullmailer pid 1673469 invoked by uid 1000);
        Wed, 15 Dec 2021 19:16:23 -0000
Date:   Wed, 15 Dec 2021 13:16:23 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: arm-smmu: Document
 nvidia,memory-controller property
Message-ID: <Ybo/B1cjP4pumACW@robh.at.kernel.org>
References: <20211209163600.609613-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211209163600.609613-1-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 09 Dec 2021 17:35:57 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> On NVIDIA SoC's the ARM SMMU needs to interact with the memory
> controller in order to map memory clients to the corresponding stream
> IDs. Document how the nvidia,memory-controller property can be used to
> achieve this.
> 
> Note that this is a backwards-incompatible change that is, however,
> necessary to ensure correctness. Without the new property, most of the
> devices would still work but it is not guaranteed that all will.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - clarify why the new nvidia,memory-controller property is required
> 
>  .../devicetree/bindings/iommu/arm,smmu.yaml     | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
