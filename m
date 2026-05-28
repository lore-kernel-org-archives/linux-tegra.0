Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE8F335564;
	Thu, 28 May 2026 20:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780001703; cv=none; b=o/AkpsBIwORLMz/+1/w9f4MlpsKvIADQMosn2I7Q3hv7Ss54y/ZDwtCUe4t4bz08beg2OHbOpasdOjNAowcf65In+Ffbyvu9R/Ci3CiglLZFX6jHxNPP+B1jdgeNWgRRZFSy43dojHB7I3wXuIjZHhuz7PnUvnJNYzbG6s5SjCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780001703; c=relaxed/simple;
	bh=dOTqJd6JhqJ1iluLlkeU56mahjeUTlHSmBTi130cC8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XPMxDwgIpJbBr8m25PLFCn6JiO15laGdtyuqKguVwwrRou+qDVBaAHC+YHplkCafZoUu4kT6WyA1V5fdsvSAFz1/jP5a9wZtoQmKGMfZSp0h14JCJzKBPZ94ILeVuttlQn+fBQgtRWG9/rmJo+ViYQGSndQifGGE21TQdG205zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n2LnRvI8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n2LnRvI8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B1D41F000E9;
	Thu, 28 May 2026 20:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780001702;
	bh=zdA0LK/AwpTCWN6AH2FVw/SyWYwQPpd8pV2IwTlmuJQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n2LnRvI8UEy0I1QCbs5jlyFUaBshGO2OlPU+APUyjKl1MR62b63lYqDTuFjO6lqdZ
	 XR5oPUEiSCUP/s72VOIqByvOO7+7BhfgY/49H7kmbhyezZZUWbkhRckn667OjHqDgQ
	 dloOzbRU7sDA0S/apgnq3LlVuBy7RpFW9+25wR7SXDMGTXNkklt8MAFE6GP6YmlHTZ
	 0FoPuz/PY2mrXQM2766l8HbhivXrfA+PGp5lQQZUs8PSIWUBplbXDpawd1S8TVroLm
	 VJCCKU8Wc/4AJ1PD6xxEs/C9EqbR0KjvBuKEP70Dw4abf1B9rk4BLKgjQgkqaMD427
	 PokUYu6rmCFaA==
Date: Thu, 28 May 2026 22:54:59 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/4] mfd: max77620: convert poweroff support to sys-off
 API
Message-ID: <ahirnB_xN7H8Bnt9@orome>
References: <20260514-smaug-poweroff-v1-0-30f9a4688966@tecnico.ulisboa.pt>
 <20260514-smaug-poweroff-v1-2-30f9a4688966@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="p6o3onhorij5m6qa"
Content-Disposition: inline
In-Reply-To: <20260514-smaug-poweroff-v1-2-30f9a4688966@tecnico.ulisboa.pt>


--p6o3onhorij5m6qa
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/4] mfd: max77620: convert poweroff support to sys-off
 API
MIME-Version: 1.0

On Thu, May 14, 2026 at 04:47:20PM +0200, Diogo Ivo wrote:
> Convert max77620_pm_power_off() to the sys-off callback prototype and
> register it with the sys-off API when the device tree marks the PMIC as
> a system power controller. This also removes the global max77620_scratch
> pointer by passing the chip instance through the callback data.
>=20
> This modernizes the driver's poweroff handling and aligns it with
> the kernel sys-off infrastructure.
>=20
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> ---
>  drivers/mfd/max77620.c | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--p6o3onhorij5m6qa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoYq6MACgkQ3SOs138+
s6EAwQ//aOfiIR5uQgsqKPiV53NTVyIDohHrbgeeqJoJMzxLcgKKskEm/mPnDURW
Q6khoQsGY/esT09Kz1eNNmj+IH972f6heYhU9HgGVKnqke1tWCurOT0UGWM1gb9I
SHSxNkCo2cykttjx6/rEkQb05MGIr143KyoElscAjzhCvCqIlZ32QFDj4HH2zG62
wfH9srEpZOLiU7GKoTu1HwDRkMN7jkeaDFbdVHoGKcm7Oc6cVsOiW3WS/9Blg1Rl
o+vxJVsOnUiQLTvocAHuQx55GM9KNLN+uzl20UxqrFwz1i0G+6+SKp1rGI6oz/yO
0acH7icyBQtSYHi1ZXqXf7GOtQ7HZqNwTngTOfjL5JpbSR/Vvucb3IDFDKA2KK3a
U3L9ImU3DkSrWl9Z0PeU8T015Y2xm2JaBeB5xLCeZSkLw9pDcwj2m8v4NWFK/3be
ETdmRtquIByyrChJORXxrMZH53/PqtJXm1Y7Fii0EKtmemo6b+kMaqhLfWQ6j2Aj
D3gk7xbUQILy9FeEtR4rDmq6thqYypr8zPR61nTWT+v1DP9cqLeTlq4wrRQG4mkH
8F+BLb0y/BQYT7n6dSCUb7/w56FWaPucjALjlx8+1BU8LBVIZ59WEJT6AIjzjlDE
q6W7Yyd6tj6xyzcZ51kbmVcz8eTaUzO2fJVH0V6cvefNWflmFXU=
=eQRA
-----END PGP SIGNATURE-----

--p6o3onhorij5m6qa--
