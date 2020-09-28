Return-Path: <SRS0=0tg+=DF=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AE47C2D0A8
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Sep 2020 13:06:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B22E421D95
	for <linux-tegra@archiver.kernel.org>; Mon, 28 Sep 2020 13:06:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AgCapqdd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726350AbgI1NGZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 28 Sep 2020 09:06:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726310AbgI1NGY (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 28 Sep 2020 09:06:24 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEC62C061755;
        Mon, 28 Sep 2020 06:06:23 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id e2so1090949wme.1;
        Mon, 28 Sep 2020 06:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=C53uHb/STqsflnQsCdRBJLVI4ObSR2xUfn18NJP2tI0=;
        b=AgCapqddZ/Eq/aAZArc5PoD5sLsPgvpM7/vENlhzXpOjkhF91Aycoe14LKD0AsbgHM
         c87+u63/5+K6zTf2Y3/KSI5DNXWFH8mvxWUiA6cTPmO/vrJGYmLKelni/3Tur05Gd8P1
         Us7kjeHz90ngIimWdir1CXyBYw116FQhJ1JZMPQvkK/i7igcG03kfD0U6Y7fS5l3fcSh
         PCHW5NkpGoFB8OFt9koQym6dS//doiBrWN5qmkw/K9Ks+jv9BHasabhfM2oWi/yCd1pQ
         Wwet2Dqw3ZunRBydEfHpotJo4IgrsKrP0W+4if4NwPTenC8Ph4mADe99eopA1w9jnvkm
         bMqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=C53uHb/STqsflnQsCdRBJLVI4ObSR2xUfn18NJP2tI0=;
        b=M7JTK84ShafpGWgJ7DEU3DTLG7ElAErYw6HGldUttinDH9ZTUxV0so3Mb0XhNRV6uR
         eVhwlQSSKEw1cOYQetxW7Y9OXOPyMQOHzpXMAhLNE5ur5bk6139EyhHhw/KiuR8Kd/tU
         8ZV4WjGn7zTeZc4fRHCUWXh5cXB2U9jdwcELxidzygePNuUEfVS/Ndd1EhUlwv0s8Fnw
         ULDKMOx7y9udHeAJrjH+f4HbHFGmZLL/9V9o6NS7XdzxEk8FxhQ6HAnV7oydhsbhSfDF
         9Kuj0tepy9C5XAeATWOnLwa8H0JGroXEqsC/mk2YpOM63/6ADJt17zIHjaW2ftG0iX8d
         kDMQ==
X-Gm-Message-State: AOAM532/yvNTvv4qJParxqrfh2v+QGwswQGgx78bhroswcxDedkDKQ7a
        BC2By5ETzrZ8rQXflnL6G7M=
X-Google-Smtp-Source: ABdhPJxl9987EXVkO8QvmC1l6ZkjaqwzJ9wiMjeo+mLyxm7Og8xJUOv6MlOl6KH50NhwIzAptSXvfg==
X-Received: by 2002:a1c:18e:: with SMTP id 136mr1573019wmb.22.1601298382496;
        Mon, 28 Sep 2020 06:06:22 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id z11sm1401810wru.88.2020.09.28.06.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 06:06:21 -0700 (PDT)
Date:   Mon, 28 Sep 2020 15:06:18 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     JC Kuo <jckuo@nvidia.com>
Cc:     gregkh@linuxfoundation.org, robh@kernel.org, jonathanh@nvidia.com,
        kishon@ti.com, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, nkristam@nvidia.com
Subject: Re: [PATCH v3 04/15] phy: tegra: xusb: tegra210: Do not reset UPHY
 PLL
Message-ID: <20200928130618.GE3065790@ulmo>
References: <20200909081041.3190157-1-jckuo@nvidia.com>
 <20200909081041.3190157-5-jckuo@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="MIdTMoZhcV1D07fI"
Content-Disposition: inline
In-Reply-To: <20200909081041.3190157-5-jckuo@nvidia.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--MIdTMoZhcV1D07fI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2020 at 04:10:30PM +0800, JC Kuo wrote:
> Once UPHY PLL hardware power sequencer is enabled, do not assert
> reset to PEX/SATA PLLs, otherwise UPHY PLL operation will be broken.
> This commit removes reset_control_assert(pcie->rst) and
> reset_control_assert(sata->rst) from PEX/SATA UPHY disable procedure.
>=20
> Signed-off-by: JC Kuo <jckuo@nvidia.com>
> ---
> v3:
>    new, was a part of "phy: tegra: xusb: Rearrange UPHY init on Tegra210"
>=20
>  drivers/phy/tegra/xusb-tegra210.c | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/phy/tegra/xusb-tegra210.c b/drivers/phy/tegra/xusb-t=
egra210.c
> index f06e7bc7a51b..ef4bbcbed60b 100644
> --- a/drivers/phy/tegra/xusb-tegra210.c
> +++ b/drivers/phy/tegra/xusb-tegra210.c
> @@ -504,7 +504,6 @@ static void tegra210_pex_uphy_disable(struct tegra_xu=
sb_padctl *padctl)
>  	if (--pcie->enable > 0)
>  		goto unlock;
> =20
> -	reset_control_assert(pcie->rst);
>  	clk_disable_unprepare(pcie->pll);
> =20
>  unlock:
> @@ -746,7 +745,6 @@ static void tegra210_sata_uphy_disable(struct tegra_x=
usb_padctl *padctl)
>  	if (--sata->enable > 0)
>  		goto unlock;
> =20
> -	reset_control_assert(sata->rst);
>  	clk_disable_unprepare(sata->pll);
> =20
>  unlock:

Does this mean that we can no longer reset these PLLs anymore? Is that
safe? Would we ever need to reset them for recovery or similar? For
power saving, is disabling the clock enough, or could we save some extra
power by putting the PLLs into reset?

Thierry

--MIdTMoZhcV1D07fI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9x38oACgkQ3SOs138+
s6HtDg//cltNSFygdEehsXmLkrNS4au0j1gDfycbnJNhDjwkSWo4eZWV0Q+cDhSx
HWpW7b9wxI8RZvsePtalLP19TTqXg4YFKiEaD575Fd3VrxM5qRpoMVF3SgNULYWe
svfab8PnPtkcilandiqppxMAYx9tWukWTM4HvEilqMZdr20lApPkHTZ/lyBH36Gu
3e0QtSn9Ckj9iKLXqh5TqpuPyFqhmNHOzH4IzlKO9VH5um1EHp/dCUnSMt39+46z
CmWNM0mjx95a8vKwc13OWekR5L80Bopl+7pSNCORWjpRbfWN5P4dc8S1VabwpTWe
5xkaXd+USLCkQIKmcCOR4Tx2tV45g+V1nfiwYla3fhCvOgbb+P2YC5GPVnhPxChL
9Za0NZupXEgBit7yzoT9acaUfzeTrmQC6feZD7A4Aqd67/njgCRxO9hvEwF5PHo6
wIviAUG614NHLntFIQ6ak7v89vS5jIkp1YDYsK7WKeMm5jYzCNusGn42z9E/9yp+
mWn0NGX7CNRPM17+lPgZ9lZb0GmI4M0iTUVpez7/L8ei5weupX5pOvjQOWuQn6sp
vil3joCmBPC67vXTMSw+mizjCvU+NY7wa9s1FB64lGfM9eZNVeQo5qCn+oSlJI6N
RycwiDcYmgb5Uf1j3hSJusoALaX4EGt8uRyVK2nqucMe8w0ZrDQ=
=+ofS
-----END PGP SIGNATURE-----

--MIdTMoZhcV1D07fI--
