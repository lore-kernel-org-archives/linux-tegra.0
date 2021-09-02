Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E43E8C432BE
	for <linux-tegra@archiver.kernel.org>; Thu,  2 Sep 2021 12:04:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CFFCE610CD
	for <linux-tegra@archiver.kernel.org>; Thu,  2 Sep 2021 12:04:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344113AbhIBMFG (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 2 Sep 2021 08:05:06 -0400
Received: from mail-oi1-f181.google.com ([209.85.167.181]:41582 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344084AbhIBMFF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 2 Sep 2021 08:05:05 -0400
Received: by mail-oi1-f181.google.com with SMTP id 6so2179330oiy.8;
        Thu, 02 Sep 2021 05:04:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=1BhybqLO/xSxTonTmG4+ysFiC+EsbInsMivl7h+IPwc=;
        b=nho1VdkKJjEQmd/v+S/i7QPNFMaXptKMhpwWQsP8DWcQ0kaepjOhWYkswpvA0V0lbe
         +HHmhgz+j/Q29Hc82XMthnqJq2upQ8n8Yq5Cr4l/UEvL0JPJyAWu3/Iwt1UPs5LotFrv
         xfjx+RD5fPcqrE8ZKA8k19go6bdeviymhftnllHK2MUCE4fHh0EJ4798NJiTDwfQF5qE
         grbcPHXI5ZXwSDszV2PBSVY+lXq2fYCdM9As3VsSV6NUjlkXXTn3XF5xmbL08l8U5E5W
         J3jJHputQDNEMTo09ugIy0Pq2HLcBgPEqyh75xEAUADO0J6us7bn/jSk5CxXTkx6gO9X
         eooQ==
X-Gm-Message-State: AOAM533hDF3lW7/vIW/4XFRW1nzYYVLU8dNEJJVBQFTCcOGJUXpTG4hY
        pE+NIcV2C2CpOtu2CLXFZQ==
X-Google-Smtp-Source: ABdhPJyfKcFgOUXSmVvN4L+H7e8NArWiAR7hFp+ggaReieLCcYCZmbU/u2j43rfIJCSQEG7HchJk1Q==
X-Received: by 2002:a54:4105:: with SMTP id l5mr1856524oic.76.1630584246444;
        Thu, 02 Sep 2021 05:04:06 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id w1sm301368ott.21.2021.09.02.05.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 05:04:05 -0700 (PDT)
Received: (nullmailer pid 685603 invoked by uid 1000);
        Thu, 02 Sep 2021 12:03:59 -0000
From:   Rob Herring <robh@kernel.org>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     alsa-devel@alsa-project.org, stephan@gerhold.net,
        jbrunet@baylibre.com, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, lgirdwood@gmail.com,
        jonathanh@nvidia.com, broonie@kernel.org,
        linux-kernel@vger.kernel.org, thierry.reding@gmail.com,
        robh+dt@kernel.org
In-Reply-To: <1630562033-13231-2-git-send-email-spujar@nvidia.com>
References: <1630562033-13231-1-git-send-email-spujar@nvidia.com> <1630562033-13231-2-git-send-email-spujar@nvidia.com>
Subject: Re: [PATCH v2 1/3] ASoC: Add json-schema documentation for sound-name-prefix
Date:   Thu, 02 Sep 2021 07:03:59 -0500
Message-Id: <1630584239.106707.685602.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 02 Sep 2021 11:23:51 +0530, Sameer Pujar wrote:
> The 'sound-name-prefix' is used to prepend suitable strings to a
> component widgets or controls. This is helpful when there are
> multiple instances of the same component. Add relevant json-schema
> and is inspired from sound-name-prefix.txt documentation.
> 
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> ---
>  .../devicetree/bindings/sound/name-prefix.yaml     | 35 ++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/name-prefix.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/sound/name-prefix.example.dts:19.28-22.11: Warning (unit_address_vs_reg): /example-0/analog-amplifier@0: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/sound/name-prefix.example.dts:24.28-27.11: Warning (unit_address_vs_reg): /example-0/analog-amplifier@1: node has a unit name, but no reg or ranges property
Documentation/devicetree/bindings/sound/name-prefix.example.dt.yaml:0:0: /example-0/analog-amplifier@0: failed to match any schema with compatible: ['simple-audio-amplifier']
Documentation/devicetree/bindings/sound/name-prefix.example.dt.yaml:0:0: /example-0/analog-amplifier@1: failed to match any schema with compatible: ['simple-audio-amplifier']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1523479

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

