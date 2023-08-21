Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A01CDEE49AC
	for <linux-tegra@archiver.kernel.org>; Mon, 21 Aug 2023 10:31:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234718AbjHUKbJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 21 Aug 2023 06:31:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234714AbjHUKbG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 21 Aug 2023 06:31:06 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2563ED8
        for <linux-tegra@vger.kernel.org>; Mon, 21 Aug 2023 03:31:04 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-d746d030a86so2115669276.1
        for <linux-tegra@vger.kernel.org>; Mon, 21 Aug 2023 03:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692613863; x=1693218663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9fEE32aL5Rb4gj0b/8MH38oOPs9iq+wkUzldyyh0kHg=;
        b=oAQKaXXAOfvZMkVX1sZGkpxGXS4x4DaEZAWSEzowre8QtNUoAchfv2KRvdP6crS+Pr
         WDSsX/G78kKRR3Q6icaIVKmRfHqZ49jDPsCnjVZFu9pxT+pV4LgaJpFlNAl+rh9U5ym6
         cGUgkOdXHKQido7b+x34hw+9bPoFveQFqCq14YAO/Nu3hrmbdK4rIubb9YaeOeAtjirJ
         WX4Duc+OployEFuX6GTT8BcocEs1ASHhlVSH1/ULvCKFxtexBucwa7bk4PQgWTY+3Mes
         smZCCQIw8FHs19sIyVbD2gUyzfnPDQPcs7l/34HSESQNVNyf+rLwuk90LcPB4IHaGbtA
         7nIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692613863; x=1693218663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9fEE32aL5Rb4gj0b/8MH38oOPs9iq+wkUzldyyh0kHg=;
        b=d9vxvTEHootbZwKLKUp/hKx9Ux3YFjBLOqLVKvYnvwtIGX3Ty94a79ZVy12bQOajjn
         Lr9U1AFvzn9MMCQD9PVj1beSDhUBVEOh4EYz05k0IO+QsrhMUgfB4SCsiJxSKBrNq5XS
         pvleTTuLr3hH03qmegCwaHqlCw/NLpQMM1KziV3oHaT6zifQsWdc7WfWu7dH/AA0YU7j
         2pzhvgI9tHmWLW1N4DvHwPIk8H02/d4Cxd1vRHF8Km86rXg4iXydfY4fy7sBXZx8cL//
         zkawSXsijw+Aj6cVEdlNV9+fqpjKE1rFhTLoIgtlZbY17d65iNTB+AV7xYI6wL3Wa7t8
         ljAw==
X-Gm-Message-State: AOJu0YzWbgngeLPF5dTsOJmQ9ZTZvZcE98Yy0qC5PgCvkmERj43IDq2Z
        kxQZXVELKX52oEVHMII06O+GgHvYbnkus0e4b2irrQ==
X-Google-Smtp-Source: AGHT+IF6Mfo/+8vVARSN95eC1x7RexyXH+sNO3+jYibcHUydhVyzIiiYt4PyLHBfRnqEn7V+mLG3SANopIr+t8lBV5U=
X-Received: by 2002:a25:6b45:0:b0:c60:1036:2082 with SMTP id
 o5-20020a256b45000000b00c6010362082mr6274051ybm.22.1692613863152; Mon, 21 Aug
 2023 03:31:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230819010946.916772-1-robh@kernel.org>
In-Reply-To: <20230819010946.916772-1-robh@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 21 Aug 2023 12:30:51 +0200
Message-ID: <CACRpkdb6J65TjD357z4fZgjO5UR55L8v9tX2Wo4-rhFk6q0T3Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Drop 'phandle' properties
To:     Rob Herring <robh@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sat, Aug 19, 2023 at 3:09=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:

> 'phandle' properties are implicitly supported on all nodes, so it
> shouldn't be listed in schemas.
>
> dtschema had a bug where 'phandle' and other implicit properties weren't
> being added under 'additionalProperties' schemas. That was fixed in
> v2023.07 release.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Patch applied, thanks for fixing this!

Yours,
Linus Walleij
