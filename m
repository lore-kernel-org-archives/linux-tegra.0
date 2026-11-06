Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793978772;
	b=qCWfrSHF7H3uuN2YaxH9W1b7hjF9Xg93Ff77omi1ceNX9zVfVj7lWY4h3Hq4yw4W18x1
	 7635o9eY6k3Ul3nxncQNspTOhu4gW8GQzWS1JsFp9jo3ojhjpOvqbdqhMj3NgwH8nx8LJ
	 sKgLJtnWp6ORMaxcsiL3taxkzWaKlkYZuneCYcHTZ62ZvBalkVE0b94/HObIu8rpD5tkB
	 fZgSgLoktO1H/xs4q1Op3N3XOcKhg1D3EezP3FQqZaCerwtUeEVjI5j7CT/OPd/QcwA/N
	 tLU10OqMIpxLCzkjD9V4ruvnqmO81o8vogr4bYAA1ALdDIrpv7p3j3QCBcNFUPm0lMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793978772;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=791jtVI/FiCvxKr+UIajb8iUBdDdnr9l0lcd66baFFc=;
	b=tNuwGn/ozBkyMJnfRV+uqlYasfWnKrO1jEAq9/z0UeyAohQ+V4IiFPaxsRMrB+8foEGK
	 a8MKj1fexu0KuvaODfZ29f1EiOI81AtRqrmbp1cs1/RnyTCtWiPWFmWCjcxGL1ws/XUAA
	 /Bm9VbRGdwvJgHGztLzZR/3u+qnKf3Jy0/pUSRyQSRpAP2hwaD2y4Yg8sqeiCr2TOo4FJ
	 QPr61qAgLm6kUgOyBLdUiv80ySCVwWsdOxZMjtOpcsgwCGx5Bj5SDcLYoSviDHccKG086
	 eelux7159GRyKHScRNAYOIIFOkLUZRNAsT4rndvHrMvNZLq4dYvHWEUMgn07EhSwU6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hI4S+TyZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321F9606A326;
	Fri,  6 Nov 2026 15:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hI4S+TyZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A0B61F0089F;
	Fri,  6 Nov 2026 15:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793978771;
	bh=791jtVI/FiCvxKr+UIajb8iUBdDdnr9l0lcd66baFFc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hI4S+TyZD8dLdZm63gpV3tRRD5zDd9iiECcx40cwuPZ7FGkXRdpyb+XIF13nk17Up
	 0dMl2zHRuk3iFGcJdzb7jvP1dGD/fPLV+tU+Gk+3nngsZYT7OsAAQ4FbsA1C0sUHaP
	 TRz5J3zHRMOaSGAD/d/VCu8gAbh18O+U1YYHmkc1rAMPBUCHnP3WxHk8DTUqZcsCZS
	 MVHhmrdu7U8NcxdQVvgzlrSLnWnB9+w6PWdLBgPPX6Q0vqZ8J1siuN15cyMkvFxyJ2
	 rV7JPaH8IJMpZMKNFxTOra772W60OQlsdFF4BFog+RyoMPELbdRp6nXrQAiJT4BYUD
	 LTKAVoinJOxGA==
Date: Fri, 6 Nov 2026 16:26:09 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 02/10] drm/panel: Convert Hitachi TX10D07VM0BAA to use
 MIPI DBI bus
Message-ID: <au3w5Euhy-DyY5qQ@orome>
References: <20261105140510.165165-1-clamor95@gmail.com>
 <20261105140510.165165-3-clamor95@gmail.com>
 <au3TcHXFt5Yhs_V8@orome>
 <CAPVz0n0ngn4nf9uTOsM6OKB9jgTnJN1FrPp0UyeHwuAwoL5_tA@mail.gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p7lbsm6ewx54bynh"
Content-Disposition: inline
In-Reply-To: <CAPVz0n0ngn4nf9uTOsM6OKB9jgTnJN1FrPp0UyeHwuAwoL5_tA@mail.gmail.com>


--p7lbsm6ewx54bynh
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 02/10] drm/panel: Convert Hitachi TX10D07VM0BAA to use
 MIPI DBI bus
