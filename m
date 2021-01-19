Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C064C433DB
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 23:35:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 06FB823108
	for <linux-tegra@archiver.kernel.org>; Tue, 19 Jan 2021 23:35:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726974AbhASXfT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 19 Jan 2021 18:35:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395294AbhASON2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 19 Jan 2021 09:13:28 -0500
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ACDBCC061573;
        Tue, 19 Jan 2021 06:12:47 -0800 (PST)
Received: by mail-qv1-xf2f.google.com with SMTP id h1so9134007qvy.12;
        Tue, 19 Jan 2021 06:12:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=3/dxzh56Xo/elIlnvfwy18echXwGwPYjXCLM4CjxvaU=;
        b=kalotEBUdFfEbjjp9IKgvL10lV/Limz2hiFPetOimI2f9Jw+sRt3sH3EDlRbwAnBdz
         xpKwZrsDMTMGts8RiyBTKW9OyONH0/Cso0nEXc1sY7yxuOO91DZ3xhec4NigdwGmL/0J
         SaR9b4XRgVdTPcNeEljJndhy+1ubW8Rz/v/DUED7d1VI3q/P0RKNvFU/++6CUc4ea5/j
         gBwQDpp02qXI0KJslXDLe7zwdkNgrBksHx2kyQfE07zZtJM7nh8iA7jnhBh7E4ClHtcZ
         z9qQmpUG6dgIus3LQuY4PfGtcLAsqI4Vxd9DPAne4fuQ9lLhXMetz0AEj0WVsXven+Rb
         kOpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=3/dxzh56Xo/elIlnvfwy18echXwGwPYjXCLM4CjxvaU=;
        b=E8Y5G2Lpb/qj0KubJGPXzsXxLNnxTv7DEu31HSjBQGWtvbP7FIPZS+k/zxqoyIaX4F
         EyoPcIkCSj4Bshw4CkaN/JRvy6jWIlOHfiIcIxZRguyyGQhwYfy8pC1V5dOgbdmevD3P
         DTnpwr4RTws8YCQ9twpwa3z663uFxN5WWWb3rMk7WikuHXGaLrD3o7NjfVeCrbsX5Slr
         7wlPA2j2IguJB7bguEdYG1ngfy6MTApCE8Tp4ahRE4OCeNyH3QzYv3Cg1tYeC47X0A/5
         6U/Ovh1GhghaL6SC89clbUkLnSLS6pz81dbOnPFk/Xb2eoFT8iTFt7bfWHikWISjB5wN
         wn2w==
X-Gm-Message-State: AOAM533HKVr/Rk8l6HFGRPN2JEiSgRikPOi95EzhgNO2hvnXVbdUA3Z8
        TPH0gOWC42musR+g2iQz1dk=
X-Google-Smtp-Source: ABdhPJw5mqhpkngyHzfGD+pDZQeo3/BdLkZ8y+VQe9S4K8KX84eVQK9ArcEywKSReThbyf5DnbXshA==
X-Received: by 2002:a0c:a525:: with SMTP id y34mr4569814qvy.37.1611065566875;
        Tue, 19 Jan 2021 06:12:46 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id i65sm12967755qkf.105.2021.01.19.06.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Jan 2021 06:12:45 -0800 (PST)
Date:   Tue, 19 Jan 2021 15:12:43 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     JC Kuo <jckuo@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     gregkh@linuxfoundation.org, robh@kernel.org, jonathanh@nvidia.com,
        kishon@ti.com, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, nkristam@nvidia.com,
        Thierry Reding <treding@nvidia.com>, linux-clk@vger.kernel.org
Subject: Re: [PATCH v6 02/15] clk: tegra: Don't enable PLLE HW sequencer at
 init
Message-ID: <YAbo2574CnMB+UuU@ulmo>
References: <20210119085546.725005-1-jckuo@nvidia.com>
 <20210119085546.725005-3-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="adLw6TOsRMQUi4xn"
