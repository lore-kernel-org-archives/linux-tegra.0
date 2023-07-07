Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37C52EB64D9
	for <linux-tegra@archiver.kernel.org>; Fri,  7 Jul 2023 22:29:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbjGGW3p (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 7 Jul 2023 18:29:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbjGGW3p (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Jul 2023 18:29:45 -0400
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 382552125;
        Fri,  7 Jul 2023 15:29:44 -0700 (PDT)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-783698a37beso90808239f.0;
        Fri, 07 Jul 2023 15:29:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688768983; x=1691360983;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=psEnD33Q4LbtjRBRJzCVPEQIimSo2c50Z8uxB8eIKAk=;
        b=MaiT8S/Kx9yV8n7nGzLMrK4QOxFOQc1NJXJPJEDc2FsWlIjTDBxmnGx3nKjo7WwtAH
         HI9jJpJOH0Wlg6JcyvMriK3egYPvMWRre/KRigS+zsKmLhgYxFW+GF7lPOv7FdeI6OAl
         wL+IV1dcczZzYDatogexZ36gdWd+WJJc3jMLTs32aVehcu0zKBTwXQ37uBASY+jHuCvV
         0tORfkq8vYd+dzdKDo+reRRk39RJR4/SDNy6jPSfAumRWP+9Fn2i4FugAVRfpZnntAE+
         Tnric8hkgmZpWpgu4s3b96x5YwEMTBpZlgxqmyioQfC3KfyW/a69OwHg/sGfNrTXbSVH
         yfGw==
X-Gm-Message-State: ABy/qLYT4GIDNc5Uh9ivopIaxNIVDbznma+jeUw6qP9oaMPUlHpVBx+K
        IFv50W2H1vD/gKfW1YjXoK19pk0Gtg==
X-Google-Smtp-Source: APBJJlGqRJdlojCf+OXAmBHAqty4djhxd5U1wTgYVsaMRWWlzVDtbXRWKyHPvdirIljBYLLtIrdVmw==
X-Received: by 2002:a5e:d70c:0:b0:780:ce12:6c50 with SMTP id v12-20020a5ed70c000000b00780ce126c50mr8096182iom.18.1688768983325;
        Fri, 07 Jul 2023 15:29:43 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
        by smtp.gmail.com with ESMTPSA id a26-20020a029f9a000000b0042b45475212sm1567519jam.81.2023.07.07.15.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 15:29:42 -0700 (PDT)
Received: (nullmailer pid 1085234 invoked by uid 1000);
        Fri, 07 Jul 2023 22:29:41 -0000
Date:   Fri, 7 Jul 2023 16:29:41 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: arm: tegra: pmc: Improve property
 descriptions
Message-ID: <20230707222941.GA1083838-robh@kernel.org>
References: <20230707131711.2997956-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230707131711.2997956-1-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Jul 07, 2023 at 03:17:05PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Reformat the description of various properties to make them more
> consistent with existing ones. Make use of json-schema's ability to
> provide a description for individual list items to make improve the
> documentation further.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../arm/tegra/nvidia,tegra20-pmc.yaml         | 215 +++++++++---------
>  1 file changed, 104 insertions(+), 111 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
> index 89191cfdf619..a90f01678775 100644
> --- a/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
> +++ b/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra20-pmc.yaml
> @@ -21,17 +21,14 @@ properties:
>  
>    reg:
>      maxItems: 1
> -    description:
> -      Offset and length of the register set for the device.
> +    description: Offset and length of the register set for the device.

nit: I'd add this to patch 2.

Reviewed-by: Rob Herring <robh@kernel.org>
