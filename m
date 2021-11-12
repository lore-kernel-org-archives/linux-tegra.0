Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B604C433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 15:02:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 617506023F
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 15:02:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235219AbhKLPEx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 10:04:53 -0500
Received: from mail-oi1-f181.google.com ([209.85.167.181]:38737 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235215AbhKLPEw (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 10:04:52 -0500
Received: by mail-oi1-f181.google.com with SMTP id r26so18365751oiw.5;
        Fri, 12 Nov 2021 07:02:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=06bAv2t9XDrmmCetkJ5sV2Z8yQvwYBjJ4MdmkjNUBLA=;
        b=p8N5BQYsbidWHN/vfdFRcpLfzi9GoqNPih1C2KGwa5Xddro45OiptnkckHtM90temi
         G51mFIqXxwUUt9JRm5hFFL90X6GNcfsyahEADy9aZkYmiIE5vI/CZKo4KSpzS3w9qEaj
         qW2xl6nFsG2tHLlp0syY2fYYJHTfPw1QxLglTPfcwOFNuRqT21hzSazd579m/QXOiYon
         mbKa1iYUcDaXqeWmaIIR/UpW2c/YcIV/2Fm/1WODu2TjfnVPW5Or4DwPGiEaKmIc+VqJ
         9s9Q+XtrQNlzgp/PplRqVLe4VMe9XERQOesEUHw9kGcjRUvcq4ezOzfcaNTILxjY+8zN
         5XPw==
X-Gm-Message-State: AOAM533WvHU6OzP5OUd4waA95/J58hiRPS/pwcMWoIsLBwHCfh5OU/Xs
        pSWL3xu0q7mRdyitoGwuFl1cim5KgQ==
X-Google-Smtp-Source: ABdhPJxPm+KtMKh3K/klUNMPLY51VavqhtGQy9mnwQ2O6mzyPPuK+anB5yezIyozJulweCeuRi4tIQ==
X-Received: by 2002:aca:3e8a:: with SMTP id l132mr12658902oia.95.1636729321510;
        Fri, 12 Nov 2021 07:02:01 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id j20sm1401103oig.52.2021.11.12.07.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 07:02:00 -0800 (PST)
Received: (nullmailer pid 2842408 invoked by uid 1000);
        Fri, 12 Nov 2021 15:01:59 -0000
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
In-Reply-To: <20211112120518.3679793-12-thierry.reding@gmail.com>
References: <20211112120518.3679793-1-thierry.reding@gmail.com> <20211112120518.3679793-12-thierry.reding@gmail.com>
Subject: Re: [PATCH 11/15] dt-bindings: tegra: pmc: Convert to json-schema
Date:   Fri, 12 Nov 2021 09:01:59 -0600
Message-Id: <1636729319.935341.2842407.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 12 Nov 2021 13:05:14 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the NVIDIA Tegra186 (and later) PMC bindings from the free-form
> text format to json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../arm/tegra/nvidia,tegra186-pmc.txt         | 133 ------------
>  .../arm/tegra/nvidia,tegra186-pmc.yaml        | 199 ++++++++++++++++++
>  2 files changed, 199 insertions(+), 133 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.txt
>  create mode 100644 Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml: properties:reg-names: {'minItems': 4, 'maxItems': 5, 'items': [{'const': 'pmc'}, {'const': 'wake'}, {'const': 'aotag'}, {'const': 'scratch'}, {'const': 'misc'}]} should not be valid under {'required': ['maxItems']}
	hint: "maxItems" is not needed with an "items" list
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml: ignoring, error in schema: properties: reg-names
warning: no schema found in file: ./Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.yaml
Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.example.dt.yaml:0:0: /example-0/pmc@c3600000: failed to match any schema with compatible: ['nvidia,tegra186-pmc']
Documentation/devicetree/bindings/arm/tegra/nvidia,tegra186-pmc.example.dt.yaml:0:0: /example-0/mmc@3400000: failed to match any schema with compatible: ['nvidia,tegra186-sdhci']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1554314

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