Content-Disposition: inline
In-Reply-To: <20210119085546.725005-3-jckuo@nvidia.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--adLw6TOsRMQUi4xn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 19, 2021 at 04:55:33PM +0800, JC Kuo wrote:
> PLLE hardware power sequencer references PEX/SATA UPHY PLL hardware
> power sequencers' output to enable/disable PLLE. PLLE hardware power
> sequencer has to be enabled only after PEX/SATA UPHY PLL's sequencers
> are enabled.
>=20
> Signed-off-by: JC Kuo <jckuo@nvidia.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> ---
> v6:
>    no change
> v5:
>    no change
> v4:
>    no change=20
> v3:
>    no change
>=20
>  drivers/clk/tegra/clk-pll.c | 12 ------------
>  1 file changed, 12 deletions(-)

Michael, Stephen,

here's patch 2 of the hardware sequencer series that would need an
Acked-by so that it can go through a different tree.

Thanks,
Thierry

>=20
> diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
> index c5cc0a2dac6f..0193cebe8c5a 100644
> --- a/drivers/clk/tegra/clk-pll.c
> +++ b/drivers/clk/tegra/clk-pll.c
> @@ -2515,18 +2515,6 @@ static int clk_plle_tegra210_enable(struct clk_hw =
*hw)
>  	pll_writel(val, PLLE_SS_CTRL, pll);
>  	udelay(1);
> =20
> -	val =3D pll_readl_misc(pll);
> -	val &=3D ~PLLE_MISC_IDDQ_SW_CTRL;
> -	pll_writel_misc(val, pll);
> -
> -	val =3D pll_readl(pll->params->aux_reg, pll);
> -	val |=3D (PLLE_AUX_USE_LOCKDET | PLLE_AUX_SS_SEQ_INCLUDE);
> -	val &=3D ~(PLLE_AUX_ENABLE_SWCTL | PLLE_AUX_SS_SWCTL);
> -	pll_writel(val, pll->params->aux_reg, pll);
> -	udelay(1);
> -	val |=3D PLLE_AUX_SEQ_ENABLE;
> -	pll_writel(val, pll->params->aux_reg, pll);
> -
>  out:
>  	if (pll->lock)
>  		spin_unlock_irqrestore(pll->lock, flags);
> --=20
> 2.25.1
>=20

--adLw6TOsRMQUi4xn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmAG6NsACgkQ3SOs138+
s6FzJBAAgZwnnmnLfasIjQ+jn42TcGlEC09yDJx8/G10VouYRaRsmd8Ok3XAAD0r
K33sOrZmQMntkXO7AAt+gnSlJxQ2Biq1skSZmLPtcXTMw6q4AZdNlF8QYNoFIj6c
S6OXDZOO96b6NI9Dl7KqOlQxN2PLWja3t4Y8kSj6Tdkxy1ZuvSWHW0qL859KU8aJ
6jFvwabcPwOScmPcc4lxodAQb2Apa3bMCH1gSjzhpV0XdD79lKyAmniJs/J42sIa
FkKzcC8IJ8Ic30/cYYIEl/N88DtU2kTN/DplYP0WPm/tTWB1oxtdX3+xerB9DBhK
/ZFg+pMy5BgUdXzjr95DR2FO3+euyFH/FJWHyBOLl+gsaW+dSprxjqRJtJh8FPNS
O7vZ0il1y1UCWS5vFqANQQx3T64wwEk5wuedOJSBtyPawCEkEgjEqGLLVzxPb1ok
mL41aEITBf8ivXu1qzaFsQMHhPEJKJhAISdvuab96KDFq6PZH/N/IlQdcl207FTe
Cf9zBuv4ws+4nOWh663MNvM+g0OIM7fJKEo5BXLj/AQEtGqluuDOehyz2qTsskBD
SkHiI8LyoUsbKYXRkCTk1Ke/Nkga4aUcOf5YvFZYi2hf9AkDGxDvXorOg7rjw+yi
2Ujk2wlJOA1qEk4Fn/o2okh28i8g1wUfNLD4t6otD74GUZQC00Y=
=Mapk
-----END PGP SIGNATURE-----

--adLw6TOsRMQUi4xn--
