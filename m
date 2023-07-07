Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B3C9EB64D9
	for <linux-tegra@archiver.kernel.org>; Fri,  7 Jul 2023 22:35:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbjGGWf5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 7 Jul 2023 18:35:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjGGWf4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Jul 2023 18:35:56 -0400
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9172C211F;
        Fri,  7 Jul 2023 15:35:55 -0700 (PDT)
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-78374596182so86693639f.0;
        Fri, 07 Jul 2023 15:35:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688769355; x=1691361355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GnCYnlU/7grSApZkDTratBrYSuDi7WA6ltNLT8uhgKM=;
        b=NpYDc7Fzp7khw87ZxINNp8qzPwx0N6WRbi+7lrojfnfPcnmY7jog6/p+r8Gx2CfqLc
         zXeMVw+Slhw6ONMiocO6oRAPjjvn/IDqbci79lKCraRhynnwEm9rjqcnlOjwcXhE7lou
         fI7oF3oqyUIMck43EWz5Mq3KMOXuF14jvu8m0U4+aejw8MBL2dsvsOoWDaxrIFuZDCW4
         OrSj/3q9eSDwTv5eOSICPZvZb6OoSGKbXmZcvJgsTnWMqMsLQSLUl3NWgH9oO3srUzep
         0sjEeruIJXD8sHTAHFIdh1Z08vI/mUrSYGxCow6zQlGQusa6OYOE2EYkIlr9KGjjYdoh
         ofog==
X-Gm-Message-State: ABy/qLZLnKBZE395hyy98sCDUObRE8y/uw21wxZxt4qAzNV91t6QRyYe
        h3QW3dYpclLu+d3au5NgeA==
X-Google-Smtp-Source: APBJJlHrvST4VQK4S3FBZ4QP/I2dcUXTGyuLCPJYNF/iISsiTFm+N32cukON1rMJEHX56c2IFHEVwQ==
X-Received: by 2002:a05:6602:420b:b0:783:6906:a32c with SMTP id cb11-20020a056602420b00b007836906a32cmr6168379iob.16.1688769354704;
        Fri, 07 Jul 2023 15:35:54 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id o21-20020a02cc35000000b004182f88c368sm1610888jap.67.2023.07.07.15.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 15:35:53 -0700 (PDT)
Received: (nullmailer pid 1092339 invoked by uid 1000);
        Fri, 07 Jul 2023 22:35:52 -0000
Date:   Fri, 7 Jul 2023 16:35:52 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-tegra@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH 7/7] dt-bindings: arm: tegra: pmc: Relicense and move
 into soc/tegra directory
Message-ID: <168876935200.1092270.1142667429988921952.robh@kernel.org>
References: <20230707131711.2997956-1-thierry.reding@gmail.com>
 <20230707131711.2997956-7-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230707131711.2997956-7-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On Fri, 07 Jul 2023 15:17:11 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Dual-license this binding for consistency with other Tegra bindings and
> move it into the soc/tegra directory.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/{arm => soc}/tegra/nvidia,tegra20-pmc.yaml       | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename Documentation/devicetree/bindings/{arm => soc}/tegra/nvidia,tegra20-pmc.yaml (99%)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

