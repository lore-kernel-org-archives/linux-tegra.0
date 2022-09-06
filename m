Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F1A1ECAAD3
	for <linux-tegra@archiver.kernel.org>; Tue,  6 Sep 2022 02:30:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232469AbiIFCaG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Sep 2022 22:30:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232502AbiIFCaD (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Sep 2022 22:30:03 -0400
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE9DA15FC8;
        Mon,  5 Sep 2022 19:30:01 -0700 (PDT)
Received: by mail-ot1-f49.google.com with SMTP id t11-20020a05683014cb00b0063734a2a786so7212858otq.11;
        Mon, 05 Sep 2022 19:30:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=62aXNAbn2VJJU9bSVwGuWx0YLMR84OQttybG88JiBOs=;
        b=4J7nuI/EetuUarNI/h3HCgVCQw9gEs7BVz1LqkDi6nsHoJ8Ci9BE4dVVZtRzgdzlys
         tmNoSfiO/wCHV7J4QpD28HZwr7/f23s4BHU3KQKKKu7MGlxzmljJg+PxTVBJBk3wZSxN
         0xBYEC3HoIYVgiZ34BhUQQJdbVueBx7xf12Qaeuw48PlkO5XsWsybRp+byzM676N8CXY
         13f0ZMYno4skEKg/fasocZGIqPO5F6+if/gedhX0OyFy5yR0umZgA5gMH78IINbnIPL4
         7ORPOGmYMzLrCwCTmxAj1xWvzOFBxq6yyT/8xWU4MfJFmQNEszMKSLNJ8rrY2JESct/D
         GeaA==
X-Gm-Message-State: ACgBeo2yBMc4akHOJ9o0qizhXD1GYCzKc8Wb7E4m+FJiYCWXgePxB1rt
        zoziVrUQP3a83hAA98jTfA==
X-Google-Smtp-Source: AA6agR4MAOUUpkDCrbdyOjhtwgxGL7uIHYDE+QmdBjiX5nPXz0w3Jz7VEKY6TdkBgbb60EYww7KImA==
X-Received: by 2002:a05:6830:24b7:b0:636:ef3f:86c with SMTP id v23-20020a05683024b700b00636ef3f086cmr20334163ots.145.1662431400934;
        Mon, 05 Sep 2022 19:30:00 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id 128-20020aca0686000000b003442d74e8a5sm4884656oig.45.2022.09.05.19.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Sep 2022 19:30:00 -0700 (PDT)
Received: (nullmailer pid 3334461 invoked by uid 1000);
        Tue, 06 Sep 2022 02:29:58 -0000
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     David Airlie <airlied@linux.ie>, Jon Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Daniel Vetter <daniel@ffwll.ch>, linux-tegra@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20220905163300.391692-3-thierry.reding@gmail.com>
References: <20220905163300.391692-1-thierry.reding@gmail.com> <20220905163300.391692-3-thierry.reding@gmail.com>
Subject: Re: [PATCH 2/6] dt-bindings: reserved-memory: Support framebuffer reserved memory
Date:   Mon, 05 Sep 2022 21:29:58 -0500
Message-Id: <1662431398.296852.3334460.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, 05 Sep 2022 18:32:56 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Document the "framebuffer" compatible string for reserved memory nodes
> to annotate reserved memory regions used for framebuffer carveouts.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/reserved-memory/framebuffer.yaml | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reserved-memory/framebuffer.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/reserved-memory/framebuffer.example.dts:18.16-23.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

