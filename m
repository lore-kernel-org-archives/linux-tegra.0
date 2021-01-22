Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AA50C433DB
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 13:42:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 48177235F7
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Jan 2021 13:42:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727293AbhAVNmL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 22 Jan 2021 08:42:11 -0500
Received: from mail.kernel.org ([198.145.29.99]:56236 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727022AbhAVNmF (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 22 Jan 2021 08:42:05 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id ECCDE22D57;
        Fri, 22 Jan 2021 13:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611322885;
        bh=uRveXDcfxZmK4ilRFphjSYXStiklAbSlb3DQDpxluoo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WS+EGM0voDSCxSFWOijVB7qD/FPsEBHFrJpkIKV5L3lTroDzH8moaB0II0APUNa7s
         olsTay6R8WkHr0rtFMS5viiEDcA5QAGRRgcvb/szHC1iBpMLs/dYaCkbip/Cak/bF4
         E3gbgVUQFj9M4DWd9+t1OkFpXmZ6gVYUXfickxYJqlFPpjZamHW4HLtUaDwYh+O5Tp
         +UCtHiPu4qW/VPOlInvtFBfQliHTg/np6Mg7RH0Osib0Jk8BsdeXei7ahotAOFppgY
         vWYcykxQPzDlGVKr48bCX4mucpKBAhCYiODWrhgw+aJ5wHxPjaQOstiGGm37f+ETX9
         5FdYQXAjGlDRw==
Date:   Fri, 22 Jan 2021 13:40:45 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3] regulator: Make regulator_sync_voltage() usable by
 coupled regulators
Message-ID: <20210122134045.GD6391@sirena.org.uk>
References: <20210121221649.23155-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="BRE3mIcgqKzpedwo"
Content-Disposition: inline
In-Reply-To: <20210121221649.23155-1-digetx@gmail.com>
X-Cookie: 98% lean.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--BRE3mIcgqKzpedwo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 22, 2021 at 01:16:49AM +0300, Dmitry Osipenko wrote:

> +	/* balance only if there are regulators coupled */
> +	if (rdev->coupling_desc.n_coupled > 1) {
> +		ret =3D regulator_balance_voltage(rdev, PM_SUSPEND_ON);
> +		goto out;
> +	}
> +
>  	ret =3D _regulator_do_set_voltage(rdev, min_uV, max_uV);
> =20
>  out:

This would be clearer written as an if/else rather than using the goto.

--BRE3mIcgqKzpedwo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmAK1d0ACgkQJNaLcl1U
h9D2Cwf/edp4snhbGeYNf/cwzdXMyAlr5LnPCCmGSWkyQgt6Uy0HwLkMKEFMx6E9
LxS/ZXSOGtGbor3xcaxsec4Ay5pcn1xf2lktEVBFrZo5Texua2c0vsvtMhB+1Cna
IK35sNbSrqTRSz2Uz/av4KYYMrbnnFgLLZFqUPvKXjXPZOtF3l8LhjfeObQkGJrj
ndPBc0rjsWrGy9AGkSIVV4ClmiVQx5qNrUwoFrOJStMzwCWQHJzGUvYibxqQG2Yn
0K3ttPOGIQJjsCJsJEomZgwztBD+0QKzLlkrtzESngcQYo+KMhUV4pNEDQ4YSpcO
yBZ1i4D4w39ABx3mIpYbB2zB20wy/w==
=zCrx
-----END PGP SIGNATURE-----

--BRE3mIcgqKzpedwo--
