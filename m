Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1FF2C433F5
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Oct 2021 14:33:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8A0DE60F50
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Oct 2021 14:33:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229878AbhJUOgC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Oct 2021 10:36:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:52430 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231404AbhJUOf4 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Oct 2021 10:35:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A563960F50;
        Thu, 21 Oct 2021 14:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634826820;
        bh=9kwxnYtD9PPrV0GuVeH5hW1G6CCuNqCAl+9H7HDFleA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VUaZbSd61vtd7iL34eyXdFyMtaI/i4hD3JHVdXelkV3wnew1hVaNWHfPqPKNhsG4u
         IZPeXjSTZe/uILjfJiv0KDZk58I48lxbyXDwRu4YLGCmGCXfRoG/y5j8wpC5c0OlQM
         g9K0z9Dm9BBHQsekGeOscryNQqyGY+jTPK4TwGn8eqABv1R+QVFH+Likjd1h1ugssa
         RS6SEpfwKKeS7/Ja1QFeKKGxdR/q8dMDUboyzaG/CMwH0k9e7spL8xHIBbfn1W8t3+
         YsxDIWE8OWQzp8DgAvVZs8hdM6lHw9rEMNISarfToiR4//jzN4z5uZZseQzF5V6uQr
         h4cLfkuIZTCyQ==
Date:   Thu, 21 Oct 2021 15:33:37 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1] regulator: Don't error out fixed regulator in
 regulator_sync_voltage()
Message-ID: <YXF6QUEid6Dx1Lg4@sirena.org.uk>
References: <20211021110707.20416-1-digetx@gmail.com>
 <YXFnIPXwPuNWM4XG@sirena.org.uk>
 <7ee0ccd7-8ac5-8a9e-7f55-31fac944a5d2@gmail.com>
 <89d99367-1f69-a9b8-90ea-7f794c85d5a5@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="VudTgh290nabVcoh"
Content-Disposition: inline
In-Reply-To: <89d99367-1f69-a9b8-90ea-7f794c85d5a5@gmail.com>
X-Cookie: I program, therefore I am.
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--VudTgh290nabVcoh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 21, 2021 at 04:55:17PM +0300, Dmitry Osipenko wrote:

> The alternative could be to check regulator's capabilities:

> if (!regulator_ops_is_valid(rdev, REGULATOR_CHANGE_VOLTAGE))
> 	return 0;

> This looks like a better variant, actually.

Yes, that should be more robust.

--VudTgh290nabVcoh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmFxekAACgkQJNaLcl1U
h9CZeQgAhw57rG/yptlxR/kUMYK/xKMWJBSlM2xnmwtDgL/oyU9U87w7Y0+/u5NJ
PrVFE2BkaQ4wqtEgM6jFyWEaiz+6ClYjFy7Pj+wUM+3T78tNyaQZY5nhMPfNIhJA
sBwUaU68M0MD4uARX30IkQZNvvtfrCbBkVxCmqiWoYBV8ZHo+Ho57wpB71Eqd7Yx
hjrrFmbpjBs/izZ84w5TtA1Xtmq4iViDzF5+q4bwH9p+BMyz6WBZFoaqClIMHfT0
kQ6RmaWyagRMZ9T++1HUFHwMGK3fVwFy9G75xiikArT6Uogi+3oJVMGyZsNtN2Qy
VsgDH5SimQkUgZVzzCC+U/6p90S9/Q==
=U0O/
-----END PGP SIGNATURE-----

--VudTgh290nabVcoh--
