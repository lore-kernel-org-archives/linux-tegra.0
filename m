Return-Path: <SRS0=Tnts=C2=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E312BC433E2
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 07:41:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A14C9208DB
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Sep 2020 07:41:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n9IUahF4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726178AbgIQHlL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Sep 2020 03:41:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbgIQHlK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Sep 2020 03:41:10 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F27C1C061756
        for <linux-tegra@vger.kernel.org>; Thu, 17 Sep 2020 00:41:08 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id u8so1128467lff.1
        for <linux-tegra@vger.kernel.org>; Thu, 17 Sep 2020 00:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KzGRfdSlTsnA6ugMb6NVstzypnemez8bSdibR9WaXZI=;
        b=n9IUahF4nx7eVElB/b5yWlOaTpw9Io8kHvS+30WVF70Vvg5Rs4hKZ7sjWxfbQXCL6U
         HknbOUTOEMlKX8yT9+2zjSIvUrlhFXl6wOHqUopLSO3WaKLX2wJXbImMlr6kHNkdXflD
         WPlirGqKCrNnSytHO+6HX3dHHHypAzcaWjAWw5/gS2dFyRNCyUbAlSVqC3VkElPX2DZ9
         UO0U4136FDAdV6SdfKKHfhd1ptDfdmFMjIG4VZLwtWJJnUkee3hs4kmm0xC/cmttQvUr
         PTbBysSr02mkeQO1rIPMPimPK15nN/p1pYu1DUyruNPcK1vjY2rwqm8MfM7t7cE1oPCQ
         5kAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KzGRfdSlTsnA6ugMb6NVstzypnemez8bSdibR9WaXZI=;
        b=H7zDVg2b7FTtLtc/wuoZ9syXzd0h3zE7BS10KU1zjOUNe9n7WUffsJalhgO4shbvg/
         75sQfp9ztlxrFwPX1npmJ1LCBxrcp7mS7qtiICouYUapi4XAqNJeHRGPQkDFhaehtBlJ
         xI/FiUWSv6HLFb8BnPb2g0nfeEgg989J+IY/ZH7OluiSDuJjGjThyA2WtiYa15Wd8+Ge
         EHfH9/qnEa+9xnu0/wqTraH9sg+CbMA2CesFzMrkim3KdG0bpKz9mE40vKuqQArzkSAf
         KJK7ZUitq+n0HJ+8ZaOHUxppfe6dRZb6ZD8lAn56SDyaqH7UlcdqS/5LKFiiMqDSjonw
         H7rQ==
X-Gm-Message-State: AOAM531BrK84mYTZMae1covUPDly5ekAWPGqIJNfcwXgc4GoCsvKvc+t
        gAGXI8QirRiWnHuCbyXeuJZg9XZIK+owmksUPJNfzw==
X-Google-Smtp-Source: ABdhPJw0G6CbvuXojTz0DEQfjC8hW/vyZAE4oeQjTVpHpNO2gXIiI69QIvEFy8ZZF35IJs0vUQ1miDcDwk3aoGuHm0Y=
X-Received: by 2002:a19:6c2:: with SMTP id 185mr8308729lfg.441.1600328467251;
 Thu, 17 Sep 2020 00:41:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200901144324.1071694-1-maz@kernel.org> <20200901144324.1071694-9-maz@kernel.org>
 <CGME20200914130601eucas1p23ce276d168dee37909b22c75499e68da@eucas1p2.samsung.com>
 <a917082d-4bfd-a6fd-db88-36e75f5f5921@samsung.com> <933bc43e-3cd7-10ec-b9ec-58afaa619fb7@nvidia.com>
 <3378cd07b92e87a24f1db75f708424ee@kernel.org>
In-Reply-To: <3378cd07b92e87a24f1db75f708424ee@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 17 Sep 2020 09:40:56 +0200
Message-ID: <CACRpkdYvqQUJaReD1yNTwiHhaZpQ9h5Z9DgdqbKkCexnM7cWNw@mail.gmail.com>
Subject: Re: [PATCH v3 08/16] irqchip/gic: Configure SGIs as standard interrupts
To:     Marc Zyngier <maz@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Sumit Garg <sumit.garg@linaro.org>, kernel-team@android.com,
        Florian Fainelli <f.fainelli@gmail.com>,
        Russell King <linux@arm.linux.org.uk>,
        Jason Cooper <jason@lakedaemon.net>,
        Saravana Kannan <saravanak@google.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Will Deacon <will@kernel.org>,
        Valentin Schneider <Valentin.Schneider@arm.com>,
        linux-tegra <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Sep 16, 2020 at 5:11 PM Marc Zyngier <maz@kernel.org> wrote:

> Can you try the patch below and let me know?

I tried this patch and now Ux500 WORKS. So this patch is definitely
something you should apply.

> -                       if (is_frankengic())
> -                               set_sgi_intid(irqstat);
> +                       this_cpu_write(sgi_intid, intid);

This needs changing to irqstat to compile as pointed out by Jon.

With that:
Tested-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
