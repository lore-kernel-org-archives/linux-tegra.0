Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94702C433F5
	for <linux-tegra@archiver.kernel.org>; Fri,  7 Oct 2022 10:22:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229643AbiJGKWC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 7 Oct 2022 06:22:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbiJGKWB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Oct 2022 06:22:01 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 450943DBED;
        Fri,  7 Oct 2022 03:21:59 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id w10so6396864edd.4;
        Fri, 07 Oct 2022 03:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=71en9V5BlaG0nyd3nTSldH1E1CoT+h4WqcM/UkzD0rQ=;
        b=Lxj9BWWT+f/apoW6vVhnGUv1weCWbNnvaUMIkBGzIJyyHZd9t+9FfHoF614w2I34y6
         OtNlbuoz42iox7ynG4lXuqFnwM8C0del1pok3z+ApRsvpinsHeWC9ytm3DcQjBzgFfNP
         v2XFTkHLdSmELaOji8vhkXFSBsCtgo/NkNxEl9gLiQfdE9411/U8qjn2Km5ZNomymzsg
         unZL6ukCS1gm0zPztjOMHV6qwuq/mxpCzRoSDHTiZQxv69iRdD6vpGRE1fsnndshCTVs
         RvZ5mc8NUugP22YLokaLxot53OCzKV1q0m79JTxFqzg6PwJbg5bLx5yd7rRQ2BmcMlxE
         PUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=71en9V5BlaG0nyd3nTSldH1E1CoT+h4WqcM/UkzD0rQ=;
        b=MEvC3gFAyRdGa7soUOEMEYwO3ddXaZf23WBh9y6CN15g+24PknN0Cc0nHb0fBSRnrZ
         T9I5VfBE/iQA7pGgrOvgv2k+VryZT9F0cGcG3m5MoXmvNNy2G7h5Fpv5NmbzvHwKOYyd
         43OxPq5evyD9HRQaZhbr9RwP+Q3glK9l1aTQdUaF22R7/XWlk06t0CS+9Eu917vq1bQD
         QepVMAd8uE59naNKxR3Ky+01WLzrO1Bf5Mkf6xUhmX2ng2GVvIRC+A9Zg8lfhAw6RLHI
         ykLODXYPLN+37odKb8h4CYcN5/aGxr/bitJLTv1YtsulyCVcrDl75+2esTvQAkW59FUD
         3/8w==
X-Gm-Message-State: ACrzQf2ljn2GQguBMIUDrMxDmMWzV8Ln6xYuIP8j2icklEoUT+GqUDsc
        VmB1cLcqmKc1pHfE3jDQtl0=
X-Google-Smtp-Source: AMsMyM6QWfp4Y5H9NodsDU23jCg2HN2dtSQyljVbSGmiHh/dZINnE4jDExqp5ZI5GaPg3jxmo2IKFA==
X-Received: by 2002:a05:6402:51c9:b0:459:6d90:2b19 with SMTP id r9-20020a05640251c900b004596d902b19mr3883318edd.219.1665138117610;
        Fri, 07 Oct 2022 03:21:57 -0700 (PDT)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id o8-20020aa7d3c8000000b0045769dee1fdsm1195503edr.29.2022.10.07.03.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 03:21:56 -0700 (PDT)
