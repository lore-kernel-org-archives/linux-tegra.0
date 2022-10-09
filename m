Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9703C4332F
	for <linux-tegra@archiver.kernel.org>; Sun,  9 Oct 2022 08:19:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229799AbiJIITI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 9 Oct 2022 04:19:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbiJIITH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sun, 9 Oct 2022 04:19:07 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC50C2D76D
        for <linux-tegra@vger.kernel.org>; Sun,  9 Oct 2022 01:19:05 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1ohRWV-0007rM-5y; Sun, 09 Oct 2022 10:18:59 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1ohRWT-000SSj-Hu; Sun, 09 Oct 2022 10:18:57 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1ohRWS-006bmL-RI; Sun, 09 Oct 2022 10:18:56 +0200
Date:   Sun, 9 Oct 2022 10:18:53 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Jon Hunter <jonathanh@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        Svyatoslav Ryhel <clamor95@gmail.com>
Subject: Re: [PATCH V2] clk: tegra: Fix Tegra PWM parent clock
Message-ID: <20221009081853.6ipyu7u3ghcp6dfo@pengutronix.de>
References: <20221007084524.10712-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="t4ajb5urhxiezmny"
Content-Disposition: inline
In-Reply-To: <20221007084524.10712-1-jonathanh@nvidia.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-tegra@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--t4ajb5urhxiezmny
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

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

First of all, thanks for your fix. Very appreciated.

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Who will take care for this patch? I assume it will be Stephen and
Michael (i.e. the clk maintainers)? Do you consider this patch fine for
application before the next merge window, or do you expect that it might
break other use cases and so should cook in next for some time?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--t4ajb5urhxiezmny
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmNCg+oACgkQwfwUeK3K
7AnK7Af+IUWQbHvwVB7qQUkTcEHygOppJwAidslsZyCayakJcj4WXigoAh5la6cK
Ml1L+6ooajSOR8Qbi6K+arQwHp7H0W3EPIPkK24QC5Zkn8UGKUax2RNrocgx8akB
Q0qjrEHEKhzOP6Rd+8Xa0qiTWlvntgOZFxnLBJhvXuKHJTHXWxSxWVqAyw8bgZjv
qo/Llga9DbHWUdmd4ZQF3ug2Aqju05zsByw5EBZ0VojfgAtOcJXyKTRXDqiDQRO6
BqhyEPbImD29EQXDZX6eVUYoyWGdl7JNi9KpT1IlazGDHSWixVEkr72kNi9xIc/J
xafBcjmS52rMweDsxqjqAvt+jgo2oA==
=ndcB
-----END PGP SIGNATURE-----

--t4ajb5urhxiezmny--
