Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87FC8C433DB
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 15:14:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5473023884
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Jan 2021 15:14:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726182AbhAOPON (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 15 Jan 2021 10:14:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbhAOPOM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 15 Jan 2021 10:14:12 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 294C9C061757;
        Fri, 15 Jan 2021 07:13:32 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id c124so7662416wma.5;
        Fri, 15 Jan 2021 07:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=irur51P18g2I48b5I3skM0768y5U1g5aOmBI7pxut84=;
        b=E/FfNFTzs/quk+ZPm6VtHMmGcgM2GUmKOBG/v5TKNANXHwCOfkRifJlFB6d/41+kRc
         dxcDDp8pJEQkRZz+Y+kyeczJfPLvFgb9W3kOQHJLgfX8aBNKGo+ZIgpZr0qlWxNvxEJT
         uX55ePuI6SuvNLU6Xp5MgrREGDd+zTZBaywlSqhUmXLvii9PVxZzSdOTXTn0ond+Ua7w
         T8TRjAOqfEJJoD/ZRNzC7FUYzp5C8LMe9yrfN5bt2/tEWqAyWtxzLb1pROVv5qz2Rkqz
         Us6pzJTJZwpaZ/upiRonARwtJiVOPGrPJ3fYqb3wWpnCwuSQQrPK0l4u4p7tnC5kpAaZ
         Xx9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=irur51P18g2I48b5I3skM0768y5U1g5aOmBI7pxut84=;
        b=bAXkOSYywi7taZB8NuYeAqZwUNtZmlHkG8NaE3ZjZzpyVB6QonVSbw7aO071ulj0OL
         IX1unF3eE215gEi7SNUdkuhaS8CqGYcj4IybuD/jRdjiTwl3bLUvH/X3FrC2zVkfcF0q
         3pVodDKC/0tSk128Y7UEcab+FUbhLfp/axeV+wHpBlL3xlPZUVgLtt9JC/BmKq2g+JXF
         Zi/yaCn8SxcdA7vQiIM+VNroVduq/OqQeL7zlusS98MTg9DblPsVh1WTMSnq6I1nwGAD
         s2kymE52E5F6nOl4zK2n+r6BoCTV4TGskDGZOE/LAH2FVZ9nmfI9Jkw4FQpwB+X2Nrni
         NiEQ==
X-Gm-Message-State: AOAM532n44zcbql1hwy5S1UI1jpiQTR/+uhHubD49NeI/MaHnNa7APWp
        z9w/54/0iLT9Ru9WkHmPS3Q=
X-Google-Smtp-Source: ABdhPJzKPIPaVow9bEsAwPw+A6IcddP49ANR495ciH2+Hc4t9bBLEbcMWgLrdKSx5wTo3T9bqcA+zQ==
X-Received: by 2002:a1c:de04:: with SMTP id v4mr7633175wmg.84.1610723610822;
        Fri, 15 Jan 2021 07:13:30 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id h9sm12367651wme.11.2021.01.15.07.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jan 2021 07:13:29 -0800 (PST)
Date:   Fri, 15 Jan 2021 16:13:25 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] clk: tegra: Ensure that PLLU configuration is
 applied properly
Message-ID: <YAGxFbvrHHcOCZIW@ulmo>
References: <20210112122724.1712-1-digetx@gmail.com>
 <20210112122724.1712-4-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7yeVzujnbvx3IEge"
Content-Disposition: inline
In-Reply-To: <20210112122724.1712-4-digetx@gmail.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--7yeVzujnbvx3IEge
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 12, 2021 at 03:27:22PM +0300, Dmitry Osipenko wrote:
> The PLLU (USB) consists of the PLL configuration itself and configuration
> of the PLLU outputs. The PLLU programming is inconsistent on T30 vs T114,
> where T114 immediately bails out if PLLU is enabled and T30 re-enables
> a potentially already enabled PLL (left after bootloader) and then fully
> reprograms it, which could be unsafe to do. The correct way should be to
> skip enabling of the PLL if it's already enabled and then apply
> configuration to the outputs. This patch doesn't fix any known problems,
> it's a minor improvement.
>=20
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/clk/tegra/clk-pll.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--7yeVzujnbvx3IEge
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmABsQ0ACgkQ3SOs138+
s6GZsRAAgsv/3+AZW5dZumiEFjvucSieXeYaUb7FmlrlX/RK+kCNKErnyQCakAeM
Cc6hxFVnCOkjdWhBvnb64mxVb9l9wUHKMOBiL4Hj54jcf6bBrwvHFhVPvfWn/fEZ
xUFN/QLj2G0+sNcpBp751VohUEVt2RLV1KcQgzzUDSwUWL8r8JqAxcYGNU9y1kkd
NynNEBT4JxnmaTMPSni8rsftdzObR89oERg1eaf8IZFhlE0jboeUIOcznUm+wOd3
TdUTKThNhMiQ5WsIdnwXVHN5T3n7eDjBGmN4X9cyFaoxDF1emlHB7rFW8/lUyZzk
jqaJnUtJOz+E3GKQO3Kvu+HXhywWItC5KYw2tiphPtV8QY4hUN6L8KEn2jSwLL4L
H1hIu+3ze9mCqlOYZouOUmnoxPsP0c0+HoaDR/0l/asqxRc+4JeehNGPtEX2v3MT
h72Ny4YDe4YUT9SIJR2i6wrUxZQkDkciJ3vigGrZw+MKVmk928Q7uUih+afYTH6i
GHCu8kDySfkyCcZ5Islt5DIU4o9kv5AffJ/L0ng1A7xVOw+TqZYMPPkZCwQkUSRh
pX6fKxY0XMpKySdG3QVtKi6e4vKsBfkig3jLFPLvjIpJyq1JVaTPDTP5vv3+iSUU
duHC9R8TG5q8Y09pRMThNYF0GkDsn/dRTvNK9j+lviYBoLthX9Q=
=oymk
-----END PGP SIGNATURE-----

--7yeVzujnbvx3IEge--
