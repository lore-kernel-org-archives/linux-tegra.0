Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8DCAC433F5
	for <linux-tegra@archiver.kernel.org>; Fri,  7 Oct 2022 14:00:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbiJGOAs (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 7 Oct 2022 10:00:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbiJGOAq (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Oct 2022 10:00:46 -0400
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E9579B858;
        Fri,  7 Oct 2022 07:00:45 -0700 (PDT)
Received: by mail-io1-f47.google.com with SMTP id d196so3660207iof.11;
        Fri, 07 Oct 2022 07:00:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=csoNLenKkQ4IM8xjMQG0bIhC/2mIv8dzWfpsvwSXftk=;
        b=uHlQGpqDxApgSt9HRJ5HshGUtFcQFx33yL2NPAT+bBa2xgPS52kwGS8csXeJjyo8GJ
         spQ7WcPk+HCueiQADe8xo1FqxFa1kzNDOrqGW50hck2aGslwLmRDrg57fJc6oRQluyli
         rKWD2Q/RiJGFGOrFege9C60+OyU7rbpOahPesTQ3CVVuXhLoJXF37iBWhU3c+eNDOD75
         NTRqSk9ZLJRxRdcSbFtzBIzfip0uSfVlEkPhzCMkbO3RNSrg+zdU1YUHVSvfrPC/woD5
         xMBfCZKnWfrr8TjKixOlYMm+4TQMmYXyKdjuw2JBtWK+vjBUHTguATQeRD1R1wMiccib
         P0qQ==
X-Gm-Message-State: ACrzQf1857p4yWF9EWMsVoKxzVClRFdfr4r3Pw+DIL6XRW3QiJKb/yMZ
        ovEaHv8F+/63thaoRlPX8A==
X-Google-Smtp-Source: AMsMyM6c5uqErPkvb0cF9pXEqiaY+4vraXeH4+b12PZU06NVe8Fy0HFW9g8qFAtISuQIbWPWfaSSKg==
X-Received: by 2002:a6b:3f02:0:b0:6a4:b54f:c280 with SMTP id m2-20020a6b3f02000000b006a4b54fc280mr2353062ioa.46.1665151244332;
        Fri, 07 Oct 2022 07:00:44 -0700 (PDT)
Received: from robh_at_kernel.org ([2607:fb90:17de:d2e8:8e7a:471f:1892:c117])
        by smtp.gmail.com with ESMTPSA id h13-20020a05660208cd00b006bb640769ecsm1009671ioz.13.2022.10.07.07.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 07:00:43 -0700 (PDT)
Received: (nullmailer pid 284746 invoked by uid 1000);
        Fri, 07 Oct 2022 14:00:42 -0000
Date:   Fri, 7 Oct 2022 09:00:42 -0500
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org, Jon Hunter <jonathanh@nvidia.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 1/7] dt-bindings: display: simple-framebuffer: Support
 system memory framebuffers
Message-ID: <166515123936.284567.14313128016482516100.robh@kernel.org>
References: <20221007124946.406808-1-thierry.reding@gmail.com>
 <20221007124946.406808-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221007124946.406808-2-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 07 Oct 2022 14:49:40 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> In order to support framebuffers residing in system memory, allow the
> memory-region property to override the framebuffer memory specification
> in the "reg" property.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../devicetree/bindings/display/simple-framebuffer.yaml      | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
