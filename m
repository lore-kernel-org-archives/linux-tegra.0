Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D5F6EE49AA
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Aug 2023 11:53:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233773AbjHULxt convert rfc822-to-8bit (ORCPT
        <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 21 Aug 2023 07:53:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231792AbjHULxt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 21 Aug 2023 07:53:49 -0400
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F37390;
        Mon, 21 Aug 2023 04:53:44 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-58fb73e26a6so21595557b3.1;
        Mon, 21 Aug 2023 04:53:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692618823; x=1693223623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7+gBNHAhlUZ/WdvmiBi7MRmLoxs0kZdMHDdJfibkx2w=;
        b=d6sq45WsaGw6G7aQzkHZ+DklnsTEIuiUv58Up3L9KTMqHp0WEHwXLVZX/vIpKksWsc
         d/q6tkOZu0kQKULhP6T0bxf3PwWtCO8M0CYOMIyiKZ+AyHVTWxnJkMK7OYAOrT37QBqr
         89tjWwkP7wkqfJSYbWHaVUtIz/UFYe8SwUQVlJ3RnCCvlL64AbAeipAh4sCc/ELJXts0
         ZsslpqDZHDtmApEH+Q6sA8Rd50XkP3iUEqwc36Rak0Rk2kTczhjgIH1kcAPLBMYLp+ep
         6zZwSFuNp7Q459HKQwwHshoagc5/vOvXHTga8xVPI3mlFC90fD9I8FkBNV3Dnkd0YGBe
         dGaA==
X-Gm-Message-State: AOJu0YyjOS0cYmNnPhxKHE0phrqBkiURpdwcpaFB4RNfxffjN7po8Mwh
        npIk0KeZI2GvDlPpKIGU4YfDkMI7m/b/9Q==
X-Google-Smtp-Source: AGHT+IGkhqMMUktRVqgR+LS3twgHL2054/6v56LYs+c+xnD1fSKZT5kE7zfuVhC/Agxp17YX1omZIg==
X-Received: by 2002:a0d:d145:0:b0:581:5cb9:6c2b with SMTP id t66-20020a0dd145000000b005815cb96c2bmr6667680ywd.45.1692618823560;
        Mon, 21 Aug 2023 04:53:43 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id z1-20020a818901000000b005869d9535dcsm2201896ywf.55.2023.08.21.04.53.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Aug 2023 04:53:43 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-d45caf42d73so3165452276.2;
        Mon, 21 Aug 2023 04:53:43 -0700 (PDT)
X-Received: by 2002:a25:dc03:0:b0:c5d:f2af:5a24 with SMTP id
 y3-20020a25dc03000000b00c5df2af5a24mr6729217ybe.14.1692618823171; Mon, 21 Aug
 2023 04:53:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230819010946.916772-1-robh@kernel.org>
In-Reply-To: <20230819010946.916772-1-robh@kernel.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 21 Aug 2023 13:53:32 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU329w9umC1X6qrpe6j0QiU7YXvXLaDGJwAPknSXdrU5Q@mail.gmail.com>
Message-ID: <CAMuHMdU329w9umC1X6qrpe6j0QiU7YXvXLaDGJwAPknSXdrU5Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Drop 'phandle' properties
To:     Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sat, Aug 19, 2023 at 3:09 AM Rob Herring <robh@kernel.org> wrote:
> 'phandle' properties are implicitly supported on all nodes, so it
> shouldn't be listed in schemas.
>
> dtschema had a bug where 'phandle' and other implicit properties weren't
> being added under 'additionalProperties' schemas. That was fixed in
> v2023.07 release.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

>  Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml    | 4 ----
>  .../devicetree/bindings/pinctrl/renesas,rza1-ports.yaml       | 4 ----
>  .../devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml    | 4 ----
>  .../devicetree/bindings/pinctrl/renesas,rzn1-pinctrl.yaml     | 4 ----
>  .../devicetree/bindings/pinctrl/renesas,rzv2m-pinctrl.yaml    | 4 ----

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
