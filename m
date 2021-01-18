Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E124DC4332D
	for <linux-tegra@archiver.kernel.org>; Mon, 18 Jan 2021 22:13:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C0B4523102
	for <linux-tegra@archiver.kernel.org>; Mon, 18 Jan 2021 22:13:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387894AbhARWNT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 18 Jan 2021 17:13:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387550AbhARWNO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 18 Jan 2021 17:13:14 -0500
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 891C9C061575
        for <linux-tegra@vger.kernel.org>; Mon, 18 Jan 2021 14:12:28 -0800 (PST)
Received: by mail-yb1-xb2d.google.com with SMTP id f6so14065192ybq.13
        for <linux-tegra@vger.kernel.org>; Mon, 18 Jan 2021 14:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FaHbxXuwER2O3nBPLqid/e1s175Jmp9RRwwfzg3SJhU=;
        b=GTFPoZ2Gt8Gtrwd34j7bYZ0JqPIv09WvAqLAQlrRDBiKHpFEcrmTDhGl2SSQg2F2/Z
         b0xL8EfCS447YyGVsfC7dJqo+m3qmsWbajYQEFjWJFm/BEL0MCHR4GKbpmrqYn3Izn98
         K54rU8Mcur0YFDWHRXt0+7S1yzxC14ir18b8eHwznK6UyY2lMuLJQoEuPqqPr/XOii3/
         QejFBdcybrhQlfvwJs+TdPsbu9vB0sRVDRdtwXxVyLAsHKhhUBcz5I7kVudHXOFsnth8
         B3VVuZRlHBjqEYLh/pwW/VJMvYHbhkEeDKKc30noGMnYAhpsxwRpVFjidV4p3yRorm2d
         3IoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FaHbxXuwER2O3nBPLqid/e1s175Jmp9RRwwfzg3SJhU=;
        b=fFBCYXq/E5Er5YU+c18eF1FIJiFMs6b3dcHcLwX21xWyKYHh9/Wfzvu2+7Ka6Zq3Tw
         TNjYTx3Z322/nIDfyFEKB6OXK31Zo0SawZOOnEvxr+QWfXWa0OyiormOXpjeGdSxDyVJ
         Mm+fIZEPTw8bKG217OJUj3vqtTQlHV5QRd6NkxvWOx69/k9d5eEavQ2MLYqiP9J9JxHs
         a6xiNjiEf/kATPFshi06WRjSNilemTHbk1JPzzsfakedLLt7lwirZ0vRr6Wx2XdMsk5K
         /H0G27WeU9XzMZspbn6WkOcM+mlnhPpOU6PXKSoSek518fgmbWxO/Q73bJxft5ugU6A3
         sjjg==
X-Gm-Message-State: AOAM533G+1RnHCzk5vbcp1R9z0S63WpSIzCHrgjkHojHel6dS0BNa5Id
        VMmP6WvEAcgBLh62JW/+zxy/JwO/zF5n3gfgA9mqaQ==
X-Google-Smtp-Source: ABdhPJwSeF9+i5o7KM4nSo55gYL8cquLutstTwhy1jmw/db+Pj8LFhfBWvY5Tx6JMHYUNcjo2xoAuOp+GslH6Bu/JWk=
X-Received: by 2002:a25:77d4:: with SMTP id s203mr1994972ybc.32.1611007947513;
 Mon, 18 Jan 2021 14:12:27 -0800 (PST)
MIME-Version: 1.0
References: <20210115210159.3090203-1-saravanak@google.com> <CACRpkdYrzaFuWkbTe7Fmos4Bk4Ojt6wbqayDjyrS7sf98P-Rbg@mail.gmail.com>
In-Reply-To: <CACRpkdYrzaFuWkbTe7Fmos4Bk4Ojt6wbqayDjyrS7sf98P-Rbg@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Mon, 18 Jan 2021 14:11:51 -0800
Message-ID: <CAGETcx9t3R-k0ttiaBUqcveqnXMX75xuTcKPSo9J6WJOfgSP8w@mail.gmail.com>
Subject: Re: [PATCH v1] of: property: Add fw_devlink support for "gpio" and
 "gpios" binding
To:     Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Android Kernel Team <kernel-team@android.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Jan 18, 2021 at 7:32 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Fri, Jan 15, 2021 at 10:02 PM Saravana Kannan <saravanak@google.com> wrote:
>
> > To provide backward compatibility for boards that use deprecated DT
> > bindings, we need to add fw_devlink support for "gpio" and "gpios".
> >
> > Cc: linux-tegra <linux-tegra@vger.kernel.org>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Fixes: e590474768f1 ("driver core: Set fw_devlink=on by default")
> > Tested-by: Jon Hunter <jonathanh@nvidia.com>
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
>
> "gpios" is a valid non legacy property I think.

I checked :) Quoting the documentation [1]:
"While a non-existent <name> is considered valid for compatibility
reasons (resolving to the "gpios" property), it is not allowed for new
bindings."

[1] - https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/gpio/gpio.txt#n8

> Anyways:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks!

Greg/Rob,

Can we pull this into driver-core-next please? It fixes issues on some
boards with fw_devlink=on.

-Saravana
