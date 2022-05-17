Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98184C433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 17 May 2022 17:56:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243940AbiEQR42 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 17 May 2022 13:56:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239176AbiEQR41 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 17 May 2022 13:56:27 -0400
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D66414CD55;
        Tue, 17 May 2022 10:56:26 -0700 (PDT)
Received: by mail-oi1-f181.google.com with SMTP id m25so23233303oih.2;
        Tue, 17 May 2022 10:56:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=F2N1qE8zq48uNNfkkiOoIqxJDm+UjcFjHWe4Kxtm/NM=;
        b=7qqi7lsHdcvRq/NZQ6j9SK3PqVEzInU3hIcaC4obqc4QggFscba6It1fm5sdjjwrhY
         zsHQU9keyyUZm1VK5lHTq3yU655VHVu+M/ngcK3h/GhgiPve2LjCYxN4SGrnmm/HgIYL
         sMsR0aFUmRJPLExsZxGsU9h8stvvppvmjWYb12eQqh5zMfcHnhb/qgDn/ktMBt56DDlq
         ivMGY3l8h6mu7b1NVcaceMwOnlnQwiz9NkvWJ0qmC0aC5xDDDQXZ/q3kSCKnf3MWM0U0
         wRst3JN7bLQgxuWNIN6Y3bKloKr0gw0f2te7tr5FBxMkVO6TDbLZX6yDJiedmzxIjGLk
         Vs3A==
X-Gm-Message-State: AOAM533CLWu7suTq685b5r4jMtAi/x9IAS+q6fz1F5B/WxQYf9CSnI5C
        lFCiehLacsynJsANFZrINQ==
X-Google-Smtp-Source: ABdhPJyWdmUEm5lqcA1rrFd2H3y7rpMSjpr1KmDb7NtjqshZ+wwlZm+8uvlG7gE2bsGpaXfDD1tmDQ==
X-Received: by 2002:a05:6808:abc:b0:325:e32f:cb98 with SMTP id r28-20020a0568080abc00b00325e32fcb98mr10974916oij.188.1652810186112;
        Tue, 17 May 2022 10:56:26 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v68-20020a4a5a47000000b0035eb4e5a6c5sm22409ooa.27.2022.05.17.10.56.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 10:56:25 -0700 (PDT)
Received: (nullmailer pid 1320807 invoked by uid 1000);
        Tue, 17 May 2022 17:56:24 -0000
Date:   Tue, 17 May 2022 12:56:24 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sumit Gupta <sumitg@nvidia.com>
Cc:     linux-tegra@vger.kernel.org, jsequeira@nvidia.com,
        bbasu@nvidia.com, vsethi@nvidia.com, robh+dt@kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        jonathanh@nvidia.com, kbuild-all@lists.01.org,
        thierry.reding@gmail.com
Subject: Re: [Patch v6 2/9] dt-bindings: arm: tegra: Add NVIDIA Tegra194
 CBB1.0 binding
Message-ID: <20220517175624.GA1320722-robh@kernel.org>
References: <20220511201651.30695-1-sumitg@nvidia.com>
 <20220511201651.30695-4-sumitg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220511201651.30695-4-sumitg@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 12 May 2022 01:46:44 +0530, Sumit Gupta wrote:
> Add device-tree binding documentation to represent the
> Control Backbone (CBB) version 1.0 used in Tegra194 SOC.
> 
> Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
> ---
>  .../arm/tegra/nvidia,tegra194-cbb.yaml        | 98 +++++++++++++++++++
>  1 file changed, 98 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra194-cbb.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
