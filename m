Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AB2542E42B;
	Fri,  2 Oct 2026 07:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790925998; cv=none; b=mvaODdjc/oep7O2abeiuwvuzSenU0QDrP/Lw41KNYAtF08LZ9MAA3xtQ7s9z2KiWqtP8vz8hiUx06XmdOZlJeLAWD3bBUeL4MFTmXdEVrJbQk/VGX++8BJ7dbMmQ2waXLysKybkvJL6tziKXk95zzDQab2wyMgTw+4Zus+y6+uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790925998; c=relaxed/simple;
	bh=M8LDx81Q8GYPdxpUav/etcd7GxcM5WDdP1EesCwH8/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IZTRkDTf9bObfTCW9S7OMkrBv0EpxUJjnV/218Vflt+i1PV5DtU4hkHKEC9Hpw9HMwCSDthN3kml9LtOo2g0ym/909u6acyyqj5dAoz0gf20bzOUW1Kg7hjslEFlAl+IgAOvQFTfQvl8VDyE7GDQtAzsQak+/fTroXgPSfBaILE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GJU/RckA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GJU/RckA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 922681F000FF;
	Fri,  2 Oct 2026 07:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790925992;
	bh=t4Aa2rDm5IJKQVp9njva5WgCYsDKYOwucAStsTFJtbA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GJU/RckA8iIsEm/XH7EkqCo/C9CckCBSHHmu72+tpVsyn4rWcGsIq21cpPy5o4CLE
	 ryQ7TIXeFh1H8WjDf1xDd1LGh+3cNS5jyYSL2zR3HaMifpuffZJw0PtqhwyOf/3iB+
	 iWJhnhkThZHZ6Ifgy9wGXn2gdp/qOw3izHl6q8/Na8OYgw7RE+lHI28Oke+fQJqTun
	 CVamtDd6qh4IetXIk3QyJ8b8mZdCebe6hNFSpsq40K6waDRvYaKpYMgitCg9Qvfr9e
	 RPJbtfsiFxrOyXj4O2+aEdQUgYkUZKdTYCOvOj5taoxjkgsXtuREvfMj9e+jyygZmi
	 DfbQrTDZdKrQQ==
Date: Fri, 2 Oct 2026 09:26:29 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: tegra: Replace spaces indentation with tabs
Message-ID: <ar9cmeQQviinOJbz@orome>
References: <20260829193858.107368-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s5ykh2ispqzj7bvd"
Content-Disposition: inline
In-Reply-To: <20260829193858.107368-2-krzysztof.kozlowski@oss.qualcomm.com>


--s5ykh2ispqzj7bvd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] arm64: tegra: Replace spaces indentation with tabs
MIME-Version: 1.0

On Sat, Aug 29, 2026 at 09:38:59PM +0200, Krzysztof Kozlowski wrote:
> Replace excessive spaces for aligning indentation into tabs.  This will
> be reported by dt-style-check ("[mixed-indent-chars] too many space
> characters in indent (more than 7)").
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra132.dtsi |  4 ++--
>  arch/arm64/boot/dts/nvidia/tegra186.dtsi |  2 +-
>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 26 ++++++++++++------------
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi |  2 +-
>  4 files changed, 17 insertions(+), 17 deletions(-)

Applied, thanks.

Thierry

--s5ykh2ispqzj7bvd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmq/XKIACgkQ3SOs138+
s6HEcg//fSTNvrj7yG/sTCj5gra0mg7yx/MdHKpc4ejj0w3uewt5eHpKa1OhXyqZ
4uGCcTBgZFsylp5wTVtRpu36EzrQACzKhsldGgvtIAsXfU9xcUSymawDU1RoTTYC
QT7+4jEB75RmMLKL/CEiZ1XfXp0rBnJqUedclCaQh/WaBLP89mfCK4FG0qIq8T2/
C7uup6gdGCO5Stk7/21hGBRXoFzbtUPjSOI9Bv9UE3vl0J0pRQKUx31Aqnbm/Lqr
m9NxWPQ2gcPd0r4jks6naubUxSunY1CBTq66vqM+XOajRwQ1PNn5DUTv7riYyS3w
5QqmryN0JsLiYb/fSa1/LazSnmtkTIEYFXF8gZFtYRXx6wmiwgqgS4J4QgdzzJeq
tDKMVOitbDSL8YhbXNNuLNKbNmIBvkUVDDvKIF8wDLKdYUwmoLaRbh0JOIbTKpiS
DKUZiBI9ZacP8tSJ6JsUaMulRCSrKHKO2o4/cMJdoq8VpipzSfLCoklwe2jJNNWQ
eKsIgc6FCs6uVkU0aTASLis9diTSFTFrdvrseKskNXRhsUDm2g6LSnk5k4wyW785
AKU3duUVfaC6hO/M7IkPRJ/1V+wJvOm6vVOWZyowE9ESdnlRkXuoEojHR14+l+X2
xQOOblBLZZMG8yuDtH1GwgSAFqEgM1vOeBQTPnhacE8hdhucyfE=
=UBg2
-----END PGP SIGNATURE-----

--s5ykh2ispqzj7bvd--
