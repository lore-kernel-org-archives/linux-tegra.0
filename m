Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5417EC433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Oct 2021 13:12:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2FD5F60EE5
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Oct 2021 13:12:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230285AbhJUNOT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Oct 2021 09:14:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:52314 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230190AbhJUNOT (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Oct 2021 09:14:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 47E73611CE;
        Thu, 21 Oct 2021 13:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634821923;
        bh=5sw9BjjZ2F1lc3AjmCwv+mYIBVnLbWIyWz1yuzdfNZw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fna/sQAeSl8oYNbM0GEjunJVL5O1Sf2yJ/vSPQlo4oAyAT2jTRZmB3tq7lR9DXLfk
         mycRb+v+WpZAID5lNCy64mFqf4wlRUCJHFOcUnRn+pKeJcfZ5HUj+GKANTrWfsaBLA
         JbLo8JL+TeD6TIEp//cXN8R88/5AOlRxkVISuriVpsK00CP3RB9CJhQNDW6vU+FXlS
         XCRzE9DGZEYFpFEGm+26oQ2pHeUDUQN9LakUMS1oXs62L9n4YSujRln1UMACzagqdL
         hH/eA4GUZhX+haUhGq7lcIhYRGkTKaAM4+Hupv5io/AazvgvM1ygJBag0P7cLcnSWH
         I4gaJ3ZHce1lA==
Date:   Thu, 21 Oct 2021 14:12:00 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1] regulator: Don't error out fixed regulator in
 regulator_sync_voltage()
Message-ID: <YXFnIPXwPuNWM4XG@sirena.org.uk>
References: <20211021110707.20416-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jdDwTqxe94fXX09A"
Content-Disposition: inline
In-Reply-To: <20211021110707.20416-1-digetx@gmail.com>
X-Cookie: I program, therefore I am.
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--jdDwTqxe94fXX09A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 21, 2021 at 02:07:07PM +0300, Dmitry Osipenko wrote:

> Fixed regulator can't change voltage and regulator_sync_voltage() returns
> -EINVAL in this case. Make regulator_sync_voltage() to succeed for a fixed
> regulator.

> +++ b/drivers/regulator/core.c
> @@ -4249,6 +4249,9 @@ int regulator_sync_voltage(struct regulator *regula=
tor)
>  	struct regulator_voltage *voltage =3D &regulator->voltage[PM_SUSPEND_ON=
];
>  	int ret, min_uV, max_uV;
> =20
> +	if (rdev->desc->fixed_uV && rdev->desc->n_voltages =3D=3D 1)
> +		return 0;
> +
>  	regulator_lock(rdev);

It's unclear why this is checking both fixed_uV and n_voltages.  TBH
this feels like a higher level issue - with normal voltage configuration
we would have noticed that our constraints prevent the voltage changing
and not go as far as trying to actually apply a new configuration.  I
would expect a similar thing to be happening here.

--jdDwTqxe94fXX09A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFxZx8ACgkQJNaLcl1U
h9BtCwf/YfftTbSPj0BPtiCH82KtoX0pyZKcnYfTbTEWPVIk19sjGy3tTFssoSeZ
Eg55KLIcC1+nCHyoGZ3lAAltSQSUH7gCe7eQl9382LNDk2kEokSJZF0pz2h+yZTF
yZm0Jh+rzvMqt6Ouo7Sh7bvNc1wWqirg5X2zDVUwKIVZP4v4amZFIdEerjxvrdjA
TF++FCD7bMqtbO0EjVRwQnN+Pa5AFE72e21b+zYxm7JDjPlQpdXylbWVpJ4OZJhu
iTQTJGxpWwtIwhzTpIUvzV2/5u7r54XF2EebaqTtYG2S6dy+f4Tm30PIfkrjdUTZ
5wBuh36HLxafFkn3ohIeva/Tqjd13A==
=/yQC
-----END PGP SIGNATURE-----

--jdDwTqxe94fXX09A--
