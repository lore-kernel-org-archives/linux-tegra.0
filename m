Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3D641A510;
	Wed, 12 Aug 2026 09:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786527797; cv=none; b=BiV9GjOW11+cx7BzOjC+qr20qfzrTmWmGw2i2yU6qP3zerLF7VP3VWPvxQ4Nr8+V/TVoeJAfTKa27cmSZ1zFI7Od4XlBqEBNBQMS4oSFcoeRyEIvvuYFA2hs0WUz1ARPeWEuqecCTqVWXmFH37VPoh6OiatQbbqwqdopHeahFgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786527797; c=relaxed/simple;
	bh=9DMTCoAma+afKL+j00tVYVgwIK4dlvbapx+9k9hXzbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B8VcEbrGzpO9Y5Byx4/Z+TpB6q3rZZUZ3eDdLEyOc2YeRkDRXSs1hC2gxhrOX6kd5Z2OmMwcKlHTPTnudXRB3pAYbi/TAzCVtx3J5oDZ8FwmHRk4e6fweo9S2dcb8UEwzxZPXRO0T2y4XSLisrRuzhVZ/Y05NG7v3mc/qYSbzo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ODDx41xT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ODDx41xT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7B131F00A3E;
	Wed, 12 Aug 2026 09:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786527795;
	bh=L0nq/F0dJfkPaSrMhwVD1azKuXgbVkfbkOM0NurH9Rk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ODDx41xTEpkc73+ujxKzPdxv4sAEBRvaqczP//anq1OOv3igX4iNSOeUs/RfcgTli
	 NFauzL7QH0+ePHx7zJvnnbmmT7uYlBRJGQFSM42Nbe05rtOEP5QRid5twQeyJzeC+S
	 6aXKI8ZhysEWHorP/chimQ+5q2WofiG9l3AEZUNmPe7a0pm7skzWZKiquo1lFkGOTt
	 uqoCVjeVPgimOKJbmHsO3/AfikTWLa8xSMQ0opLLCXaSopsTswpTld6YebNZhX08kR
	 Lpgh1Jh3aabd+bZTIIjF6C32rJj7Gt2+Ky6LZF9VJC9cDN6jttnnxFZjKVKTZtNzJ8
	 Ca3SteQ6G78MA==
Date: Wed, 12 Aug 2026 11:43:12 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: jonathanh@nvidia.com, Aniruddha Rao <anrao@nvidia.com>, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] firmware: tegra: bpmp: Add MBWT BPMP helpers
Message-ID: <anw-YlHY09qFlzKB@orome>
References: <20260722110544.193551-1-anrao@nvidia.com>
 <20260722110544.193551-5-anrao@nvidia.com>
 <aso9tq6bS9iLGL62qG0U8A@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="phqbetzroxjbxito"
Content-Disposition: inline
In-Reply-To: <aso9tq6bS9iLGL62qG0U8A@nvidia.com>


--phqbetzroxjbxito
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 4/5] firmware: tegra: bpmp: Add MBWT BPMP helpers
MIME-Version: 1.0

On Thu, Jul 23, 2026 at 02:15:50PM +0900, Mikko Perttunen wrote:
> On Wednesday, July 22, 2026 8:05=E2=80=AFPM Aniruddha Rao wrote:
[...]
> > diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpm=
p.c
[...]
> > +int tegra_bpmp_mbwt_set(struct tegra_bpmp *bpmp, unsigned int instance,
> > +			unsigned int vc_type, unsigned int bandwidth)
> > +{
> > +	struct mrq_sochub_mbwt_request request =3D {
> > +		.cmd =3D CMD_SOCHUB_MBWT_SET_BW,
> > +		.set_bw =3D {
> > +			.instance =3D instance,
> > +			.vc_type =3D vc_type,
> > +			.bw =3D bandwidth,
> > +		},
> > +	};
> > +	struct tegra_bpmp_message msg =3D {
> > +		.mrq =3D MRQ_SOCHUB_MBWT,
> > +		.tx =3D {
> > +			.data =3D &request,
> > +			.size =3D sizeof(request),
> > +		},
> > +	};
> > +	int err;
> > +
> > +	err =3D tegra_bpmp_transfer(bpmp, &msg);
> > +	if (err) {
> > +		dev_err(bpmp->dev, "MBWT set bandwidth transfer failed: %d\n",
> > +			err);
> > +		return err;
> > +	}
> > +
> > +	if (msg.rx.ret)
> > +		return msg.rx.ret;
> > +
> > +	return 0;
> > +}
> > +
> >  static void tegra_bpmp_mrq_handle_ping(unsigned int mrq,
> >  				       struct tegra_bpmp_channel *channel,
> >  				       void *data)
> > --=20
> > 2.43.0
> >=20
>=20
> Since these are only used by the sysfs code, I would squash this patch=20
> into the sysfs patch and move these functions into the sysfs file.

I don't mind having this in bpmp.c. It's a fairly small file and this
isn't a lot of code, so it doesn't have much of an impact either way.
Adding an extra file is a bit of extra overhead and it would make more
sense if we had a separate symbol to configure this out.

Putting it alongside the sysfs code is bad if there's only even an
inkling of a chance that we might want to call this from somewhere else,
like maybe setting some default policy during boot or something.

That said, I would place this somewhere different within bpmp.c. Maybe
atop the probe function would be more appropriate instead of in the
middle of these other utility functions, maybe slap a multi-line comment
on top and describe what these new functions do.

Thierry

--phqbetzroxjbxito
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmp8QC0ACgkQ3SOs138+
s6HoDg/+IuvVasEg4N8ioZQD+9Lh1PoY2se6shatgIU2A4DzotmyKlOT5GmLDvsP
uQ5uAYLZ24Y7uxXcxCAUBhS0A53KJc7r7pINAOTeKVYR7OTJ/jv4jqXXIN6HxCzu
a8QV0N6RSw/lFLkOdHT8WQ4J0f6Z3at3PVgUJRIaclk22QgjaW3Cgb3g4Hznp2A0
dAc7rWKJrEup//t8ChAksHLipJnEVb1l9KMjKitFBvjhksbJGJoIHG+uvwh6nqSf
19iFA1WMxuQx+o4JVSy1LRaPG4cl9lojTY8A7YrxtGoGZj79BNWBSKWeVBUT3OBX
xisMXX42cszJN5gNrOp7DYASS+LqWMvwwF9K3DUvJraV8hzNSIjWWFHjk31vORCV
8AVeqArOe+pNZbb0mk+nhN5bHEOBPl2mNtKzyVEhKf5zUi9TW3esl6dxYBgB63bK
PIRkG1PUnngbir6uogIUieiztFerO0mhQq9R8mykJr7FMejjX8q5lbUNcmmcax+R
7p1yW++gUp7p1gAaRpxz6UUbw0xQGiYnWZnGHriQx8S8knGjP1bzhggkB3bt6HIN
b1Z6xzjWGXGtyCpMbALFqkwUbgcyAlS11DHaRU2j417rGgpgAPbJJvPCNv7O1LVF
2D7wEKz+pvP6aOyhow/O27XK/Qw0WazEBbguXX933oGmWmk+KBE=
=fUIb
-----END PGP SIGNATURE-----

--phqbetzroxjbxito--