MIME-Version: 1.0

On Fri, Nov 06, 2026 at 04:00:45PM +0200, Svyatoslav Ryhel wrote:
> =D0=BF=D1=82, 6 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 15:=
19 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Thu, Nov 05, 2026 at 04:05:02PM +0200, Svyatoslav Ryhel wrote:
> > > Switch from a generic platform driver to a dedicated MIPI DBI driver.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  .../drm/panel/panel-hitachi-tx10d07vm0baa.c   | 167 ++++++++--------=
--
> > >  1 file changed, 78 insertions(+), 89 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c b/dr=
ivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
> > > index 83c2af1be9755..d5d7ba2096608 100644
> > > --- a/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
> > > +++ b/drivers/gpu/drm/panel/panel-hitachi-tx10d07vm0baa.c
> > > @@ -14,6 +14,7 @@
> > >  #include <video/mipi_display.h>
> > >
> > >  #include <drm/drm_mipi_dbi.h>
> > > +#include <drm/drm_mipi_dbi_bus.h>
> > >  #include <drm/drm_modes.h>
> > >  #include <drm/drm_of.h>
> > >  #include <drm/drm_panel.h>
> > > @@ -25,7 +26,7 @@ static const struct regulator_bulk_data hitachi_tx1=
0d07vm0baa_supplies[] =3D {
> > >
> > >  struct hitachi_tx10d07vm0baa {
> > >       struct drm_panel panel;
> > > -     struct mipi_dbi *dbi;
> > > +     struct mipi_dbi_device *dbi;
> >
> > It's somewhat difficult to exactly see the difference between mipi_dbi
> > and mipi_dbi_device. Maybe that should be explained better in the cover
> > letter of patch 1? Or the documentation added in patch1.
> >
>=20
> It is already documented in detail in the drm_mipi_dbi.h

That documents what the struct mipi_dbi is. I'm asking about the
difference between mipi_dbi_device and mipi_dbi and mipi_dbi_dev. It's
not clear to me why we have both mipi_dbi_device *and* mipi_dbi_dev,
especially since they're very similarly named. People are going to
easily confuse where to use which.

Thierry

--p7lbsm6ewx54bynh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmrt8ZEACgkQ3SOs138+
s6GKSQ/8CO+1lWO38xYwHMKy3he1QZi7KnwlWMuqXSlkTnr70L03IIS91e9xT7y8
ErXIomywS8xrLKQO01zd4QHj8WccK0/98EwwhIQ5x8BuYVl78PVW/QjvgjT/75Jf
xRPbTK3T/mWao7bW5uGAv8z5QHVBF6f+Mks1jLvv4Lg1z7DxeHo2oC0Znz3DpaE8
r4CfqX5aIig5TguQtyZlrZf4ZPKAslewfgW2ebu09knOM1utULbEBrRH+ljVrp4u
eGjrbJ/GoziEBB4vzn9L2qYJMEei54YmBLgaLqhTgkoK+5sX5AvmteeqKUaqWGrr
evGwrd0R0/nJ6kzUQtNqttLijm9YgRWdHHyFQcKI2ldkvZQrJ+MWiC5q7dE2hUHn
RHbaS1Y1oJHX5VW3yiimkOnBeywVpxKMWJ1g4JB+tCIyfMDhDNlOP0yfSCQSxa3v
s/RZHkIQ0NUzIJjmTru80SYyWwGwzl5bAcTJrZlOgFQVvqumn8AZ2YfUzwoH11jx
UILAmqV2CNtD1VNNCfXtQJ4AfvcugHYHcXEPhUhyJo8q32hJHVUjf5apuPWah5fc
8yjHaty6gQzn0hr8lSa8TRED1PiZVcpVD6/mGngUATv3DpRuImwyit+knR3H5dF7
BW9zZOM8UA02PEPTP6AIiVGEVrrBfHvoGi1i+AqnYRVhMFOxp78=
=Nriy
-----END PGP SIGNATURE-----

--p7lbsm6ewx54bynh--
