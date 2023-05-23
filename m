Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB319C77B75
	for <linux-tegra@archiver.kernel.org>; Tue, 23 May 2023 09:18:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236423AbjEWJSR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 May 2023 05:18:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236370AbjEWJSI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 May 2023 05:18:08 -0400
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com [IPv6:2607:f8b0:4864:20::a35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 316B71BB
        for <linux-tegra@vger.kernel.org>; Tue, 23 May 2023 02:17:51 -0700 (PDT)
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-4572fc781daso904097e0c.2
        for <linux-tegra@vger.kernel.org>; Tue, 23 May 2023 02:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684833470; x=1687425470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pk8OMJU/i+DL9domkx1SxECiIr/Cw8hUh9Jh7kwNm3g=;
        b=Bdx1POUAqFJkjBgUi/GS0mdhya6BUMSBtxOpkjIYslelvZMDyOxdXjpHp6KFSmNEva
         DoOqH5YE55cxw/OsjFJJBF7wk+RyoXA8VtxHSZvBNTT0mSO8EX9QoDi84yUx7KqeYkWM
         oqiwIFlMfqGgdQYrLVnv/dQdV1Exbu+tyWFoImqXR8cukKC/BBLWaXTz+7CeDZc5dyUO
         mv7Iigd20c11CjpzH0Rhi20M4szWE9i55a9Z3Y0CGMM6wTnhtwEoBPSPVTp1v1eRPpOD
         jaQYgGUuWkjbZD8Ehm6yhyBOBpTB0prxNiEUCIpa25Ccs88q+Ero7ifnfv/B6SOMwhQ2
         e/aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684833470; x=1687425470;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pk8OMJU/i+DL9domkx1SxECiIr/Cw8hUh9Jh7kwNm3g=;
        b=J9LFTyxjZVEAV1xASTK8W8ISYUpoqpEFuwO5guW+kMrA/3ISDZBNonfe72plTEv6M4
         Q5rko1DUmFrW74Xvu8QsgXORjAj+6GAFGCVQUEXm6OyGGYpgQYwMA5kDXSGYIcTT5Rue
         ODKAoWs0gPeXD87K3/4SP36T5yM1dF4ypDGzvay/15e0w3N3QhoEL8/jRMu+ie2pPDqA
         tegmb16EdeUCkoNFoEM2ZZVHCGlqDqZ3Q2/pc3XF2nxbk9X1us+DXCO5+O8uhbSo1Nod
         NV32vMz/ayd3dSMQodFonBcKFmYkrHfT2tGzl647BUoRvXD3YJJuQx/Ins8Z9DS78tQI
         Nv+Q==
X-Gm-Message-State: AC+VfDyONmv+/GvD96zy1/+EJDscW8m3GmWCOA1ZrEbYrLFSXVpFcykG
        8TDgZoggUjSegRlTatBgQh6s4876aolFxYKDOUDB8w==
X-Google-Smtp-Source: ACHHUZ7CHtarrucWGhxACF3S5WCro6uTcboj0GJAKcNxdbnYzGOU1NsbYTqH38dbQghvd72lmfdBvFudK2a6RwnqVzQ=
X-Received: by 2002:a05:6102:2f4:b0:437:e5d1:a0e0 with SMTP id
 j20-20020a05610202f400b00437e5d1a0e0mr3647966vsj.19.1684833470145; Tue, 23
 May 2023 02:17:50 -0700 (PDT)
MIME-Version: 1.0
References: <Yz62XmiH8YG3Dtsf@orome> <20221007055936.5446-1-pshete@nvidia.com>
 <CACRpkdYkJdZ67kyTnDg3xFzO8MJhC0nHK98O+KJwCLBqV_5f-Q@mail.gmail.com> <1de5b7fb-a39e-183a-1407-7d6489f706b4@nvidia.com>
In-Reply-To: <1de5b7fb-a39e-183a-1407-7d6489f706b4@nvidia.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 23 May 2023 11:17:39 +0200
Message-ID: <CAMRc=MdCiieaYR3BeATm+2o8UDz+9D5vs=dTNDAavi19BmKZ8w@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: tegra186: Check GPIO pin permission before access.
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Prathamesh Shete <pshete@nvidia.com>, thierry.reding@gmail.com,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        smangipudi@nvidia.com, kyarlagadda@nvidia.com,
        Manish Bhardwaj <mbhardwaj@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, May 23, 2023 at 8:22=E2=80=AFAM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
>
> On 17/10/2022 10:31, Linus Walleij wrote:
> > On Fri, Oct 7, 2022 at 7:59 AM Prathamesh Shete <pshete@nvidia.com> wro=
te:
> >
> >> This change checks if we have the necessary permission to
> >> access the GPIO. For devices that have support for virtualisation
> >> we need to check both the TEGRA186_GPIO_VM_REG and the
> >> TEGRA186_GPIO_SCR_REG registers. For device that do not have
> >> virtualisation support for GPIOs we only need to check the
> >> TEGRA186_GPIO_SCR_REG register.
> >>
> >> Signed-off-by: Manish Bhardwaj <mbhardwaj@nvidia.com>
> >> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> >
> > Very nice patch!
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>
>
> I did not see this anywhere in the mainline/next. However, I also
> noticed that we don't have the correct email address for Bartosz (again).
>

I have only ever changed my address in MAINTAINERS once, so "again" is
not really the right term. And scripts/get_maintainer.pl should be
used anyway every time when submitting patches.

> Bartosz, let me know if you can pick this up? Thierry also ack'ed
> previously for Tegra too.
>
> FWIW ...
>
> Acked-by: Jon Hunter <jonathanh@nvidia.com>
>

This doesn't apply to v6.4-rc1. Prathmesh: could you rebase and resend?

Bart

> Thanks
> Jon
>
> --
> nvpublic
