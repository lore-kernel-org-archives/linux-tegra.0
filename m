Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B26F419FA2;
	Mon, 27 Jul 2026 16:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785170018; cv=none; b=gTQLzkum4RaVs8S+kELqTEdQDthZxsi7o56CcA/3/sR6enU6/e3pTZzhMfIUJjML+qn/vBspKp2rtB0lSdWw0dJZJyYKoXOel5QNkmDbqR/7QiMU7eMTO4YOQKW/wNchXRU3YUuqREI9beUUX+iQWoznzPizeVN6UvuGmONeuoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785170018; c=relaxed/simple;
	bh=lDRPaSO4rlyqFhVEx+9fpNe5Rxhf+BS6baLLxIOmR+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gOjaWR5ncp7Bw2+02DL/uOHBjZ0i5J10ttwNEpubd9J1+FWDzxLaP9/zrmcc0H90P5V/Ik38nTBwuExEMxSq8jTC8snanLOvqZzxSYR8zo2gbeH131uZSWa1NFzCbB7GHaP/DVw+N64z2jOiMMjIH1F67YVS3v4Ox4kXA+FMzdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QXP/ZRE3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QXP/ZRE3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4732B1F000E9;
	Mon, 27 Jul 2026 16:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785170016;
	bh=Wr0iEMpY6mnymor8cobq8NKXGrDlWqO414r/J4YVasM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QXP/ZRE3MMjYF+xivnPzI9S4ofX9Rg6wzaxqfdm4oSJUslpS45A6EaXYCfB059041
	 hgqaljNDgil4e1B5GkbC74dZHmelG2ixK1GSVEQxDh7XKzoNTEfvTkRhtr7qHAI5nM
	 4Zy0leon1eX+jYUDCkWdo/gYNbUVqn9Qs9zZ2zu5C/ZvFDvY6JETeJzzWsjp2MxnDO
	 nFWjA4rBm/ZV9SecTPWu4vXcJA3Joldy/kx0bo3KWdBpziB7H50wsUtA+aHV87aFrQ
	 lIyuCpzV3gQD71hSlQZWbdyzeNpnWHFy4FqKYMgKvBK6kJrHiES04ScWWDvimiF4B9
	 luLgIym1E9Icg==
Date: Mon, 27 Jul 2026 18:33:34 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: jonathanh@nvidia.com, skomatineni@nvidia.com, 
	luca.ceresoli@bootlin.com, mchehab@kernel.org, gregkh@linuxfoundation.org, 
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>, linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: tegra-video: Use BIT macro in tegra20.c
Message-ID: <ameHNGAsPEN5UecN@orome>
References: <20260722154055.385164-1-mukhtarfaisal03@gmail.com>
 <A0-05eQLQFWwHGewIFE3Kg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ofdew7mm3y3wxfle"
Content-Disposition: inline
In-Reply-To: <A0-05eQLQFWwHGewIFE3Kg@nvidia.com>


--ofdew7mm3y3wxfle
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] media: tegra-video: Use BIT macro in tegra20.c
MIME-Version: 1.0

