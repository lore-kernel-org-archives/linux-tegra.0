Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5152EC76195
	for <linux-tegra@archiver.kernel.org>; Sun, 19 Mar 2023 21:20:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230247AbjCSVUv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 19 Mar 2023 17:20:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230232AbjCSVUt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 19 Mar 2023 17:20:49 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE48410ABA
        for <linux-tegra@vger.kernel.org>; Sun, 19 Mar 2023 14:20:46 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-536af432ee5so193744737b3.0
        for <linux-tegra@vger.kernel.org>; Sun, 19 Mar 2023 14:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679260846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1xVIksZcR76edI4z8mmPrpSpOfu0/pVV80WudQ/Vavs=;
        b=yxYOpG1BTRH8mP4CO9pabOiIVp8JZr5VwAuFO8HU6vbaqpTxWmCE4iIgG/OVL1bC1K
         h3LhfvJ9Emngr37qgSs4y3135OyBRvx5CQrGOhqBQ1h52Thw6LlPUCXerXAafRWoy3r/
         FDFDT9ERbcJkGc+2G4eLkbvA5KcKtQ6KYbmnVg4lq1vniUExZ2sFYpXbvCD7hKDVMLon
         QLx20N80Tf488Dgbj44gJ9XeDYP2w0y+6+La+/a0ASo0Dh+zkjSg2/P4RcnR2PKoZR8Z
         jdQ+VbU+0FFOQcGsff14UjVnV15EfKcDuX6yib3W9b/IG0H6KARxUCDOXylMZHreZLWk
         0npg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679260846;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1xVIksZcR76edI4z8mmPrpSpOfu0/pVV80WudQ/Vavs=;
        b=h0aufndOSjR5LnyoZFLHuDisCXcRLCgE8H04elQicJS4LSnIgi+YDOMRZI93NqdFXp
         EKnh3q6oFQk/soACl5vxq1vGxqpDUX2FAdKvPZEmZ4ItDh0K+L0WL8pWIq11/DVNqf8G
         hlKwJl6ejF/O2h4M6WF/DXV9fAX3JF7/l8fQuufuw2/FSf5WzmjG+dZnG+ngyaTMLlcA
         PJT9RUehPQxjpLgoVHJ8ncI4JQ4d2WN7vOAapNxVi2pPYKsNRTWwuWB73Hh3TGrPdWUc
         EhUgrbc+oe0JuicYyBppE/42R4DRCmRVCBRMzLQL43GPCAlsZLKJRN7fxlIo3FhETyo/
         PtMw==
X-Gm-Message-State: AO0yUKXhb4Qksgr3wTVCvlFeRWWc1YPwiLVkGQyAqMC/o0UnhVuQXoiC
        P5lEKJ+nMN8bcICTEZh4rwlG8gtOexvY4LxUO8vfmg==
X-Google-Smtp-Source: AK7set/4tcKb2KcMcmhkFSECkX9UEXl6Q7CPyM6DmVWY/gBDswc6Du79KNPC9UhC3cNpQzNAw1FAAnNdRAYmdab1914=
X-Received: by 2002:a81:ae5f:0:b0:532:e887:2c23 with SMTP id
 g31-20020a81ae5f000000b00532e8872c23mr9029129ywk.9.1679260846054; Sun, 19 Mar
 2023 14:20:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230319115925.1317654-1-sensor1010@163.com>
In-Reply-To: <20230319115925.1317654-1-sensor1010@163.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 19 Mar 2023 22:20:35 +0100
Message-ID: <CACRpkdbxSNCKNfous7h2dBQ_AW9KS9qyxPfPxOO=3PMDsDxcng@mail.gmail.com>
Subject: Re: [PATCH v2] drivers/gpio : Remove redundant platform_set_drvdata().
To:     Lizhe <sensor1010@163.com>
Cc:     brgl@bgdev.pl, geert+renesas@glider.be, info@metux.net,
        rjui@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        f.fainelli@gmail.com, sbranden@broadcom.com, shc_work@mail.ru,
        j-keerthy@ti.com, hoan@os.amperecomputing.com,
        fancer.lancer@gmail.com, orsonzhai@gmail.com,
        baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, kaloz@openwrt.org,
        khalasa@piap.pl, keguang.zhang@gmail.com, daniel@thingy.jp,
        romain.perier@gmail.com, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com, thierry.reding@gmail.com,
        u.kleine-koenig@pengutronix.de, grygorii.strashko@ti.com,
        ssantosh@kernel.org, khilman@kernel.org, mani@kernel.org,
        ludovic.desroches@microchip.com, andy@kernel.org,
        palmer@dabbelt.com, paul.walmsley@sifive.com, jonathanh@nvidia.com,
        sathyanarayanan.kuppuswamy@linux.intel.com,
        michal.simek@xilinx.com, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-pwm@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-unisoc@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sun, Mar 19, 2023 at 1:02=E2=80=AFPM Lizhe <sensor1010@163.com> wrote:

> platform_set_drvdata() is redundant in these functions.
> the purpose of calling this function is to place data
> in *driver_data. but the data is not retrieved in these
> functions
>
> Signed-off-by: Lizhe <sensor1010@163.com>

You have to also ascertain that the data is not used elsewhere
like in some callbacks or even in other drivers in some odd cases.

Yours,
Linus Walleij
