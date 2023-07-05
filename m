Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55FD2EB64DA
	for <linux-tegra@archiver.kernel.org>; Wed,  5 Jul 2023 20:48:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234075AbjGEUsf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 5 Jul 2023 16:48:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234054AbjGEUse (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Jul 2023 16:48:34 -0400
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E60C01BDC;
        Wed,  5 Jul 2023 13:48:19 -0700 (PDT)
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-77a62a84855so280927439f.1;
        Wed, 05 Jul 2023 13:48:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688590099; x=1691182099;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4FhGoJL6MPNSpU2Iuqwh/1L0pNB7vwQ0FpdyR8LQioY=;
        b=dBeO1+6HTZ5dc5hJulAHh/0elxw96SMbaz+acfz5gk6AJBGNwJfPfttHl+WEYXFsA3
         hr2JXR4uNxcIVkO0PSblExBuQb2BNONbCbNy5whe0rXGyIFn2hcSYp7DGHPX9ve7fqJd
         p2vUE8U4pzqJov5RZKHjlJ9zaMsdQ5veyQF7ZIdzo7VOkwkb6XRBhfPeBg4tLRXf6GfQ
         B/Z52Fc/ArXZPBJh7JcL+xOyNcHuFYuUFbvT96ob/EdK+D10WCAQ9mYlQLAazRsg6fK9
         mGif4QrZVzSF54P6LbapQnQ4J4AWVbnlp65BUcyqdc11T/8bthsWrTH15G9jLn3qbjXs
         02dQ==
X-Gm-Message-State: ABy/qLbcimTmXIiljMh7AQSkqH6J4OOA5+gHPxokEL99SZg0R3Bmclsm
        y4Bcs6QpffW0sJ3qSiHE2g==
X-Google-Smtp-Source: APBJJlGOzgFTGumH7SdS7Nlw3UOQPU0fLYXTkNMPTcP8/qmGIR1tO3DJAj+5o1jkfG09hgSVLxj8sQ==
X-Received: by 2002:a5e:aa1a:0:b0:76c:56fb:3c59 with SMTP id s26-20020a5eaa1a000000b0076c56fb3c59mr225364ioe.10.1688590099188;
        Wed, 05 Jul 2023 13:48:19 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id u7-20020a02aa87000000b0042b1c02d17csm10957jai.2.2023.07.05.13.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 13:48:18 -0700 (PDT)
Received: (nullmailer pid 1871764 invoked by uid 1000);
        Wed, 05 Jul 2023 20:48:16 -0000
Date:   Wed, 5 Jul 2023 14:48:16 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Conor Dooley <conor+dt@kernel.org>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: arm: tegra: ahb: Convert to
 json-schema
Message-ID: <168859009568.1871703.3025640898918748051.robh@kernel.org>
References: <20230705155222.2519728-1-thierry.reding@gmail.com>
 <20230705155222.2519728-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230705155222.2519728-2-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On Wed, 05 Jul 2023 17:52:21 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the NVIDIA Tegra AHB bindings from the free-form text format to
> json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - collate all single entry compatibles into an enum
> - use 4 spaces for indentation in example
> - move to soc/tegra directory
> 
>  .../bindings/arm/tegra/nvidia,tegra20-ahb.txt | 17 --------
>  .../soc/tegra/nvidia,tegra20-ahb.yaml         | 40 +++++++++++++++++++
>  2 files changed, 40 insertions(+), 17 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-ahb.txt
>  create mode 100644 Documentation/devicetree/bindings/soc/tegra/nvidia,tegra20-ahb.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

