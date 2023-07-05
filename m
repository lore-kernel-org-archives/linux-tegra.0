Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E399BEB64DD
	for <linux-tegra@archiver.kernel.org>; Wed,  5 Jul 2023 20:44:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233864AbjGEUok (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 5 Jul 2023 16:44:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233871AbjGEUoh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Jul 2023 16:44:37 -0400
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33EC31BFB;
        Wed,  5 Jul 2023 13:44:06 -0700 (PDT)
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3460b67fdd8so14131485ab.0;
        Wed, 05 Jul 2023 13:44:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688589844; x=1691181844;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M5ReJzoQkOnKYiJ50iKd5unMYjYSltWqdP9DYachURw=;
        b=Bg3bUWMHOCWuMIpVBmL0I0rwX2QFbhDY2pereeLtug4JumH7AlWTjrP0djbRF0A2sO
         hL8hefMEGb/EwesJmucGRSErTK3nstKhnXtCrTpHJn/UJpcVbpJ4G1OF8khPTcPChAsI
         eaFpmqBmRtomTqd7/GGicQKC81D9iLqn99MuKf3dY/xsUu+7Nu75N6P4oixyRsHYeXKU
         TXHmA36JDYFoqtbb/ywSuCj0ibr8zwdWcPBq6TbD+qFurH66nLjq8HqP/dKBSQpZxKrk
         TTcrtNftAKC4+NHh5COXX2b6ThZMKDXluDOeM4CIF/XY2MRZQAtlokGqS2MTnyddWguk
         p8Zg==
X-Gm-Message-State: ABy/qLbIsgmEK8tYB5e5rRkEt5gkkGPZg/p4/MBFE4Af5RJf7kwMkT2d
        DqlXd3/U//Vr+YYmg+3y+9ICkG1FXQ==
X-Google-Smtp-Source: APBJJlGHvFtO6UZ2znd+R38kg2gzqQYPEODmsQy+INbZHRa72dJOk7ey2a2S7ptvrZGl/31la/TrSw==
X-Received: by 2002:a92:c88c:0:b0:346:770:af1d with SMTP id w12-20020a92c88c000000b003460770af1dmr225524ilo.6.1688589844315;
        Wed, 05 Jul 2023 13:44:04 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id e5-20020a02a505000000b0042b394eb984sm2802944jam.105.2023.07.05.13.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 13:44:03 -0700 (PDT)
Received: (nullmailer pid 1865809 invoked by uid 1000);
        Wed, 05 Jul 2023 20:44:01 -0000
Date:   Wed, 5 Jul 2023 14:44:01 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: cpu: Document NVIDIA Tegra186 CCPLEX cluster
Message-ID: <20230705204401.GA1864555-robh@kernel.org>
References: <20230705152825.2514544-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230705152825.2514544-1-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Jul 05, 2023 at 05:28:25PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add device tree bindings for the CCPLEX cluster found on NVIDIA Tegra186
> SoCs.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../cpu/nvidia,tegra186-ccplex-cluster.yaml   | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/cpu/nvidia,tegra186-ccplex-cluster.yaml
> 
> diff --git a/Documentation/devicetree/bindings/cpu/nvidia,tegra186-ccplex-cluster.yaml b/Documentation/devicetree/bindings/cpu/nvidia,tegra186-ccplex-cluster.yaml
> new file mode 100644
> index 000000000000..4275ff16e8e3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/cpu/nvidia,tegra186-ccplex-cluster.yaml
> @@ -0,0 +1,37 @@
> +# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)

Not GPL-2.0-only for some reason? Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>