Date:   Fri, 7 Oct 2022 12:21:54 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Thomas Graichen <thomas.graichen@googlemail.com>
Subject: Re: [PATCH V2] clk: tegra: Fix Tegra PWM parent clock
Message-ID: <Yz/9wrmdRQTAhIgS@orome>
References: <20221007084524.10712-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rkkjX5C8IKMpIGXl"
Content-Disposition: inline
In-Reply-To: <20221007084524.10712-1-jonathanh@nvidia.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--rkkjX5C8IKMpIGXl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 07, 2022 at 09:45:24AM +0100, Jon Hunter wrote:
> Commit 8c193f4714df ("pwm: tegra: Optimize period calculation") updated
> the period calculation in the Tegra PWM driver and now returns an error
> if the period requested is less than minimum period supported. This is
> breaking PWM support on various Tegra platforms. For example, on the
> Tegra210 Jetson Nano platform this is breaking the PWM fan support and
> probing the PWM fan driver now fails ...
>=20
>  pwm-fan pwm-fan: Failed to configure PWM: -22
>  pwm-fan: probe of pwm-fan failed with error -22
>=20
> The problem is that the default parent clock for the PWM on Tegra210 is
> a 32kHz clock and is unable to support the requested PWM period.
>=20
> Fix PWM support on Tegra20, Tegra30, Tegra124 and Tegra210 by updating
> the parent clock for the PWM to be the PLL_P.
>=20
> Fixes: 8c193f4714df ("pwm: tegra: Optimize period calculation")
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>=20
> I have tested this on Tegra210 and boot tested on the Tegra20/30/124
> platforms but please confirm if this fixes all the issues seen on these
> platforms.
>=20
>  drivers/clk/tegra/clk-tegra124.c | 1 +
>  drivers/clk/tegra/clk-tegra20.c  | 1 +
>  drivers/clk/tegra/clk-tegra210.c | 1 +
>  drivers/clk/tegra/clk-tegra30.c  | 1 +
>  4 files changed, 4 insertions(+)

Thomas, can you check this on Nyan where you were observing display to
be completely broken? In case you don't have this in your mailbox, see
here:

	http://patchwork.ozlabs.org/project/linux-tegra/patch/20221007084524.10712=
-1-jonathanh@nvidia.com/

Thierry

>=20
> diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-teg=
ra124.c
> index a9d4efcef2d4..6c46592d794e 100644
> --- a/drivers/clk/tegra/clk-tegra124.c
> +++ b/drivers/clk/tegra/clk-tegra124.c
> @@ -1330,6 +1330,7 @@ static struct tegra_clk_init_table common_init_tabl=
e[] __initdata =3D {
>  	{ TEGRA124_CLK_I2S3_SYNC, TEGRA124_CLK_CLK_MAX, 24576000, 0 },
>  	{ TEGRA124_CLK_I2S4_SYNC, TEGRA124_CLK_CLK_MAX, 24576000, 0 },
>  	{ TEGRA124_CLK_VIMCLK_SYNC, TEGRA124_CLK_CLK_MAX, 24576000, 0 },
> +	{ TEGRA124_CLK_PWM, TEGRA124_CLK_PLL_P, 408000000, 0 },
>  	/* must be the last entry */
>  	{ TEGRA124_CLK_CLK_MAX, TEGRA124_CLK_CLK_MAX, 0, 0 },
>  };
> diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegr=
a20.c
> index 8a4514f6d503..422d78247553 100644
> --- a/drivers/clk/tegra/clk-tegra20.c
> +++ b/drivers/clk/tegra/clk-tegra20.c
> @@ -1044,6 +1044,7 @@ static struct tegra_clk_init_table init_table[] =3D=
 {
>  	{ TEGRA20_CLK_GR2D, TEGRA20_CLK_PLL_C, 300000000, 0 },
>  	{ TEGRA20_CLK_GR3D, TEGRA20_CLK_PLL_C, 300000000, 0 },
>  	{ TEGRA20_CLK_VDE, TEGRA20_CLK_PLL_C, 300000000, 0 },
> +	{ TEGRA20_CLK_PWM, TEGRA20_CLK_PLL_P, 48000000, 0 },
>  	/* must be the last entry */
>  	{ TEGRA20_CLK_CLK_MAX, TEGRA20_CLK_CLK_MAX, 0, 0 },
>  };
> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-teg=
ra210.c
> index 499f999e91e1..a3488aaac3f7 100644
> --- a/drivers/clk/tegra/clk-tegra210.c
> +++ b/drivers/clk/tegra/clk-tegra210.c
> @@ -3597,6 +3597,7 @@ static struct tegra_clk_init_table init_table[] __i=
nitdata =3D {
>  	{ TEGRA210_CLK_VIMCLK_SYNC, TEGRA210_CLK_CLK_MAX, 24576000, 0 },
>  	{ TEGRA210_CLK_HDA, TEGRA210_CLK_PLL_P, 51000000, 0 },
>  	{ TEGRA210_CLK_HDA2CODEC_2X, TEGRA210_CLK_PLL_P, 48000000, 0 },
> +	{ TEGRA210_CLK_PWM, TEGRA210_CLK_PLL_P, 48000000, 0 },
>  	/* This MUST be the last entry. */
>  	{ TEGRA210_CLK_CLK_MAX, TEGRA210_CLK_CLK_MAX, 0, 0 },
>  };
> diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegr=
a30.c
> index 168c07d5a5f2..60f1534711f1 100644
> --- a/drivers/clk/tegra/clk-tegra30.c
> +++ b/drivers/clk/tegra/clk-tegra30.c
> @@ -1237,6 +1237,7 @@ static struct tegra_clk_init_table init_table[] =3D=
 {
>  	{ TEGRA30_CLK_VIMCLK_SYNC, TEGRA30_CLK_CLK_MAX, 24000000, 0 },
>  	{ TEGRA30_CLK_HDA, TEGRA30_CLK_PLL_P, 102000000, 0 },
>  	{ TEGRA30_CLK_HDA2CODEC_2X, TEGRA30_CLK_PLL_P, 48000000, 0 },
> +	{ TEGRA30_CLK_PWM, TEGRA30_CLK_PLL_P, 48000000, 0 },
>  	/* must be the last entry */
>  	{ TEGRA30_CLK_CLK_MAX, TEGRA30_CLK_CLK_MAX, 0, 0 },
>  };
> --=20
> 2.25.1
>=20

