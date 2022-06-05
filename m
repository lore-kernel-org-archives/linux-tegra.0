Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE066C43334
	for <linux-tegra@archiver.kernel.org>; Sun,  5 Jun 2022 16:16:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351207AbiFEQQn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 5 Jun 2022 12:16:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351061AbiFEQQm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 5 Jun 2022 12:16:42 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 175864D9FC
        for <linux-tegra@vger.kernel.org>; Sun,  5 Jun 2022 09:16:41 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id me5so24223522ejb.2
        for <linux-tegra@vger.kernel.org>; Sun, 05 Jun 2022 09:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DOd91IrpVsMvaCem3N2Wlo4e4L7ezusJLGgTEZxYBBA=;
        b=gM5L49Q5RNeeLmx4jz/0qVJoD+bjMCPlzbAXCJbNiWO9sHNBhK0oC+q5dS9DI0hDF9
         aB88gWRVtT/asQV44soIAqkaWx/vgut/QdrGnnJ3lmg5okT37PQPXX7ZVKAR7WmBVVPZ
         kc7/YY3mLvNZdYMjYfi9IB27m25VBDCVJkLyQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DOd91IrpVsMvaCem3N2Wlo4e4L7ezusJLGgTEZxYBBA=;
        b=tAjiocKRwA3XOqQB6l0n1VOyMlcZfTtJLZiWrR4821GaFDnLhMfqm2TVLiDL7Hz3qr
         sOiNBUCkVBE4LVAl3hOCQZvPXQ3aZZVDb4O/3xo/iiutbtPmKWBDkHrZ2j9HWoO8eKRA
         awjEnqDv5X/eMvckUNLfa+z5jDe1kOUgPhSYqPOeDEERHljYTSS7Fqg8qwdXWbS/cIVU
         YJ2HukgYHM3kOMbk1mHXScl0b9ajInpfFz51xMta/Ob8outDA0RWOuh5Uqa+pwzn0/2U
         diJHkxuRsCTmiQPQmo098wtpnEmzAtzvKY1DHm4kPX9E5o+vVUkyHhRRwt1vHhY+SZgt
         mS3g==
X-Gm-Message-State: AOAM531FaOiKzXoMFd2SbvpvjqsKZzoiSwFnBwVZXEkiupvaLTIGU0oR
        il7dY3sgaHIaeUmVED8bBixgYuITX2HvM1y2
X-Google-Smtp-Source: ABdhPJyxfGNXRQeg7FuvZvmE3WlgGdfn+BdeyouNef3PgZWLVhNzRLMPAh+Yipc+8AAkpXN5Z9ar5g==
X-Received: by 2002:a17:907:94c1:b0:6ff:7dc9:ac22 with SMTP id dn1-20020a17090794c100b006ff7dc9ac22mr17558989ejc.768.1654445799241;
        Sun, 05 Jun 2022 09:16:39 -0700 (PDT)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com. [209.85.128.41])
        by smtp.gmail.com with ESMTPSA id g2-20020a1709063b0200b0070a5ba0669dsm4353719ejf.218.2022.06.05.09.16.38
        for <linux-tegra@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jun 2022 09:16:38 -0700 (PDT)
Received: by mail-wm1-f41.google.com with SMTP id c5-20020a1c3505000000b0038e37907b5bso8837424wma.0
        for <linux-tegra@vger.kernel.org>; Sun, 05 Jun 2022 09:16:38 -0700 (PDT)
X-Received: by 2002:a05:600c:4982:b0:39c:3c0d:437c with SMTP id
 h2-20020a05600c498200b0039c3c0d437cmr13980053wmp.38.1654445797876; Sun, 05
 Jun 2022 09:16:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220603113908.78777-1-thierry.reding@gmail.com>
 <CAHk-=wiVxF5VLFSuet3OrC7u1Gfb-ZyMs4W-KXAc42rXPRWmhA@mail.gmail.com> <CACRpkda0KiyjV27WEP_MYpvWXyG787L9PJZaP_hnXh_DFpSj5Q@mail.gmail.com>
In-Reply-To: <CACRpkda0KiyjV27WEP_MYpvWXyG787L9PJZaP_hnXh_DFpSj5Q@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 5 Jun 2022 09:16:21 -0700
X-Gmail-Original-Message-ID: <CAHk-=wirNAe3ApyCWMAyz-QFaNX_oNCzc8SSX7a52pV=+OQ6Qg@mail.gmail.com>
Message-ID: <CAHk-=wirNAe3ApyCWMAyz-QFaNX_oNCzc8SSX7a52pV=+OQ6Qg@mail.gmail.com>
Subject: Re: [GIT PULL] hte: New subsystem for v5.19-rc1
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "D, Lakshmi Sowjanya" <lakshmi.sowjanya.d@intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Dipen Patel <dipenp@nvidia.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Saha, Tamal" <tamal.saha@intel.com>, bala.senthil@intel.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sat, Jun 4, 2022 at 1:11 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> Another provider did come up, and were requested (by me) to work with
> Dipen on the subsystem in august last year, that was the Intel PMC in the
> Elkhart and Tiger Lake platforms and forward

Ok, I've pulled this now, even if I don't love the "hte" name. I
despise specialized TLA's that aren't some obvious "if you're a kernel
developer, you know what this means".

                       Linus
