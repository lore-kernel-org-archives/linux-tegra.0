Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48E59C433E0
	for <linux-tegra@archiver.kernel.org>; Wed, 31 Mar 2021 08:03:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 14AE5619D6
	for <linux-tegra@archiver.kernel.org>; Wed, 31 Mar 2021 08:03:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234274AbhCaIC3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 31 Mar 2021 04:02:29 -0400
Received: from sauhun.de ([88.99.104.3]:33970 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234120AbhCaIBz (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 31 Mar 2021 04:01:55 -0400
Received: from localhost (i577BC086.versanet.de [87.123.192.134])
        by pokefinder.org (Postfix) with ESMTPSA id 32F032C01E8;
        Wed, 31 Mar 2021 10:01:53 +0200 (CEST)
Date:   Wed, 31 Mar 2021 10:01:52 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: Make i2c_recover_bus() to return -EBUSY if bus
 recovery unimplemented
Message-ID: <20210331080152.GH1025@ninjato>
References: <20210329195530.1053-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="EemXnrF2ob+xzFeB"
Content-Disposition: inline
In-Reply-To: <20210329195530.1053-1-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--EemXnrF2ob+xzFeB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 29, 2021 at 10:55:30PM +0300, Dmitry Osipenko wrote:
> The i2c_recover_bus() returns -EOPNOTSUPP if bus recovery isn't wired up
> by the bus driver, which the case for Tegra I2C driver for example. This
> error code is then propagated to I2C client and might be confusing, thus
> make i2c_recover_bus() to return -EBUSY instead.
>=20
> Suggested-by: Wolfram Sang <wsa@the-dreams.de>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Applied to for-next, thanks!


--EemXnrF2ob+xzFeB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBkLHAACgkQFA3kzBSg
Kba3xhAAmsP5Oo1B/oB41uXANcZr+efoYffJan31arqosJxrfeH4jeoQqVjCo8uR
Ik6lmb/4ojlLaZirKUtuxAxrRZrTODbeFQVVAAffJsWAud7W5bYcmqLUYsON0hQ/
SPMC2EpWizwBOfhsrzY/Dpthzf6VuWXguEEZpCsF1PHtZ8djyf1X+OtJT0s9Nwex
GlgXDNqr7YDak/hlKt7UN2JX/UZ2SIdtw2nVrFTbxdBH6bip3k28RBJRfm4ivNB3
B4RiQ8bW/kqCWMvpy4aqx3V0iWnj3jWCNn38j6o6DYrLBgIXjjgN7BvcFbFYVXpQ
jpdwzUaFYro85h8q0n4PZupXLsi5SPtx6GHOy6+6mnJY7J1bcQk2VrIlBjLJdEEN
PTtqLe2P29r48KlA/7twdMChPXRsiqRGoAdm1pPcHJkYaENdn+/QHlznrCdFwLa+
tqtxMLRwmr3wUEHrR1ZyRQ78O4fn0WGdPKEqnuS63OhPAHzrqbjTsB4ExwG9cKhq
+XPCNvg8Bt6COaTBac5AO7j/Txme8RZNT9NC53pos70xFf5dPbzyPcpb5ftMFn8x
VhBmTwEjnFwTiZLgJUeMlTgwkNwhQp5nAj2l/+PXCCq/LkAZss236l2YaDfrKzoV
NFi59IIh4D8pA0ZH2pFlTrLVYYh+CAfatK/Jz8x/swf4chpotDs=
=hxrj
-----END PGP SIGNATURE-----

--EemXnrF2ob+xzFeB--
