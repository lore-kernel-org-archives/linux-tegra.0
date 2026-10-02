Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA49411A03;
	Fri,  2 Oct 2026 22:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790980895; cv=none; b=LG6/w3zd5GATn5577pB7t4u9wJQ8gsnnaJxw2GcyldY0VfWvQRa4pZIRRbfD9457Na0thHt2g7qmG2jxRZ98grVkXNw0Yhomh8C9wgiWRBiHOropW+GkDZW2AntAjbnbT6KG9g7LyHXCbPJ/IAT7v8yrC5CvAzXlHvUvo1F1Tjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790980895; c=relaxed/simple;
	bh=AKTrkISx6dxwtExIyuacRZZeFC7jBO87EIhnSA1BhXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eqdE1S+ZHs3KrKkw/+fdd/ildIgW+yTxLFB6hxjq38nX+IEHmdwgFidAt/tbWdgYtvXEKcDkyquMOfGzBM7PlpwhiLjlwGNrPJWmiAPBBv59FZxv6CiBjPd10UH5oj8nPMMRTeFwfcm/DL9D5FPTBiaIfjOXwAT3Vzx5KiJc5sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HaECnzKV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HaECnzKV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B3441F000FF;
	Fri,  2 Oct 2026 22:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790980894;
	bh=YMitbVU2U6uwbZkAlGe/6edWpwpUSz5woSH/YcWw1dI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HaECnzKVg2/e5K/Z8YRANYshmS6/40A/zi3jd9K7XhVsdRugFC0fpKmi/SsB4Oiiu
	 N2FvQLNqBdyIcCrPSeFdUzzR1osZrPeiqdqQjvWsKea6uFdDuJVEC4h7B8+lPhVhQh
	 LrvtnAVsDUkPW8CengXrOhsdazpm9keQZn1jNbhCvA1aZTzVG76Iw4kgaMJZjA0aJ4
	 DRNuRKxJDhl0Mmz+B91WKAyGHoXmm0EyanRMGtHTY/0ZkF4v2MKuZYHuGFA5tSrrPx
	 cTdBSZ2snPTu2tMlvd6KBZdHHloNyMi6MTatq2UmG4OhQ4Esoz76/qehR9sipppgzk
	 yJL5ToZWH3vdw==
Date: Sat, 3 Oct 2026 00:41:31 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: webgeek1234@gmail.com
Cc: Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alex Frid <afrid@nvidia.com>
Subject: Re: [PATCH v2 0/2] soc/tegra: fuse: Support Tegra210B01 Speedos
Message-ID: <asAzDl93ckhMCRii@orome>
References: <20260727-t210b01-speedo-v2-0-4f287a3dab72@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ipdchu2655m3bjay"
Content-Disposition: inline
In-Reply-To: <20260727-t210b01-speedo-v2-0-4f287a3dab72@gmail.com>


--ipdchu2655m3bjay
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 0/2] soc/tegra: fuse: Support Tegra210B01 Speedos
MIME-Version: 1.0

On Mon, Jul 27, 2026 at 08:57:34PM -0500, Aaron Kling via B4 Relay wrote:
> This series adds support for the b01 fuse revision, then adds speedo
> support for known Tegra210B01 sku's.
>=20
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> Changes in v2:
> - Update patch 1 commit messag to be more descriptive
> - Update patch 1 to set unknown revision in the major revision B code
>   path if minor revision is not 1.
> - Add based-on tags to patch 2
> - Link to v1: https://lore.kernel.org/r/20260717-t210b01-speedo-v1-0-f04a=
8bd4d997@gmail.com
>=20
> ---
> Aaron Kling (2):
>       soc/tegra: fuse: Support revision B01
>       soc/tegra: fuse: speedo-tegra210: Support revision B01
>=20
>  drivers/soc/tegra/fuse/fuse-tegra.c      |  1 +
>  drivers/soc/tegra/fuse/speedo-tegra210.c | 22 ++++++++++++--
>  drivers/soc/tegra/fuse/tegra-apbmisc.c   | 51 +++++++++++++++++++-------=
------
>  include/soc/tegra/fuse.h                 |  1 +
>  4 files changed, 53 insertions(+), 22 deletions(-)

Applied, thanks.

Thierry

--ipdchu2655m3bjay
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmrAMxsACgkQ3SOs138+
s6EJdxAAkJ30yG9EfrDzTXVWw+6RuBU4QCOPZJpC4PB0jJGPEQXOpDHorUbbUv1F
wrn00UIEcur7kcBQo9hrXtDdFgE4r6exsGYOtuzZOe14eY1WjShYGyR40k0hydeH
STQZdADXbNOSsGN7424rQrqMp5mhNA3ByvLEFZD8KC7z6tc10FhbqQNjBH9IfVDl
tL/+5U9GDMswBlSeNd5xYfSsLvgoB/WLAtIbd3kumSL6yfPP3kSiQjuSBTO28A8D
KyGEsbOKe6UyP/I0oIFai5m+GgEwnLg4qtXsk5wUpzR1AbisiZXU6l2+961bBkZ4
4qRwmLfHCstS8J3/nLt+qoGJOIUjM37lxYG5bp+P3zQigOT6yiZGbRdwTZBMJ0wD
mka1zJAJPJNoMlgPCOtAUEn4esun5dk8oarGOHk2qww2PL/503isZ8uBe3G5Yp9g
kx/NIDoyLpOL2lC/XSwi9NZgsF/bB2jrHuH7V2qIMdau5Q8/5JxkMJIyP65kaM43
50eoD4Gk2zKCGVaX8WGJRGs7hslCu8WRrSkn3rXWSkeBfZCHnJs+b1sOIkMqDamf
9dde48SIhKYGn88PidKqDly6LO9jkcyuQgJ+PoFx4b69ZRsdJHQUaEFzREAEysb/
6i65g7PBmtzu/nFlxu5HqtHoiUXxhZBcoesoyvFF3GNjvMT+MCE=
=fbMo
-----END PGP SIGNATURE-----

--ipdchu2655m3bjay--
