Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB708C4741F
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 21:11:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 966F22076A
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 21:11:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FabrGy9I"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730441AbgI3VLN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 17:11:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725814AbgI3VLN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 17:11:13 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 507F6C0613D0
        for <linux-tegra@vger.kernel.org>; Wed, 30 Sep 2020 14:11:11 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id o8so4886426ejb.10
        for <linux-tegra@vger.kernel.org>; Wed, 30 Sep 2020 14:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=NOk8c2APRYC30UPRAFHZ43REyMt6GV6fXQhIWNvFDgg=;
        b=FabrGy9IuFyWiliExAguoclEsEauU9gRTELnKIQdlsOf7hvYSfdm63GTuSTenjuRMC
         6x6UyqUApJsDpzU+yIAkGQNXLz3NDAgTLSdgQ0RnT20pbrD5HDjaI7lGsyG+ppEematD
         1+THko9mee0t3jZqlvW5BSuIezwc8yKbqq5FQmYsT/c+LGiYv/LI+sjJroX2uYcqlNFu
         reSCo1poeCyGdLu3UV1Q0/MWR/V0wbfHmJhwiwnp/X3WDzVerDpWyvx7kFj/uhqbtYHK
         dYlp9IUIRSkS47SHRHOII4ixUHwLw89dY1zBK4Xid1AA/s0goko7oK8VHmj1uvjyJA+F
         Wntg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=NOk8c2APRYC30UPRAFHZ43REyMt6GV6fXQhIWNvFDgg=;
        b=pZbk2ze7o967JP9VPsNAXPX1WzH7oCn3TALuGj+0B0aHq+ZlZoeo16HxKrdfr0/zXl
         kClhv2+u/N/jJqIGMEoUn4nAsC+2vzQvhTB5Uk4YxonDF7BrM9PecT9Txh72CsCH+HJX
         Zi3spvR4JDIrKCGdKcUrKfQU8UIwPUZJxmiGe8/ez5dHezGm4qRZW00HPn+z0QdM7Uim
         yaVDqSFAnVgerbQNBfdohHYrSkkKIS5kPW26VSEH+4BK1WWEaAdPsSsUpAj5fl6Pqpju
         YmwV/AyfCY/hGPEgq53tJv55HPJZatNXoV3ZbFFrQIgrXkE/LyEnmAF1pVj/dmp3uvZd
         HrlA==
X-Gm-Message-State: AOAM530U418Qdac/XRoUfCQh6mNjaLCglCRg8d6um7kpJBQjDpl2USf4
        V8biB9jM1AbyfpyUjNG75+dcvzHnuqA0fV6/nfLekQ==
X-Google-Smtp-Source: ABdhPJxQsB31I9zoUXjTlYNVI1WvPMwYEGQGlHAwZDAxOzXWh7mtbCLtKvFkHMJYFECJN4PKTpunKW9XxNtEYYlph/E=
X-Received: by 2002:a17:906:c447:: with SMTP id ck7mr4739798ejb.358.1601500269817;
 Wed, 30 Sep 2020 14:11:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200930210824.GA12277@embeddedor>
In-Reply-To: <20200930210824.GA12277@embeddedor>
From:   Jann Horn <jannh@google.com>
Date:   Wed, 30 Sep 2020 23:10:43 +0200
Message-ID: <CAG48ez3X3aZwfde3_2Sc+gdtUGRHfzan6oNFiffAvNzFDSsFDw@mail.gmail.com>
Subject: Re: [PATCH][next] mtd: rawnand: Replace one-element array with
 flexible-array member
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org,
        kernel list <linux-kernel@vger.kernel.org>,
        linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Sep 30, 2020 at 11:02 PM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
> There is a regular need in the kernel to provide a way to declare having
> a dynamically sized set of trailing elements in a structure. Kernel code
> should always use =E2=80=9Cflexible array members=E2=80=9D[1] for these c=
ases. The older
> style of one-element or zero-length arrays should no longer be used[2].

But this is not such a case, right? Isn't this a true fixed-size
array? It sounds like you're just changing it because it
pattern-matched on "array of length 1 at the end of a struct".

> Refactor the code according to the use of a flexible-array member
> instead of a one-element array. Also, make use of the struct_size()
> helper to calculate the size of the allocation for _nand_. In order
> to keep the code as maintainable as possible and to keep _cs_ as an
> array, add a new macro CS_N to aid in the allocation size calculation,
> in case there is a need for more Chip Select IDs in the future. In the
> meantime, the macro is set to 1. This also avoids having to use a magic
> number '1' as the last argument for struct_size().
[...]
> diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/teg=
ra_nand.c
[...]
> +/* Number of Chip Selects. Currently, only one. */
> +#define CS_N                   1
> +
>  struct tegra_nand_controller {
>         struct nand_controller controller;
>         struct device *dev;
> @@ -183,7 +186,7 @@ struct tegra_nand_chip {
>         u32 config;
>         u32 config_ecc;
>         u32 bch_config;
> -       int cs[1];
> +       int cs[];
>  };
[...]
