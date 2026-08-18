Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06E9451993
	for <linux-tegra@vger.kernel.org>; Tue, 18 Aug 2026 10:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787050162; cv=none; b=UmecJv7ZSEZ3MAZPP5Lt7n4+oKqeLNyaLjEdAuAxnaXpY6UIHfFSz0VOPeP5jz4fOEJkI20SZYB+E6a93qsxfGHaNQk0NRaxR4Ypf1b/ow6a+scOevpnbzr3DDdOsXop2Eexr6JwzPe8Jd92kKuAKV97T03UJsgn4Sz0Ly1+kGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787050162; c=relaxed/simple;
	bh=GAlaucyHqGn8PKMEX+dbmngs2kvk0Tsp/R+CjlWggKo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KW0kDOGJZ6tbD2U2piNqXFXwid2I1NpK0I0OL1mYV9yoYNhvdz1/9cghFgpT+0EtaGM9I2LCxrfmERpzxxFfTkaJNtwjKAQVkBVxsOEc0lZ36pcAJU4vbGxLVNkwPxwhG2ZsvLsjR3OVAY1HPiAcnKJ4jTDo+/EpVpWt6UEOXuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rs/6kuSb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rs/6kuSb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC0F81F000E9;
	Tue, 18 Aug 2026 10:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787050161;
	bh=GAlaucyHqGn8PKMEX+dbmngs2kvk0Tsp/R+CjlWggKo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Rs/6kuSbvwNdS+68f7gcUfrjFle9aE5+DY7HlrImZ7hOYImSenvNjVlBCw71x5OXG
	 Y4KhC3yB81nb/PlwOnQQbYwagIWcX4bRhT2vaCdfi6g2JinXRg8rvTYrNp0zzrMEJk
	 em6ezxsJSXO0onumjK/MrFSxe+4Ot0QmdMmaMZ8jfx7U/0eu1bP/FiDD0fRlzykvnC
	 /okGAHwdOrH7W0sXq2wjRYEtQLfFt6NiLvvJsuXs1NNGhjx/zRoyUFAAehF52ceetG
	 MNu+6h0Al7EIc312RBLp5S8mwIS1b3TQh4gsXbcQDLBA9kVIng6bRDrEKtHNrSzEPm
	 624m696zNEnVg==
Date: Tue, 18 Aug 2026 12:49:18 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, 
	Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org
Subject: Re: [REQUEST] Release Firmware to Match Current Driver Support
Message-ID: <aoQ4he4rBJSTPBbR@orome>
References: <CALHNRZ8uHmx3nqpg1-F6RCprDavx3nY55en5gJds54RU8MDR5Q@mail.gmail.com>
 <CALHNRZ_4WaAuJmpTnvdpn10=vw5SXcv-5Qq+UX-T_pG4Snba7A@mail.gmail.com>
 <CALHNRZ9152Ox=Y230zmFM_eywsOtr0Z07CYLKZH+hGbOhRmF7w@mail.gmail.com>
 <78vIAjaWTgyGORO7lyOZcw@nvidia.com>
 <CALHNRZ8PcnQ7mHwpvJwk29N0FvTh2vqZSBhfE4ckf=78NkKEHw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qcdld6xzmri7fpjc"
Content-Disposition: inline
In-Reply-To: <CALHNRZ8PcnQ7mHwpvJwk29N0FvTh2vqZSBhfE4ckf=78NkKEHw@mail.gmail.com>


--qcdld6xzmri7fpjc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [REQUEST] Release Firmware to Match Current Driver Support
MIME-Version: 1.0

