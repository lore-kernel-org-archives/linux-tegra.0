Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 728DDC38145
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Sep 2022 13:22:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232401AbiIHNV6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 8 Sep 2022 09:21:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232110AbiIHNV3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 8 Sep 2022 09:21:29 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88DF3E5594
        for <linux-tegra@vger.kernel.org>; Thu,  8 Sep 2022 06:21:22 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id e18so24326574edj.3
        for <linux-tegra@vger.kernel.org>; Thu, 08 Sep 2022 06:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=yGzjUAVlbWD9K7WB5zdnXNvMsAG9MdKx18Dh/BG0fAc=;
        b=T+IPtcdLJg303fTaAq+ct5LWwvXOQ/rhVoGClZGMLoYPhMskJNU1QqUjBpaDX6bQB8
         aysHXs4c5+QV/fGHzpw6Lm9KAbX8P2lwqEZX62zLFZjvW8/0xTFB+5zF6AEa67/YiKBG
         oS/YRtgioKnhYbPZiAERB+c7qzh2bDvxLHeiNhcLDameybe8YdRmW2GRaUy94un4d/z5
         Am6C6RjA+Elb0Ua6loxzqY/pnzbTW0XbWcXVq0w53ZWmhdBtdM7k2Sq7jUOrRF9Z3iLo
         iiGJNf9dSTtQ2+bBF2K91nEj4KfaLqF2ZHeGg26GHAV1YTQ0Gd1J4qizLXne8F+NgrC1
         i83w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=yGzjUAVlbWD9K7WB5zdnXNvMsAG9MdKx18Dh/BG0fAc=;
        b=qE7pQnFNLvZXRco4kbPzQw99DBFEm/1QCc8YbtIexgpALIvAiZkbBTED8NENA14cod
         hyR57BT2smQ2UzjOyPec1Me1OtpAHWmQo4vuev+Fzd41+XjVVQMJ2qz+/XqQ2QGaEcxC
         x7TbqUY/ImtgBVxau2R6SmI972smSw1K0qZ0pg7BCSkTgG5+7P1WMP1g6u73XIIModVJ
         QLI4og+LX3iYEXz8JQGjlKbMSZeujntU7wysVTbJic3I5HHnxqijDcyUXfgYADCTShQq
         ku2zUsQPo9FuPdvWaOkSJb9Ph67y1+qFA+pizE88kJMCk0Yp1MU7bNcDZz4Ce57aJeOX
         b5Tg==
X-Gm-Message-State: ACgBeo3hax1aX0dRCkK/ymV9Gj+tr9a38xGDOkwI5CivzlxDXtLFuEAC
        lKOe0K8D0jyci6mbB6J/GAp2bj5gN29lQ/XzLoVi7Q==
X-Google-Smtp-Source: AA6agR5gu7ZZe9a+j6qGcOZMau8x3QW1vVI/bIdW6gIkpHsboKtJFXGRe4Kpf2DvG8FECjqzZPxoKKIEbjvKVFz3v08=
X-Received: by 2002:a05:6402:4517:b0:443:7fe1:2d60 with SMTP id
 ez23-20020a056402451700b004437fe12d60mr7126269edb.133.1662643281146; Thu, 08
 Sep 2022 06:21:21 -0700 (PDT)
MIME-Version: 1.0
References: <Yhe0pCpfeCpyfPWg@orome> <20220816102725.14708-1-pshete@nvidia.com>
In-Reply-To: <20220816102725.14708-1-pshete@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 8 Sep 2022 15:21:10 +0200
Message-ID: <CACRpkdbMnRNTLcCtqNjKpxWxMbAXLssnuBEuNqAfgDfj3XVfXQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: tegra186: add Tegra234 PMC compatible in GPIO driver
To:     Prathamesh Shete <pshete@nvidia.com>
Cc:     bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        jonathanh@nvidia.com, thierry.reding@gmail.com,
        smangipudi@nvidia.com, Manish Bhardwaj <mbhardwaj@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Aug 16, 2022 at 12:27 PM Prathamesh Shete <pshete@nvidia.com> wrote:

> Using this patch we are adding PMC compatible string for
> Tegra234 in GPIO driver so the IRQ hierarchy can be set.
>
> Signed-off-by: Manish Bhardwaj <mbhardwaj@nvidia.com>
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

It also has Thierry's ACK from v1.

Yours,
Linus Walleij