On Thu, Jul 23, 2026 at 01:18:11PM +0900, Mikko Perttunen wrote:
> On Thursday, July 23, 2026 12:40=E2=80=AFAM Faisal Mukhtar wrote:
> > Fix checkpatch.pl warnings by replacing explicit
> > bit shift (1 << n) with the BIT macro, to better
> > adhere to the kernel coding style.
> >=20
> > Signed-off-by: Faisal Mukhtar <mukhtarfaisal03@gmail.com>
> > ---
> >  drivers/staging/media/tegra-video/tegra20.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/stag=
ing/media/tegra-video/tegra20.c
> > index e513e6ccb776..cdfd9f276d11 100644
> > --- a/drivers/staging/media/tegra-video/tegra20.c
> > +++ b/drivers/staging/media/tegra-video/tegra20.c
> > @@ -177,15 +177,15 @@ enum tegra_vi_out {
> >  #define       CSI_SKIP_PACKET_THRESHOLD(n)		(((n) & 0xff) << 16)
> >  #define TEGRA_CSI_PIXEL_STREAM_CONTROL0(n)		(0x0018 + (n) * 0x2c)
> >  #define       CSI_PP_PAD_FRAME_PAD0S			(0 << 28)
> > -#define       CSI_PP_PAD_FRAME_PAD1S			(1 << 28)
> > +#define       CSI_PP_PAD_FRAME_PAD1S			BIT(28)
> >  #define       CSI_PP_PAD_FRAME_NOPAD			(2 << 28)
> >  #define       CSI_PP_HEADER_EC_ENABLE			BIT(27)
> >  #define       CSI_PP_PAD_SHORT_LINE_PAD0S		(0 << 24)
> > -#define       CSI_PP_PAD_SHORT_LINE_PAD1S		(1 << 24)
> > +#define       CSI_PP_PAD_SHORT_LINE_PAD1S		BIT(24)
> >  #define       CSI_PP_PAD_SHORT_LINE_NOPAD		(2 << 24)
> >  #define       CSI_PP_EMBEDDED_DATA_EMBEDDED		BIT(20)
> >  #define       CSI_PP_OUTPUT_FORMAT_ARBITRARY		(0 << 16)
> > -#define       CSI_PP_OUTPUT_FORMAT_PIXEL		(1 << 16)
> > +#define       CSI_PP_OUTPUT_FORMAT_PIXEL		BIT(16)
> >  #define       CSI_PP_OUTPUT_FORMAT_PIXEL_REP		(2 << 16)
> >  #define       CSI_PP_OUTPUT_FORMAT_STORE		(3 << 16)
> >  #define       CSI_PP_VIRTUAL_CHANNEL_ID(n)		(((n) - 1) << 14)
> > --=20
> > 2.53.0
> >=20
> >=20
>=20
> BIT is only used for true/false fields. These are not that.

The best way for silencing checkpatch would probably be to define fields
for each of these using GENMASK(), listing the values as defines without
any bitshift and then change the code to use FIELD_PREP(). Or define the
field values using FIELD_PREP() or FIELD_PREP_CONST().

Thierry

--ofdew7mm3y3wxfle
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmpniF4ACgkQ3SOs138+
s6Fu5w/+KKED9VpoHoHLZhpUloYOpqhB9p07QLKn0rbpUQB9BR8fTHzbrpf6uM4s
HJR7WVfARyhc6XFwMBJbFySfmxAWG8EXACjEWNWOr0+cm5pfk4kG3MilodjoWy9D
9WsdAzas9NR2BNyO5dUwXSIr2Pnd4Ea+Yled+A4d6xtFT5DcvKd+loHi7VhnaV+L
7dwSaQHo2/IMkW8Hflgwk66Gz1lvaUTeHeXCdFwfpsp7Et6/LonkBiaKM5fxgniO
zfY9Kw/7BrJT5cBWQFz/ApYB6dj68OE/ZOLvWYULLaK2T/3lUzZ14x0EKKT4dv9r
sVjUDS6slAs99wxBb49vC1oJ4PDk7iEReSHs0J/Xj0zE4ofPMGbH7IrABpS1cquM
3MTu++3jJooYipdyVgqFL2EqPENdZ6CV+YE7GaJ6rzNWlMq2DRetS4TSU9njW6v1
boVP6krVKGkU8fSRnfMrCeMMPSWD7Kg1SQLL4sJ6YckMV/L9CEWmdUjCObTk/t2z
ndS+V2UOKA5TJpBJbK2sBXSJSxonEOXn3vwLy+2g2VApn9G82dAhWg/yBZ6Axm89
0h8V14l/oD4oNT/IkkXfri5WSvNSzd4hjfnuPYD6J8aAOe1ZBrGA7plI8yTsDrAc
zzKWYw6NrQ3QNwkiA+DOSejU7ChuVgQJIriE3vf+MmO91mqDkNY=
=TIZw
-----END PGP SIGNATURE-----

--ofdew7mm3y3wxfle--
