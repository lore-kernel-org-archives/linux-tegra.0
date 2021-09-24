Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B40F0C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Sep 2021 07:43:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 90F5B60E9B
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Sep 2021 07:43:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244407AbhIXHog (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 24 Sep 2021 03:44:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:52270 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235134AbhIXHof (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 24 Sep 2021 03:44:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 36D2760E94;
        Fri, 24 Sep 2021 07:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632469383;
        bh=XPvIGBX447PGQFkMF+ZWZcUB+7WxQwFocq16XNv9k4g=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=VdPohMY0sCZED8WVOCiLOigJ4j5armmGaRr2/b8k68R4qEHwWjX6F520gkv7w/Nv4
         ZFZypgrQ7iYPpuvrYJayrLTwlFCZLaUTWkg65Fp63qI/YPDyxzoanubaWEEd+UmZwb
         5oxQseqbS1KeFmXQGhOKWIPpRL3kQq6bLqhQ5+/UddQvkfPNzVeBgQF+qO6cjkDceO
         mWWfyw2td1plE0zc5eqYcjx1LKal0YC2yGNSbI6tMOLiwiILS3LuRXxGDKNdNYdIu2
         P3mGTz0z3lhuJft1Oi4sbv8AIE3JXmwV90AeWS4WJov9onS1yDxDjWboyb45uJxbA2
         +05hq7w4wSfog==
Received: by mail-pl1-f172.google.com with SMTP id t4so5953490plo.0;
        Fri, 24 Sep 2021 00:43:03 -0700 (PDT)
X-Gm-Message-State: AOAM530zEpPzmBR9x1n4pl5yvlKSx43a7nlvmCNJcmPz8K1Jn3QSet08
        bAjDDde4rwf6snKFJUnCBC7KiMYCOI9ZoXfPCEQ=
X-Google-Smtp-Source: ABdhPJyvlEDjFLktDmLeK06UX7dZjnb+oXRGTUwNhya5oCn7bjA+Tt3jIjNy46RhpplhpX1VSn5duvUv8Vd/z9VPeuA=
X-Received: by 2002:a17:90a:c982:: with SMTP id w2mr631785pjt.30.1632469382884;
 Fri, 24 Sep 2021 00:43:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210921174434.4839-1-bbiswas@nvidia.com> <20210921174434.4839-4-bbiswas@nvidia.com>
In-Reply-To: <20210921174434.4839-4-bbiswas@nvidia.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Fri, 24 Sep 2021 09:42:51 +0200
X-Gmail-Original-Message-ID: <CAJKOXPeKP6RiGh+VaD=QzcXrjPWU+8JL7=PjFqCM7HtwA2XSog@mail.gmail.com>
Message-ID: <CAJKOXPeKP6RiGh+VaD=QzcXrjPWU+8JL7=PjFqCM7HtwA2XSog@mail.gmail.com>
Subject: Re: [PATCH V1 3/3] dt-bindings: tegra: clock,memory,thermal: add
 header Copyright
To:     Bitan Biswas <bbiswas@nvidia.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        robh+dt@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
        rostedt@goodmis.org, mingo@redhat.com, jassisinghbrar@gmail.com,
        p.zabel@pengutronix.de, skomatineni@nvidia.com, broonie@kernel.org,
        linus.walleij@linaro.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, 21 Sept 2021 at 19:46, Bitan Biswas <bbiswas@nvidia.com> wrote:
>
> Add Copyright for below Tegra dt-bindings headers:
> 1. clock
> 2. gpio
> 3. mailbox
> 4. memory
> 5. thermal
> 6. reset
> 7. pinctrl
>
> Signed-off-by: Bitan Biswas <bbiswas@nvidia.com>
> ---
>  include/dt-bindings/clock/tegra114-car.h            | 4 ++++
>  include/dt-bindings/clock/tegra124-car-common.h     | 4 ++++
>  include/dt-bindings/clock/tegra124-car.h            | 4 ++++
>  include/dt-bindings/clock/tegra186-clock.h          | 6 ++++++
>  include/dt-bindings/clock/tegra20-car.h             | 4 ++++
>  include/dt-bindings/clock/tegra210-car.h            | 4 ++++
>  include/dt-bindings/clock/tegra30-car.h             | 4 ++++
>  include/dt-bindings/gpio/tegra-gpio.h               | 4 ++++
>  include/dt-bindings/gpio/tegra186-gpio.h            | 4 ++++
>  include/dt-bindings/mailbox/tegra186-hsp.h          | 4 ++++
>  include/dt-bindings/memory/tegra114-mc.h            | 6 ++++++
>  include/dt-bindings/memory/tegra124-mc.h            | 6 ++++++
>  include/dt-bindings/memory/tegra186-mc.h            | 6 ++++++
>  include/dt-bindings/memory/tegra194-mc.h            | 6 ++++++
>  include/dt-bindings/memory/tegra210-mc.h            | 6 ++++++
>  include/dt-bindings/memory/tegra30-mc.h             | 6 ++++++
>  include/dt-bindings/pinctrl/pinctrl-tegra-xusb.h    | 6 ++++++
>  include/dt-bindings/reset/tegra124-car.h            | 4 ++++
>  include/dt-bindings/reset/tegra210-car.h            | 4 ++++
>  include/dt-bindings/thermal/tegra124-soctherm.h     | 4 ++++
>  include/dt-bindings/thermal/tegra186-bpmp-thermal.h | 4 ++++
>  include/dt-bindings/thermal/tegra194-bpmp-thermal.h | 4 ++++
>  22 files changed, 104 insertions(+)

This is the third email (same), so to avoid the confusion and applying
before answering my comments from the first submission: NAK for this
series. Please respond to the comments before sending it again.

Best regards,
Krzysztof
