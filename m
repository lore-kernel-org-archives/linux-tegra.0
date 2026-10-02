Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11483400986;
	Fri,  2 Oct 2026 22:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790980824; cv=none; b=kY5BNVAsjeIVT6Z0QRbIwaX1ASHIBeYb7NKTliO1yyfGskRbgf43OfEW4QYi9DX//1i9v4UD7nVzBenMsmGppeTdGLZa8MEkrUF1IL6SVr8iLLFTVuGTM1C8PZtec1TQLzFOM3zJmHYZ3gNMyMtoiRIIOJNxj99eCveX9WO/xqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790980824; c=relaxed/simple;
	bh=JwW5mZmTud5tP08S8sNobma0ZDT9xCYCjRO1RBOIrao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hhWM9S4t2BwlHRRiv95iPm2d/FdlI3dhXak6QAggM8C4t+ZgoYYSVq5MHL/dKsOTxyupYejds64SlfLsCrhnfV/yj+OqZBFoGsSiErRPLC3oHIu8rccJ15aFMsI8YeYTubDC+2ffAjf6BOShW7oiHcP8QMRysB09TtWy1OHKM8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UcT3IiuU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UcT3IiuU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 205A91F00893;
	Fri,  2 Oct 2026 22:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790980822;
	bh=b+guDJ+6ue63Kf74hHxrjaU5WAEYvQyFDLTq3NDnDjw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UcT3IiuUrqnW4MReGXc0oI/ClzghLUrLFMzK/QH9galk/R3HnBP6+TZGIyCGWZUzW
	 XAwM2DeXL+8VNL16+C009PYDtRfGAdDbQyaCUV0o8XfuYtuEXesXNBw/BeSNJ8yv0a
	 58CuNQ17m4HR/J50B1W1Z+8//Gg2H8vNZVywmKRGofz3s8oP/LpGjkgrLlfePxwWVw
	 uCuD7rJFCJOUXxjJU+ZqMOtn3bY2mIy9L2104IqbodofBhFhu/2/Y3m935LQlqwp5J
	 836P13AMlQEhZ4zJZBn9nU+anrcvF4SSbymbHjBVatn9VAjqj2dOhAvFT7l5F5Mmt1
	 74B6DL0mzBhNg==
Date: Sat, 3 Oct 2026 00:40:20 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: webgeek1234@gmail.com
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alexandre Hamamdjian <azkali.limited@gmail.com>, Thomas Makin <halorocker89@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>
Subject: Re: [PATCH v4 0/2] soc/tegra: pmc: Add Tegra210B01 support
Message-ID: <asAywx-TFRgVVMxc@orome>
References: <20260727-t210b01-pmc-v4-0-af68a21cd746@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ysebxuimg42wkplx"
Content-Disposition: inline
In-Reply-To: <20260727-t210b01-pmc-v4-0-af68a21cd746@gmail.com>


--ysebxuimg42wkplx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 0/2] soc/tegra: pmc: Add Tegra210B01 support
MIME-Version: 1.0

On Mon, Jul 27, 2026 at 09:00:09PM -0500, Aaron Kling via B4 Relay wrote:
> This series adds support for the Tegra210B01 SoC to the Tegra PMC driver
> and documents the new compatible.
>=20
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> Changes in v4:
> - Add venc to powergate list in patch 2
> - Link to v3: https://lore.kernel.org/r/20260722-t210b01-pmc-v3-0-1c5b970=
788f2@gmail.com
>=20
> Changes in v3:
> - Update patch 2 commit author and sign-off tag as requested off list by
>   author
> - Update patch 2 commit message to describe the powergate differences
>   compared to t210
> - Drop sata powergate in patch 2
> - Fix has_io_pad_wren value in patch 2
> - Link to v2: https://lore.kernel.org/r/20260720-t210b01-pmc-v2-0-ca5317f=
8507b@gmail.com
>=20
> Changes in v2:
> - Address sashiko report and drop duplicated structs
> - Link to v1: https://lore.kernel.org/r/20260717-t210b01-pmc-v1-0-bf776be=
8b3a7@gmail.com
>=20
> ---
> Aaron Kling (1):
>       dt-bindings: soc: tegra: pmc: Document Tegra210B01
>=20
> Alexandre Hamamdjian (1):
>       soc/tegra: pmc: Add Tegra210B01 support
>=20
>  .../bindings/soc/tegra/nvidia,tegra20-pmc.yaml     |  5 +-
>  drivers/soc/tegra/pmc.c                            | 62 ++++++++++++++++=
++++++
>  2 files changed, 66 insertions(+), 1 deletion(-)

Applied, thanks.

Thierry

--ysebxuimg42wkplx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmrAMtAACgkQ3SOs138+
s6Frgw//X9Oo5RC5Q83CHX55FUS+RusWjU8bD0e5Pv0GuZ/D2kZ8THLu54baIX+r
5nQbMMHi3BHz8eF6Xn1ZrK6twQhq6v/fEp7Vo288ixLv8gZwEeS0heKxm76qbSdC
IOou2+rWXMlSUIyjVcW/C4X8bjClyJKYjcaM0SU0DN1sVC/F718+zLLb3mpilhpO
cQTdBf8e2ZBfE9TNAIWoIlUgePVYHG0NMTE6oNB1CneLbrwL+qBhlbjdKi0IRcG6
kcU8ggB9uCq328VXx0rfpoiYH2GB977DeMfWADN76g89gf7z1jdqgO5d3jByeKpS
rOw2b3N36mXh48iZ5BKJRLMIhM59g6n0P4/awVQ0df/0oCcGNlFDHQCxQGU6ZHHA
LZuXpkqf6vekofTZiTqbV4aIJFfh0o+L3pCkxxrK6XuGK+8JoDpEKZPoaI2Kp4YO
TM9cN8E78MWArg9kkaQ3hK94a3eu/sGoEY03nmgVEQZijvKVRXV12goc31tx1nI5
LgGZ5Unmm792iJkNgAzQuVUvZILuB/9G58W31bcd6ZmRDl4p/JrKUPNIulbGjVXa
SzHAyhHO9g1O1NgQ6lXQK0N1c2xZJB96+mmh19BW/Gq12VAYZ3DQ3qRSxW4y1dFS
o2jB3sRzXJHuk0tzN71ajfBesZMpG1LAWvCyZHkiiLH/TMlQhug=
=303I
-----END PGP SIGNATURE-----

--ysebxuimg42wkplx--
