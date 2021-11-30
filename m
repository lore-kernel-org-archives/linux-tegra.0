Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 360CDC433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Nov 2021 01:35:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236613AbhK3Bi3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 29 Nov 2021 20:38:29 -0500
Received: from mail-ot1-f47.google.com ([209.85.210.47]:34449 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236601AbhK3Bi2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Nov 2021 20:38:28 -0500
Received: by mail-ot1-f47.google.com with SMTP id x19-20020a9d7053000000b0055c8b39420bso28093506otj.1;
        Mon, 29 Nov 2021 17:35:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=45WoqYz39efhZLvqX+vn/CQMwGhdaC5TXmpxCbhMTtM=;
        b=YkwHi7KCY3qEargc6X3SonkLDb+8z4FlAp+mfsivh5Xdy0jOCXzL3fmZ+FMWCJkSD+
         cGtVC2aXvo+W05J8Q785w0oyASfi3to2B8jP4fNkJNMrdWb1j3l6rQAB7wwvOUhRwS5A
         /5S7DSgdJpOImU8wS8wbqBRZBxUjR7vpfhRV8hMasncPU88fIjWfhpeFNCHKDjBgi035
         8wfIsebOIymmZuSvAWOGN53kuJJtEzmpiDhJMt6SpoJ+1XjN9TnWzQMmuBEGPe01jUde
         RLh+iY6s9tKAtsh5cXL4b3OrXcYEAE+mhfcP8hvTR+2UuIpkJTa25JE4Hg/x/xP/T1zz
         /eFw==
X-Gm-Message-State: AOAM531eTCOj/maxDaS10r63E4Rug4UvKTQKnxV8jp891o58fEC9i/Mi
        iuUpIItEBMc1DstSXPZPRQ==
X-Google-Smtp-Source: ABdhPJzZrCeTj3kKTv4Ihj4UXEpnnPTWvRUSKLtrhXtMnsyz5+TOK9nmZUw54MT7cAxZyBrQx0BkQQ==
X-Received: by 2002:a05:6830:183:: with SMTP id q3mr47190818ota.285.1638236109945;
        Mon, 29 Nov 2021 17:35:09 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id q10sm3301960oiw.17.2021.11.29.17.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Nov 2021 17:35:09 -0800 (PST)
Received: (nullmailer pid 984328 invoked by uid 1000);
        Tue, 30 Nov 2021 01:35:08 -0000
Date:   Mon, 29 Nov 2021 19:35:08 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 08/16] dt-bindings: fuse: tegra: Document Tegra234 FUSE
Message-ID: <YaV/zLbmL5iy5hWD@robh.at.kernel.org>
References: <20211119143839.1950739-1-thierry.reding@gmail.com>
 <20211119143839.1950739-9-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211119143839.1950739-9-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 19 Nov 2021 15:38:31 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add the compatible string for the FUSE block found on the Tegra234 SoC.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  Documentation/devicetree/bindings/fuse/nvidia,tegra20-fuse.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
