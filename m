Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FEB3C3F55;
	Thu, 16 Jul 2026 21:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784236922; cv=none; b=CfP6Vhgz1aBapGXjfT1/VaSZ3jWbva+r/3rzTVPFlB3n21TgTKdG/D742b3EpIosMfW1KzHgaAbqDAPJ7Z6qKGS2cpWDz8cTUfoFqSjfpmi7oho/s0K9i6l5UAd2SlnCTjiDTNcPfOvKdBj/GS1GupJ8Dk4RODBCqSE6FyIlcqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784236922; c=relaxed/simple;
	bh=IIXfDbmyF4PISlHDsU3XySkrXsBnSU3kSUci847v5Qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T2dSM2uJKq0WwmMW2DNe4U0wjhM5DJodtEByj/8wDgEVWI6yRqSd6Ynmr7NnEI1eqZBgdvyT1ZYPPsLMgWdTkQxUiom7YE7+jBoC4zyLtQpKW130nDn74ZUJnPwgOLnxU7F72qPOQTVvMjJnDGbKfrI0tHZXuLLrH8jfTCqxM8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KArvfXl9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KArvfXl9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABEC51F000E9;
	Thu, 16 Jul 2026 21:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784236921;
	bh=PQAxKJampJ6BYjnx2tQU51KQl8X51MqlR83zG55ZGr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KArvfXl9H4RoBsPCCXOF+k6eKVZITLKNR7uk5Cw5gKVsiwKkRgiVyhaauGx34K79G
	 Orqq8A0WaxuRWNXmjKg9VTvKgK9lBltcG5WY/nPOsSoZZ7vOCK6NKBzDrmcfodz5J2
	 LUlCS8WQOZL3jDgySOWedJJkr53+v5xopknnZWXR4lJUrZxQh51NRWVeeWjlzva+RI
	 h+4LuPWG7WSmpJzGyF1sFg+IPKtecM1JLl3/2UJrdhj8Kclnw4m1yGQdy0uwWPO5oM
	 aKGoVd9YfLch8z4Yhy/v9eGtKVJk40ZBk+j9DDcCdfNN3wMEujgMZc7ahwR3JvCeqf
	 qUI8/r7vlV2Tw==
Date: Thu, 16 Jul 2026 23:21:58 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-tegra@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 7/7] arm64: tegra: Add Host1x and VIC on Tegra264
Message-ID: <allLaoy3uKyhIgs1@orome>
References: <20260622-t264-host1x-v2-0-ff7364d9ff7b@nvidia.com>
 <20260622-t264-host1x-v2-7-ff7364d9ff7b@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="expvlkcbwdbfsl3w"
Content-Disposition: inline
In-Reply-To: <20260622-t264-host1x-v2-7-ff7364d9ff7b@nvidia.com>


--expvlkcbwdbfsl3w
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 7/7] arm64: tegra: Add Host1x and VIC on Tegra264
MIME-Version: 1.0

On Mon, Jun 22, 2026 at 03:57:44PM +0900, Mikko Perttunen wrote:
> Tegra264 has a host1x instance with a VIC (video image compositor).
> Other multimedia engines have moved outside host1x. Stream IDs are
> now namespaced by device rather than being defined globally --
> however, the only engine we have using context isolation is VIC so
> we only define VIC's range of context devices.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra264.dtsi | 63 ++++++++++++++++++++++++++=
++++++
>  1 file changed, 63 insertions(+)

Applied, thanks.

Thierry

--expvlkcbwdbfsl3w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmpZS3YACgkQ3SOs138+
s6FirQ//RkjggMzhEiiMStdAyRG34FXZLizVqFQy+9aXzk5WxBZV7vkpMK7em2Dm
wBmGzLoiHH+TYGw2R5k++U7D7zdg9EWtCIREGavtftZpSe4vkhFsCB3dM09ZD1Wi
BempOfPGJ99/QCBbsm+WYrKtB1tct0+/r+t1a4tQS/CvX4oQzb9Db6VtdwcLWGSj
h2YBSFiamk39UE24fOK1m9jplY152PecGBs0ogKcJ93MhsByUenJUwUh3EkOWa0D
HFQ+9YgTDUEIE6vV87qO+YRxAnBhsMue89ljTfluZNK4enFrMNvtjXVhZWxFupZB
4CF0mQ4beLHpZVlniEqMhM0hkPj6VFKHVekEcP1l3ZviOOFL828qqrx03PaxfM9s
o9P7czdtBfuXWzKRT/efnCwDVlM76KoVUUVHjtUtxwtZtOhk2KoGdLCUcvhKzFrw
iG796LIlnSk7d0jPMQpFHAQURrvjLLDsIkvMdNsBQfhM5pGu3/iskPN/YEkQd91J
YkN/cLLH7xAirey8cfn7ravnHroKFecg6w13pO/YjtnHdZqqMkxPaul/vVr4zRJr
nduN2TwJRX1WJIiKvDUGhRzkYNPuC+hPN0hzIuosYUOHH4He1rdKTZ4zI2Sf2OKJ
VOar/djvXVuyclin+QnbvWqGw9d+M9vuCH5ZycVBzKmM3OPkg5U=
=iUOG
-----END PGP SIGNATURE-----

--expvlkcbwdbfsl3w--
