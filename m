Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793979247;
	b=HTi3JoCWA9ViXhbGsCRID9xO9pxSWOEPTHlZHY8zOOK5xYbqWH/AxdgYtmwR4EeHdQKC
	 wqVYDgWdmKOA5t6d0uR4byW/XVWSfZH8KcH4iV/4xrTag1hyl9BoLZot+myrLIT2fs1Mv
	 JGQauDqQj16Sioww6p/GwilJSH9yBW0SPGep5NskJJKfYgxZVp8HYmVeP3E+VWdufNVj5
	 CNo32rBjpUqER9ziacJpM72gpP+XfR6ojaeRlk9exrel6ikD3vvsQqE56tM/L2OvREiYd
	 pVV3Ygc/kOllXW4w6pYUi0h+PkoEk/iXwQYWhQIUAf8jWiMsh2MTzCvKZB11dWE26ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793979247;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=II+/X/AjHk0LYdYU8qce4WUbCQR7IugTOkyE8BsCIhw=;
	b=VaJTQy5uaQELxEdb4nBbXOLKqRjPRV5GVQRQynca4GclIiDdt7J7S9mjvhpbh/EBCXG1
	 e5RmfyDtDkzhL5L615YHzGZ/0NlC8PTsPEhUH3o+F9xviJ3cuvjb68vBEp2MGlaP07NQx
	 s7J7b87er3uDaGwq3js6RJbJg8WZIitp+u0Ym5lsRwwTpdZzKuXPHgDCYrVjR1kOYdKgf
	 qpbph5BxDSZ35O3Krvb6djO4l3Y5subWTIPjvAGGHDIJ7FiYhztFLXCTdsfQf+nk1kGUU
	 g5C1UzgMQieDGy5e3vcFpzCnAJ0fBwxQwH6dlwActp3Dmid9mkTtmdCosGpDTq7bdrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ofnNNgjs;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28F8606A326;
	Fri,  6 Nov 2026 15:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ofnNNgjs
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 288121F0089F;
	Fri,  6 Nov 2026 15:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793979246;
	bh=II+/X/AjHk0LYdYU8qce4WUbCQR7IugTOkyE8BsCIhw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ofnNNgjskEICYvaBMQ5Hxz2bF9n4sLEzhep/feYz49X59zjApKsMY9OE9pz2qlqY8
	 mAqOwsksfHjWbUMw0F7zZ20suWnYkKVpNrZ3IcJvWPoTDb+jjQZnejbYVXq0a5hroi
	 t/bAdCups3F9fq2K/2vn9ARUPX5zG7sQrF94/+0pJcd9kPB1q6/IgESQu7dQGAvhVU
	 D65A/Y9Ry8DICZsndZx0xUSMBL2ysSK9VLYzqjt1dJfpEZc9RESdrJHWV9KPH7n/XZ
	 S0Jy+01bWKjj4NJjAEADzoeTpWedtFeBAf/CG6MdJ7pXiiRljY7yU4N/tAor/3n5Ak
	 VEYK51K2qEKnw==
Date: Fri, 6 Nov 2026 16:34:04 +0100
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
Subject: Re: [PATCH v6 06/10] drm/tegra: Make panel parsing by
 tegra_output_probe() optional
Message-ID: <au3yeJQPgRNiOM_R@orome>
References: <20261105140510.165165-1-clamor95@gmail.com>
 <20261105140510.165165-7-clamor95@gmail.com>
 <au3dMlmsLEOUqan9@orome>
 <CAPVz0n3=R1UhyTw1o-ZR2hMyXwKAomNkb5O-cQbG+TBFJi5=JQ@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="vsbcwdisnglh5dny"
Content-Disposition: inline
In-Reply-To: <CAPVz0n3=R1UhyTw1o-ZR2hMyXwKAomNkb5O-cQbG+TBFJi5=JQ@mail.gmail.com>


--vsbcwdisnglh5dny
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 06/10] drm/tegra: Make panel parsing by
 tegra_output_probe() optional
