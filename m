Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E5A1C433DB
	for <linux-tegra@archiver.kernel.org>; Sat, 27 Mar 2021 18:42:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0E2FD619B1
	for <linux-tegra@archiver.kernel.org>; Sat, 27 Mar 2021 18:42:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230224AbhC0SmF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 27 Mar 2021 14:42:05 -0400
Received: from mail-oo1-f43.google.com ([209.85.161.43]:41614 "EHLO
        mail-oo1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230220AbhC0Sl7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 27 Mar 2021 14:41:59 -0400
Received: by mail-oo1-f43.google.com with SMTP id q127-20020a4a33850000b02901b646aa81b1so2074409ooq.8;
        Sat, 27 Mar 2021 11:41:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dB0QA2aSLypuYnfIkaw+uqKji++3dpvGYoR2SdegZuA=;
        b=cwSA2EnObzz1MU4BI/IYNY+N2uhmHbvlAcYDhRAgkV5O8Fs3fQx0pw/E2a5Qma9aTl
         9L3vNeITbSmlw+oCp7A5JfaTIMmpzjq/HH/e2SAEKN+dLLnxU+zsccu4wx2jtzGp89m9
         HlNOgLP+0iCGpgsR/m0WikBcKxGTWJkqZ9+wJkbzHClrpDXU0H/CSRUOjIwFv66tS/bx
         1859dkKWQ/IAWPXyqLYrdb1xsexUO7kB1OnziEqZYWaVAfkLwSTjT0IWjPTbtglDLBTR
         b/KIv1e758qaKbGappeEvS8D078Kz15o+4+Cli+56cFcJ3B9IEPDU0KUXllUIYy0gwG/
         dgAA==
X-Gm-Message-State: AOAM5315/pIlNXuH+/odRr+20mXU+0/8wOLjHnoRuuMaYf8M2lhBKipK
        K+HIpztfIHv0dQTmgXeCqA==
X-Google-Smtp-Source: ABdhPJxovlk79Ap2jSYc3eXKvWHjXxyK4tUEMgTyZNzOIKlfEnbbWub8vVzXPEsbpWjZFg1iDrzC0Q==
X-Received: by 2002:a4a:ea94:: with SMTP id r20mr16164861ooh.43.1616870518753;
        Sat, 27 Mar 2021 11:41:58 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.99.41])
        by smtp.gmail.com with ESMTPSA id n1sm2529775oig.47.2021.03.27.11.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Mar 2021 11:41:58 -0700 (PDT)
Received: (nullmailer pid 366889 invoked by uid 1000);
        Sat, 27 Mar 2021 18:41:53 -0000
Date:   Sat, 27 Mar 2021 12:41:53 -0600
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: serial: tegra-tcu: Convert to
 json-schema
Message-ID: <20210327184153.GA366821@robh.at.kernel.org>
References: <20210326174641.1612738-1-thierry.reding@gmail.com>
 <20210326174641.1612738-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210326174641.1612738-2-thierry.reding@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 26 Mar 2021 18:46:39 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the Tegra TCU device tree bindings to json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/serial/nvidia,tegra194-tcu.txt   | 35 ------------
>  .../bindings/serial/nvidia,tegra194-tcu.yaml  | 56 +++++++++++++++++++
>  2 files changed, 56 insertions(+), 35 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/serial/nvidia,tegra194-tcu.txt
>  create mode 100644 Documentation/devicetree/bindings/serial/nvidia,tegra194-tcu.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
