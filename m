Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D31BC433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Nov 2021 01:31:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232599AbhK3Beu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 29 Nov 2021 20:34:50 -0500
Received: from mail-oi1-f177.google.com ([209.85.167.177]:41681 "EHLO
        mail-oi1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232168AbhK3Beu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Nov 2021 20:34:50 -0500
Received: by mail-oi1-f177.google.com with SMTP id u74so38132767oie.8;
        Mon, 29 Nov 2021 17:31:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Ftvd8FZgETgzPyQrED/E9wWWusTSwzU2ioFIh4pxJ6Q=;
        b=3o6Igqqym83OB+DkbEqxNNNyk1OC9Y4RDTvY5ExjX+7uaqG5/HZl5aqkVN/NViwtsO
         E70ChkLQnTv+b8+SHGMFJL3TJ7hUebMuSr44hUQcTbxwcSWnzi4YArUj2KwQTv43ZExM
         qy5xkoLv5RkXv1m1X6TXfN1ancj1e49TYv7oiPCaeclQOQKgCwJzHyHOlW2wUsMiX4xI
         ETyXw1iDIPWmaUJYQD/89lk96IBj621bb1BAUd3fbaeIA6sOLTm4CWxrJPbijC8LkKX1
         lTOhQxFgjyiCr0qI37qHH4CUAHsDz/3YrQ/MKrJwkNE0QRNevpDvQBihhh7wYAnF+RRX
         Ujlw==
X-Gm-Message-State: AOAM5310lZIMfZBj66CdnrfwqcBm9CwLTyjrVBaANyW1DMCXqUHxO3Ph
        MmgY7dvsBpCIdMhuz2KUZA==
X-Google-Smtp-Source: ABdhPJzrSf8SqnCL4MtB4h+eRgYkVsdr12Kq3d59MgE/JUqjfMFiszbaU8LlV/8zxf6HkMwgShMoyA==
X-Received: by 2002:a05:6808:8d4:: with SMTP id k20mr1545988oij.106.1638235891347;
        Mon, 29 Nov 2021 17:31:31 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id s9sm3031397otg.42.2021.11.29.17.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 17:31:30 -0800 (PST)
Received: (nullmailer pid 978557 invoked by uid 1000);
        Tue, 30 Nov 2021 01:31:29 -0000
Date:   Mon, 29 Nov 2021 19:31:29 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2 02/16] dt-bindings: mmc: tegra: Convert to json-schema
Message-ID: <YaV+8a805C3GFGn3@robh.at.kernel.org>
References: <20211119143839.1950739-1-thierry.reding@gmail.com>
 <20211119143839.1950739-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211119143839.1950739-3-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 19 Nov 2021 15:38:25 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the NVIDIA Tegra SDHCI bindings from the free-form text format
> to json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - drop redundant $ref properties, add missing maxItems
> 
>  .../bindings/mmc/nvidia,tegra20-sdhci.txt     | 143 ---------
>  .../bindings/mmc/nvidia,tegra20-sdhci.yaml    | 294 ++++++++++++++++++
>  2 files changed, 294 insertions(+), 143 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.txt
>  create mode 100644 Documentation/devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
