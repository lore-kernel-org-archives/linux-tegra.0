Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49FAEC433EF
	for <linux-tegra@archiver.kernel.org>; Thu, 19 May 2022 13:30:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238816AbiESNa1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 19 May 2022 09:30:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238799AbiESNa0 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 May 2022 09:30:26 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A276CEBA7
        for <linux-tegra@vger.kernel.org>; Thu, 19 May 2022 06:30:19 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id e78so9010902ybc.12
        for <linux-tegra@vger.kernel.org>; Thu, 19 May 2022 06:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ea9SWDA6wvriBFyiWmSM/cUBDRlPeKx6B/XCiADE6Cg=;
        b=ks6F3fTckOrmjWS0ClW006McxhjxXzbDAmClZ85Ndf/WMrVkPSfxPwMkCJ5+JB/Zly
         zqD5LIxa+lWehhvWN4Mf2NAHwpS/L4Y90P7fnLH5GPIKVSen0ZQFicNPS4BO/kxG2Hi7
         9+VqUpx3JpcDW4Kk2EBUINsel5EOpG7wvvFrLGI/79QAayI4cP63wE/0zgtW6uCGI/46
         NbjttW4tN3/OkWR6s6nrDwk1Vto3pC3uUL5jEpueyGDrGhBIRRoelrsklzxX3c65f6dY
         nVGShTwmklzNOXcRrUN7VvADdrC/n6x9IsBvYl4aTfA7ntFmcUWmig7WU3bTqN+epHWp
         Pvtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ea9SWDA6wvriBFyiWmSM/cUBDRlPeKx6B/XCiADE6Cg=;
        b=iIkvgACK+mPevydPLqryPXABjq58MVuLzeFSU8pbINa+kCC/MuMlpkYGa/CRO2xU7R
         Qs2Zv6Q5nwblHlZHU8fYxLanWUDwVLmaK3m8Tsbk8OOZYavDo8qWBr1AyOg1YYg5ugIj
         qTtDKpSw9KRE5ZUf3D3gsOt3kf8dL3eEoQpGP3O2VAd/c3f1b3mgfP6vgNdBeeFqFy8I
         DbMS1VtiCOyXP0XNv/9A13i3r59AtjEh3CRf6Sg8kmvQygwYCJ5AXaeIE8nLOPukYhBx
         /rmNTdDymcXK+cquATyzrNhgvuXfaDYAEcy8QnQ9RDIPujsxYejg9qMKghj9/2TqAp1L
         fJqA==
X-Gm-Message-State: AOAM533MgxRyMINPmaMbvcXbRikUXv6X4zosHXNdI56zRmLDMQklmsxy
        ZjXVMkcESCwVq9DyV21y1Eq1fAe1Pk9DCiwyS75Mdw==
X-Google-Smtp-Source: ABdhPJx5ABKP9iZZdCdL37HDpt4btHGxSXXOR0fGwkumd4vTxNoxrgrIZ9EOp8UTgSt1tW+U2kK3C15aGRatb6Ii7AA=
X-Received: by 2002:a5b:691:0:b0:64d:ab44:f12e with SMTP id
 j17-20020a5b0691000000b0064dab44f12emr4304244ybq.533.1652967018884; Thu, 19
 May 2022 06:30:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220518192924.20948-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20220518192924.20948-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20220518192924.20948-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 19 May 2022 15:30:07 +0200
Message-ID: <CACRpkdYt-doG_i2T9jjDCb8=oJFR_7Z8RCwW+S05qd90E3FgLg@mail.gmail.com>
Subject: Re: [PATCH v4 4/7] gpio: gpiolib: Dont assume child_offset_to_irq
 callback always succeeds
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Marc Zyngier <maz@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, May 18, 2022 at 9:30 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:

> On Renesas RZ/G2L SoC not all the GPIO pins can be simultaneously used as
> interrupts. The SoC allows 32 interrupts which is first come first serve
> basis and is dynamic i.e. if there is a free slot (after rmmod) this can
> be used by other GPIO pins being used as an interrupt.
>
> To handle such cases change child_offset_to_irq() callback to return error
> codes in case of failure. All the users of child_offset_to_irq() callback
> are also updated with this API change.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

This looks very useful!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
