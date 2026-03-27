Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2ED334688;
	Fri, 27 Mar 2026 23:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774655104; cv=none; b=M0E+QTvrN8/FYgSViK4yh71H3goLy110kewPKbe5qdsdwXogDdVHlnB5aG0ls8Tj1LmZsVG2s7WzvlCcDjT/BuyxtbSauiph2r7wRa8mtrwxJb6Ah3b+pJTgSeHEkKyfyO8M9Ct+f5Qlxw46VMKTce/klfwvMYXx6YVA2oiqgn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774655104; c=relaxed/simple;
	bh=qcEBrU54OnmjXXp127IJVyBBGSj3fSnTisG8DZv8qx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZuGPSTUdHQc5UXH0sM6OlP/7LmXww39J+0u4hW5Edivqm9Qdopm3X0dxWoQiOJdoXS2Su2Ao058umkOLrh8kXOqkAS7fAfwtObkkeXvt0HekI9fNhFznDEHns5PQVQoCHAdMrYtJwTSmH7tXROGNQ6HPGXPajOw4OSYfzYlQ4sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b3HV9e8T; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b3HV9e8T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F261C19423;
	Fri, 27 Mar 2026 23:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774655103;
	bh=qcEBrU54OnmjXXp127IJVyBBGSj3fSnTisG8DZv8qx4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b3HV9e8T8g98gEg2esaiv6cbC4gyANKGDXPI13LU6/J7SkN4nobQ03hnO6StzJbyo
	 tA1L92tXAjuQF8hj1XwArFEOy8w4wHglEan9Ely6CJp5UkwrE9pGzwXJZmaU0b7i5d
	 8zfbF6vZJQScFJ1ZQDDGHy+l4bOHKxIOYGCkJ38KSeSWKWDg9l5DZimCChkSNt8c2e
	 KwwxnN9f0OxeBIza7e71445OzP/U4oyd7ZJn4veOgFu1cCw3o4tOD0KESwp2wzPYar
	 RuJmr5ypNUmBqhI0qS66yeIEeY66clgtM03p0+x10VPmL9pnXbbcjV/KiDHa9UkKqO
	 DoxJr6FUJkXbQ==
Date: Sat, 28 Mar 2026 00:45:00 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] ARM: tegra: transformers: add connector node
Message-ID: <accWKnokG3o8WIGJ@orome>
References: <20260223065500.13357-1-clamor95@gmail.com>
 <20260223065500.13357-3-clamor95@gmail.com>
 <acafk7munaGrCTK3@orome>
 <546AC4C1-CCC2-4C69-B563-B29BC1D865B5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bg4tbvk6kt3nlo44"
Content-Disposition: inline
In-Reply-To: <546AC4C1-CCC2-4C69-B563-B29BC1D865B5@gmail.com>


--bg4tbvk6kt3nlo44
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/2] ARM: tegra: transformers: add connector node
MIME-Version: 1.0

On Fri, Mar 27, 2026 at 05:28:04PM +0200, Svyatoslav Ryhel wrote:
>=20
>=20
> 27 =D0=B1=D0=B5=D1=80=D0=B5=D0=B7=D0=BD=D1=8F 2026=E2=80=AF=D1=80. 17:18:=
42 GMT+02:00, Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=
=D0=B5:
> >On Mon, Feb 23, 2026 at 08:55:00AM +0200, Svyatoslav Ryhel wrote:
> >> All ASUS Transformers have micro-HDMI connector directly available. Af=
ter
> >> Tegra HDMI got bridge/connector support, we should use connector frame=
work
> >> for proper HW description.
> >>=20
> >> Tested-by: Andreas Westman Dorcsak <hedmoo@yahoo.com> # ASUS TF T30
> >> Tested-by: Robert Eckelmann <longnoserob@gmail.com> # ASUS TF101 T20
> >> Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # ASUS TF201 T30
> >> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> >> ---
> >>  .../boot/dts/nvidia/tegra30-asus-tf600t.dts   | 21 +++++++++++++++++--
> >>  1 file changed, 19 insertions(+), 2 deletions(-)
> >
> >Two things about you commit messages that I have to fixup every time:
> >
> >  1. caps after the subject prefix
>=20
> Prefix ends with ':' which does not imply using of capital letter as '.' =
'!' or '?' do. Linux documentation does not regulate this.
>=20
> Even more, examples use lower case
>=20
> [PATCH 001/123] subsystem: summary phrase

I don't care.

> >  2. wrap commit message at 72 characters
> >
>=20
> The body of the explanation, line wrapped at 75 columns, which will be co=
pied to the permanent changelog to describe this patch.
>=20
> The commit message is wrapped by 75 characters, as linux documentation re=
quests.

Fine, I'll accept 75 columns then. Pay attention to point 1 though.
Helps keep me in a good mood.

Thierry

--bg4tbvk6kt3nlo44
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnHFnkACgkQ3SOs138+
s6Fq+Q/6A4gg6zcHMai9QTux6jqdlORmsm4HlrXqlqgkd+7AcngSPZEUkHO+EXO3
6O70yBqZV98GVlIVWsUfAhkCgYMjDO6srsdd/X8Yk9DCwgASRa9Z9B/W93ZWoKzX
zhQgiMann7su3eRLOopIBzV6vrSKbBCET3Rin748nSWGSpaSJn582PcIIQM2Kuf0
07DfX7sxqoSG/z4bC+LRAdwIieokftKc7URoex4MmJ+JP3OFEB+LzwYv6JKWlf7Y
03NfVpMoKqqY2DcEV+DFtYbLYGSrKDPNGEojR0lrDgMXcr5plLRlW1Mh11YGDTt/
R8zspPdco4o/pTJ38cgSAul89Aw+EVFPDUo6DB7juFUKXkOoCbkS1jSCP8g6V6xC
cJRm7BPRiEoYUyNjx+cY5fNdMkvVpBEHGHLzImU8+krk89FI+380HqkLgJF3DJMu
XoxIM86E8gUezF20dG8SaA7A0v7sQn5HmfOhNWMGldFnYyLShRHMIUDp65Y09+W2
qEnFw9q0d94CfwbAwj9lN5CcQUQ9CN2e0LKfAnW5rBS5Afuu1J1XJT3s0s+dBATa
ZYwUq9nWqFE6epShvXJqwkp9kT9GReePyXU4EQqwwJXROadbkCAR9dxo7gsgR3nc
uKAebuo1wc8dWcwQ3a/5zTt5BAI7bMOxGz7aIgikwa21iLN1cbE=
=3CUp
-----END PGP SIGNATURE-----

--bg4tbvk6kt3nlo44--
