Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4560FC433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 13:48:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 268946108B
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 13:48:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235078AbhKLNvd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 08:51:33 -0500
Received: from mail-ot1-f49.google.com ([209.85.210.49]:36430 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235074AbhKLNvc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 08:51:32 -0500
Received: by mail-ot1-f49.google.com with SMTP id w6-20020a9d77c6000000b0055e804fa524so13939488otl.3;
        Fri, 12 Nov 2021 05:48:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=jxmVxwVEIODsUz5cmQZGbjxDZQfY0Nw513i0hXKcGII=;
        b=ERxj3hi8q+QXpUSernFfBvHIXsEc+DwI+RWeMWEAvbCj2qPPeRDtd1xgkDlhmgwz4F
         NiTeLyWEjK4IW3qfBShk55euZKHdo+/YD+v7bCWYjltWZKDU2TeBhnpZ0+4UC0eFs2Tg
         2IcfsNYU1x45Oa7DxVBxYakYgyjtb61Lggfb1xzUouDCAEBLD79fe4FTdbxm74avkuiI
         jyEJDWlWalOWYVQ4YPVVjQrB5vuiYCST+RUciH1+K5bTMBkPVuqsPlw8CkNwITnoarv2
         ACu/8D8dnwBl3zVCpno0FY+23bpfAshAuX5FaaQ3Gm0NJeLz34aOWjDWWEhZwNrvp8iM
         KLeA==
X-Gm-Message-State: AOAM532hz+eotNWnkOmEVgOkkZj+tIinUVUg+wa3N3ojbkHlbKFMar77
        d8urOA5p4c+05l2HNR9GjC1BQr6U2Q==
X-Google-Smtp-Source: ABdhPJz80ATDrF4RPUbdjx4SU03fMnowayCqKTca1SIIyrBu7+tXWUedFcxGs/KXDkApzfvbZ9Ebwg==
X-Received: by 2002:a9d:62ce:: with SMTP id z14mr12325812otk.56.1636724920972;
        Fri, 12 Nov 2021 05:48:40 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id j5sm1219479ots.68.2021.11.12.05.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 05:48:40 -0800 (PST)
Received: (nullmailer pid 2463367 invoked by uid 1000);
        Fri, 12 Nov 2021 13:48:37 -0000
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
In-Reply-To: <20211112120518.3679793-4-thierry.reding@gmail.com>
References: <20211112120518.3679793-1-thierry.reding@gmail.com> <20211112120518.3679793-4-thierry.reding@gmail.com>
Subject: Re: [PATCH 03/15] dt-bindings: mailbox: tegra: Convert to json-schema
Date:   Fri, 12 Nov 2021 07:48:37 -0600
Message-Id: <1636724917.104467.2463366.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 12 Nov 2021 13:05:06 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the NVIDIA Tegra HSP bindings from the free-form text format to
> json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/mailbox/nvidia,tegra186-hsp.txt  |  72 ------------
>  .../bindings/mailbox/nvidia,tegra186-hsp.yaml | 109 ++++++++++++++++++
>  2 files changed, 109 insertions(+), 72 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.txt
>  create mode 100644 Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml: properties:compatible:oneOf: [{'const': 'nvidia,tegra186-hsp'}, {'const': 'nvidia,tegra194-hsp'}] should not be valid under {'items': {'propertyNames': {'const': 'const'}, 'required': ['const']}}
	hint: Use 'enum' rather than 'oneOf' + 'const' entries
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml: 'additionalProperties' is a required property
	hint: A schema without a "$ref" to another schema must define all properties and use "additionalProperties"
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml: ignoring, error in schema: properties: compatible: oneOf
warning: no schema found in file: ./Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.yaml
Documentation/devicetree/bindings/mailbox/nvidia,tegra186-hsp.example.dt.yaml:0:0: /example-0/hsp@3c00000: failed to match any schema with compatible: ['nvidia,tegra186-hsp']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1554298

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

