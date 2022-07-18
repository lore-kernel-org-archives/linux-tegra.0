Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7475C433EF
	for <linux-tegra@archiver.kernel.org>; Mon, 18 Jul 2022 07:53:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230054AbiGRHxN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 18 Jul 2022 03:53:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230009AbiGRHxN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 18 Jul 2022 03:53:13 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70BBD140A0
        for <linux-tegra@vger.kernel.org>; Mon, 18 Jul 2022 00:53:12 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1oDLYt-0001GH-N4; Mon, 18 Jul 2022 09:53:03 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oDLYs-001fcC-Go; Mon, 18 Jul 2022 09:53:02 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oDLYr-005uuY-JC; Mon, 18 Jul 2022 09:53:01 +0200
Date:   Mon, 18 Jul 2022 09:53:00 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     JC Kuo <jckuo@nvidia.com>, Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] phy: tegra: xusb: Only warn once reset problems in
 .remove()
Message-ID: <20220718075300.u6yxlwebwnh6gymi@pengutronix.de>
References: <20220716145403.107703-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="eng7uporgfs33jur"
Content-Disposition: inline
In-Reply-To: <20220716145403.107703-1-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-tegra@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--eng7uporgfs33jur
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

$Subject ~=3D s/once reset/once about reset/

=2E Should I resend, or can you fixup when applying this patch? (Assuming
you're otherwise happy with the change of course.)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--eng7uporgfs33jur
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmLVEVkACgkQwfwUeK3K
7Amg6gf+O4s04tPcTQsku70LG1RNfeJcB4yZOH8IyCO3RKF9EXhge6EVBwTc8bGT
5IGuFFVtgSA8V21q0dmcvOjiMjZsP1uZzlcfXp/NjMSMmjyV2CzfIfAIXFlqjGKw
FNoaYpXEKPf++oM9h2X0gnDWWA3GOl1fUO5g32FsQhfqvqs7igmADhJMxD38EIVb
U1eonlqyfUSMpx+Ito+fkkvhRjv+EGwrIRlypLeVLa5Z5GZhf9Mb97rWlQXM2fNr
Y7zJlqid8bXFrpyjdpS0Jg2JUJDp0uxfPOo/4xoX5UqSMTj84vWL4El9djolat5s
RBOnnnJ875g3SAk52aDWzJJ8tOBavQ==
=/CIO
-----END PGP SIGNATURE-----

--eng7uporgfs33jur--
