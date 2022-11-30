Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A760DC4321E
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Nov 2022 16:40:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbiK3QkJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Nov 2022 11:40:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229610AbiK3QkI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Nov 2022 11:40:08 -0500
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04B235B877;
        Wed, 30 Nov 2022 08:40:07 -0800 (PST)
Received: by mail-qt1-f174.google.com with SMTP id c15so11500892qtw.8;
        Wed, 30 Nov 2022 08:40:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/B0jwa+xciuz/rLM/D5quDyC7IZMyW67SHNi9nPK74M=;
        b=Cu8/lQXM5BafGjQC2+VpnM7sM9V1EIXtttHTOPJ+xvJh6qtIYhZ0b0+k7VtLhyKYY7
         FjuNiEsHejuInuOWYDpBEqQ+/H/2qyFjZSwxftmRbSN8Oxr5RJBQSrJ+pct1Efi4HPxA
         +XGkGMkPaxuSXN82aTnnRHlbe02ysGWSJpaS2Wxafr08f0REhvqog4NXVxHvIfDABSM5
         cf70ZaLc8wnnLSQr6dKtq6ObUO2109BnmgL4J2Nqsoqy64wW5gIGGzeIPlS2HJmXmBZ+
         GY8Dh1OjMgukGHHEYOta7S00xhU8ZJmSXKQxKohaq6qXHeCdt9iyQvn1M0LNbCxt9In6
         4esg==
X-Gm-Message-State: ANoB5plDAl2poNyZa0a1WRYxdC+gGLxdU2LeT0w8UCNF/h4Zn0WXT0La
        Nl/6qOv/eP55fdqk6pUdT6NhPMTDeuq3xg==
X-Google-Smtp-Source: AA0mqf4jY4D82AaAHWHVEQ1PIKo9kqpMofAtaWr2mcB+MX9CeIe5RbnNWd7AJzP5hMOHxpHyNG4WmA==
X-Received: by 2002:a05:622a:5808:b0:3a5:9170:458e with SMTP id fg8-20020a05622a580800b003a59170458emr58546044qtb.509.1669826405728;
        Wed, 30 Nov 2022 08:40:05 -0800 (PST)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com. [209.85.219.169])
        by smtp.gmail.com with ESMTPSA id de4-20020a05620a370400b006fae7e6204bsm1511278qkb.108.2022.11.30.08.40.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Nov 2022 08:40:05 -0800 (PST)
Received: by mail-yb1-f169.google.com with SMTP id y83so22265767yby.12;
        Wed, 30 Nov 2022 08:40:05 -0800 (PST)
X-Received: by 2002:a25:7204:0:b0:6f0:9ff5:1151 with SMTP id
 n4-20020a257204000000b006f09ff51151mr33350652ybc.543.1669826404935; Wed, 30
 Nov 2022 08:40:04 -0800 (PST)
MIME-Version: 1.0
References: <20221130154111.1655603-1-thierry.reding@gmail.com>
In-Reply-To: <20221130154111.1655603-1-thierry.reding@gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 30 Nov 2022 17:39:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV9qom7TmhmNkpAqYLGfqT0pRkndAMzn-EisZkcw9pVBA@mail.gmail.com>
Message-ID: <CAMuHMdV9qom7TmhmNkpAqYLGfqT0pRkndAMzn-EisZkcw9pVBA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: usb: tegra-xusb: Remove path references
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Nov 30, 2022 at 4:52 PM Thierry Reding <thierry.reding@gmail.com> wrote:
> From: Thierry Reding <treding@nvidia.com>
>
> Unresolved path references are now flagged as errors when checking the
> device tree binding examples, so convert them into label references.
>
> Reported-by: Conor Dooley <conor.dooley@microchip.com>
> Suggested-by: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

This fixes "make dt_binding_check" for me, so
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
