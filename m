Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00D47C433FE
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 15:02:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DD7576023F
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 15:02:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235157AbhKLPE5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 10:04:57 -0500
Received: from mail-oi1-f181.google.com ([209.85.167.181]:35602 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235264AbhKLPE5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 10:04:57 -0500
Received: by mail-oi1-f181.google.com with SMTP id m6so18419077oim.2;
        Fri, 12 Nov 2021 07:02:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=jzgUSBrfkblxF8BMQg3uEJrOR8PF/txvtTs34d8DOi8=;
        b=CJitNlwWhFC41hkhKK18pjQ5UWerzzLNKcPBYp2HkTnFqwJ2iXWv/RTYMeDeJdU6Xc
         TIPslTY0Lfr7H/pN6nfYhxLYrR6hns3kpPirXteIirLsZ5FkFsa0KAEwPSVAxZYte5CQ
         aRVglQtBd4WSxwVmCwSfYgG/XqDOKNYu0u0FutL4vNPMJAwtgj3QWoGGKUO+njLMwFNf
         LE/yLIENbtyb6FLwwcR17RX2FxSclgL2gc4wHltKQQ/g5DQ3Dn0LOgWfKZruE69/9w1J
         8S2XOMStTAfDf1kjCEd+rEyz2Q1Fut8EPT/QlE9NJyY1viGTchdFI2VQAPmCBqNImVFy
         Pe2Q==
X-Gm-Message-State: AOAM533JMSZtM4kZJpsXX0VwwJcDGTjpJoluDp/Y30Jr2Ks7ZQBSR2Se
        j9F2DSjhIguxJhneHLHdXBWenDsfPw==
X-Google-Smtp-Source: ABdhPJwA9XX7b4+Go1nzDat0z0Hu1cATwKYDIOcvzSIzVqixYJwZV2HhyBg70bXxJGRepcqs0Y2kVQ==
X-Received: by 2002:aca:bb56:: with SMTP id l83mr13264951oif.47.1636729326371;
        Fri, 12 Nov 2021 07:02:06 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id d12sm1150388otq.67.2021.11.12.07.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 07:02:05 -0800 (PST)
Received: (nullmailer pid 2842411 invoked by uid 1000);
        Fri, 12 Nov 2021 15:01:59 -0000
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20211112120518.3679793-13-thierry.reding@gmail.com>
References: <20211112120518.3679793-1-thierry.reding@gmail.com> <20211112120518.3679793-13-thierry.reding@gmail.com>
Subject: Re: [PATCH 12/15] dt-bindings: firmware: tegra: Convert to json-schema
Date:   Fri, 12 Nov 2021 09:01:59 -0600
Message-Id: <1636729319.950216.2842410.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 12 Nov 2021 13:05:15 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the NVIDIA Tegra186 (and later) BPMP bindings from the free-form
> text format to json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../firmware/nvidia,tegra186-bpmp.txt         | 107 ------------
>  .../firmware/nvidia,tegra186-bpmp.yaml        | 161 ++++++++++++++++++
>  2 files changed, 161 insertions(+), 107 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.txt
>  create mode 100644 Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml: 'additionalProperties' is a required property
	hint: A schema without a "$ref" to another schema must define all properties and use "additionalProperties"
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml: ignoring, error in schema: 
warning: no schema found in file: ./Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.yaml
Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.example.dt.yaml:0:0: /example-0/hsp@3c00000: failed to match any schema with compatible: ['nvidia,tegra186-hsp']
Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.example.dt.yaml:0:0: /example-0/sram@30000000: failed to match any schema with compatible: ['nvidia,tegra186-sysram', 'mmio-sram']
Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.example.dt.yaml:0:0: /example-0/bpmp: failed to match any schema with compatible: ['nvidia,tegra186-bpmp']
Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.example.dt.yaml:0:0: /example-0/bpmp/i2c: failed to match any schema with compatible: ['nvidia,tegra186-bpmp-i2c']
Documentation/devicetree/bindings/firmware/nvidia,tegra186-bpmp.example.dt.yaml:0:0: /example-0/bpmp/thermal: failed to match any schema with compatible: ['nvidia,tegra186-bpmp-thermal']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1554316

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