--rkkjX5C8IKMpIGXl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmM//b4ACgkQ3SOs138+
s6EUgBAAm2epD1wVduufXiqQmGgFEWHgDLaXJDVOP0bTdgeKOs7xo+/Rb0SHsm7t
db6+145Un2wW8imOreeQyA5KK0uJn4ZW5AmbbYy4Y02iMLjmOKYxYQM/+LtDS/vd
DOQvuoqS3boOEpytiy0hWNNca2y+cgH/+EGVldmhi34AJe/QiBcIj+gZcWkTcUQq
TWZjGNDr7kZSD55Bfkf9Rlipuqw1DlAZ+h8ciWHnW+jQxf2ZfZfsc7MKNbxHW2m1
/uw8geKIWuip3SH8cR8syXgXSZNr3xsjJ5Ianz1J1AxLrqpBZwgfUGDnJZ5b2DFs
Vmt7nW1ei+mDaFMuSe/JYdNmfVVBZlZv9rtNcnD9P1iU3HVE+BpI4ypzgKyVyVW7
tpQLsOb9R+kaWxzVQJ94Z3ScUtsziz+eEhfjz6BcZxu8qcn5T5re4Ihy9hmGehcI
baXBfODhwBWSFjwnrLQnUlEQrH3KIw2UfEOWXlzsOdfGnqAN7uRh/y9GbIGys8CF
dqggIMU1OlQ03IOOD83SI10W5FNr6A/sYXkG1a49wb3XxR/Ksts46vwgsD+CtaZb
kRIl/UF9zkVyJjdTsKzifjG1+0z70QGglSIRqohHYS13mKf14PqxaZY+K5Zv3WxW
wKYa28v3pmwBf6I1co/wpxiNmpBnnKzEc996RBbl/I4GeZPtS/w=
=pmiP
-----END PGP SIGNATURE-----

--rkkjX5C8IKMpIGXl--
