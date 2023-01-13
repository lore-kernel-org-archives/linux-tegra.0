Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BFD4C678D9
	for <linux-tegra@archiver.kernel.org>; Fri, 13 Jan 2023 17:24:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230405AbjAMRY3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 13 Jan 2023 12:24:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231225AbjAMRXx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 13 Jan 2023 12:23:53 -0500
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6ED6A41EC;
        Fri, 13 Jan 2023 09:14:42 -0800 (PST)
Received: by mail-oo1-f51.google.com with SMTP id d2-20020a4ab202000000b004ae3035538bso5700589ooo.12;
        Fri, 13 Jan 2023 09:14:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JHq6/tYDyN/pAINWJ5Rbv3uWB7irgrVWcq37RauemwE=;
        b=j2mPM8sTJjuu6P3xurfGnLCsy8Ha+Vu3qCxYoUqRlkXLsrRI/TRvv9+ZujAnnIlndX
         cborXBF2i1T10RcQpVXt9+d+5cFhzPR3Qte7jMPXCC7AaSP/movDKhgtMCocvFk45u9g
         +KrN0kVC50hYfVqSmsvcpE27muFm+Cr4ygiVv9jC86IgA+4brIADqeoPlSJxxsoeKVsd
         aWIKt5C9rM6NYIMK15N6tpeU+D93HHV0pVkf5wPiSostWYQl2tZ7LuMI4dv7767PburN
         L5BQzg+4Yp3nWro7JW9OPw1Zpf0u1JoNqwvOvnPOi8x1F+cus4soQLe24aHau4rKcSih
         6xOw==
X-Gm-Message-State: AFqh2kr+0bhb4fmmSXruE68IiGGUwrlrzAga8cYLyKgd+reU3qcIf4u3
        XkAmtHXETR7fv5QhV31jfg==
X-Google-Smtp-Source: AMrXdXsAciTa3kC0ArhVzqoF/QaPDMxYBCzM8+8GnXbEi1RBXZ9lPOjUcyLSpQZP71oTATHGYnWQ0w==
X-Received: by 2002:a4a:3c16:0:b0:4f2:cf1:c3db with SMTP id d22-20020a4a3c16000000b004f20cf1c3dbmr7004450ooa.1.1673630080384;
        Fri, 13 Jan 2023 09:14:40 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id m48-20020a4a9533000000b0049fcedf1899sm10127278ooi.3.2023.01.13.09.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 09:14:37 -0800 (PST)
Received: (nullmailer pid 2505066 invoked by uid 1000);
        Fri, 13 Jan 2023 17:14:37 -0000
Date:   Fri, 13 Jan 2023 11:14:37 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     linux-usb@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-phy@lists.infradead.org,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-tegra@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        waynec@nvidia.com, Thierry Reding <treding@nvidia.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH V6 1/6] dt-bindings: usb: Add NVIDIA Tegra234 XUSB host
 controller binding
Message-ID: <167363007663.2505014.5823592035658449614.robh@kernel.org>
References: <20230111110450.24617-1-jonathanh@nvidia.com>
 <20230111110450.24617-2-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230111110450.24617-2-jonathanh@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On Wed, 11 Jan 2023 11:04:45 +0000, Jon Hunter wrote:
> From: Wayne Chang <waynec@nvidia.com>
> 
> Add device-tree binding documentation for the XUSB host controller present
> on Tegra234 SoC. This controller supports the USB 3.1 specification.
> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> V5 -> V6: Updated main description and register description.
>           Corrected 'dma-coherent'.
> V4 -> V5: No changes
> V3 -> V4: minor update to the power-domain description
> V2 -> V3: nothing has changed
> V1 -> V2: address the issue on phy-names property
> 
>  .../bindings/usb/nvidia,tegra234-xusb.yaml    | 159 ++++++++++++++++++
>  1 file changed, 159 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/nvidia,tegra234-xusb.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
