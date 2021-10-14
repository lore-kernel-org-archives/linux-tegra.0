Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E59C433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 14 Oct 2021 21:50:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 75EB76105A
	for <linux-tegra@archiver.kernel.org>; Thu, 14 Oct 2021 21:50:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234133AbhJNVwn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 14 Oct 2021 17:52:43 -0400
Received: from mail-ot1-f53.google.com ([209.85.210.53]:33746 "EHLO
        mail-ot1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbhJNVwm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 14 Oct 2021 17:52:42 -0400
Received: by mail-ot1-f53.google.com with SMTP id l7-20020a0568302b0700b0054e40740571so10259068otv.0;
        Thu, 14 Oct 2021 14:50:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Lgm63ajtw0EkgA9RNh/rg8NxNHCdQk5lQHr0lWizZ10=;
        b=nXLmy0+gnLhEx/zKOc0vUN6bnf9dl+zOpbAO50K56m9jifrgE5y1iIm6Q/CiXru39z
         LteFPJ0xt2BdGgvoXgfyUbQcDaqNEltHGfC9v+0WtaGdt5jaOcQpjn3cmszpUODWtRR/
         HLxCZn55oURjKCIDXSatkogpz/TfDBK8TrYNxhzb5nCXPl9HWntiUkCmwcaY0ujrlMoA
         VXOHJ3VMo0+ddhRpVHsuO+eJlg3Z+30oOobFkOWnOWNKhq/BNMojFINs+ze7fADMvnGF
         ERyVg/vyumJtN+DjIVbhDxJwsDRrf6w6Egu9XAXTUfdaSjaSVzjz0CULZhuiuDjwYIja
         PFJw==
X-Gm-Message-State: AOAM5328lYKpikJEi2CUiholQjIjDibYyvwREejFAZNLs231Un7pY5Lx
        QwU2+jBk1Fo+j7z5PTLuKg==
X-Google-Smtp-Source: ABdhPJwmCkdLpXNO29e72DDuQ7AcIN8Qyw0J1cQru8dKwUVHFM8rf9Q1G3RQLgVpOBj0nuz5isYuCw==
X-Received: by 2002:a9d:4c88:: with SMTP id m8mr4725000otf.308.1634248236842;
        Thu, 14 Oct 2021 14:50:36 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id o80sm795231ota.68.2021.10.14.14.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Oct 2021 14:50:36 -0700 (PDT)
Received: (nullmailer pid 4008641 invoked by uid 1000);
        Thu, 14 Oct 2021 21:50:35 -0000
Date:   Thu, 14 Oct 2021 16:50:35 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v5 2/9] dt-bindings: memory: lpddr2: Convert to schema
Message-ID: <YWimK0GfsI+CiOvL@robh.at.kernel.org>
References: <20211006224659.21434-1-digetx@gmail.com>
 <20211006224659.21434-3-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006224659.21434-3-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 07 Oct 2021 01:46:52 +0300, Dmitry Osipenko wrote:
> Convert LPDDR2 binding to schema. I removed obsolete ti,jedec-lpddr2-*
> compatibles since they were never used by device-trees and by the code.
> I also changed "Elpida" compatible prefix to lowercase "elpida".
> 
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../memory-controllers/ddr/jedec,lpddr2.yaml  | 208 ++++++++++++++++++
>  .../memory-controllers/ddr/lpddr2.txt         | 102 ---------
>  2 files changed, 208 insertions(+), 102 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml
>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/ddr/lpddr2.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
