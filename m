Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74F1189B89;
	Fri, 23 Aug 2024 22:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724450639; cv=none; b=B8WzTySl6px9Mfz6H0nu2gkLTOZOclEJA06yo9S5Hr6+u72GVeS3wFj757J1cSACCYDyQEmi9iBMjuRhf+Q9rAVI0A7jDRpJNTxz/844XtGKVh79iWDUMet+VKQkshhKu5AC7r59cRjKm/qDH1V5u00SQmThbQoJUFKVcEoqupo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724450639; c=relaxed/simple;
	bh=e4tDaDARiwmh5IybNCFovwvKcQSXZXZBBcOVAS3QSmI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GKJPLsSuOfCi0Ts/avwZkOOKgjCZU26Q+/AvBrUGJnAC+Bqw7tVSwWGhj9Gf8N/qPLXlDvSnE5G34p2ekw+48vu6NOunnAPsVFbEjGMdPaN+VE7CXuKiReYWvyw81pZYOq+gHGO9FGiL6jLClyp4g7JpfTtvXN8DDRC7bPY3XWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N2nSK7wJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N2nSK7wJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5857C32786;
	Fri, 23 Aug 2024 22:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724450637;
	bh=e4tDaDARiwmh5IybNCFovwvKcQSXZXZBBcOVAS3QSmI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N2nSK7wJ5ZDJITC5AFRBq1Dd7Ojw1FZqqV5aJjZpT/2fpDq4wlljUiuExF2FBOeYd
	 qVbz+NmVpq/Z13nYLzbQIOKg0PDbMoGzydIt61JA5idiXamHHdlmLt//F+FUd5vi9X
	 P16G9wVe8WdXLFvRibK8SGzUECsykYEcjKk5LoP8hSM9YY6pW/YAZ2KVozcuHmkJiK
	 msWcA8UG3fwCHYRdhahC50G7i75s9s2UM2nKvfifw24kJOlYW+Tvhth0t5z9FevhMd
	 S3U9TlNZrUbLTfYScdi3Ha+J5eNNGLqPrERHPQR3WdTVhirRvmPXbbzm6ibEbVr2LF
	 C9F90dE66IDCg==
Date: Fri, 23 Aug 2024 23:03:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Sameer Pujar <spujar@nvidia.com>
Cc: linux-sound@vger.kernel.org, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, thierry.reding@gmail.com, jonathanh@nvidia.com,
	mkumard@nvidia.com, rituc@nvidia.com, jbrunet@baylibre.com,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	robelin@nvidia.com
Subject: Re: [PATCH 1/2] ASoC: dapm: Fix UAF for snd_soc_pcm_runtime object
Message-ID: <ZskHSUlzwQwxYNpR@finisterre.sirena.org.uk>
References: <20240823144342.4123814-1-spujar@nvidia.com>
 <20240823144342.4123814-2-spujar@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R2NCKGz3+nZ3j+Xl"
Content-Disposition: inline
In-Reply-To: <20240823144342.4123814-2-spujar@nvidia.com>
X-Cookie: Your love life will be... interesting.


--R2NCKGz3+nZ3j+Xl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 02:43:41PM +0000, Sameer Pujar wrote:
> From: robelin <robelin@nvidia.com>
>=20
> When using kernel with the following extra config,
>=20
>   - CONFIG_KASAN=3Dy
>   - CONFIG_KASAN_GENERIC=3Dy
>   - CONFIG_KASAN_INLINE=3Dy
>   - CONFIG_KASAN_VMALLOC=3Dy
>   - CONFIG_FRAME_WARN=3D4096
>=20
> kernel detects that snd_pcm_suspend_all() access a freed
> 'snd_soc_pcm_runtime' object when the system is suspended, which
> leads to a use-after-free bug:
>=20
> [   52.047746] BUG: KASAN: use-after-free in snd_pcm_suspend_all+0x1a8/0x=
270
> [   52.047765] Read of size 1 at addr ffff0000b9434d50 by task systemd-sl=
eep/2330
> [   52.047771]
> [   52.047776] CPU: 7 PID: 2330 Comm: systemd-sleep Tainted: G           =
O      5.15.148-tegra #9
> [   52.047781] Hardware name: NVIDIA NVIDIA Jetson AGX Orin Developer Kit=
/Jetson, BIOS 36.4.0-gcid-36705213 07/01/2024
> [   52.047785] Call trace:
> [   52.047787]  dump_backtrace+0x0/0x3c0
> [   52.047794]  show_stack+0x34/0x50


Please think hard before including complete backtraces in upstream
reports, they are very large and contain almost no useful information
relative to their size so often obscure the relevant content in your
message. If part of the backtrace is usefully illustrative (it often is
for search engines if nothing else) then it's usually better to pull out
the relevant sections.

--R2NCKGz3+nZ3j+Xl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbJB0gACgkQJNaLcl1U
h9AMzgf9GQTnpYLUCLYDlZ1ScLgraDZmayp7WayrO7n1+D6Vb4yaYM+rENI9g+eP
sZ15s2qN6s818rkXu90+AfsRoc67V6mwQvz4ElhA6qoGqHe3CAAsdCDVHyr3jIG/
vfiG6PNltVJwCTHkVSvrPH9KUReIZWCXLT2TuCpHvLJsSaaFzmyMnekux/wWCrjA
oBtITgh4PolHZn6cKfizeVwNk1ECAMUdJNndBZOfqZ18cLbz58wjxu+ecZ6urtPw
5lB9dNgJHLr1gSfQbp7uOlPds2xc0vTORJvv69e3CH9tkbTS+qQ4nWx6EYIMt4AB
T3g1wWg+nVgnLzYku7EEVIo6KB0r6g==
=Rd43
-----END PGP SIGNATURE-----

--R2NCKGz3+nZ3j+Xl--
