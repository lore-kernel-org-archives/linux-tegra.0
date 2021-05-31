Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 598FAC4708F
	for <linux-tegra@archiver.kernel.org>; Mon, 31 May 2021 09:13:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D71F611CA
	for <linux-tegra@archiver.kernel.org>; Mon, 31 May 2021 09:13:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbhEaJO7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 31 May 2021 05:14:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbhEaJO6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 31 May 2021 05:14:58 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3207C061574;
        Mon, 31 May 2021 02:13:17 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id l18-20020a1c79120000b0290181c444b2d0so6115446wme.5;
        Mon, 31 May 2021 02:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=P/FcU8jcIInu3/5vyfw3rzhek7vS2tOiNJ/TNmS0lXw=;
        b=FT0tyPYFz4FIEIqixuK7tvzKqWYGEQ+zOsagYUpiWBmbWLFd6g02W8O2XfB/CvGAib
         5BEKi7vOmJKooyNjlrp/xvAML7HfZ6aM73wutFv5cDyGgwGjpos+3ZiX8tpzsioMHviK
         TxWGXp+6bN3DcMduNk074aEy9ByZSw91S6sBck5wS1r3CItcOie08VIf0opk9ApPTk1z
         5MEECvvsz/3dnA0oKMOn7P3TdZmHZxrW20koCD4W6MhmIOXjTxJaEIC3tStgAHTn6e3l
         0AC75kSH5pgYizJ7Bd+mShpDM9mfNR02474qdWjhQsU3PlreIf3epq7sr9tRnhuw47J3
         canQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=P/FcU8jcIInu3/5vyfw3rzhek7vS2tOiNJ/TNmS0lXw=;
        b=lZxtwPUp4G0dZPS/54f0G44Ns9Yqf64Sbj7xGWqDKic4a5y4EoEYfGGxTKgUkq8/TO
         83jtHrqtIs8B4JfS3j2EXX9sf+Js3+A2PGl0l/wR/7Qpqe43ytoyTLjNq6yvQ3LBC8Cf
         T36XYbN/sfJnznMZuy2C2plkQuD/LvO0+oKTDEhp42dhhI4mpmA/lBL6CHJeSwv2ulUv
         p8bnVmgLObJjwFPyL4AIIYKCZFZI+K8SSGGFjM7kzN8hPQc+7qEv5UvzVy6aOzT/dSXB
         TgBQ67F2nylSeg19UKieblSiAKS2n0Jl//0uW7kPt918Kz9ZwfexXzyPUhYECLrEUEw0
         gcTg==
X-Gm-Message-State: AOAM5309m2VQByd50FY9GREStmXo5MPVO8uyZdNPI23c1H8C9JHBVh/3
        HCJ+lf5ZwEHEkIqysrFqF64=
X-Google-Smtp-Source: ABdhPJxJixZR0XbEI5GzHNOVJBRoLPUNamNgtzvVVgFcBSP0rCZj+dHOu6MfBWAAVcyiJPRrrkvEIw==
X-Received: by 2002:a05:600c:3542:: with SMTP id i2mr19736597wmq.124.1622452396494;
        Mon, 31 May 2021 02:13:16 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id x16sm16196569wrp.6.2021.05.31.02.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 02:13:15 -0700 (PDT)
Date:   Mon, 31 May 2021 11:14:49 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Agneli <poczt@protonmail.ch>, Paul Fertser <fercerpav@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 04/10] ARM: tegra: Add reg property to Tegra20 EMC
 table device-tree nodes
Message-ID: <YLSpCXNtut3z8U9a@orome.fritz.box>
References: <20210510202600.12156-1-digetx@gmail.com>
 <20210510202600.12156-5-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3GTNXXpnqAELcLjv"
Content-Disposition: inline
In-Reply-To: <20210510202600.12156-5-digetx@gmail.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--3GTNXXpnqAELcLjv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 10, 2021 at 11:25:54PM +0300, Dmitry Osipenko wrote:
> The reg property is now specified for the emc-tables nodes in the Tegra20
> device-tree binding. Add reg property to the EMC table device-tree nodes
> of Tegra20 board device-trees in order to silence dt_binding_check warning
> about the missing property.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  arch/arm/boot/dts/tegra20-acer-a500-picasso.dts | 4 ++++
>  arch/arm/boot/dts/tegra20-paz00.dts             | 1 +
>  2 files changed, 5 insertions(+)

In retrospect we should've just used "reg" in the first place rather
than adding the custom "nvidia,ram-code". It's a bit redundant to have
both of them with the same value. I wonder if we should deprecate the
use of "nvidia,ram-code" and at least make the code look at the "reg"
property first and only fall back to "nvidia,ram-code" if "reg" does
not exist. We probably won't ever be able to get rid of the fallback
for backwards-compatibility reasons, but at least that would make the
intent a bit clearer.

Thierry

--3GTNXXpnqAELcLjv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmC0qQcACgkQ3SOs138+
s6E4ZA/+L3pXjr7LDZIYSuiOI6J1hx43F7MT2JrtA5uvDEqqAYepFuL1NdtKDE4F
cWat3iTYKZkTteOQZ5KMRjO30V/81aCXWeqIQxiIiqYiER1XiuBVqFT7xE29AvEU
jSRuRkY1Co5Pubew1BfvxrsrB/1x7Dtpl7VL5TNoFUttlE4dJRjjnCfdPM8LtNFm
53fZBmqqhG5NLK7lgqCMXmqVnJKXbOGavxbfK1o+sUbujTTrMqzKO9ZgOZFIfWFA
EgRZOICPkAnM+eJLCUKaiXXIMXPlhf21V87VV783p2Ka/Gc7TyEv3bzeetBHaDjP
0tLVKYYB8764N9rNUnvx7xzuQA8Y8UP2Sf8KqJouziK1X7ioHv+IAJXBAeImpNYh
+X+pFqCqY6OZhP0naOGB2jvLX/hV0hXuy262+BMowY2xl/S8AooAjC6BBDN4QKTL
V5lPZwAGrjpoTSAk7WybTP6mDOzW0Gdkg1QZwgCRKcbBPfnxm4Nfd3+stXT5EcH7
FDsDgOlKyYKEor9zbia2igKEJIbfTroWF5HzhH8FQ19zIixIhNXCkTmAUNWw0+/c
HNwSxp1lhh/0lGeY590/VFyyqzlrOKW2yxap/yJ0qHp/wbYEJaI3+D/UugT6WMvr
8fiNS/tYDmYsmZSepjG5c07kQuQHyirGrYEWO5I/mmYYd8S7qhA=
=AVK1
-----END PGP SIGNATURE-----

--3GTNXXpnqAELcLjv--
