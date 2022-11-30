Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0D48C46467
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Nov 2022 17:12:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbiK3RMR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Nov 2022 12:12:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231153AbiK3RLy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Nov 2022 12:11:54 -0500
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38BA070630;
        Wed, 30 Nov 2022 09:07:12 -0800 (PST)
Received: by mail-ot1-f49.google.com with SMTP id 94-20020a9d0067000000b0066c8d13a33dso11601554ota.12;
        Wed, 30 Nov 2022 09:07:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+yCvE4xL7PcYhApAjLTDVKWvyzIVUevfInfC0cACAe0=;
        b=pvOxLDA+xUMpuZOGXe9n8s6Kn+p9I4guT8SNR8rccoRuh/L5DRxsdfRglDGfq9DWY1
         RdupRJaxGbUEmFmo/nOpc+XsyOrgHITFphwu+lfTH7qEIt5U+wP7Y0GAV4dKWYFfQxyV
         d8KAha8LvOP+rYFRo7I9Gz3+bzb3txyjcmliAn/nict91hwpnB3UCIJZ6YZWRIRJ4k1b
         RRq7Qz1jgEXttfr2WqlSzVHCdfIMRLCEbg+ddLkjdJDLZI5nMEnL9cERmVLoOeRRtmlk
         G8Rw/JdoZ6UTXP096GgqZLkWEVMIXQiXiJ3gWfg55/X8YTH4/lP8KAeGkhgSoCH/7TnE
         fYJQ==
X-Gm-Message-State: ANoB5plN+Gw8CMuWyw2EYxcYtPaXiK8Jm4GfRLDpaqRp4VT30N0GNYuF
        /s0lIKUCinMOFcGGtQsPik10XCMvSA==
X-Google-Smtp-Source: AA0mqf5G3ILqf43J74PC7Uy/K6RqK5iaFw5vp7nG4FRXL6eWEQbc8SiS1NqktAkhS98cdBFbxbK0GQ==
X-Received: by 2002:a05:6830:412a:b0:66e:69f8:93ba with SMTP id w42-20020a056830412a00b0066e69f893bamr1651849ott.334.1669828031398;
        Wed, 30 Nov 2022 09:07:11 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id h17-20020a056870171100b00136c20b1c59sm1393711oae.43.2022.11.30.09.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 09:07:10 -0800 (PST)
Received: (nullmailer pid 2456583 invoked by uid 1000);
        Wed, 30 Nov 2022 17:07:09 -0000
Date:   Wed, 30 Nov 2022 11:07:09 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        gregkh@linuxfoundation.org, krzysztof.kozlowski+dt@linaro.org,
        vkoul@kernel.org, treding@nvidia.com, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-tegra@vger.kernel.org, waynec@nvidia.com
Subject: Re: [PATCH V4 6/6] dt-bindings: phy: tegra-xusb: Add support for
 Tegra234
Message-ID: <20221130170709.GA2454510-robh@kernel.org>
References: <20221118154006.173082-1-jonathanh@nvidia.com>
 <20221118154006.173082-7-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221118154006.173082-7-jonathanh@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Nov 18, 2022 at 03:40:06PM +0000, Jon Hunter wrote:
> Add the compatible string for the Tegra234 XUSB PHY.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> This is a new patch in this version of the series. This patch is
> dependent upon the following patch.
> 
> https://lore.kernel.org/linux-tegra/20221118144015.3650774-1-thierry.reding@gmail.com/
> 
>  .../devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml  | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml b/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml
> index 1c570ff65eb4..5302fdb0949c 100644
> --- a/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml
> +++ b/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml
> @@ -42,7 +42,9 @@ description:
>  
>  properties:
>    compatible:
> -    const: nvidia,tegra194-xusb-padctl
> +    enum:
> +      - nvidia,tegra194-xusb-padctl
> +      - nvidia,tegra194-xusb-padctl

Did you test this because I'm pretty sure you would get an error. The 
bot didn't test because of the dependency.

Rob
