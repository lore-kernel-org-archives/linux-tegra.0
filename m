Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7B87C433F5
	for <linux-tegra@archiver.kernel.org>; Wed, 17 Nov 2021 18:21:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD171630EF
	for <linux-tegra@archiver.kernel.org>; Wed, 17 Nov 2021 18:21:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239948AbhKQSYS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 17 Nov 2021 13:24:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239940AbhKQSYR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 17 Nov 2021 13:24:17 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBC5DC061570
        for <linux-tegra@vger.kernel.org>; Wed, 17 Nov 2021 10:21:18 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id u3so12816877lfl.2
        for <linux-tegra@vger.kernel.org>; Wed, 17 Nov 2021 10:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rxZZyaqSeECbHShUU1e6nyZolvCataFx7XMR5EnugzQ=;
        b=nV6v3kvHfDOsEHa//unuk7hKY+T8Ur2ySWyOBtNUwXxGo0Q+OZS2LIzQDzIbLzJ+Dm
         j/dOowu1LlkmuceMaozN0Jwv9xLst7l/Paoe/ND/GUMSezAzhHMjzKwEGCXqcT1kStLQ
         nnRJvjqZWtSNg4jDeQydDlmuCmtoZVNmVrCT1u4hJ6hlqfx8Ki4rUqp1dxQgiE7elSfH
         CDRRP8Lr/nS2+RawPguXhxIfRYQZ2ITy8MaFmJAlQfOk0e8+kdpdWprwhyMwJtFK32Ss
         aD8T4mLfBwvcw2mGvQVIB52ntFSDqcarxp8kHMzHD4um+7z7u+2np3tCbrnDO6vbgEO3
         T2xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rxZZyaqSeECbHShUU1e6nyZolvCataFx7XMR5EnugzQ=;
        b=ugKV1wEXrI4mTpbvWuuDJadrEnRYnF0L4cHBNBXrEPiKGrKZiZBzcrQQEhlVoKloRi
         KIGEzkwt2xVbM20S3eX4W2XVMdBVKX8goX9IU1/fH5MdL/leOc8DxFUa4WqgXD41+/cC
         VDJRPA6L+kYpOyVxUz3h+reA3yc3Yjs8C24oZZGvf9CkchAS5O1P2Kh6PR5mAZh08/Iu
         Ym3SnTMrsn5REUldFtTMrS0nzbMQA9EUI7AlxnE9phqkGB/Nyo68L9XqL2GbMq2fGXO7
         ZZOi+qLjawEChx7GRJFMvExyiAce2Bt/3PROdvbc2s+oSc/+UWUURA9f4GweqR/0e2Ic
         uVOA==
X-Gm-Message-State: AOAM533M55htVLs0Ko2ygybBIgsClwjUtwojvL6a/EhS2snSfxMeJiWD
        l3ZwmN71vqsGxxjtS8NPtRgDw80jVD8idO4bT+5/tA==
X-Google-Smtp-Source: ABdhPJyFikjXXqzOj6YkMgayYjCdOOLM33cYMaMMto7XQuyQf9aixUnlVx2PnbTYswd4ixaLlpqH/pKdJwSf4lvJCf0=
X-Received: by 2002:a05:6512:3b9c:: with SMTP id g28mr17505579lfv.651.1637173276868;
 Wed, 17 Nov 2021 10:21:16 -0800 (PST)
MIME-Version: 1.0
References: <20211021214500.2388146-1-nathan@kernel.org>
In-Reply-To: <20211021214500.2388146-1-nathan@kernel.org>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 17 Nov 2021 10:21:05 -0800
Message-ID: <CAKwvOd=Y50SvJiu=cxtEoogxJabdREh2tEX+wYn8FWs0si8vSg@mail.gmail.com>
Subject: Re: [PATCH] soc/tegra: fuse: Fix bitwise vs. logical OR warning
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

+ Anders (combining
https://lore.kernel.org/all/20211117142115.694316-1-anders.roxell@linaro.org/).

On Thu, Oct 21, 2021 at 2:45 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> A new warning in clang points out two instances where boolean
> expressions are being used with a bitwise OR instead of logical OR:
>
> drivers/soc/tegra/fuse/speedo-tegra20.c:72:9: warning: use of bitwise '|' with boolean operands [-Wbitwise-instead-of-logical]
>                 reg = tegra_fuse_read_spare(i) |
>                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
>                                                ||
> drivers/soc/tegra/fuse/speedo-tegra20.c:72:9: note: cast one or both operands to int to silence this warning
> drivers/soc/tegra/fuse/speedo-tegra20.c:87:9: warning: use of bitwise '|' with boolean operands [-Wbitwise-instead-of-logical]
>                 reg = tegra_fuse_read_spare(i) |
>                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
>                                                ||
> drivers/soc/tegra/fuse/speedo-tegra20.c:87:9: note: cast one or both operands to int to silence this warning
> 2 warnings generated.
>
> The motivation for the warning is that logical operations short circuit
> while bitwise operations do not. In this case, it does not seem like
> short circuiting is harmful so implement the suggested fix of changing
> to a logical operation to fix the warning.
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1488
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
Fixes: 25cd5a391478 ("ARM: tegra: Add speedo-based process identification")

> ---
>  drivers/soc/tegra/fuse/speedo-tegra20.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/soc/tegra/fuse/speedo-tegra20.c b/drivers/soc/tegra/fuse/speedo-tegra20.c
> index 2546bddbab93..4984246605ae 100644
> --- a/drivers/soc/tegra/fuse/speedo-tegra20.c
> +++ b/drivers/soc/tegra/fuse/speedo-tegra20.c
> @@ -69,7 +69,7 @@ void __init tegra20_init_speedo_data(struct tegra_sku_info *sku_info)
>
>         val = 0;
>         for (i = CPU_SPEEDO_MSBIT; i >= CPU_SPEEDO_LSBIT; i--) {
> -               reg = tegra_fuse_read_spare(i) |
> +               reg = tegra_fuse_read_spare(i) ||
>                         tegra_fuse_read_spare(i + CPU_SPEEDO_REDUND_OFFS);
>                 val = (val << 1) | (reg & 0x1);
>         }
> @@ -84,7 +84,7 @@ void __init tegra20_init_speedo_data(struct tegra_sku_info *sku_info)
>
>         val = 0;
>         for (i = SOC_SPEEDO_MSBIT; i >= SOC_SPEEDO_LSBIT; i--) {
> -               reg = tegra_fuse_read_spare(i) |
> +               reg = tegra_fuse_read_spare(i) ||
>                         tegra_fuse_read_spare(i + SOC_SPEEDO_REDUND_OFFS);
>                 val = (val << 1) | (reg & 0x1);
>         }
>
> base-commit: 519d81956ee277b4419c723adfb154603c2565ba
> --
> 2.33.1.637.gf443b226ca
>


-- 
Thanks,
~Nick Desaulniers
