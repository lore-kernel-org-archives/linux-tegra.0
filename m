Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E76F1BDF4
	for <linux-tegra@vger.kernel.org>; Mon, 11 Mar 2024 20:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710189379; cv=none; b=JgCpfh3U5m8Mim8HJ87KIT0lbFfyn626V47Mslm4VXyXTbNed7BF3qXy+u3Wb3Ti9QApKJkDNbH4z82MW1l54jyNiOFXlsPULiOav1d0BclpjVNPK5ctt9lbJyd2dd5uEXdjXrhBwICuJGmZgyq2wxJSHblt4ol6yiVI/ri8eSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710189379; c=relaxed/simple;
	bh=ksnLqp2P9GaLa2zMmrYl6sYw5xsILIkThgjloFhz6Bc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rI0/l8eFpY72DPpIZuI81IW33U1Kn3d4CZzgWXNpQZvxW+X5covdfe+kHnGck2cmdgrDFjH8ejbiu9pcJKlEeOb5wwNWNJNCVtNEALVunkTru9rYniPxaY0FMSBugtHzXJMQb78YtrSa58/VNHuRmq1uLqiWth0AlxgiHogzWJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rjmNZ-0004SC-2S; Mon, 11 Mar 2024 21:36:13 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rjmNX-005mj4-6P; Mon, 11 Mar 2024 21:36:11 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rjmNX-004G3w-0N;
	Mon, 11 Mar 2024 21:36:11 +0100
Date: Mon, 11 Mar 2024 21:36:06 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Dipen Patel <dipenp@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, 
	timestamp@lists.linux.dev, kernel@pengutronix.de, Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] hte: tegra-194: Convert to platform remove callback
 returning void
Message-ID: <vij2jpf2arf34xxcrel5dxcnlrp6idsystmkj276ossk6bpfba@x3opk65vaui3>
References: <0b0a5d3816973ee88d4be9fe9f2349065a42cbff.1709886922.git.u.kleine-koenig@pengutronix.de>
 <CZR1QZ6F6QA4.2YFL58PNYHE0P@gmail.com>
 <a698710b-083a-4873-b054-b1426c1237f4@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="molke6wsjwejai5x"
Content-Disposition: inline
In-Reply-To: <a698710b-083a-4873-b054-b1426c1237f4@nvidia.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-tegra@vger.kernel.org


--molke6wsjwejai5x
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Dipen,

On Mon, Mar 11, 2024 at 10:13:15AM -0700, Dipen Patel wrote:
> On 3/11/24 9:04 AM, Thierry Reding wrote:
> > On Fri Mar 8, 2024 at 9:51 AM CET, Uwe Kleine-K=F6nig wrote:
> >> The .remove() callback for a platform driver returns an int which makes
> >> many driver authors wrongly assume it's possible to do error handling =
by
> >> returning an error code. However the value returned is ignored (apart
> >> from emitting a warning) and this typically results in resource leaks.
> >>
> >> To improve here there is a quest to make the remove callback return
> >> void. In the first step of this quest all drivers are converted to
> >> .remove_new(), which already returns void. Eventually after all drivers
> >> are converted, .remove_new() will be renamed to .remove().
> >>
> >> Trivially convert this driver from always returning zero in the remove
> >> callback to the void returning variant.
> >>
> >> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> >> ---
> >>  drivers/hte/hte-tegra194-test.c | 6 ++----
> >>  1 file changed, 2 insertions(+), 4 deletions(-)
> >=20
> > Acked-by: Thierry Reding <treding@nvidia.com>
> Do you want me to take this patch or want to add in your patch series
> for the drivers with similar changes?
>=20
> Acked-by: Dipen Patel <dipenp@nvidia.com>

I don't plan (yet) to care for applying these changes myself. So if you
could pick it up that would be great.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--molke6wsjwejai5x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmXvazUACgkQj4D7WH0S
/k5D2AgAnv1sLVDtEOahR56KCUwwIdIYsjYXUJLR/UVExGO9lDfV2JzsfjYKM0Ww
B4geCaWoBnSXxvd4Gvx2VjoaGgqVhghu59+vTx+aPDpDJq78kdEDco7W62KpVuiE
fFhf6BwzieIGNXKBt2+tok1wVsTQjvf4oiWNc9jeDH44BjVbMbO4FFbqc/+2Yys0
ebJYXwquf5pCECz6B6leQFrSxLfvHnzRwfEaHMtvfFZQJGNXv05JL7JAgZc9SW4a
8rkC0pfsNRLXlDMWhFknK2/+YbVjB+x6+L61FPqulbd7sowLGF4kEFaO+VWC+mXZ
ySVBlY68N4K1bUdzylfn/WDL66mGdA==
=mXO2
-----END PGP SIGNATURE-----

--molke6wsjwejai5x--
