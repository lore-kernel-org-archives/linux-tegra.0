Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A00C8C433F5
	for <linux-tegra@archiver.kernel.org>; Sun,  3 Oct 2021 22:02:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7CEEB61029
	for <linux-tegra@archiver.kernel.org>; Sun,  3 Oct 2021 22:02:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231808AbhJCWEI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 3 Oct 2021 18:04:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231790AbhJCWEH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 3 Oct 2021 18:04:07 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EEB6C061781
        for <linux-tegra@vger.kernel.org>; Sun,  3 Oct 2021 15:02:19 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id u18so63707820lfd.12
        for <linux-tegra@vger.kernel.org>; Sun, 03 Oct 2021 15:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sryZZWOb+Z8lt57Kp1waSiIepNfRLtFgQuykU/s70UY=;
        b=vrk9/2uJIRZZxlXfTkUaUVXdhC99Q+8vIzJoCDlBhZZqzDclY3nateRSufwL1SVC2N
         dt25zKGwP472R1HYjBxNzox9NHqPDwSVxstNecwC/BEaHUZYPAi3p/LleUtbnqdlgash
         Lc8R0Q38Tjxde6KiMMj4iecFSZ9YhzUTEdK19lQD9M53D3z2cIZtXow3HbkIh1abYQvS
         zsQ3eUO1fvcNc2vJFgIP9q8EqKgw/PfznsZx16yxyEfpsDd8hIBOUOaq9SRhshi6WCoE
         uKIgidfHdNIdPNHVZ9BJyE5PFdJWot2sFTHs3868v/ib1Xln+3XA7YSEnDhQkoT2NHv8
         NqBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sryZZWOb+Z8lt57Kp1waSiIepNfRLtFgQuykU/s70UY=;
        b=vHwSkGbWccFR09kePzPE088r1bBVOWQDy2iDVnED5eWvb4YRuMld0DOXs2r/x/Ja57
         v3UafTFaThDx2wq4u9yG0OmBiueLiJbN9A5/uxSsrNumQPyPhB8cB8ld6am5EGqf8lOM
         qxQJFYEqt874vEV1P8x/kGZPucFqSjRNW3n8LuNsOe16hNyouKMOOGZB6RnfluScdFfF
         HLfPI8F9Q87tcQbls+uqXMKFCawxNVwTN3e6G0cCNBQs/d+XaFlIsh9PGfX/X3jorFfm
         rR6YiCmSn4R6mEieoEebz5nPk0gQ1szJJasiigwEVuCdu/iAcfxkt+XT8iZyVcGjvp3s
         oEng==
X-Gm-Message-State: AOAM53138clcs9NdWhHhTVHB/EtddDpyk6N4+C+mH6ZZ2PiA4890GR/y
        5za4PWeFN3QF8LjPcDQC+oKr9uBn9VC5ag/w97mcrQ==
X-Google-Smtp-Source: ABdhPJyZK4OJYvU+mdcWAQOrh2+vdlNRlc0qq1hNRXAX9txSIOFqUHqzfk2zSxeKXbOyzyILb2hsjIestzb0c9Ric3M=
X-Received: by 2002:a19:c10a:: with SMTP id r10mr9127968lff.95.1633298537543;
 Sun, 03 Oct 2021 15:02:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210930232617.6396-1-dipenp@nvidia.com> <20210930232617.6396-10-dipenp@nvidia.com>
In-Reply-To: <20210930232617.6396-10-dipenp@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 4 Oct 2021 00:02:06 +0200
Message-ID: <CACRpkdZqB=abQ-p4muj2myn2E7tzrc2+YnFKs4fQogxmZX+x9g@mail.gmail.com>
Subject: Re: [RFC v2 09/11] tools: gpio: Add new hardware clock type
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kent Gibson <warthog618@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Oct 1, 2021 at 1:26 AM Dipen Patel <dipenp@nvidia.com> wrote:

> gpiolib-cdev is extended to support hardware clock type, this
> patch reflects that fact.
>
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
