Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6007DC7619A
	for <linux-tegra@archiver.kernel.org>; Wed,  5 Apr 2023 11:13:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237022AbjDELNb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 5 Apr 2023 07:13:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237015AbjDELNa (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Apr 2023 07:13:30 -0400
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C2BC1FE6
        for <linux-tegra@vger.kernel.org>; Wed,  5 Apr 2023 04:13:28 -0700 (PDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-4c025e10b32so306943a12.0
        for <linux-tegra@vger.kernel.org>; Wed, 05 Apr 2023 04:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680693207;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+mwwhpGAeK4xkTJChBqUCLo/HcDLqGyQxoPM1TmXN4=;
        b=ScnREK8qcGdhVR2w47vw+zNQYh00dm8nIS9q4KmxfJWTXbzyz08PIZghzf0c6GRmfm
         MJIjmOvwPan+P5Ysf8zoVXS7n85d7Iv/d1FxmginBwp0PjRysVERTYFmqoGlqPtiFIOD
         V5PVF+3pPJkazrA+Xg7fsoAT5WMbdtlvTEW4Mvt7P6XhCQntQ6hS6IJzex66WK4Z/ytq
         O2pwoHDVcZB+s9Mw99pgISsLPQR2BD9X0amVTWtLoPA818EgEeSX1rMGpvD4gW1cG5N4
         n8dvN+GAZo5cI+PI4bptOin2lKCvpJ2aFsUp+bPLnGb82y7RN9PobMC1GSOGfNvrlHrP
         JuRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680693207;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E+mwwhpGAeK4xkTJChBqUCLo/HcDLqGyQxoPM1TmXN4=;
        b=4bm2RN5erVfoRE19AheE/8530EhRqPKaGyNltnRy3BJYoJUOrDmVETDNAEH/po8fg7
         tu8vQJxCGXYXi80VDVlgDpj/80P9aH1wzkXob2ODaCxPdaAB/+pOOkzllITrV7HiVP36
         pIjs05PK01RAgq9NGR48e55LzdEvNy2O2uk2m7kw0b4h0hm6PC4XA7neWm0WVgIWs3tB
         xHFWTvOkMIyuJCsa/riqADao1KGtMMEqTbiiHSmC7WD0cHc9FFIW8qtD4Y/PWal48F2S
         oyvKD8KGtUlr6G35yydQiIBjMP3J76abxHPd07TATLTyTdfZ2SEYN6klqD3r0xnn0Wog
         yjjA==
X-Gm-Message-State: AAQBX9d2aSEEWZvgjUeQwITwaeU0AQgHAU76WZXUlxZQnwwtyRtMABLp
        IKRm+mRQxSEsBMBLuqnXyBA=
X-Google-Smtp-Source: AKy350Z67kMpXqhx1TonCX9wPt+T6Fl6NztyLAqxIijVdvfbYKvPe17H5f5YODHf9hI7DWTiYiBRgw==
X-Received: by 2002:aa7:c94f:0:b0:4fb:3ab9:fe81 with SMTP id h15-20020aa7c94f000000b004fb3ab9fe81mr1283712edt.30.1680693206811;
        Wed, 05 Apr 2023 04:13:26 -0700 (PDT)
Received: from orome (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id q28-20020a50aa9c000000b005023aaf52desm7095669edc.95.2023.04.05.04.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 04:13:26 -0700 (PDT)
Date:   Wed, 5 Apr 2023 13:13:24 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Richard Weinberger <richard@nod.at>,
        linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 47/49] mtd: rawnand: tegra: Convert to platform remove
 callback returning void
Message-ID: <ZC1X1IdDiaPvBXdg@orome>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
 <20230401161938.2503204-48-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wTshhJMdpC1E6eg/"
Content-Disposition: inline
In-Reply-To: <20230401161938.2503204-48-u.kleine-koenig@pengutronix.de>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--wTshhJMdpC1E6eg/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 01, 2023 at 06:19:36PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
>=20
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/mtd/nand/raw/tegra_nand.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--wTshhJMdpC1E6eg/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmQtV9QACgkQ3SOs138+
s6GI7Q/9FU7Nsf2vSUJquqmaSjNCxGyfEsC+VNBItIrQbm08CIZZm0Oh9hkQICF7
Be6XXMh1hSzrPshmMTouhY000kgHonDQSwV5uhI2tA1Y8UN+/FbHLksfr/W9SpLp
IgQZ3N2VesgojNDsjiIDmBSVI+FOw+DnLA7+RkHT+1CfJHTQIgjj5iO7Xmk8rIkd
cI2ZDNVFJvd70iBbV0ItBDrkkq3F4UulFWWfj/kupbzDjSt1O9ipxmmt301TG2+k
Ylv4r9YeM+Ap/syjR4SCZk67IVWRE5IolXimqJsmMzOlcVBjh0txOHBYr94HxrBf
fpHAEasjpmdzoBq+WAx2z1AMvppr3FPlma3n5DTBjWlrUGeNDzHEfSvX/JXuSRTa
gEPnBjHPrb2uD9K7RpppUvffw5ceIW3ti4Y8O2EEKNDOUTa79SwezYr5JESmYwfq
3fF1E8ERwRpFpvHLxRXF6Y1MeTvTPV10KW1edHtkHLXd8+KJKuQQ2faIph5vd461
kr1YNAalkTJSphPBkq1+pNqppPIf4MAXOFrOXgaZQNU+vCJJhsHRJz6DDZWJD3iZ
A3FPN6A+UcSt7sZlMt7wd1eN3kHmWr5XDVg4PqObwsUoRcjO2bi5/BYFYeCCR3vF
+8E7doOpJPhcsZ7AqtfjFPKFEeBFeeAofogECldPYlAek/yIHQQ=
=bmkJ
-----END PGP SIGNATURE-----

--wTshhJMdpC1E6eg/--
