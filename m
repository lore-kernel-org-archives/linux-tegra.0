Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABDB9C54EAA
	for <linux-tegra@archiver.kernel.org>; Tue, 24 Jan 2023 13:50:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234515AbjAXNuq (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 24 Jan 2023 08:50:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234987AbjAXNuQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 24 Jan 2023 08:50:16 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64B1B2410B;
        Tue, 24 Jan 2023 05:47:53 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id s124so13332193oif.1;
        Tue, 24 Jan 2023 05:47:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dgVu7me6sU+em3VIV4aC+WPji/mlX6JtCE66fSnGyn4=;
        b=eZTY5qRZxf4KEh7UCsslELdpi8xX5rElv9c5C1SnxNhllNviqfDr2t08gHjt9m1vkL
         C5Uw69FgV2uDGnGgl7gSz2w2nKfu5cmTYLmPoPq0cuWKKPPOzXuarM7+m5StM1EGtWko
         EminHAvJH+hQhzCSAyVGVgcuH1ERWbBTONGkYewi2IZp4TK3THPFPZAcQxA4amFIF1+F
         Mivo3P/Zefm16N4mXhZUiFFgI4cF0DnbbB4rmbwIBaQ808JG0vBfIpNsDsmzSTVkpoEI
         5QMa/CMmqy33gWcRduML3nZJQlUsLpU4SVRD7aLIGz6hoTu1SU8sMlWHGGBWSmtU7ADF
         W26w==
X-Gm-Message-State: AFqh2kq2Ooi1SH+YvL8ld8CIo97j3EmBvLDkz7iaoQu3aTuBtPsLSCzI
        K8aAMOsCr1MEuanWIfrfqw==
X-Google-Smtp-Source: AMrXdXt9hoqjLN2to+csT0/dkCRVXxuqN6eTU/E0qsd4wp8ozPy7l2VcYEeNOSS3tFpgIz0nCJaK1Q==
X-Received: by 2002:aca:de89:0:b0:367:6c7:baf9 with SMTP id v131-20020acade89000000b0036706c7baf9mr11467889oig.8.1674567940590;
        Tue, 24 Jan 2023 05:45:40 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id i10-20020a056808030a00b0036a97066646sm1020354oie.8.2023.01.24.05.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 05:45:40 -0800 (PST)
Received: (nullmailer pid 637757 invoked by uid 1000);
        Tue, 24 Jan 2023 13:45:39 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     devicetree@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, linux-usb@vger.kernel.org,
        Wayne Chang <waynec@nvidia.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-tegra@vger.kernel.org
In-Reply-To: <20230124114318.18345-2-jonathanh@nvidia.com>
References: <20230124114318.18345-1-jonathanh@nvidia.com>
 <20230124114318.18345-2-jonathanh@nvidia.com>
Message-Id: <167456749036.611215.16155554024148748452.robh@kernel.org>
Subject: Re: [PATCH V7 1/6] dt-bindings: usb: Add Cypress cypd4226 Type-C controller
Date:   Tue, 24 Jan 2023 07:45:39 -0600
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On Tue, 24 Jan 2023 11:43:13 +0000, Jon Hunter wrote:
> From: Wayne Chang <waynec@nvidia.com>
> 
> Add the device-tree binding documentation for Cypress cypd4226 dual
> Type-C controller.
> 
> Signed-off-by: Wayne Chang <waynec@nvidia.com>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> V6 -> V7: updated example to use 'typec' for the node name
> V5 -> V6: no changes
> V4 -> V5: updated subject and updated binding to use 'firmware-name'.
> V3 -> V4: no changes
> V2 -> V3: fix additionalProperties warning on new schema
> V1 -> V2: based on the review comments. Fix some addressed issues on
> 
>  .../bindings/usb/cypress,cypd4226.yaml        | 88 +++++++++++++++++++
>  1 file changed, 88 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml: More than one condition true in oneOf schema:
	{'description': 'Either unevaluatedProperties or additionalProperties '
	                'must be present',
	 'oneOf': [{'required': ['unevaluatedProperties']},
	           {'required': ['additionalProperties']}]}
	hint: Either unevaluatedProperties or additionalProperties must be present
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230124114318.18345-2-jonathanh@nvidia.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

