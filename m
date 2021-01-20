Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13598C433E0
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 15:43:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A7A74233A2
	for <linux-tegra@archiver.kernel.org>; Wed, 20 Jan 2021 15:43:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732046AbhATPmO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 20 Jan 2021 10:42:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:56774 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388531AbhATPlQ (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 20 Jan 2021 10:41:16 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 74ECD233CE;
        Wed, 20 Jan 2021 15:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611157235;
        bh=iPrXMOixk4rnufNuURuXZ2zlo2rSwdT1HbkPz5/0/FM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=NS0Q7LyUbaj4JGpGV98tukL590zF32xNSPHB4fPJycPKnLdmsItk71o6aIivdGNtD
         4rWm0ufxh/RN3mrwqU24A8PZBKDDQfRdBfX2RYZ/sRITmj5EvOwOBjOxmcmCdEArQ9
         fDr4Pp63OJMphbTV4ASrBMBEk3vyC7pTCkHc0olYb2M618Zk+vubTQDJK6T8CZqWV7
         Sh15WeALCAvgenRjuXUpFUIfnChny7d1ygi8++Ros67/RRQGKqq+0sduHZeJisVf+0
         0QLQ7t/XFp41ClP9A4Psa/6U470s841/6+GOLjtKUhk8NzAoT22uVKbNmxNCHWzcNW
         Xs1a31YTSeBEw==
Received: by mail-ej1-f42.google.com with SMTP id ke15so26457403ejc.12;
        Wed, 20 Jan 2021 07:40:35 -0800 (PST)
X-Gm-Message-State: AOAM530Cku+ANVG9vffGCOCDoMYRWIjJ1uWe2wvkQHk5yXm3UM+dU8P4
        2Bc9q5MyYuBZXp3MUXuG0pMtqXXmCu7OJhAQDw==
X-Google-Smtp-Source: ABdhPJzuFt9H5FmOQcH8+5iYJi5G+Rj7apHW8Vl9i79qkvpLtIVEsjkEhW7R79yKyuE8T4gfv2ZI8dMd50lQNG3CHdI=
X-Received: by 2002:a17:906:958f:: with SMTP id r15mr6306493ejx.360.1611157233991;
 Wed, 20 Jan 2021 07:40:33 -0800 (PST)
MIME-Version: 1.0
References: <20210120080522.471120-1-saravanak@google.com> <20210120080522.471120-2-saravanak@google.com>
In-Reply-To: <20210120080522.471120-2-saravanak@google.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 20 Jan 2021 09:40:19 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJw+=Ak1fNprKJyaJMyqgAjoGuZHqfjDrtkyFP5geK2xQ@mail.gmail.com>
Message-ID: <CAL_JsqJw+=Ak1fNprKJyaJMyqgAjoGuZHqfjDrtkyFP5geK2xQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] of: property: Add fw_devlink support for "gpio"
 and "gpios" binding
To:     Saravana Kannan <saravanak@google.com>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Marc Zyngier <maz@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Android Kernel Team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Jan 20, 2021 at 2:05 AM Saravana Kannan <saravanak@google.com> wrote:
>
> To provide backward compatibility for boards that use deprecated DT
> bindings, we need to add fw_devlink support for "gpio" and "gpios".
>
> Cc: linux-tegra <linux-tegra@vger.kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Fixes: e590474768f1 ("driver core: Set fw_devlink=on by default")
> Tested-by: Jon Hunter <jonathanh@nvidia.com>
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> ---
>  drivers/of/property.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
