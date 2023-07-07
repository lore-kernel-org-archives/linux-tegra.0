Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C0B4EB64D9
	for <linux-tegra@archiver.kernel.org>; Fri,  7 Jul 2023 22:35:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229955AbjGGWf3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 7 Jul 2023 18:35:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjGGWf3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Jul 2023 18:35:29 -0400
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3177F211F;
        Fri,  7 Jul 2023 15:35:26 -0700 (PDT)
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-345f4a3ff76so9346855ab.2;
        Fri, 07 Jul 2023 15:35:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688769325; x=1691361325;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6cSNsYsooG3g+SzMV5kYx3UnaENxpDe46jfApIadeYw=;
        b=QUP9vvLggdNPjoHH1NeQUnlnDHx3Vu8nyXXRbXJFL/nh31O95jyXSYef/CYF9ocqda
         Kd97N5UTEqbbl7rZ+ai12+2qsfYTpM5d/AwLXnb7ge+row/Zf0X8vwvei4ggXmj7lKfN
         hfKdG6XMAPXgMa/Vv+EWaxNaE6PjVF4bDWePlZ31BMrn9BKOtAesAibHiX1ochgx5X/5
         KYo2nLx7Fb3YN04N+HwcrXCkwSaBf1DqvVvZRstSdVUnMdPpInonuDOfDZF6y/mMlNCe
         muIVIsH7tBikGG/e9WwAN2EV42cjE5kKiAGqXuOf1IuJBJ8UWB1M/+rlWbi2xrVH9TAG
         dF3g==
X-Gm-Message-State: ABy/qLaR3cGo0ZSssAJbbnL7aEgh4JvHD1gFyPtgUG/+WDnFBDK94XJF
        j+XPFp1thN6OJDQnVgkjfQ==
X-Google-Smtp-Source: APBJJlEEYnNJ6KYGvtI1OxGoOG1wlxXKWxyGCsrUSyNer6tyT4yTOK3jHmG4Xvjt2TOxCxVHLpeWAw==
X-Received: by 2002:a92:d0ca:0:b0:345:d58d:9ae6 with SMTP id y10-20020a92d0ca000000b00345d58d9ae6mr5605366ila.9.1688769325412;
        Fri, 07 Jul 2023 15:35:25 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id m14-20020a924b0e000000b0033e62b47a49sm1628474ilg.41.2023.07.07.15.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 15:35:24 -0700 (PDT)
Received: (nullmailer pid 1091703 invoked by uid 1000);
        Fri, 07 Jul 2023 22:35:23 -0000
Date:   Fri, 7 Jul 2023 16:35:23 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-tegra@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 6/7] dt-bindings: arm: tegra: pmc: Reformat example
Message-ID: <168876932267.1091649.2626767223045502774.robh@kernel.org>
References: <20230707131711.2997956-1-thierry.reding@gmail.com>
 <20230707131711.2997956-6-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230707131711.2997956-6-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On Fri, 07 Jul 2023 15:17:10 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Reformat the example using 4 spaces for indentation.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../arm/tegra/nvidia,tegra20-pmc.yaml         | 77 +++++++++----------
>  1 file changed, 38 insertions(+), 39 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

