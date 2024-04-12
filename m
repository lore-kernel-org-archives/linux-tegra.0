Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A61E4595B
	for <linux-tegra@vger.kernel.org>; Fri, 12 Apr 2024 12:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712925332; cv=none; b=lkjVT5xAiCKdBq2LFtx9eTwkw13Mn0PL7jjAO5NCdPJlBQfSQSn3K0vb3bNNW9+ALufAckU5BigwmEFxfDYCWHNoacoVmwO02GXo/QotAKYgoG/HdedfyafaUOXFLOy5WDYPrJmVHjQFJRaRuRrWZCy1P0HvulnJ7Z2zaObpRI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712925332; c=relaxed/simple;
	bh=FSvGzMwt2JATILHdouRzgQL6KpO9KLPVRGmnPN5Z1YQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GrN7MMDfH+fodkW36aDwpFj4yk17vaj1+H4jF0OsDBMCqUseA+FoRCsO9UeDB7dH0yTugyINdJqJzpCEGRjhVZIp1pAhfA4/BjA6lG9iKhU2xC2rqbPr7cZGkvJ6xAqgq1bMqSo/FyphPjdrIjHfvoqSPSqaDHpHsUl4oMIEB2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rvG7r-0001Dw-Ln; Fri, 12 Apr 2024 14:35:27 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rvG7q-00BsYf-SR; Fri, 12 Apr 2024 14:35:26 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rvG7q-000AhT-2a;
	Fri, 12 Apr 2024 14:35:26 +0200
Date: Fri, 12 Apr 2024 14:35:26 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Dipen Patel <dipenp@nvidia.com>
Cc: linux-tegra@vger.kernel.org, timestamp@lists.linux.dev, 
	Thierry Reding <thierry.reding@gmail.com>, kernel@pengutronix.de, Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] hte: tegra-194: Convert to platform remove callback
 returning void
Message-ID: <x3cs6kbixp5lro5adn62ljxxrxhmkdymli4xk744hahx6nzdgx@a24jk2hjito7>
References: <0b0a5d3816973ee88d4be9fe9f2349065a42cbff.1709886922.git.u.kleine-koenig@pengutronix.de>
 <CZR1QZ6F6QA4.2YFL58PNYHE0P@gmail.com>
 <a698710b-083a-4873-b054-b1426c1237f4@nvidia.com>
 <vij2jpf2arf34xxcrel5dxcnlrp6idsystmkj276ossk6bpfba@x3opk65vaui3>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2pqly2y5cmiesnht"
Content-Disposition: inline
In-Reply-To: <vij2jpf2arf34xxcrel5dxcnlrp6idsystmkj276ossk6bpfba@x3opk65vaui3>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-tegra@vger.kernel.org


--2pqly2y5cmiesnht
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Dipen,

On Mon, Mar 11, 2024 at 09:36:06PM +0100, Uwe Kleine-K=F6nig wrote:
> On Mon, Mar 11, 2024 at 10:13:15AM -0700, Dipen Patel wrote:
> > On 3/11/24 9:04 AM, Thierry Reding wrote:
> > > On Fri Mar 8, 2024 at 9:51 AM CET, Uwe Kleine-K=F6nig wrote:
> > >> The .remove() callback for a platform driver returns an int which ma=
kes
> > >> many driver authors wrongly assume it's possible to do error handlin=
g by
> > >> returning an error code. However the value returned is ignored (apart
> > >> from emitting a warning) and this typically results in resource leak=
s.
> > >>
> > >> To improve here there is a quest to make the remove callback return
> > >> void. In the first step of this quest all drivers are converted to
> > >> .remove_new(), which already returns void. Eventually after all driv=
ers
> > >> are converted, .remove_new() will be renamed to .remove().
> > >>
> > >> Trivially convert this driver from always returning zero in the remo=
ve
> > >> callback to the void returning variant.
> > >>
> > >> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > >> ---
> > >>  drivers/hte/hte-tegra194-test.c | 6 ++----
> > >>  1 file changed, 2 insertions(+), 4 deletions(-)
> > >=20
> > > Acked-by: Thierry Reding <treding@nvidia.com>
> > Do you want me to take this patch or want to add in your patch series
> > for the drivers with similar changes?
> >=20
> > Acked-by: Dipen Patel <dipenp@nvidia.com>
>=20
> I don't plan (yet) to care for applying these changes myself. So if you
> could pick it up that would be great.

Either you didn't pick it up or your tree isn't included in next. Both
options are not optimal in my eyes.

Given that I want to change struct platform_driver::remove in the merge
window after v6.10, it would be great if this patch made it into
v6.10-rc1.

Thanks for considering
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--2pqly2y5cmiesnht
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYZKo0ACgkQj4D7WH0S
/k7Afwf/SCCfMG0s53JD7lAo8cdm0QiSU5H76eTfLL/5e6CKW32q3bYFoyGnZf1W
FfcV8fndw/jIefOA3aF4rzQq0Ca1j+ZEJ6RjcTHMvn3FkiS5NCzeM7E7A6tLVMOG
ScgTjKePvGjIVeCuyduKLoBf6duVV54fG+YYPK/7GoKd6t+8yKR4EoZHpU+RcqW2
qhDWDhDTBuRNmqlhw7XZrUbscaq59G3SnqQvSADn6fXyk+MuOdyrC8EhvE4dM4gc
SmwCRBfFbbhWzmH1z1kqhu8C6F5u4BGRSa7IMdUok1zeL+P2+peDvA7JHEjWhQUt
lo32vsvTdUMhPhXu/8GUBodsVV+GHg==
=3vud
-----END PGP SIGNATURE-----

--2pqly2y5cmiesnht--
