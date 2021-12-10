Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7306AC433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 10 Dec 2021 19:04:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245742AbhLJTHg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 10 Dec 2021 14:07:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245600AbhLJTHe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 Dec 2021 14:07:34 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C127C0617A1
        for <linux-tegra@vger.kernel.org>; Fri, 10 Dec 2021 11:03:57 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id m6so7934606lfu.1
        for <linux-tegra@vger.kernel.org>; Fri, 10 Dec 2021 11:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=YRIlmq1+iZrjFvchtZLa2XEWbp2/+L1kaW6ixwhNcKk=;
        b=dC55T7NVec8zDfqI25DC4orPrU+YljERqdmhvP8BSBfOEWGs7/rj+vdItXMhXXpORv
         eqMpdz/v19NnizJpYYgCcjJRlV+J6XYem0gws42YVfFsXBJmlqrGGE344hZBH/SVGQro
         ZWBUDmPBDw4rOgQ57hZJSHhW9QwTw39/ALNiRcI2h8V8YfSlfCdsVyd3Nza14RKySlsH
         /tvXJPmp8AaLbq6w0IZIbr3IBqhe0TZyHifZFrVa0z4PldqmMPPOkjqUzT2l0qK21eAI
         Tr0Khghv2uXuSopdQZ6ruVbeDM3Ymgu8WJnj+/lUgLWY285GHGHm3Ejo8K4fF6rO2qD2
         u3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=YRIlmq1+iZrjFvchtZLa2XEWbp2/+L1kaW6ixwhNcKk=;
        b=3pDleSg/vlPn93z1niUDAtDqjDsZ/zRMfPzMkRYsIrZb563LPlAm6ysqhVg6eln+MV
         Kx3pxlpF3ylWCxf13BemlAPLY15EE6IolQGkgQh5lnKOuzQu1Zap0yc5vxODCcDjN5p2
         IVOqGZnFqswuvyW3NeeC0a2JM2/UFt+kp8Vqn0YeEE5OQNGdvP+5AC/jE6MUUJTtkx8Q
         vcujFbzNrSLiVPDG5xS/9Uz/u8OsSzK3tcycdnIeZZRGATKCrorCrlFibXZLRxTHA286
         FcZcybZ8OcETSqHhL+758B1yCeS69xErPRVpHfBn/tF/5JhpWWSHlt/MZ/JH0B4vnqen
         TP1A==
X-Gm-Message-State: AOAM530H2WLou0ySJYyNDpOv3O3ELMX/3/jsIXT5g4CQaWwmx8ur7ehW
        liRkPLdmqVq/CT8XKfH4MY+9MzoYJCCW6xVqsZ/sWw==
X-Google-Smtp-Source: ABdhPJyoOVN7O/8fGgT5BJ/zKJF8IlTUbgLWM2OtohJe4qNABNx3FzVkhf8SEU9GV7/dxhmyOUNT4D+MIizWI79sKB4=
X-Received: by 2002:ac2:4d19:: with SMTP id r25mr13734844lfi.82.1639163035097;
 Fri, 10 Dec 2021 11:03:55 -0800 (PST)
MIME-Version: 1.0
References: <20211210165528.3232292-1-nathan@kernel.org>
In-Reply-To: <20211210165528.3232292-1-nathan@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 10 Dec 2021 11:03:43 -0800
Message-ID: <CAKwvOdktm1p-ZxdOmQnGvdeq1zbPd1C5c7Mp0Co55=prccdcrg@mail.gmail.com>
Subject: Re: [PATCH v2] soc/tegra: fuse: Fix bitwise vs. logical OR warning
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Dec 10, 2021 at 8:57 AM Nathan Chancellor <nathan@kernel.org> wrote=
:
>
> A new warning in clang points out two instances where boolean
> expressions are being used with a bitwise OR instead of logical OR:
>
> drivers/soc/tegra/fuse/speedo-tegra20.c:72:9: warning: use of bitwise '|'=
 with boolean operands [-Wbitwise-instead-of-logical]
>                 reg =3D tegra_fuse_read_spare(i) |
>                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
>                                                ||
> drivers/soc/tegra/fuse/speedo-tegra20.c:72:9: note: cast one or both oper=
ands to int to silence this warning
> drivers/soc/tegra/fuse/speedo-tegra20.c:87:9: warning: use of bitwise '|'=
 with boolean operands [-Wbitwise-instead-of-logical]
>                 reg =3D tegra_fuse_read_spare(i) |
>                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
>                                                ||
> drivers/soc/tegra/fuse/speedo-tegra20.c:87:9: note: cast one or both oper=
ands to int to silence this warning
> 2 warnings generated.
>
> The motivation for the warning is that logical operations short circuit
> while bitwise operations do not.
>
> In this instance, tegra_fuse_read_spare() is not semantically returning
> a boolean, it is returning a bit value. Use u32 for its return type so
> that it can be used with either bitwise or boolean operators without any
> warnings.
>
> Fixes: 25cd5a391478 ("ARM: tegra: Add speedo-based process identification=
")
> Link: https://github.com/ClangBuiltLinux/linux/issues/1488
> Suggested-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks for the revised patch!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>
> v1 -> v2: https://lore.kernel.org/r/20211021214500.2388146-1-nathan@kerne=
l.org/
>
> * Change return type of tegra_fuse_read_spare(), instead of changing
>   bitwise OR to logical OR in tegra20_init_speedo_data() (Micha=C5=82).
>
> It would be nice to get this fixed sooner rather than later, as ARCH=3Dar=
m
> allmodconfig is broken due to -Werror.

Yes please let's try to get this into 5.16-rc5 if possible!

>
>  drivers/soc/tegra/fuse/fuse-tegra.c | 2 +-
>  drivers/soc/tegra/fuse/fuse.h       | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/soc/tegra/fuse/fuse-tegra.c b/drivers/soc/tegra/fuse=
/fuse-tegra.c
> index f2151815db58..e714ed3b61bc 100644
> --- a/drivers/soc/tegra/fuse/fuse-tegra.c
> +++ b/drivers/soc/tegra/fuse/fuse-tegra.c
> @@ -320,7 +320,7 @@ static struct platform_driver tegra_fuse_driver =3D {
>  };
>  builtin_platform_driver(tegra_fuse_driver);
>
> -bool __init tegra_fuse_read_spare(unsigned int spare)
> +u32 __init tegra_fuse_read_spare(unsigned int spare)
>  {
>         unsigned int offset =3D fuse->soc->info->spare + spare * 4;
>
> diff --git a/drivers/soc/tegra/fuse/fuse.h b/drivers/soc/tegra/fuse/fuse.=
h
> index de58feba0435..ecff0c08e959 100644
> --- a/drivers/soc/tegra/fuse/fuse.h
> +++ b/drivers/soc/tegra/fuse/fuse.h
> @@ -65,7 +65,7 @@ struct tegra_fuse {
>  void tegra_init_revision(void);
>  void tegra_init_apbmisc(void);
>
> -bool __init tegra_fuse_read_spare(unsigned int spare);
> +u32 __init tegra_fuse_read_spare(unsigned int spare);
>  u32 __init tegra_fuse_read_early(unsigned int offset);
>
>  u8 tegra_get_major_rev(void);
>
> base-commit: 0fcfb00b28c0b7884635dacf38e46d60bf3d4eb1
> --
> 2.34.1
>
>


--=20
Thanks,
~Nick Desaulniers
