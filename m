Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87DF2C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 15:02:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6FB8661056
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 15:02:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235265AbhKLPE4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 10:04:56 -0500
Received: from mail-oi1-f176.google.com ([209.85.167.176]:38743 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235215AbhKLPEz (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 10:04:55 -0500
Received: by mail-oi1-f176.google.com with SMTP id r26so18365982oiw.5;
        Fri, 12 Nov 2021 07:02:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=4EQIArY31QPwnI5p1XwTVStzIn2qrhq9vLI4hmJG9T0=;
        b=6YF8f2mIayHn3NZUDLuSKc4FAZuxNx/iGPusT33rT4x3P/QLBiw0Dth48Gwjx/C3Uf
         r5q3q41g6lPvm0A0FFeZ4i9sLyygUpHTUzHJvY4euqF2Coo63SiPWHwY2nl7NIPu2dwo
         ycW9MH1fyevHJGGV/RcKF41EGQqC4kyym7kcn7D2jD6p6vJYyuSiLJkqUj5D1ZcolW83
         1qoEcvqRC3Ex4/wqxO9IfvctA9eRaGILM7de6ZzSQxjGZhzzvQmmoVtsgw1y86bam5rr
         QJSaT253+h7Zrx5SegPd25XM893SlhWDhebYhj/ErWJ5FcGuyQ/qT9BwJqQxhGZWk+mk
         vn7g==
X-Gm-Message-State: AOAM5304m+yGgplPrmn5sjPrbss9cwyHYqzo50TIIgIOsRZrI5eu6bAQ
        IXB6fsrTLB+BfEbzAjmLLA==
X-Google-Smtp-Source: ABdhPJx+xbP84uwYTtLFhLNrEa5jvd7KYdTt8H/tFZy6EMBE0mRB44Ra4DF7atburXjEvRFGoetoHQ==
X-Received: by 2002:a05:6808:1a01:: with SMTP id bk1mr13759058oib.46.1636729324807;
        Fri, 12 Nov 2021 07:02:04 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id bk41sm47351oib.31.2021.11.12.07.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 07:02:04 -0800 (PST)
Received: (nullmailer pid 2842413 invoked by uid 1000);
        Fri, 12 Nov 2021 15:01:59 -0000
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org
In-Reply-To: <20211112120518.3679793-14-thierry.reding@gmail.com>
References: <20211112120518.3679793-1-thierry.reding@gmail.com> <20211112120518.3679793-14-thierry.reding@gmail.com>
Subject: Re: [PATCH 13/15] dt-bindings: i2c: tegra-bpmp: Convert to json-schema
Date:   Fri, 12 Nov 2021 09:01:59 -0600
Message-Id: <1636729319.962879.2842412.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 12 Nov 2021 13:05:16 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the NVIDIA Tegra186 (and later) BPMP I2C bindings from the
> free-form text format to json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/i2c/nvidia,tegra186-bpmp-i2c.txt | 42 -------------------
>  .../i2c/nvidia,tegra186-bpmp-i2c.yaml         | 40 ++++++++++++++++++
>  2 files changed, 40 insertions(+), 42 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.yaml: 'additionalProperties' is a required property
	hint: A schema without a "$ref" to another schema must define all properties and use "additionalProperties"
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.yaml: ignoring, error in schema: 
warning: no schema found in file: ./Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1554317

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

