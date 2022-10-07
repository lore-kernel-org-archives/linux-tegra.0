Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 518EFC4332F
	for <linux-tegra@archiver.kernel.org>; Fri,  7 Oct 2022 14:01:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbiJGOBS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 7 Oct 2022 10:01:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbiJGOBQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Oct 2022 10:01:16 -0400
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DABEB9793;
        Fri,  7 Oct 2022 07:01:16 -0700 (PDT)
Received: by mail-io1-f42.google.com with SMTP id q200so3264818iod.7;
        Fri, 07 Oct 2022 07:01:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yTfEzj6wTBPBNgpH4rAPvyQBfg2nW7VHaZnm3c1rV34=;
        b=sPCUPibbBTXagGqFgYeuDMGlDeq4+qFNrXOwHjTMZXAxfkC35ho0LsY9qKvxb9atcy
         UPQzjIg1kpmfXtcBshB6AF4qZEnDuqSrF89wgzjmWbHdN0wAcwlbWiehIoblbrFY+23a
         n3BE++94EOyByCSLtsESJRpsD4EBx5pVuDByCEmm4sv10sZnufakYuwU7jw9ONDWQDVh
         2U3UJ82y42mrLB9sHtTr9cESY2GMKJlFT1gMlRtyiZoppln2/aveOw/7rnVuNHOSCuWq
         +1xfxGvogCTMgUsFftWpbhAijhMOhTuYCj9HuwmcHxPQv2V41A7AXHX33VeSygtN4yWb
         hdoA==
X-Gm-Message-State: ACrzQf2OJen2syGfAmCgKrFYSbCoKEG0oUEewTP23DC1dhF64Wfv0tQI
        l1fTLajWlGy0q+RNfnTqHg==
X-Google-Smtp-Source: AMsMyM4QqQQuOe7tr4Lb8VfgEwCm9mt4LP2psPTY3hHrmFcFBAk2Nic5yqcRIdeyGE3eroFrdB07iA==
X-Received: by 2002:a6b:c5c4:0:b0:6a2:4ab2:6490 with SMTP id v187-20020a6bc5c4000000b006a24ab26490mr2258978iof.129.1665151275229;
        Fri, 07 Oct 2022 07:01:15 -0700 (PDT)
Received: from robh_at_kernel.org ([2607:fb90:17de:d2e8:8e7a:471f:1892:c117])
        by smtp.gmail.com with ESMTPSA id w72-20020a022a4b000000b003632e326dbfsm888184jaw.79.2022.10.07.07.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 07:01:14 -0700 (PDT)
Received: (nullmailer pid 285402 invoked by uid 1000);
        Fri, 07 Oct 2022 14:01:13 -0000
Date:   Fri, 7 Oct 2022 09:01:13 -0500
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-tegra@vger.kernel.org, David Airlie <airlied@linux.ie>,
        devicetree@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 2/7] dt-bindings: display: simple-framebuffer:
 Document 32-bit BGR format
Message-ID: <166515127213.285348.14742074141984076012.robh@kernel.org>
References: <20221007124946.406808-1-thierry.reding@gmail.com>
 <20221007124946.406808-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221007124946.406808-3-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 07 Oct 2022 14:49:41 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> This is a variant of the 32-bit RGB format where the red and blue
> components are swapped.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../devicetree/bindings/display/simple-framebuffer.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
