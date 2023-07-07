Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0C33EB64D9
	for <linux-tegra@archiver.kernel.org>; Fri,  7 Jul 2023 22:30:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbjGGWaw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 7 Jul 2023 18:30:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbjGGWav (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Jul 2023 18:30:51 -0400
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36652199F;
        Fri,  7 Jul 2023 15:30:49 -0700 (PDT)
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-345a8a78bcfso9346845ab.2;
        Fri, 07 Jul 2023 15:30:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688769048; x=1691361048;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+yzcs4YVirmNtrzEjdaCCoDY/Vwm1Gn/I9WcBTv2ea0=;
        b=B5IvWF24Mp7gO41XsTZqtvSedD96nY+bHeClikJ7skvE1fD3BndvlkGnFrZdHY55ru
         n3NBgipeBDLydfPnok/bl2xVDTOAxVEBAkanBb+eJhZlNb+6QSrZ7Uh8w9OEMKwxeEbQ
         J0PbRboOpmeUbejCWAFHy2CbhFpUr4pwwdrd4jAXrhHphy6YTXh45y6jI7qdzjNyRUoQ
         BlrIXqJ8FRZRCz8tn+9TtmhfnTc3OMuKypHHQsU2Pc3wfOaRgy2P1OicCwfWPW3Xgi+3
         V/AutIIoPG2En3OBwTbtDdeGxQWA3Fh7vOkD9c8dnzNemQl82uFD1zrZ9EQgPW2udUub
         qDig==
X-Gm-Message-State: ABy/qLZgOreEBLLDmPpJHKVf6yGeDiVVVGYs89RlB+qGk8GQ+JnOp9yH
        KRWbJ0nPDIeMo1bp5885Bg==
X-Google-Smtp-Source: APBJJlFb/sAfjlhJ848Hs4Jr+rMHOfoy7i1SSmxu9TKfsX4Cl+0cVqojUW/qKexXwQ0Ue5rijZsZrA==
X-Received: by 2002:a92:db4c:0:b0:345:baef:842b with SMTP id w12-20020a92db4c000000b00345baef842bmr5969367ilq.25.1688769048406;
        Fri, 07 Jul 2023 15:30:48 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id g9-20020a926b09000000b00345d6297aa7sm1588452ilc.16.2023.07.07.15.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 15:30:47 -0700 (PDT)
Received: (nullmailer pid 1086603 invoked by uid 1000);
        Fri, 07 Jul 2023 22:30:46 -0000
Date:   Fri, 7 Jul 2023 16:30:46 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 3/7] dt-bindings: arm: tegra: pmc: Move
 additionalProperties
Message-ID: <168876904574.1086564.16180085134813220906.robh@kernel.org>
References: <20230707131711.2997956-1-thierry.reding@gmail.com>
 <20230707131711.2997956-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230707131711.2997956-3-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On Fri, 07 Jul 2023 15:17:07 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> For indented subschemas it can be difficult to understand which block an
> additionalProperties property belongs to. Moving it closer to the
> beginning of a block is a good way to clarify this.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/arm/tegra/nvidia,tegra20-pmc.yaml         | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

