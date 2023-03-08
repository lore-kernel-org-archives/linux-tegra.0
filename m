Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA14C678D5
	for <linux-tegra@archiver.kernel.org>; Wed,  8 Mar 2023 20:26:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229545AbjCHU0i (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 8 Mar 2023 15:26:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjCHU0g (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 8 Mar 2023 15:26:36 -0500
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B8709AFD3;
        Wed,  8 Mar 2023 12:26:36 -0800 (PST)
Received: by mail-oi1-f172.google.com with SMTP id bg11so18327oib.5;
        Wed, 08 Mar 2023 12:26:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678307195;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CnlOvUXyeAKtLKYQ2hfdrG+b67GCk57wS5Cg5xULFRQ=;
        b=SH+bFUqYQLcylxLEl1FergTcGDXeJNBwd9MyVrdWQYFC5ay3jhXvf1sdJl04NsSFIU
         UojwqTWoml+5t59Ic2/vqeBaLwnkMgw/RNYMtax/9zQ7QlG/VEAcTtTZ+g/FuY5XuMTd
         TLxaYCeM2msfplu9efIVv7XKRorsrX3McVXs589j+wrbPVrT5ZSKjqfZ8R9KpDzp/6Zm
         rltt8XfTPopuNCyC8p5Vjo6HC/t3UMcexWHS0okk+uP2DK7YJw+afKURqngjH/H8wkJu
         IUhLbbMMi5qOzKGaKnqaSpJ9PbLtLnbHF8QhjB2Z/aa6bM29rza2rGlVZ8F/fjkvymh9
         +9EQ==
X-Gm-Message-State: AO0yUKWxh/AvouvjjgsUKgjxBabNjATjwSIhuwYEyZvRApMycSu8uDWk
        IpRrPvpyO72DTyl1pdioIg==
X-Google-Smtp-Source: AK7set9Xb3ptSfumhzPp957/cQ8hDZwcHBiqkZGmGIaoMbDiEpp1M+L8wlirxE6gTGLrnNwsKvIhpA==
X-Received: by 2002:a05:6808:313:b0:384:dffe:ef1c with SMTP id i19-20020a056808031300b00384dffeef1cmr2615966oie.15.1678307194127;
        Wed, 08 Mar 2023 12:26:34 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id o65-20020acad744000000b00383e4ac8856sm6766104oig.22.2023.03.08.12.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 12:26:33 -0800 (PST)
Received: (nullmailer pid 3721978 invoked by uid 1000);
        Wed, 08 Mar 2023 20:26:33 -0000
Date:   Wed, 8 Mar 2023 14:26:33 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: tegra: Document Jetson Orin NX
Message-ID: <167830719263.3721918.14629705621182003227.robh@kernel.org>
References: <20230302093353.3873247-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302093353.3873247-1-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On Thu, 02 Mar 2023 10:33:50 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The Jetson Orin NX is the latest iteration in the NX family of Jetson
> products. Document the compatible strings used for these devices.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  Documentation/devicetree/bindings/arm/tegra.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