MIME-Version: 1.0

On Fri, Nov 06, 2026 at 04:09:36PM +0200, Svyatoslav Ryhel wrote:
> =D0=BF=D1=82, 6 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:=
00 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Thu, Nov 05, 2026 at 04:05:06PM +0200, Svyatoslav Ryhel wrote:
> > > The tegra_output_probe() performs panel parsing unconditionally, even=
 for
> > > devices that do not require it (such as HDMI) or that handle panel pa=
rsing
> > > on their own (like DSI). Make panel parsing configurable.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  drivers/gpu/drm/tegra/drm.h    |  2 +-
> > >  drivers/gpu/drm/tegra/dsi.c    |  2 +-
> > >  drivers/gpu/drm/tegra/hdmi.c   |  2 +-
> > >  drivers/gpu/drm/tegra/output.c | 52 ++++++++++++++++++--------------=
--
> > >  drivers/gpu/drm/tegra/rgb.c    |  2 +-
> > >  drivers/gpu/drm/tegra/sor.c    |  2 +-
> > >  6 files changed, 32 insertions(+), 30 deletions(-)
> >
> > Does it break anything to try and parse this even when it's not needed?
> > In all cases we error out early, so there shouldn't be a whole lot of
> > extra overhead either.
> >
> > Adding this extra parameter just adds extra complexity for seemingly no
> > benefit.
> >
>=20
> Dual DSI panel fail for Xiaomi Mi Pad. Maybe you should check your
> email a bit more often?

What's with the passive aggressivity?

> https://lore.kernel.org/lkml/20260305161035.64548-1-clamor95@gmail.com/#t

That's a thread from over half a year ago. I don't usually keep track of
email from that long ago.

Also, I asked previously if this broke anything. If it does, then the
commit message should say so to make it obvious that this is an actual
fix. And it should explain the problem so people can think about the
problem and judge whether this is a proper solution or not.

Your commit message doesn't mention any of this and makes it look like
you're trying to micro-optimize for no reason.

Thierry

--vsbcwdisnglh5dny
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmrt82wACgkQ3SOs138+
s6Ge9RAAs0gRNuV8ajPe0zMqQ7l0nh5k5pTb0yKxufq6QJJsYFvp/fivU8sBmS2L
qq2gjLv/OnCZOmDdDWdfwUStRuTVzI7eQbFouVvGadxjxyWY0VfV7XSXcI6aCH2u
s+hcgNEDaHy1YT+8tyUtOYm+3uVN+tJNnjIbFMxZ8q+s460Qh58+LRe8nyokwRVJ
fjocfQUL7A2VSJWEakyoyD9KNasvaUZ9jTi4cJbxsSM+IfS4lohDFl2VoKZE4o+H
j4QtGAdJu1fYPH8dDiY4160+zPqyQyDms6tw5ZuVA2BFZPRFrKcPgWnKuYNQbl1m
DTMP2XzNO0+7c6m98CCcaBq4lo+jsmlyCkgaXkpLyRFpQP/0SfFD6DQUQHi6asUr
NblJ95fJeYCS6+hlUJi4QJj1uSoqqa7lMeozkKCZGcBseJTnvIOi2d5pErL3dwmE
BcsQk/yBd24kdmEAwN+v9Yz8L+5MfpOJ602GJWMrZ31Sj16CLbeBu6aTa8iE4hgb
gKTG1omK/iF8FHZFzV5xeEHCa7U3LbscouO7o7hwHb6124QfNwBTNLJKC9CFMf6I
yYgKCj2kMyAnEtl0fZCueYvRssTGVhUmHE8GuMBOv5UjCZWEotP2UMuHt6+w258f
K9NmJpqT3ARg6tcamiSLKwUSoTR7yGdNNmGd02C7CPGsRoMWuoA=
=t1Ik
-----END PGP SIGNATURE-----

--vsbcwdisnglh5dny--
