Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4E84D4875;
	Thu,  1 Oct 2026 23:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790895604; cv=none; b=t1u0t3XjPAyK5jZb1wevfi+Y8zQwEH/P4i3lsXBAiNY9oPKjHv7vHqPSS8QbXSRtbItKPTrUwajnTv/OVbsrXMXsPGfMGc9Sl+LJJNLdgLfl/ZSF0kShJkMc0i2mGPkNWOAAY1G9obTGN9rfO7H21A7mZ8HUApFoAHXVObjnBqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790895604; c=relaxed/simple;
	bh=MNyCXZy5ru3r4Fny/rb9dCIGjrACfAsA7/MvgYfiETU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NhddYqyUmLs5ynMp4oovn4/k+wZ3GctyIMWgUSUc9j0gnlPA9Nz/yNipvpfmwxrFvBZt+WC7Dkb88n3XdvY/NWCa8RXR0vVUJPfAEv5EYLNPth8HFfk+eezDcBqq+jEpUfnr9La2XWIqadNwp/GoolpTG6GZLa729WtDM6V/E4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IZsUEa+M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IZsUEa+M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2187C1F000FF;
	Thu,  1 Oct 2026 23:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790895603;
	bh=OvXyZeFZqgoZv43AfR9lxtOXs/un1M9HwAQCfdVDuRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IZsUEa+MZoIpvMEisKnasesrXNQ0gxicq3vOHXtc0inX8fTiscPZlfCZrm2S5OE5t
	 A/nuvt3ICdSXQhr8JU/cGzVwa/G9GTI4SFx6L1wLVfIl5lRQX+Em5GViBkuKglP3/r
	 8hC2sJuPRrtOsaiPlZhLJKJpkeGOsdjFmkdc4wUaC4f7Egj/1dL1T3B1vAbeNrkUQS
	 8zGs6ozL5n9p0a9Fm/YuKkzlXm6RSeMK8yfmyE0HAgxBrFvmZK6BNv6KzEvQLMfPmZ
	 zXi1UfE/+Gzj/lVWfZualVFtTXABqU96i+bgvxH5uleKLaIFPNeLczJErkYuywIdqI
	 xjmXI/+8Jk+Nw==
Date: Fri, 2 Oct 2026 00:59:59 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@avionic-design.de>, 
	Lee Jones <lee@kernel.org>, Shree Ramamoorthy <s-ramamoorthy@ti.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
	Svyatoslav Ryhel <clamor95@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, goledhruva@gmail.com, 
	m-chawdhry@ti.com, daniel.baluta@gmail.com, simona.toaca@nxp.com, 
	mfd@lists.linux.dev, Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 4/4] regulator: dt-bindings: ti,tps6586x: Convert to
 DT schema
Message-ID: <ar7lq50d4IcTCbkU@orome>
References: <20260916-ti-tps6586x-v2-0-f12cfdfb446c@gmail.com>
 <20260916-ti-tps6586x-v2-4-f12cfdfb446c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="abqtqkyhimdysw4w"
Content-Disposition: inline
In-Reply-To: <20260916-ti-tps6586x-v2-4-f12cfdfb446c@gmail.com>


--abqtqkyhimdysw4w
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 4/4] regulator: dt-bindings: ti,tps6586x: Convert to
 DT schema
MIME-Version: 1.0

On Wed, Sep 16, 2026 at 06:41:29PM +0530, Bhargav Joshi wrote:
> Convert Texas Instruments tps6586x regulator binding from text to DT
> schema. Reference to nvidia,tegra-regulators-coupling in child regulator
> nodes.
>=20
> Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
> ---
>  .../devicetree/bindings/regulator/ti,tps6586x.yaml | 196 +++++++++++++++=
++++++
>  .../devicetree/bindings/regulator/tps6586x.txt     | 135 --------------
>  2 files changed, 196 insertions(+), 135 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/regulator/ti,tps6586x.yaml=
 b/Documentation/devicetree/bindings/regulator/ti,tps6586x.yaml
> new file mode 100644
> index 000000000000..1f7c7b35066f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/ti,tps6586x.yaml
> @@ -0,0 +1,196 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/ti,tps6586x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI TPS6586x family of regulators
> +
> +maintainers:
> +  - Thierry Reding <thierry.reding@avionic-design.de>

Not sure if I'm an appropriate maintainer for this, but I guess I
initially submitted the freeform text bindings. Anyway, that email is no
longer valid, so this should be:

	Thierry Reding <thierry.reding@kernel.org>

instead.

Thierry

--abqtqkyhimdysw4w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmq+5esACgkQ3SOs138+
s6Gbjw//b1TnlaW0WiXbta+vQVNVfxN6XgIcleOrTO+lfpFm2DMN8uiY/GdAFJwz
0epfTz/kPVVqacGLxUnHMoq93s6S5mrBm9h0cm/KNOOhzt8R7Hr+0EkfL8deTCHY
YiDNKAQVN7p2bILSFoajeX4BrcfFbJoOdzs47aiRTS+rb6wbiajdsdnKal48MiFr
2xHnPP47eIUJAzmd678x0IoT6fsMrxzTWpmSWMIF9fpV8bS/QO1gt3SWkGBN0e73
MQQD1q32HycjDgoqR0onGpidPfd9p+tGdJtSJTaDJgTFbtsJssQNXAIMPLVG1IK8
WdI12CGtvxHe7YOq7c4DBaes5zuth2D6AvloHN4TQwgyBd7Xihf72tU92pjSP2EQ
ujPZp11ofvuVy0USLlqZ4ymBJnsYBGk0R7k/96b2UPGZC5hesRrp+OHDVGtf8AdL
uyorw1pOq6aS74TXt/b6NQgGhnVGTMgup4MqCdRc5et4T7K9MwOmKF6ADqXiLMZ9
NkxRBzGeHiprXQirutYkFQq2Ltcspi3/DmBULfs2ReijJd0xaPudv0leFklpgeRw
j9AUhmxY6CwmutB2uDO1eSTXUYhatWcw9mot8BtoIs53QyLjku+rJVwHKRMD0LVd
MUQYvDucLfcQm5DbFK7o7ntX0vPpXDL9LPBWqYszE1/22fBQGGY=
=Ng9S
-----END PGP SIGNATURE-----

--abqtqkyhimdysw4w--