On Mon, Aug 17, 2026 at 12:17:27PM -0500, Aaron Kling wrote:
> On Mon, May 11, 2026 at 3:02=E2=80=AFAM Mikko Perttunen <mperttunen@nvidi=
a.com> wrote:
> >
> > On Monday, May 11, 2026 12:05=E2=80=AFPM Aaron Kling wrote:
> > > On Fri, Nov 14, 2025 at 2:17=E2=80=AFPM Aaron Kling <webgeek1234@gmai=
l.com> wrote:
> > > >
> > > > On Fri, Aug 1, 2025 at 4:56=E2=80=AFAM Thierry Reding <thierry.redi=
ng@gmail.com> wrote:
> > > > >
> > > > > On Thu, Jul 31, 2025 at 04:22:32PM -0500, Aaron Kling wrote:
> > > > > > This was originally discussed on the freedesktop issue tracker =
[0],
> > > > > > but there hasn't been a response there in 6 months. So I'm reop=
ening
> > > > > > the discussion here.
> > > > > >
> > > > > > * Nvdec firmware. The driver has been in the kernel for over th=
ree
> > > > > > years and there's still no available freely licensed firmware t=
o use
> > > > > > with it.
> > > > > > * T234 vic firmware. The driver has supported the arch for almo=
st
> > > > > > three years and freely licensed firmware still isn't available.
> > > > > > * Nvjpg firmware. The driver is awaiting final approval, probab=
ly
> > > > > > worth it to release the firmware with everything else.
> > > > > >
> > > > > > * T194 nouveau firmware. This does not have driver support, but=
 there
> > > > > > has been some interest in working on it. Making the firmware
> > > > > > available, even if it isn't merged to linux-firmware, would be =
one
> > > > > > less blocker for someone that doesn't work at Nvidia to work on
> > > > > > support.
> > > > > >
> > > > > > Aaron Kling
> > > > > >
> > > > > > [0] https://gitlab.freedesktop.org/drm/tegra/-/issues/4
> > > > >
> > > > > I will continue to look into this, but it'll not be high priority=
=2E Too
> > > > > many other things going on.
> > > >
> > > > After some discussion with nouveau developers, it was pointed out to
> > > > me that the gsp on ga10b doesn't do much and the setup is more like
> > > > prior tegra gpus. And that it wouldn't make sense to support ga10b =
on
> > > > nova. So I would like to expand the request for gv11b nouveau firmw=
are
> > > > to also include ga10b. Perhaps not directly pushed to linux-firmware
> > > > until they can be verified working, but made available so driver
> > > > development can happen.
> > >
> > > It has been over eight months since the last response. Nvjpg driver
> > > support has been merged in the meantime. Has any progress been made on
> > > any of the firmware releases?
> > >
> > > Aaron
> >
> > I have the multimedia engine firmware files on my todo-list. I'm
> > planning to send these out after Tegra264 VIC support is ready to send.
> > Unfortunately there have been some delays in that.
> >
> > Mikko
>=20
> The Tegra264 VIC series has been picked up into -next. Is there any
> update on the firmware release process?

We're still working on it, it's just taking a really long time.

Thierry

--qcdld6xzmri7fpjc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmqEOK4ACgkQ3SOs138+
s6HQBhAAwmlE7BN8Ag1jmcAmp9qZgtZVN3rCLg3TzNzmk5CuJv/A4gTR9u1sEAhJ
VGFhYz7HTicS536ZA1Yb5UapcpUJiFjEQHe5ZqDDicDOjsmWznsb5Yh8HoYhIsO0
9rlw1Wc7FRPVnhJQRkzQhE4mmIL4QifG1xONri/Es7C4xve5MJMzymhxIUYSlUfw
8U2dYmKUjNJ13atm3QMDsV5zC8ULpFl48yqfRkf8OdmTWGZde19ErpK0GpafMliW
aYShb4xPicny011k4ZLjUrlWcUGaq0ZcXmpaAmxNu+kv6zTzYyx+3mBS5JjysMh/
gHOtsKJUfvfmlR3JZaL8GBpHwIdSyC28NcGBRWhDJCS8yAh9mWxoPpgMl0kVNWDe
/cPzJfdiSwDz4MSkqbWXxMdU074ROqdEquLpIP7U0bwLR4FEWt+iWh40e5PDXTx/
3jDK4SaX63ipTWZanLy28HoG+WTKmwtZLtUOit0fP6+KN5JYnm/s9meEY1K1B94f
nEAOOPxSrvR7d0IIXFGzgPMk3WC/SUhSRVIgyivyMtjr7ZwWJm+CUPG62cByzzkL
fTCRAPawpmH/IKEDBQpFIjn59usAbtGnMDRqTHEWyKlIO6Rbs6ACxCKDoeKOgMdN
myq2gb+Z+lqqDvRlWI9CrW/I9CNQzEdr0SpKh1rOGyAj8hAXQ9M=
=Q9Kl
-----END PGP SIGNATURE-----

--qcdld6xzmri7fpjc--
