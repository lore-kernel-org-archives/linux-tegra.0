Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A43EBC433EF
	for <linux-tegra@archiver.kernel.org>; Sun, 20 Mar 2022 02:13:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239466AbiCTCPB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 19 Mar 2022 22:15:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234519AbiCTCO7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 19 Mar 2022 22:14:59 -0400
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A77B813D07;
        Sat, 19 Mar 2022 19:13:37 -0700 (PDT)
Received: by mail-io1-f45.google.com with SMTP id b16so13398723ioz.3;
        Sat, 19 Mar 2022 19:13:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=UF0SVjvxkvLMkbZAod4g1NcoKI8o6ZW/ztSqINDD0q4=;
        b=ZKMlN2GU3jJR1H89yyTJ6sqQrzN53DDvgY3CPDh5WdjV0pb8RepkZMrlVmLTm8Yp+T
         Q/yvTL064+4oyP/rR5TyJWn1DiRpykJaS7tl4TaTYCxvqzQdDRAnwhscXX+3cV+5B4Do
         QtfrI4qNFYAVR613PcdXUkwnuQHv44bgDMXz6Pb5a3ytx5Eas7sxzc9NNLcRX1NRsn+f
         d3swGX729eB09tKw4cyNgXEPwWneainm6n1v37tZ42dukJ7XA9RuvyPJadSSHlP/5FE3
         AjmTFQ8J+RIliswKmt+XhOeOqhATndcyEkMg9suYO5cXglZ8Il4nG7+v28s9xMTYQ4N7
         vqGQ==
X-Gm-Message-State: AOAM531+bPMiqXF9VyWxes34FyJwxO1B6q7RYnTmCZ9k0FYwGYOIdjBp
        vK+O/3S7a/NYGHOdudq1/Q==
X-Google-Smtp-Source: ABdhPJwU2UMo2D/EvMgpqw90b/mGuw0WecnJreqQYWqeR/rv2y/4GyVZvigkx7FKlaHcaQn9Q9IgfA==
X-Received: by 2002:a05:6638:1249:b0:321:2e10:c276 with SMTP id o9-20020a056638124900b003212e10c276mr1754149jas.304.1647742416902;
        Sat, 19 Mar 2022 19:13:36 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
        by smtp.gmail.com with ESMTPSA id a3-20020a5ec303000000b006496b4dd21csm2735762iok.5.2022.03.19.19.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Mar 2022 19:13:35 -0700 (PDT)
Received: (nullmailer pid 2990514 invoked by uid 1000);
        Sun, 20 Mar 2022 02:13:33 -0000
From:   Rob Herring <robh@kernel.org>
To:     Ashish Mhetre <amhetre@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, robh+dt@kernel.org, digetx@gmail.com,
        linux-kernel@vger.kernel.org, krzysztof.kozlowski@canonical.com,
        vdumpa@nvidia.com, Snikam@nvidia.com, devicetree@vger.kernel.org
In-Reply-To: <20220316092525.4554-4-amhetre@nvidia.com>
References: <20220316092525.4554-1-amhetre@nvidia.com> <20220316092525.4554-4-amhetre@nvidia.com>
Subject: Re: [Patch v5 3/4] dt-bindings: memory: Update reg maxitems for tegra186
Date:   Sat, 19 Mar 2022 20:13:33 -0600
Message-Id: <1647742413.932927.2990513.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 16 Mar 2022 14:55:24 +0530, Ashish Mhetre wrote:
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.example.dt.yaml: memory-controller@2c00000: reg: [[0, 46137344, 0, 720896]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.example.dt.yaml: memory-controller@2c00000: external-memory-controller@2c60000:reg: [[0, 46137344, 0, 65536], [0, 46202880, 0, 65536], [0, 46268416, 0, 65536], [0, 46333952, 0, 65536], [0, 46399488, 0, 65536], [0, 46465024, 0, 65536]] is too long
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.example.dt.yaml: memory-controller@2c00000: external-memory-controller@2c60000:reg: [[0, 46137344, 0, 65536], [0, 46202880, 0, 65536], [0, 46268416, 0, 65536], [0, 46333952, 0, 65536], [0, 46399488, 0, 65536], [0, 46465024, 0, 65536]] is too long
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.example.dt.yaml: memory-controller@2c00000: reg: [[0, 46137344, 0, 720896]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra186-mc.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1606062

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

