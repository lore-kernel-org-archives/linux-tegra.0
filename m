Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21118EB64D9
	for <linux-tegra@archiver.kernel.org>; Fri,  7 Jul 2023 22:30:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229629AbjGGWaE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 7 Jul 2023 18:30:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbjGGWaD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Jul 2023 18:30:03 -0400
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12D54199F;
        Fri,  7 Jul 2023 15:30:03 -0700 (PDT)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7869bcee569so88490339f.0;
        Fri, 07 Jul 2023 15:30:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688769002; x=1691361002;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xcl9zTXU6lxR4gd02CH6jQXobojxfhQktEpZ6SVOYuw=;
        b=WICBZI3lc5oZYZHPq3eb6Q3dmEjl94mkrkV3vpuYW4pkPW+20QzN3k3KBR/fM8EqxG
         73xBqka9DqEo2hbQXWJAMYcSjms07+HSrEJzTknckBeq4MqC+oGF9x5rfCDxOopBvAwc
         6gyhX/3yM4MzzYVdQkQkuD4RQexWvpLJNcFCCdNirkNOvEZGs9Wht6s4y4mb/sn5DUUa
         ULA3dOXUWfOY8+1pd2WXToW8+zTFx/VqAPAmFU6TMXdWWeGlEpoxMvO3fHc9zPW0c7qh
         zmghHoku/4nEJI6fNSfktVeUO4Pcty0ZEIFzkEnXIUH5PymEKLUd+EeoynhNFXfn23FB
         3Fvw==
X-Gm-Message-State: ABy/qLaitUtT2UyT5AfZ3DPuGFrrQWg0VyuEROV6mRvFcXHzdPohmiq3
        h6uy6yIpZ8JfqF9+n6eW2w==
X-Google-Smtp-Source: APBJJlGWL0IebUXWH1i/uiDVSA5nS8HN5xC5Ujknr+4IkH689asVb/PeqZTLMUzGyflPN5pCT9Lhag==
X-Received: by 2002:a6b:6202:0:b0:780:bfc8:ad10 with SMTP id f2-20020a6b6202000000b00780bfc8ad10mr5805836iog.1.1688769002319;
        Fri, 07 Jul 2023 15:30:02 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id e11-20020a02a78b000000b0042b76deb22fsm1543291jaj.92.2023.07.07.15.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 15:30:01 -0700 (PDT)
Received: (nullmailer pid 1085709 invoked by uid 1000);
        Fri, 07 Jul 2023 22:30:00 -0000
Date:   Fri, 7 Jul 2023 16:30:00 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     devicetree@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/7] dt-bindings: arm: tegra: pmc: Remove useless
 boilerplate descriptions
Message-ID: <168876899924.1085638.15292371493988491123.robh@kernel.org>
References: <20230707131711.2997956-1-thierry.reding@gmail.com>
 <20230707131711.2997956-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230707131711.2997956-2-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On Fri, 07 Jul 2023 15:17:06 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> The descriptions for the clocks and resets properties are no longer
> useful in the context of json-schema, so drop them.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/arm/tegra/nvidia,tegra20-pmc.yaml        | 11 -----------
>  1 file changed, 11 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

