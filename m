Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAC81C433E1
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 13:09:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7F962619BB
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 13:09:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232000AbhC3NJA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 30 Mar 2021 09:09:00 -0400
Received: from mail-ot1-f46.google.com ([209.85.210.46]:41643 "EHLO
        mail-ot1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231960AbhC3NIv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Mar 2021 09:08:51 -0400
Received: by mail-ot1-f46.google.com with SMTP id l12-20020a9d6a8c0000b0290238e0f9f0d8so15512530otq.8;
        Tue, 30 Mar 2021 06:08:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=iKB56ZUcP8zgJEiOdPOBtoB1UcSHBt1H37xe9WGB7n0=;
        b=fULaSxisZg0KmC10B9dMd13/TXSQOZGbqVuOK47R/JMvxY1iClN9F9B/axzkuKbQ/P
         chSYeg/lcM5+SYk3z8Xe9vtzsDPgD+Sr2Zwh9U5jRnzLEVq0sk7sUVajofep21KIhpEq
         LlyMzH77BikZEjJvgGc0J3k6i5HVRNwrPP8Pg+BFJ8TR0CjgSzPtWAsIuSPE7HYNggRn
         GqekubqKSfo8yDp+yuTqjHG5TTAaVgZCxooojGRrH9yfj36vSoOsp/Zyx/0ucus1wMUF
         St4Hai7UngywKPe5XlgTdghOpudjpUHwa192DlatZjm8/Y18IvfyEDwNTxv+mTSRMGSn
         pPeA==
X-Gm-Message-State: AOAM532JQlztP/VHeR7XEl4twSry2nQZfY/N23JK8yApg9JZtjEeTBuB
        wwyPD/nyEw2ew5nMNSRW8w==
X-Google-Smtp-Source: ABdhPJxDqWGl0VBW7OfmjvVPNEmDWE+83l8ZMf8lB3tTWUlXMVcnv6l2OgsUMcG18Y0tl0Cc6B5taQ==
X-Received: by 2002:a9d:7699:: with SMTP id j25mr21076624otl.177.1617109730364;
        Tue, 30 Mar 2021 06:08:50 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 24sm4026567oij.58.2021.03.30.06.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 06:08:49 -0700 (PDT)
Received: (nullmailer pid 173733 invoked by uid 1000);
        Tue, 30 Mar 2021 13:08:43 -0000
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>
In-Reply-To: <20210329194602.17049-5-digetx@gmail.com>
References: <20210329194602.17049-1-digetx@gmail.com> <20210329194602.17049-5-digetx@gmail.com>
Subject: Re: [PATCH v1 4/6] dt-bindings: memory: tegra20: mc: Convert to schema
Date:   Tue, 30 Mar 2021 08:08:43 -0500
Message-Id: <1617109723.704724.173732.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 29 Mar 2021 22:46:00 +0300, Dmitry Osipenko wrote:
> Convert Tegra20 Memory Controller binding to schema.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../memory-controllers/nvidia,tegra20-mc.txt  | 40 ----------
>  .../memory-controllers/nvidia,tegra20-mc.yaml | 78 +++++++++++++++++++
>  2 files changed, 78 insertions(+), 40 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.txt
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-mc.example.dt.yaml:0:0: /example-0/memory-controller@7000f000: failed to match any schema with compatible: ['nvidia,tegra20-mc']

See https://patchwork.ozlabs.org/patch/1459800

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

