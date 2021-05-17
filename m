Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04D79C433ED
	for <linux-tegra@archiver.kernel.org>; Mon, 17 May 2021 02:27:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE3D161166
	for <linux-tegra@archiver.kernel.org>; Mon, 17 May 2021 02:27:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233718AbhEQC20 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 16 May 2021 22:28:26 -0400
Received: from mail-ot1-f54.google.com ([209.85.210.54]:35496 "EHLO
        mail-ot1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231338AbhEQC20 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 16 May 2021 22:28:26 -0400
Received: by mail-ot1-f54.google.com with SMTP id 69-20020a9d0a4b0000b02902ed42f141e1so4340676otg.2;
        Sun, 16 May 2021 19:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=R03QDnkN9zqsgroSoJg97D5ffisyGbIPB9o/7Bcnl+o=;
        b=fDQp+jtSwBvzyH37RcNm0ePY0xGbGXKfj6INtjLbjMh+oUBEEBU46D+s/VeKK7g4BO
         jdu0KbN8XCvcY9LIQkI8KZcg+4j1h3da9D/dpK/EFSgEbvqWbWwAn4ybtrIFmzbCFI3m
         1UoKGZQnZzUyr+JSs2pNwj9wAYZQyK3ibb4/DBYkVyH1AZQFn5kvKiXUb8P6RelhHM2O
         eDFEgQg67HngOIOMcwwzEAbVa6gcxF92mifXcozPXfp1Bueo77JJbuGwfnFmEIVrdesw
         pUaOcBfTnTJPRRdKn/okC6FMtc3GLC5uz54G41GtVxW3gjuMxDxc02tndcvIlMyJl+JU
         YoEA==
X-Gm-Message-State: AOAM531aeT9izr2pTDFGKTbBpQA0KFmlgtjZDP4Gj9MVR7BM67t1SAeS
        nvhI/soaDwzhxOggo29eEg==
X-Google-Smtp-Source: ABdhPJwDIoiUywYuLTEq2x9lqWjoXgQgSJ8aRn8Y3IG0/gCe2Dd/S3PXka7/ZUEjsCsQdUMD4rEP1A==
X-Received: by 2002:a9d:5a9b:: with SMTP id w27mr45874171oth.362.1621218430403;
        Sun, 16 May 2021 19:27:10 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v19sm2891231otq.35.2021.05.16.19.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 19:27:09 -0700 (PDT)
Received: (nullmailer pid 1315834 invoked by uid 1000);
        Mon, 17 May 2021 02:27:03 -0000
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Jonathan Hunter <jonathanh@nvidia.com>,
        devicetree@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        =?utf-8?b?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-tegra@vger.kernel.org
In-Reply-To: <20210516163041.12818-10-digetx@gmail.com>
References: <20210516163041.12818-1-digetx@gmail.com> <20210516163041.12818-10-digetx@gmail.com>
Subject: Re: [PATCH v8 9/9] dt-bindings: clock: tegra: Convert to schema
Date:   Sun, 16 May 2021 21:27:03 -0500
Message-Id: <1621218423.813065.1315833.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sun, 16 May 2021 19:30:41 +0300, Dmitry Osipenko wrote:
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

See https://patchwork.ozlabs.org/patch/1479105

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

