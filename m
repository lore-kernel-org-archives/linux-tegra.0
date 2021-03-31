Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F39AAC433B4
	for <linux-tegra@archiver.kernel.org>; Wed, 31 Mar 2021 13:42:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C20F661994
	for <linux-tegra@archiver.kernel.org>; Wed, 31 Mar 2021 13:42:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235907AbhCaNle (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 31 Mar 2021 09:41:34 -0400
Received: from mail-ot1-f43.google.com ([209.85.210.43]:36677 "EHLO
        mail-ot1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235930AbhCaNlH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 31 Mar 2021 09:41:07 -0400
Received: by mail-ot1-f43.google.com with SMTP id g8-20020a9d6c480000b02901b65ca2432cso18957701otq.3;
        Wed, 31 Mar 2021 06:41:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=XT+L6M3yZXaHCJkFyzkxUYEOZAnkSOv3iL67Pxa3CN8=;
        b=RMK0sj3giZbVPEm7Y8HUUW98eeftJOzcQXG+j7iJAeeUzzHgyicSinMT3ffAbgBX9b
         53q0jfdbmhEyUC4g/ttuRNXbxRlssX1cb3pGyBDdTC1b8Oa8ORIUPq1kaVQ7N1Ree7zi
         YKH8QK9vT0y0c8+qmH3fQdeV0V1pmXMHtAqcyJavBs++DOQpQit7m0uvCf+gqxwldPtp
         ig1cO1uEobJBP/xkz3ce31P8rPiGI6leKV/HI6L6LmsYh/chElkEX9NPUN4IaqX6OBfy
         tlk/FHRpEdH6UpvuAls2RFSgHFSLFA0nGuLSCGqx0j2wz86WfowbOk/shtzg1J5Y+dvh
         zZGg==
X-Gm-Message-State: AOAM532kjsPBdX7AKPtTePzYG+eGkpZec9NDXZk7lutOsYv56W8RHJW5
        oRvcNPZl5OYRBcy2ujM94g==
X-Google-Smtp-Source: ABdhPJwlG5+iOdS7eulp0UiVkA2GsoNlz0PJcwBFZarnzGtyaFOTdI20ixb5eZ0D8IvfbBUZUz0/YA==
X-Received: by 2002:a9d:7003:: with SMTP id k3mr2738659otj.351.1617198066161;
        Wed, 31 Mar 2021 06:41:06 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d2sm479225otl.48.2021.03.31.06.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 06:41:05 -0700 (PDT)
Received: (nullmailer pid 2074857 invoked by uid 1000);
        Wed, 31 Mar 2021 13:40:59 -0000
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20210330230445.26619-6-digetx@gmail.com>
References: <20210330230445.26619-1-digetx@gmail.com> <20210330230445.26619-6-digetx@gmail.com>
Subject: Re: [PATCH v2 5/6] dt-bindings: memory: tegra20: emc: Convert to schema
Date:   Wed, 31 Mar 2021 08:40:59 -0500
Message-Id: <1617198059.590387.2074856.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 31 Mar 2021 02:04:44 +0300, Dmitry Osipenko wrote:
> Convert Tegra20 External Memory Controller binding to schema.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../memory-controllers/nvidia,tegra20-emc.txt | 130 --------
>  .../nvidia,tegra20-emc.yaml                   | 294 ++++++++++++++++++
>  2 files changed, 294 insertions(+), 130 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.txt
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/memory-controllers/nvidia,tegra20-emc.example.dts:33.26-55.15: Warning (unit_address_vs_reg): /example-0/external-memory-controller@7000f400/emc-tables@0: node has a unit name, but no reg or ranges property

See https://patchwork.ozlabs.org/patch/1460288

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

