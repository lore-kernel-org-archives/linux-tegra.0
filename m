Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A730C433E6
	for <linux-tegra@archiver.kernel.org>; Mon,  1 Feb 2021 20:06:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BDD9F64EBD
	for <linux-tegra@archiver.kernel.org>; Mon,  1 Feb 2021 20:06:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232927AbhBAUF6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 1 Feb 2021 15:05:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233034AbhBAUF3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 1 Feb 2021 15:05:29 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B2FAC061756
        for <linux-tegra@vger.kernel.org>; Mon,  1 Feb 2021 12:04:49 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id m76so11381435ybf.0
        for <linux-tegra@vger.kernel.org>; Mon, 01 Feb 2021 12:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L9sw9hSS8Z/uEqXF5ukYAI1b9wH2rffWPop3oA1u9N8=;
        b=OaqXg573LwGDOY7qNJNrh0QcBeqsUIIqangIggwrbBQxOBAtBk3cpdcdqa2WsrVSS2
         laGL44tiLg1XML8BpM1iubpZljC7ujabB9YqWWAdNvvTZgQzuTE9+OO8/JkhCszWCvNv
         LrxCQeksu44w3KXdZXVK1HUeoBD/nP1TJub5dyxoB6NOkN4sBiBXm26tmGqhhOKPK7C8
         kUo91KC2IK7GUrmmCz1/CGH7H1GK/IzjMDzoTMhzf0Ac4nl7COJGy6l0plw/GiPX/H5B
         mfD9sO3BVpSlv61DGdi+uXE1iG5Ct92fELaimdzlNifeFGUB2wl92f1tL4+b4IvWDjk0
         zyAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L9sw9hSS8Z/uEqXF5ukYAI1b9wH2rffWPop3oA1u9N8=;
        b=By01gvsaIrQ8ztUKYJoUO3MOahJQTzBhkiVV/I/0YqjlMO2GkPuDuEk/1yl3tgJRI/
         NkD7sgQTYAr0WPTrAecpA3GPwc5ZuerR/d6AGTOSsKyNYmscH0vvKSxjCR2H1r2yAcTx
         glu0LMRl0/3Qp5RPhvMFLIMqpCjRDA7go5BOijVTly+d0cnIaPVH8pP5DMyvP61aaWQy
         jgvL3nUSUdwADL7EdTxAT8xWAda2YUuQ9eX9PIvLcFohRxWLLeGdhOUVgw3OD8LFVT7a
         MJQdJg32Gw+bvUoXYXljHTdtScZuqyGz9fkk/EEAOb60z43KsRkbZHd0Y47IcGXCsXhS
         yaoQ==
X-Gm-Message-State: AOAM533vsaQ3GmosofVGOhx7WyBuQ1YA9CYbgjrruenj3vVvKXezb5WE
        P14J936py2uxvbHqR2oiTJz7O7lGnDursq4pPqRs4Q==
X-Google-Smtp-Source: ABdhPJw4RFUaM2c3Knj9a5xMEVR7SKifxohoJtjamohf1LlW3VtIH11Ase4ZEm/ickH5qdpZf1yRO+hhRtckErqk53A=
X-Received: by 2002:a25:c683:: with SMTP id k125mr29048716ybf.32.1612209888649;
 Mon, 01 Feb 2021 12:04:48 -0800 (PST)
MIME-Version: 1.0
References: <20210121225712.1118239-1-saravanak@google.com>
 <20210131163823.c4zb47pl4tukcl7c@viti.kaiser.cx> <CAGETcx8A_+Y0sCLPdyeeT+rHOsAPsmg4LVn_ahF0NaD6hfRiZw@mail.gmail.com>
 <20210201105204.GA1467@martin-debian-1.paytec.ch>
In-Reply-To: <20210201105204.GA1467@martin-debian-1.paytec.ch>
From:   Saravana Kannan <saravanak@google.com>
Date:   Mon, 1 Feb 2021 12:04:11 -0800
Message-ID: <CAGETcx91CdvqYpSr6Eg45jrToEFLPBSgzMxTjHh=1rBqi8V3pg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] of: property: Add fw_devlink support for more props
To:     Martin Kaiser <martin@kaiser.cx>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
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

On Mon, Feb 1, 2021 at 2:52 AM Martin Kaiser <martin@kaiser.cx> wrote:
>
> Hi Saravana,
>
> Thus wrote Saravana Kannan (saravanak@google.com):
>
> > This series [1] has a high chance of fixing it for you if
> > CONFIG_MODULES is disabled in your set up. Can you give it a shot?
>
> sure. This fixes things for me if CONFIG_MODULES is disabled. Booting is
> still stuck if modules are enabled.
>
> > The real problem is that arch/arm/mach-imx/avic.c doesn't set the
> > OF_POPULATED flag for the "fsl,avic" node. fw_devlink uses this
> > information to know that this device node will never have a struct
> > device created for it. The proper way to do this for root IRQCHIP
> > nodes is to use IRQCHIP_DECLARE(). I Cc'ed you on a clean up patch for
> > IMX [2], can you please give [2] a shot *without* [1] and with
> > CONFIG_MODULES enabled? Things should boot properly with this
> > combination too.
>
> This works as well.

Thanks for testing both. Mind giving Tested-by for [1] too?

-Saravana
