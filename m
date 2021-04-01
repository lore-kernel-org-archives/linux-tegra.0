Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A322EC43461
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Apr 2021 17:43:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3FBBB61386
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Apr 2021 17:42:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235509AbhDARmw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Apr 2021 13:42:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234400AbhDARhJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Apr 2021 13:37:09 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA0EFC02FE80;
        Thu,  1 Apr 2021 08:55:08 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id w70so2276777oie.0;
        Thu, 01 Apr 2021 08:55:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=1kpevatVSVhaXS8GLLw+LPKLyun7RcAFN9H0p54jc7w=;
        b=GOZqIx3uQajpybFvH1BDFgOlD+nzLZlxIDGxqLoJGsGsIeq9a6lk7m2Ue0nkOCF/e4
         X/N1PyShc7hw9WwmT16h8Alrv7l8jrL9ugZ6b2oELkN0GJNh0ozsYZLYo3fHlW3WXFyf
         rDi5Zei4HJvRbD4ft9Gb5r4lmi3QWwvD6DmkXqJLkyqmZ1qYIooEw821q2Dzzykxwace
         I6F1j5zwe47WsUvXdcpkV5KmWoEGn/ZqtFwuAhYTW/NXORLZ84ldt2BFUWGnZgmOQnAa
         7SQ9IeWtxc+p5N2pLHrbk9S0pDtzUtjhzg5ygOKhorZW5GQfqRKjNEC1PiCTNqJX2fnc
         MDcg==
X-Gm-Message-State: AOAM532c5/PW9EsNp4+CXTlJ1zduLWTpouoJxrP+Rzn98NkVBIakkHlq
        A2RN4+67zIVJqFjDSjGc6g==
X-Google-Smtp-Source: ABdhPJzGjaTLASu2lNzytfhG08RmA+2E77SwcrdNkxvqKr8QcIu1kdUyBXhQfz4XBn+CoLynF4zW9w==
X-Received: by 2002:aca:211a:: with SMTP id 26mr6538978oiz.157.1617292508249;
        Thu, 01 Apr 2021 08:55:08 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v65sm1125644oib.42.2021.04.01.08.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 08:55:07 -0700 (PDT)
Received: (nullmailer pid 501677 invoked by uid 1000);
        Thu, 01 Apr 2021 15:55:06 -0000
Date:   Thu, 1 Apr 2021 10:55:06 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/6] dt-bindings: memory: tegra20: emc: Convert to
 schema
Message-ID: <20210401155506.GA498681@robh.at.kernel.org>
References: <20210330230445.26619-1-digetx@gmail.com>
 <20210330230445.26619-6-digetx@gmail.com>
 <1617198059.590387.2074856.nullmailer@robh.at.kernel.org>
 <b4f7c7fb-1332-8490-fb4f-293fd357338e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b4f7c7fb-1332-8490-fb4f-293fd357338e@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Mar 31, 2021 at 05:59:39PM +0300, Dmitry Osipenko wrote:
> 31.03.2021 16:40, Rob Herring пишет:
> > On Wed, 31 Mar 2021 02:04:44 +0300, Dmitry Osipenko wrote:
> >> Convert Tegra20 External Memory Controller binding to schema.
> >>
> >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >> ---
> >>  .../memory-controllers/nvidia,tegra20-emc.txt | 130 --------
> >>  .../nvidia,tegra20-emc.yaml                   | 294 ++++++++++++++++++
> >>  2 files changed, 294 insertions(+), 130 deletions(-)
> >>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
> >>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml
> >>
> > 
> > My bot found errors running 'make dt_binding_check' on your patch:
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.example.dts:33.26-55.15: Warning (unit_address_vs_reg): /example-0/external-memory-controller@7000f400/emc-tables@0: node has a unit name, but no reg or ranges property
> > 
> > See https://patchwork.ozlabs.org/patch/1460288
> > 
> > This check can fail if there are any dependencies. The base for a patch
> > series is generally the most recent rc1.
> > 
> > If you already ran 'make dt_binding_check' and didn't see the above
> > error(s), then make sure 'yamllint' is installed and dt-schema is up to
> > date:
> > 
> > pip3 install dtschema --upgrade
> > 
> > Please check and re-submit.
> > 
> 
> FYI, I'm aware about this warning and I think it's fine to skip it in
> the case of this binding. 

It's not because dt_binding_check should be warning free.

> The dtbs_check doesn't bother with that warning.

With W=1 it will. It's off by default because there are too many of 
these warnings. Patches welcome.

Rob
