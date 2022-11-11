Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82582C433FE
	for <linux-tegra@archiver.kernel.org>; Fri, 11 Nov 2022 18:36:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233940AbiKKSgB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 11 Nov 2022 13:36:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234096AbiKKSfx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 11 Nov 2022 13:35:53 -0500
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B0E5833BB;
        Fri, 11 Nov 2022 10:35:37 -0800 (PST)
Received: by mail-ot1-f48.google.com with SMTP id br15-20020a056830390f00b0061c9d73b8bdso3261721otb.6;
        Fri, 11 Nov 2022 10:35:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7tPZgreKLHqA+8JChabIylqFxb3MA62t4HFVqoO5PnA=;
        b=tifDhfZ6J6gCT54gDoyA5ht+7wGAZ5RYqunBRpsKmid1ew/kS99OzaLtxYguBeC4rd
         u2aID7dpb/d3vTcjE5BWxM8SG57S7QDcbj0ooRJPotPwhwKeUVrRfzi5RjbJiLpA9684
         kpFikEzGmAG3eweQ8GHl9cQwzooGFBI9I1cJoqJyoHMvT1zmlSolMkhsmCKcZ5nYUqc/
         OvLXcQJ1uIOp7l8Orbr/DZ47q7iUhoiQmC8TYOOWDxakG0Gm4+TLiflw2MyvZFmUkDoA
         i+eXdRSiPoJZ+olyKLRabMYkPQDOHyiUdj28uHq28zfDoCBMspDHR8sJK2+BDVmEpOUo
         Gfog==
X-Gm-Message-State: ANoB5pkgjJKsYjtxgfbez6afu3tp0pAHkkGB3SZ31NS/kxkr/ps0fMoe
        mY3e+sV8XzqgcEIp850b3SU6hMsZdA==
X-Google-Smtp-Source: AA0mqf4L5Pg3bnyUHyrkiO2ViAuRilDzV5j/Od1eYmvDjSbcyUpGOIyHSzRjCLy27CNNWoYs/RNvLA==
X-Received: by 2002:a05:6830:1e09:b0:66a:9b95:b23a with SMTP id s9-20020a0568301e0900b0066a9b95b23amr1823767otr.302.1668191736564;
        Fri, 11 Nov 2022 10:35:36 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id j103-20020a9d17f0000000b0066c2d80c753sm1295055otj.22.2022.11.11.10.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 10:35:36 -0800 (PST)
Received: (nullmailer pid 3660055 invoked by uid 1000);
        Fri, 11 Nov 2022 18:35:37 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org
In-Reply-To: <20221111152843.627286-1-thierry.reding@gmail.com>
References: <20221111152843.627286-1-thierry.reding@gmail.com>
Message-Id: <166819171068.3659211.4965449596446863079.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: clock: tegra124-dfll: Convert to json-schema
Date:   Fri, 11 Nov 2022 12:35:37 -0600
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


On Fri, 11 Nov 2022 16:28:42 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Convert the Tegra124 (and later) DFLL bindings from the free-form text
> format to json-schema.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/clock/nvidia,tegra124-dfll.txt   | 155 ----------
>  .../bindings/clock/nvidia,tegra124-dfll.yaml  | 277 ++++++++++++++++++
>  2 files changed, 277 insertions(+), 155 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.example.dtb:0:0: /example-1/pinmux@700008d4: failed to match any schema with compatible: ['nvidia,tegra210-pinmux']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

