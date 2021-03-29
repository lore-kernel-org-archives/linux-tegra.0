Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 360F1C433DB
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Mar 2021 19:16:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D94E76198A
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Mar 2021 19:16:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231319AbhC2TQJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 29 Mar 2021 15:16:09 -0400
Received: from sauhun.de ([88.99.104.3]:40786 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230359AbhC2TPi (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Mar 2021 15:15:38 -0400
Received: from localhost (p5486ce89.dip0.t-ipconnect.de [84.134.206.137])
        by pokefinder.org (Postfix) with ESMTPSA id 404B72C00E6;
        Mon, 29 Mar 2021 21:15:32 +0200 (CEST)
Date:   Mon, 29 Mar 2021 21:15:31 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: tegra: Improve handling of i2c_recover_bus()
Message-ID: <20210329191531.GA6654@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210329190546.24869-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Content-Disposition: inline
In-Reply-To: <20210329190546.24869-1-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 29, 2021 at 10:05:46PM +0300, Dmitry Osipenko wrote:
> The i2c_recover_bus() returns -EOPNOTSUPP if bus recovery isn't wired up,
> which the case for older Tegra SoCs at the moment. This error code is then
> propagated to I2C client and might be confusing, thus return -EIO instead.

Hmm, makes sense. Maybe we should change it in the core? But with EBUSY
instead?


--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmBiJ08ACgkQFA3kzBSg
KbZXcQ//b4NDYu49tVixZRw1UuqFH90MPZl+g5ZducdspzSu8V1HRKEV1LZb980q
JbVxhTb0b1VImvGtmR2uaRTTb2SKGEBbQ8CzlOz9st3PVvukOpycQZSyHNTTJv0p
m/mYzu9VPrH4HTPqLmXRL2SPD4AGlaFTl+qXr78x6HFRb6u125a4C9zekEAYdi5P
t4dFBsyEaswHgbGD7W4eAWzav7zFPmmJjjQsvC96gyo/muGplZQEjta33Pi6vSjF
7xx3R4To8Tbqnq+2pk07IP7hnCann5tsePHcXqbgRxAgCGStNNHCoJxfyUHO5V0t
flHD//nE0snrOLNBx5JE/wq0UxVefAg+kesDL4YI353CAyN4LX/WhhA2W8j7PQ1T
9z3MBiiNxFBUSTm3Ck5Ps6CfK2pT9PgJyhOQjoBaBHT06V6RL2cZJdlD+GDzUvXa
tqfIe0Iu83ZBYb3BdnB8xXIW4MTVSjDNW/8CAWsoMxeFBnTBKnBE6kw8Dh9GGo9A
B8ZVFj5UmPGh/Gc/eNEVIrPfqacvaqQt1ucAcJY1SmmLw3p2okIwKElgNnIhM/WP
M5cyUjyGwFUsdEnWiZrusvta0iel+PG75p8W/EpfgRCt0hLLRFUA+U9NHzOigrnl
LE+lpnas/0ovqKGQ/cs7gv4aH7eOu7PaD8zdNgMaVWvHMen7cf0=
=nuLF
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--
