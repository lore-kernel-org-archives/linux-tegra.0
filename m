Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E30D0C433FE
	for <linux-tegra@archiver.kernel.org>; Mon, 10 Oct 2022 16:06:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229996AbiJJQGE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 10 Oct 2022 12:06:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230026AbiJJQFt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 10 Oct 2022 12:05:49 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FFC624F06
        for <linux-tegra@vger.kernel.org>; Mon, 10 Oct 2022 09:05:13 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1ohvGu-0004Pk-GE; Mon, 10 Oct 2022 18:04:52 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1ohvGs-000iow-Uc; Mon, 10 Oct 2022 18:04:50 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1ohvGs-006uaf-45; Mon, 10 Oct 2022 18:04:50 +0200
Date:   Mon, 10 Oct 2022 18:04:49 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Robert Eckelmann <longnoserob@gmail.com>,
        Antoni Aloy Torrens <aaloytorrens@gmail.com>,
        Andreas Westman Dorcsak <hedmoo@yahoo.com>
Subject: Re: [PATCH V3] clk: tegra: Fix Tegra PWM parent clock
Message-ID: <20221010160449.un6gdrxu3hqbvd3i@pengutronix.de>
References: <20221010100046.6477-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="igprdqe3agturd5e"
Content-Disposition: inline
In-Reply-To: <20221010100046.6477-1-jonathanh@nvidia.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-tegra@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--igprdqe3agturd5e
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 10, 2022 at 11:00:46AM +0100, Jon Hunter wrote:
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
> Fix PWM support on Tegra20, Tegra30, Tegra114, Tegra124 and Tegra210 by
> updating the parent clock for the PWM to be the PLL_P.
>=20
> Fixes: 8c193f4714df ("pwm: tegra: Optimize period calculation")
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> Tested-by: Robert Eckelmann <longnoserob@gmail.com> # TF101 T20
> Tested-by: Antoni Aloy Torrens <aaloytorrens@gmail.com> # TF101 T20
> Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # TF201 T30
> Tested-by: Andreas Westman Dorcsak <hedmoo@yahoo.com> # TF700T T3

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Thanks for your work on this!

Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--igprdqe3agturd5e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmNEQp8ACgkQwfwUeK3K
7AmPLwf8C0lY9kL1/ubNj9hd4hrNrZ0IhspuLTX14xCRaa+U0pR0xtAD7HAoeu0v
aYz7Kiy77diuaFIyt1Rb1uNAV3okUNC1dQXOpp4cXVwa/LXwDIwXxOw0EYwyR26Z
kd1viLZ4Q6eMoao2arEOiiisZh78OaOx1Mhncue8nv5No9xMNE8kOv07wW7Lr1je
Fel+Ll98SoZU+tHU2eUIp2rwR0K1ZN3L+tglVldKXbCERy7+tKuxoSfivPwohEp1
mt7MZOhonrPM4zdQcs8bnPVvQMOW8HSMiydbFmpe++tcdByZTpEZ+Ah9Li9i9krl
ss6g+zm7fvGT+UWJ1B+EhnDpUDQvTw==
=y2EG
-----END PGP SIGNATURE-----

--igprdqe3agturd5e--
