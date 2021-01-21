Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C27EC433E0
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jan 2021 13:13:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EBFAC23A00
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jan 2021 13:13:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731690AbhAUNNF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Jan 2021 08:13:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731652AbhAUNMR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Jan 2021 08:12:17 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AECC3C0613CF
        for <linux-tegra@vger.kernel.org>; Thu, 21 Jan 2021 05:11:36 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id b26so2406158lff.9
        for <linux-tegra@vger.kernel.org>; Thu, 21 Jan 2021 05:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5SfYgMEZhXd25eYi6qDsESTLBn/H15YeTrdDgpcnnLg=;
        b=XqZam54V6WNMaJGpQ/zvStXdECi0C+QtAqbDl16uTP8QioYtk1POCI5rq4ekLBZUIz
         kqDKzYSX8IHExWGey4zMVWfm90PVJegAsI9pSoEhlbTENGMDh6pSp4b5tlefIzBvwoB7
         swLIZazE6kk/8MNF4dLmLSJIrM8sHNzVLmNYgrRKEF5y/duOdwPTw5jSGwqDUcPL2yOW
         /3gI2Ht6mM2RpqVZMAsGhxcMSW0j4+Drz600DkSUVF++LOFmjgQVLj7ePlqSQPMe6O5m
         RCXQMtC2csH8UIsDZyKtdZkpiiK+RX3uZ5/KpaVAust1eNvovi0wfgU+mm2jEKTPOJXO
         r0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5SfYgMEZhXd25eYi6qDsESTLBn/H15YeTrdDgpcnnLg=;
        b=JeBdEdcOJxZ3WK5KdQQZyKgDzWxltPqedpQyERn4K/7GhqOGT8p7B9Vz9papSiYhP0
         kJHionRB9SDZ26TDo7wnUa45QbXq19LdzeDdpA+Lp2/Ewr12aTVpJcHrCsle5c8D3jzf
         48YkNHzFKKm1geDKjLSX3BXm9UE7BR4cVzMM69RkAGO9k90Vrc/+qbvbTKu+ynGD2y69
         aFMDhZQ4UhclMjN+4OmXd5fQjasFVsDmzT4g3JgSa4SYgjkU/wiA2nF2kOLOEpBxE3Bx
         /GTH7EeZZ2U+45xKhu9mWjmiCjZgvzyBT/PUKBqNkvPkjPkzmulsx4pqJYTSyZfw5CpP
         DCgQ==
X-Gm-Message-State: AOAM531mdXWra5G13/MXxCCefyGlqrH3hnl2HhK/XzgAVqRY2nGPXI6K
        /FTLyfGoZneHlgxWyJOlaFSLXULpjy/au6xGK9Z4ig==
X-Google-Smtp-Source: ABdhPJwFTZwp0woXY9zVcoMioOYsSx1rGdrNSXqJ/is4tl/LS3ywlrqFOWHMdDa3yy6WG1BJ0UNlQtoKVhMMhIRbxeI=
X-Received: by 2002:ac2:5597:: with SMTP id v23mr6289121lfg.649.1611234695050;
 Thu, 21 Jan 2021 05:11:35 -0800 (PST)
MIME-Version: 1.0
References: <20210120080522.471120-1-saravanak@google.com> <20210120080522.471120-2-saravanak@google.com>
In-Reply-To: <20210120080522.471120-2-saravanak@google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 21 Jan 2021 14:11:24 +0100
Message-ID: <CACRpkdbEC6duR=fJQD_Nw9o=HW0DEe2_Ks3SYCgJmkOjzKz3Jg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] of: property: Add fw_devlink support for "gpio"
 and "gpios" binding
To:     Saravana Kannan <saravanak@google.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
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

On Wed, Jan 20, 2021 at 9:05 AM Saravana Kannan <saravanak@google.com> wrote:

> To provide backward compatibility for boards that use deprecated DT
> bindings, we need to add fw_devlink support for "gpio" and "gpios".

You do some more stuff in the patch so describe that too.
Especially the check for hogs and #gpio-cells.
Describe why you do that. Maybe even with a comment in
the code because I don't think everyone will understand.

> +       if (strcmp(prop_name, "gpio") && strcmp(prop_name, "gpios"))
> +               return NULL;

This part is easy to understand.

> +       if (of_find_property(np, "gpio-hog", NULL))
> +               return NULL;
> +
> +       if (of_parse_phandle_with_args(np, prop_name, "#gpio-cells", index,
> +                                      &sup_args))
> +               return NULL;

This part is hard to understand. Insert comments and tell the reader
of the code what is going on and why.

Yours,
Linus Walleij
