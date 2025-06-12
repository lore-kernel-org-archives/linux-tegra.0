Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6270A222575;
	Thu, 12 Jun 2025 15:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749743202; cv=none; b=kOxpcBn3EeDpALvz1QO4QacmGUOM5rfPKy9mJOyfhQczNxSti92dDCoCOP2XLh9X7ahugdHtFn/xXnuCwiCm05bjSJMWeT4gi2iE6lDcuiFRyd4RuqvldNSbZhFSz6C1ZdEmnJPhp+kSwcgOntABLnVo8N4yN+agSZgJ+3up2GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749743202; c=relaxed/simple;
	bh=nN7tgNs/ZFcOM7vnqnGPxg3lpLHHcc83AoFtsLi0eQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nyQhtIm1Kltj3qHEuIKkREhwAHVXY+ODfT0Nz8Gg0tubgaM1SHLFJ72gimdalCiwFjV1OZ4SdK2FElB2Vj9fyMmcSCftHsd7H0tNCJkesRCzux4/gkjMS6HHWkInsyUhSsZibOkvurNBYZq7J/JQTiZcri7phJFJsbQU2xmCR+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G5RsZj6E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G5RsZj6E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A4BFC4CEEB;
	Thu, 12 Jun 2025 15:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749743201;
	bh=nN7tgNs/ZFcOM7vnqnGPxg3lpLHHcc83AoFtsLi0eQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G5RsZj6E3hWrBgSQaBbUpfwiWHbjT+XCDDuSwogMQ63iYc4shmexLMBE/Wr76Drko
	 UzgpemkSIogOdoLz/VzwR5WCJi+AEGLJVPB+6EmKPj7ah8gI2jmwbBEddVGmMVDhzE
	 1FUU0N0ALL1dixaD0vqO7F/JWGTr1x7XrZ2+vQuSc+l5QV6n3W0iXIPsChjFBTY72H
	 Df47tRCAMHu17KzRcMil6SpctRy+08J1IXJtCiqBnknDyw3j2fjf59FTxv8Q5PXz5k
	 FIV24SU3DZ078EoLZ6jJvrN11IS7EYgCYdIbTpblT5ky/9gWn1BSnkpBwZpyt6AgQg
	 eRWqucdUJK02A==
Date: Thu, 12 Jun 2025 16:46:37 +0100
From: Conor Dooley <conor@kernel.org>
To: webgeek1234@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: samsung,mipi-video-phy: document
 exynos7870 MIPI phy
Message-ID: <20250612-unrushed-endurance-a9a0933fb8be@spud>
References: <20250611-p3452-v2-0-fd2679706c63@gmail.com>
 <20250611-p3452-v2-1-fd2679706c63@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="h5shkSpl2/e0c3YV"
Content-Disposition: inline
In-Reply-To: <20250611-p3452-v2-1-fd2679706c63@gmail.com>


--h5shkSpl2/e0c3YV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 01:53:37PM -0500, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
>=20
> Add compatibles for the Tegra210 Jetson Nano Developer Kits
>=20
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--h5shkSpl2/e0c3YV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEr2XQAKCRB4tDGHoIJi
0n+0AQDB10mgfSWItI9oBHwCaew2X9fAIPcr23SmYH2qihEvEAD+OWkUm3h9K0hQ
QD47+O9BP+3shMzJuAPoGh2VVN4vbAY=
=TzIn
-----END PGP SIGNATURE-----

--h5shkSpl2/e0c3YV--
