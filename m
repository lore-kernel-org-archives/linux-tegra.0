Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793971438;
	b=1riAvx7482LwScsn6BEpC+b5AZIgwx9FIg5fBWrCAobQTp6qbebebdATv0YaZ2OoCBvO
	 NlbrWNPls+jxkwdEnN1z2EU1THwRF3TCJVlJNZ0SQ8O430z+HnlhN0qd/XUZeXB4AJUSy
	 VDp5kWeeWjXGbCrKTVHYbkHc2qvxGDFXZwNUkn7LXxaqepde3HdFlc4fVLNVMP4QT6BRP
	 rjcK6skAOQx9NFC97i3BJcD0axrWHJS8TXg+HnObyOAaaE3W+V60rhOuTmDGASt4aYs80
	 vcu2hd50KGTQpZ0UXYToPqij1Ym/GEV6WL/3+K/XqwC9qkBEzYgXB2uPzhRlZ4nMv+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793971438;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=/kodSX96ujDziaB7lGvbVTnU34UOPakkV0ayfzL5L94=;
	b=P+RSeAQg9gYKCN9pR9ChiviOXFq2woj7/8yabHwSagWVY1VzPcwMPiwS3Mtq3Kn9v1S+
	 sW1Rd+V+RWqYqeIzycEA6muFfEQ7hnmCNvgHqQn7tShdG5HbX7vNqoN29BGahQu3VQR7T
	 oMiOsOFt2N+zvIVaYz8rkPRXNr9rgBUxYZTuGXkp7Rn5XcEqlH/1v3KTXEwvD4Q2fbcUS
	 dKniHUNMJmA1nLFPRswqoUsXUWMhemcR/knnmRNhJhp684rUgSCFs6bw/4Tcagks0tZeO
	 CZB83cpIHjdxPVLh6YLMTnvGLj3fvPc9zpqTxWrk6+6oW1o28k8w2i1k03MJjRvSwnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ho07j9cZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67629606D80A;
	Fri,  6 Nov 2026 13:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ho07j9cZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 812661F008BC;
	Fri,  6 Nov 2026 13:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793971438;
	bh=/kodSX96ujDziaB7lGvbVTnU34UOPakkV0ayfzL5L94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ho07j9cZPpIFko6+b33h7hgp49r0Jv5esWt04CGV55mDgMi4ztV5nlxeGDNtFvvHQ
	 wNc84qttMZ6c1HH0Wz4zic72EazVEMi7rlYABUchxcFNmNlQvH7Pe93nq06YKijeXa
	 JuaaH1BWG2w29Cz++yEB9wUtMPOYRli8YR1S2nu990V/l5jAiJ5HyoyZD630l1AVlt
	 +V4LQSJpTCgWlI1CinOeTcKa5E1CPyUPbkZBG7zn0f8FXYph3Nl+zBcFP9F2KgVc/t
	 9c/ieaiLntkWOx4jCKTRFbe3IDSn947+zyciyMZFoz3hqn+Nllc4b/4zxOJPBGB/eq
	 Mrquu4m3cIfcg==
Date: Fri, 6 Nov 2026 14:23:55 +0100
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
Subject: Re: [PATCH v6 03/10] drm/panel: Convert LG LH400WV3-SD04 to use MIPI
 DBI bus
Message-ID: <au3UDDpLUmeIOwEH@orome>
References: <20261105140510.165165-1-clamor95@gmail.com>
 <20261105140510.165165-4-clamor95@gmail.com>
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
	protocol="application/pgp-signature"; boundary="qkzlestmbzyulvpc"
Content-Disposition: inline
In-Reply-To: <20261105140510.165165-4-clamor95@gmail.com>


--qkzlestmbzyulvpc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 03/10] drm/panel: Convert LG LH400WV3-SD04 to use MIPI
 DBI bus
MIME-Version: 1.0

