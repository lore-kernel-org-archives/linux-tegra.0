Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934C847F3BE;
	Thu,  1 Oct 2026 12:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858543; cv=none; b=fFccB9Zkvy0aYhPgDGwLj0RC7UNrQRhq9Tz32hM9mwGhecjMGisGMU2q4q50TgtUtoYY61hDt4JQ/J/o0Xt175iMf0XJnYh1XsdyrAjuYsOW9H4hhk0T6zNh1ibqkB1DqkIk50eRX4GZqar6C0whGpBBGjBciXHhjl0b5Xo7RTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858543; c=relaxed/simple;
	bh=+iDR3sgRYXVOjsAHsVSOjsKrGbB2T6BK4qFl7aMdN4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PDKavlzCr8zec8sJPew2BGDl6vgcHKjJ4hqFUrAbeVp6WoAW78zgyZVVl2MdZOm22KXpLvivlOO33P0zvIVU9Fww7jZ7Aw/zyfQ3eD6LIgnFU/NeNbAmGpyoICQDaHST2DFBs+3Ls/TYXlP8mpsnbtiJQ9DBuohLyb+Be4lcDD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RjGKDheP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RjGKDheP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF4811F000FF;
	Thu,  1 Oct 2026 12:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790858542;
	bh=5d/lfo+j/m96Rp7cQ0pebNNQO5aBypVc1xArkCmf11Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RjGKDhePdQwqte/D3He2EVGkPVAx09SlNHiZsb5txAm5O3hHkEPTIDquET5QZXNEd
	 FXRQzUbJekgtVG6hvCOqIs0ZUdIWbj3M4DrqrpdCHj+6Wc8iG85wDeMLkQ/P6o6DlH
	 O0KOJ3ssW19btQbLFb488hHZl2tRb3CQdJqcvbBslGOPRS6R97MkKdhGeHNyslOp5x
	 49YpHdH+U//QrjwN5aOPFVBJHaikO9zgrQB4rRSGWSU45s8Sg4Se8OHCVM5Nit5Z4O
	 hfSMaLwfC7hdjWrf5p+/sRbtzQZoVBHTxBKzWT3WoEeWgpZned2flfCXZKTTmOWLO3
	 nK/iR2iQrUN7w==
Date: Thu, 1 Oct 2026 14:42:19 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Jiale Yao <yaojiale02@163.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 0/4] pinctrl: free maps on DT mapping failures
Message-ID: <ar5U-FseGCtU3mp2@orome>
References: <20260924111856.622898-1-yaojiale02@163.com>
 <CAD++jLkTzLm00UKdUZuxWidNUppQM=Fge-dUgDJGB-NdRVEn9w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f32m3uco7dl7mmpf"
Content-Disposition: inline
In-Reply-To: <CAD++jLkTzLm00UKdUZuxWidNUppQM=Fge-dUgDJGB-NdRVEn9w@mail.gmail.com>


--f32m3uco7dl7mmpf
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/4] pinctrl: free maps on DT mapping failures
MIME-Version: 1.0

On Thu, Oct 01, 2026 at 09:49:09AM +0200, Linus Walleij wrote:
> On Thu, Sep 24, 2026 at 1:19=E2=80=AFPM Jiale Yao <yaojiale02@163.com> wr=
ote:
>=20
> > Several pinctrl drivers reserve map storage before appending mux and
> > configuration entries while translating device tree nodes.  If a later
> > operation fails, their error paths free only temporary configuration da=
ta
> > and leave the partially built map allocated.
> >
> > Commit 17007cd700601777d9ee203a13d97e64ece3a10f fixed the same cleanup
> > problem in the generic mapping helper.  These drivers use their own map=
ping
> > callbacks and need equivalent error handling.
> >
> > Free the accumulated map and clear the output parameters on every failu=
re
> > path in the Spreadtrum, Renesas RZ/N1, Tegra XUSB, and Samsung drivers.
> > Each patch changes one driver and remains independently buildable.
>=20
> Patches applied as nonurgent fixes.

Jiale said they were going to update this to drop the useless reset of
the output parameters. Those changes should probably be integrated into
the patches you apply. Could of course be a follow-up, too.

Thierry

--f32m3uco7dl7mmpf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmq+VSkACgkQ3SOs138+
s6HNHQ//UNL8kQCrEzTu9uTC/OiH7O9obk5jWD8Nh/LlerlKRTS6I1fCi2DYc9id
TJqRVIH2lGnbcQIVFawD1O621eAHcyFIg2oMGj9UCOeCNVS6L+7XiBvwl/cvRLBJ
1kFB11kEQy70S31trT5+hlmGhCRlLYdpiU0ZnrHHtH4ysppPmK1ZwCZEmycMsu2C
iKmaEjl5iET99dShGYb8rmR48oYnLPNRoKne7xhGL/alZ4c8Oyrs3Ms9/3gr/tkw
OXRzqB9kkHiLr0oe4hhQ1HC5OmE1WrAfosE+DxLvcBtzMJVbP4i/ybQP9EIgszWD
Hvc0s+8GJx6toMp9nt/aqE1u81LWIIDC9qSilBOlK1EmlufDwauxHcaMHi5zT/bf
ExYOMvK1z5+mYtFLCmm2tC73YVLwijsS0inoQvX3M1Ug+xGAdYBKPLf6nxB92jpy
Njxvt9O4F17kdS3gHYkr13k6qeL5I1Wv6QJOXnOGcEnjpzkwj8Nedr2LGuPtSVhC
bf6Q0FGAObGOYJIEgJJ2Dfq3HTfmyWDDKqP4ykr8qwMslrVeJ4Kh8Fzfet1jTnX9
d4AdeIZGLzqNPuSCjcaCb43isl4xGJp+OHchBJtF7o6us0XADMP8IZRcL7hVK5fB
Yp+3CZ9dugrQ0W7mMSPKnjN7oE9ubzpLtcLwkvgzZRAc87EUid8=
=ILq1
-----END PGP SIGNATURE-----

--f32m3uco7dl7mmpf--
