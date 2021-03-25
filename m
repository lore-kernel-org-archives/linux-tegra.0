Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB2F7C433DB
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 14:39:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A2B1961A23
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 14:39:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230358AbhCYOjU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Mar 2021 10:39:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231211AbhCYOjM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Mar 2021 10:39:12 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E6D7C06174A;
        Thu, 25 Mar 2021 07:39:11 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id e18so2529277wrt.6;
        Thu, 25 Mar 2021 07:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=eVMg9U8Kdz9xJ+s917StRu9WI7qS3OmAkOKawdzzeY4=;
        b=Sv0VCIJljaIN3OM4TNc131cDMS3qydGQPSbjknsIPQCiIolufWD9r65z1ZtsWtFjj7
         gvwXYvyUTBdwl/KZWLkLcOZ+agkT6Z4LU9xCo7O/c31Nb1xL9GyhFVF9+XVwguKN7z05
         et9m6FTMLBb5LG+aBmawx/JQ60/8/917as9wQ3wP30Kod13WwziNbVH3GrRtpwzuvfwu
         DmP/IcHoYeQeEVTC7c50ivewRk3F1vFGOLEeC263WZPFqosQOkRy8DvKtnFFgLYLh6Ou
         yAoz4x2MIsWUcZmF5fxbHibNh839BvPxSc8F5xrfwvyeGVcRL/SmSebINU9p2jyR2EHn
         BYXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=eVMg9U8Kdz9xJ+s917StRu9WI7qS3OmAkOKawdzzeY4=;
        b=jZpnm8zFJ2w1bwGazAN2OIcMyPko3Q7IfOLblWdRWuomANPJeASf2WNzo0obefZExQ
         c1hf3sUmyyIwHunCbzZJAwaadbV7SXMLx0RJhvZ9I6orFZRuhOJwOSMiqNwTqzqWtNAy
         Tj8lkcK1o9L6ljORJX7vKzCnPjL23ndpAwUyFQr5y9MWAtvMiMiTLkjkfvgVg+9glQHu
         ADMTlwIAYL63H4fUXctO7GUG/MoLFuM5wcAE/lWVVwIQwOjHO7V0GrUTm7S3E77qadXt
         2II+Li2uprhRwa7IvidBHK7GhV/E8gFQjHlfZlJiUEajKpUtB+jK0gXTBaElujLccAaq
         z3nQ==
X-Gm-Message-State: AOAM532/b9ys4D6AT+05Vqhh8Bx/hHxoOwCiL2dAyqoEIJ8WUWweVs3G
        b6rVfbiQPmVAWXQ38myfExw=
X-Google-Smtp-Source: ABdhPJy8EOX1pW7R72AiKQ4GwnutLnz5MMzh8zqbBLSCvfdKFtjg/AAh6mLClf/2txlZt6HexfxLag==
X-Received: by 2002:a5d:570c:: with SMTP id a12mr9441809wrv.209.1616683149870;
        Thu, 25 Mar 2021 07:39:09 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id l9sm6232289wmq.2.2021.03.25.07.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 07:39:08 -0700 (PDT)
Date:   Thu, 25 Mar 2021 15:39:30 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/5] soc/tegra: pmc: Ensure that clock rates aren't
 too high
Message-ID: <YFygotHKjgPQ/R4G@orome.fritz.box>
References: <20210302122502.20874-1-digetx@gmail.com>
 <20210302122502.20874-4-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Tcr+9zq/JqP5m3Qd"
Content-Disposition: inline
In-Reply-To: <20210302122502.20874-4-digetx@gmail.com>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--Tcr+9zq/JqP5m3Qd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 02, 2021 at 03:25:00PM +0300, Dmitry Osipenko wrote:
> Switch all clocks of a power domain to a safe rate which is suitable
> for all possible voltages in order to ensure that hardware constraints
> aren't violated when power domain state toggles.
>=20
> Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30
> Tested-by: Nicolas Chauvet <kwizart@gmail.com> # PAZ00 T20 and TK1 T124
> Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/soc/tegra/pmc.c | 92 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 90 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index f970b615ee27..a87645fac735 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -237,6 +237,7 @@ struct tegra_powergate {
>  	unsigned int id;
>  	struct clk **clks;
>  	unsigned int num_clks;
> +	unsigned long *clk_rates;
>  	struct reset_control *reset;
>  };
> =20
> @@ -641,6 +642,57 @@ static int __tegra_powergate_remove_clamping(struct =
tegra_pmc *pmc,
>  	return 0;
>  }
> =20
> +static int tegra_powergate_prepare_clocks(struct tegra_powergate *pg)
> +{
> +	unsigned long safe_rate =3D 100 * 1000 * 1000;

This seems a bit arbitrary. Where did you come up with that value?

I'm going to apply this to see how it fares in our testing.

Thierry

--Tcr+9zq/JqP5m3Qd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBcoKIACgkQ3SOs138+
s6EX/g/+J6USwbUaTKlXIziLfJz1hm2pPY/lsfoXVaA24s+d6nfV8Lq3hFtJ/A3K
Wfs/MtOEE8CUX5zMIhSlxVKNkl+ZVlypEG6/cMxpARlFNxaOuq/3+y3l7GdoM26m
o/PYrZV624lgbusvtmQQwMEbrnSggDJgO3irSRPJHy4y83guoj8vg+XVSdxIT9dP
2XOotLgyMd3SfbU480wE8MZw+q0mhsBKFMZxoeRjibUCER4RKJP8iT9CNBKQBMS1
96cHdEip/avubYiCY1H+vMntYdfkukNF3cw9baNfEKvSpsMixPMcYibuEJ14/qjS
15yr88EucjWfsr4P4PX7aqgGfJOUWFcOFpBinHQk+0O8IVTMXYXe/eyhbX//jr8X
jYFj8Bum6FD3zaWiEKSuo2efMdVTAr54Bm5D51KzlAsJnJ9H4AshMiJFl/0JQnDc
1XNtsrDsGpr3oBcUsSbn/gcNbRy3pEHweD1izUG3WCg8khrBbUnhWNSJgwk314ua
Z8soVf9kXOiuW1KLPYKHNst8OwqufhNUDU8tRs5rdNOHJQAykWKBLxPtLI88nP1F
4UFqpQMMJ2bSw7/N9iE4pMeJiM3QVpOQQ6HdGamdqjCJL2SPGP9/++EV1cB7v/8d
F4kxvFc88IPS7zNxejMfxcLFVK9MYC6tezjvEkZLNSOZj5MBzkM=
=OQxL
-----END PGP SIGNATURE-----

--Tcr+9zq/JqP5m3Qd--