On Thu, Nov 05, 2026 at 04:05:03PM +0200, Svyatoslav Ryhel wrote:
> Switch from a generic platform driver to a dedicated MIPI DBI driver.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/gpu/drm/panel/panel-lg-lh400wv3.c | 103 ++++++++++------------
>  1 file changed, 46 insertions(+), 57 deletions(-)

Same comments as for the previous patch.

> diff --git a/drivers/gpu/drm/panel/panel-lg-lh400wv3.c b/drivers/gpu/drm/=
panel/panel-lg-lh400wv3.c
[...]
> -#define panel_dbi_command(priv, cmd, seq...) \
> +#define panel_dbi_command(dbidev, cmd, seq...) \

This probably also applied to the previous patch, but there seems to be
no reason for this change and the related changes below.

>  ({ \
>  	const u8 d[] =3D { seq }; \
> -	struct drm_panel *panel =3D &(priv)->panel; \
> -	struct device *dev =3D panel->dev; \
> +	struct device *dev =3D &(dbidev)->dev; \
>  	int ret; \
> -	ret =3D mipi_dbi_command_stackbuf((priv)->dbi, cmd, d, ARRAY_SIZE(d)); \
> +	ret =3D mipi_dbi_command_stackbuf((dbidev)->dbi, cmd, d, ARRAY_SIZE(d))=
; \
>  	if (ret) \
>  		dev_err_ratelimited(dev, "error %d when sending command %#02x\n", ret,=
 cmd); \
>  	ret; \
[...]
> @@ -177,14 +166,13 @@ static int lg_lh400wv3_get_modes(struct drm_panel *=
panel,
>  static const struct drm_panel_funcs lg_lh400wv3_panel_funcs =3D {
>  	.prepare =3D lg_lh400wv3_prepare,
>  	.enable =3D lg_lh400wv3_enable,
> -	.disable =3D lg_lh400wv3_disable,
>  	.unprepare =3D lg_lh400wv3_unprepare,
>  	.get_modes =3D lg_lh400wv3_get_modes,
>  };

It's not obvious, and also not documented, why .disable is removed.

Thierry

--qkzlestmbzyulvpc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmrt1OsACgkQ3SOs138+
s6E7RhAAhYaqjQpfxuR0l1ZuY4dmYeegPdxooSOgCYqYp6c11Rh7fip7s4vdJYqE
emn9EvuSsZjwV0kF3BTkroWFkJBKtFZB1KpHqJMiUfB+l9zRZJEb1w1/rovBXP9n
XhAroklrn494LRa5A6WMuSU35U5AXCOvY2PX3euu9HJlTjwO4tKqoXLy+JvjPifE
LNCylIWfRgampR3y8wPzpjoon3e5QnIeK9yMOyLetAd1/dl9+pCH6ROlFc8eWiim
+6dJ5V2p2kDuauD3CVGI7oPTDV+jscsaUV+PjkB1urv9TVEGvNC2P3vDz4gTZa1s
FwnZNQqFj84PUho4vCZZKIffM7eV20S5jBPuzgWdagZVTY6wxKwsIH/OXY7E0FU0
dCRqGabKG4a4v8iqSdB1f1IrxVK7Ic8aQgliAVdt4SjtNu+/GbVm/FcinEbu4Psz
LbqDxv/T8HGc9YVhyqQdY7ni09OuEaTez7FdmmHZL1nzSaf0OjAHhqgCVyH+HDZo
nIeWl1MxRe1q0cuwHeYMQj0uQ6JSenhDHEILix2i6AFt6w3pspErjxkb3Xo7Dm4G
r+R9/oZPi/zcZ5oH0aCWQRTkK9a6WgVscbNh7K7dwQfPMMFZ51CWG1riVluLRxGf
+rdrQlldQVhAEJrgw3lwjVerdbSRz76nVMwadaXh+lhcbeR+3tU=
=TgBu
-----END PGP SIGNATURE-----

--qkzlestmbzyulvpc--
