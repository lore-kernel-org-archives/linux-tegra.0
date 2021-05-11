Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D771C43460
	for <linux-tegra@archiver.kernel.org>; Wed, 12 May 2021 21:42:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 620DC613DE
	for <linux-tegra@archiver.kernel.org>; Wed, 12 May 2021 21:42:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241499AbhELVn2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 12 May 2021 17:43:28 -0400
Received: from mail-ot1-f44.google.com ([209.85.210.44]:43654 "EHLO
        mail-ot1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1385242AbhELUHs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 12 May 2021 16:07:48 -0400
Received: by mail-ot1-f44.google.com with SMTP id u19-20020a0568302493b02902d61b0d29adso20889892ots.10;
        Wed, 12 May 2021 13:06:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=y75a+npHzYnAcEOmEtDKotRbA7WzUvRLx11YfyY+WUU=;
        b=fOnNwwkQoz1aeXd1g78+C/sgX6prwYfmni/oxUbPW+c3nKuFAvgYzEzQ9JxLXSLdAw
         1/NmdkTp7oO31UDiwl8cB72LBJeiisD4wQQFHgR0CyARAFWfTCEaAjl7GaSBDjAtRnGD
         CpRrONmloydX2rCi24i3FK/3VeIKIRjdyKlMwiRJrOVyHp2QVHb4wV4W3LOFIaFj+cxd
         289i41PI5zikr3TNZqoD5SWDSkTxK2gjOQN9G4zz6HHl9K0qgYEeCGMzCFWo6cwVnTjJ
         YT84I7CdJ1qRPzbm+Z/NnUAX5yZwB+nSrYORhLME/Yg4EAVAdC4/o0miMYHrl/VT8E+j
         L6NA==
X-Gm-Message-State: AOAM532NqUXylFHyZdnOHkLOGSfY6+gDyDBs8O8J/VAXt4kw+9NZkOky
        T5AgKLZg2IAbVturXbiQCw==
X-Google-Smtp-Source: ABdhPJxoDGfKmXXaK6iKVaWIMgHWAwaXQ+vvdi96PtmRwBpqWzU3YEAOkWPn3koqCfhG8RemFU1aVw==
X-Received: by 2002:a9d:614b:: with SMTP id c11mr32075996otk.59.1620849998823;
        Wed, 12 May 2021 13:06:38 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q1sm192057otc.21.2021.05.12.13.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 13:06:38 -0700 (PDT)
Received: (nullmailer pid 2020688 invoked by uid 1000);
        Tue, 11 May 2021 13:40:20 -0000
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        =?utf-8?b?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
In-Reply-To: <20210510231737.30313-9-digetx@gmail.com>
References: <20210510231737.30313-1-digetx@gmail.com> <20210510231737.30313-9-digetx@gmail.com>
Subject: Re: [PATCH v7 8/8] dt-bindings: clock: tegra: Convert to schema
Date:   Tue, 11 May 2021 08:40:20 -0500
Message-Id: <1620740420.957803.2020687.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 11 May 2021 02:17:37 +0300, Dmitry Osipenko wrote:
> Convert NVIDIA Tegra clock bindings to schema.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/clock/nvidia,tegra114-car.txt    |  63 ----------
>  .../bindings/clock/nvidia,tegra124-car.txt    | 107 ----------------
>  .../bindings/clock/nvidia,tegra124-car.yaml   | 115 ++++++++++++++++++
>  .../bindings/clock/nvidia,tegra20-car.txt     |  63 ----------
>  .../bindings/clock/nvidia,tegra20-car.yaml    |  69 +++++++++++
>  .../bindings/clock/nvidia,tegra210-car.txt    |  56 ---------
>  .../bindings/clock/nvidia,tegra30-car.txt     |  63 ----------
>  7 files changed, 184 insertions(+), 352 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra114-car.txt
>  delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra124-car.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra124-car.yaml
>  delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra20-car.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra20-car.yaml
>  delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra210-car.txt
>  delete mode 100644 Documentation/devicetree/bindings/clock/nvidia,tegra30-car.txt
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/clock/nvidia,tegra20-car.example.dt.yaml:0:0: /example-0/usb-controller@c5004000: failed to match any schema with compatible: ['nvidia,tegra20-ehci']
Documentation/devicetree/bindings/clock/nvidia,tegra124-car.example.dt.yaml:0:0: /example-0/usb-controller@c5004000: failed to match any schema with compatible: ['nvidia,tegra20-ehci']

See https://patchwork.ozlabs.org/patch/1476773

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

