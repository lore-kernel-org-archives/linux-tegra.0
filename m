Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7253B9D90;
	Thu, 28 May 2026 12:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779970724; cv=none; b=FUKedG35ZYn8o1JGPO+Sum0F6JI5TCLj0ih1r/DCLDJswhADuC/k0GfEaX//pRh008Fvjj7X8cAs/Fuirjl5ju3Mz2tbnost3rcjSX8G0PhC0tIqH0uS2sy5KtyuZ87ot2khDXd3mEEarjn4QQuANNIv3ND2O6qiyIozuJoclNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779970724; c=relaxed/simple;
	bh=F5AeZ6aR4a91CJIySyCnhhR5y6Kkx+LDOgYTl1DVACo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pKCnbpxFLfcZhMkjfXeKcY2bRRvgMw+Vv6xKj2EYXeQC36fN/XFmLEQiwjnUsp5AVWn7I2LJaShw0e+E4eKwoar7cnOVFAcWMCzp5+t/1PEtZrK1tPEzkWVUMIiIRfO17KY2AEuOFGcJyWp++gEQNliW/LCrWkcBJPI+Ehm6kBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=la8OcLun; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="la8OcLun"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 101921F00A3A;
	Thu, 28 May 2026 12:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779970723;
	bh=NH11+mJ5bBQa4zeUL8bXacM3mVoV8R1CnRHTZPVPpQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=la8OcLunEi/rFDWmMjDsmibajjd+8SxW1wGBQ6LeuvDpbtJzgVxhPdS7EluHg8blO
	 mA/zSPvFIi1wKHO47EiavI+V1MdqRqUqolTM9a4d3bLrnngRNsAJEt0YZ2F8G/H7qU
	 G0FOuomBkpOaXjMe9CEJ2d6mVyHmXgHNx4B+Ro8jHabpDLXDpOMA18afhPQCH5d5to
	 ILLejknUZR6ykny7YQoJCJ0js2fnKKyb9Z2Gc78FIN7IhzgpMKvFp7rHyNqMhpyIyL
	 UdB2bbcMIZTSppv/5VPjWzVR6QVWw+duyyDT62tNeBJOF3+64nkcneXvVOQJWP89Kr
	 ZEjS44wvcBouA==
Date: Thu, 28 May 2026 14:18:41 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Tanmay Patil <tanmayp@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] gpu: host1x: syncpt_wait micro-optimizations
Message-ID: <ahgylxp4s04sb3DL@orome>
References: <20260514103153.766343-1-tanmayp@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bmct6mf4goicw7er"
Content-Disposition: inline
In-Reply-To: <20260514103153.766343-1-tanmayp@nvidia.com>


--bmct6mf4goicw7er
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/2] gpu: host1x: syncpt_wait micro-optimizations
MIME-Version: 1.0

On Thu, May 14, 2026 at 10:31:51AM +0000, Tanmay Patil wrote:
> This series reduces the latency in host1x syncpoint wait path.
>=20
> Patch 1 removes redundant MMIO reads in host1x_syncpt_wait().
> Patch 2 skips the host1x_intr_update_hw_state() call in the ISR
> when no fences remain.
>=20
> Measured syncpoint wait latency (50000 samples):
>   Average latency:   12.2 us  -> 9.4 us
>   99.99 pct latency: 62.96 us -> 36.58 us
>=20
> Tanmay Patil (2):
>   gpu: host1x: skip redundant syncpoint loads in host1x_syncpt_wait()
>   gpu: host1x: skip redundant HW state update

Both patches applied, thanks.

Thierry

--bmct6mf4goicw7er
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoYMqAACgkQ3SOs138+
s6Gx+hAAlMUMKg7XBweWXj+62BodkNm8kvFz8QbKkWhemaU0odj362AXOdZtcnyA
ccBkH/AduHZzArbUsk4WnGl9tDEWDeMkIb28j9iKxKpg1XVL0Okoz3YG8vI07CT0
9y1mLC6dvFwiHfY6cIkkUjByw5RaoIlArV6Myddq9cL9I5/hLTfWIFqaYstJr9Bb
7xUcTVdYNYYfavIpkoHkw/MeroJbGCOPQxzomvx0rhoj/2FH9+iZgmXRKAHHop9a
TPs9pvAur7/uVuwo9RSUfWy9mT2PmXMdFE69nGd8e5O1mWQccBaC7DMViiqFoAoz
2YLeO6ydl9kEdgsgolr032RwP80I7VSKl9hW+kvJ6P33Wo8XaHh/txBjuIXMtgS4
Y9SvBKdMbu5H5BJSumUy3yIdkV5hgz9vDFIn5A3/0FowH78dm5bt2WL1u+rIZhgG
PMKXFFmzLr4ioHYDpxDhtPS6D3Xm00dh2ZRU6/5MFPxEVGfkoBLIbqAKXh8j7TgL
JpXz7OZkatpsCFPTApo4IGOiporZn4w3sWbicBBdu0W+EI4mbyMVXPzPHrVad+yS
qKruoFnZD33E+FWAZS1IBRGXoqBJbsa3JAGfh5wjPQ687WR2RcIvNJw7N/q1Ambh
UOqvHsr4onb7YKoQsboVPJ+Q+kQnTimIksp59XiTXo42EutvTTw=
=AsN2
-----END PGP SIGNATURE-----

--bmct6mf4goicw7er--
