Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05606421235;
	Thu, 10 Sep 2026 10:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789037599; cv=none; b=fI83he8053PKaERvK3YVRziITbwpfrTqBUfOSCUqCNvNl5R6RjVR0++VTjeRLk16CJDmCt0HyAq7oEegZxIu1+DMQ2QfJhcU5rDl5ujyRJC8VQMfyRup9+hQ3s3c4oA2mlPTjwpqRBBd9gMjOE3oHfq6lBtMkoGPOtJ2F/4yurs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789037599; c=relaxed/simple;
	bh=XQ4bOpWEdg7joI/rHhEM0ntGnna/QHZ0cyWmU7NS4QE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SCPxaumkUKBAwVWaAVn3ZjvekAMHzEVa/9sGSJBPAlBGdFThzLey2PkIw9/zAW4kjeazfLG1eq+CIs/j2zpe+AsE3pmPX0tf43WuY500qKzQptO44gsWN2Ru8YFFVtcceIMCaOj7UnXvKys8czEtU3JTNwWqpNRuyh7ramjFmBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W0qKshY4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W0qKshY4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 164071F000FF;
	Thu, 10 Sep 2026 10:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789037597;
	bh=MxMwOJOdXW6C8s3622AqqaYNuUGyq5gIDqrLGbv8shM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W0qKshY4SnWlyQeFf9OJC5RXsUxOWyYDDXegchHthqgABJIN3xirFUmn4i1uNv8Ux
	 l3+QOS1h/8yd092xWjYosXlzvtHo39MMxAWSnhc30V8THpspbyPx4yehKhAikWPd/Y
	 4tE3rGoG8WhLR+vTOJOSzN/BDBCphWvAS727LqC/TeKzPmo3db7V+/+lajtonOD4xp
	 Am8Kuwq0RhvAqkefcCgz5wi0aPzrULTufO3DbHweR2OMKMywQNesO3lLkLGUcZHMWd
	 Xmzi3TUAQm8+sfBxSDYiTpeKkbRc534m+5xPV1Y39TEnceKojuBRHYGXbEOYMn6MyN
	 5mqKBoeeZEN/A==
Date: Thu, 10 Sep 2026 12:53:15 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: net: nvidia,tegra234-mgbe: Add missing
 properties
Message-ID: <aqKL_UX7bFt4BrYE@orome>
References: <20260902003004.453960-1-thierry.reding@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n4di5mlilxk6ph5q"
Content-Disposition: inline
In-Reply-To: <20260902003004.453960-1-thierry.reding@kernel.org>


--n4di5mlilxk6ph5q
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] dt-bindings: net: nvidia,tegra234-mgbe: Add missing
 properties
MIME-Version: 1.0

On Wed, Sep 02, 2026 at 02:30:04AM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> Being a DWMAC derivative, the Tegra234 MGBE supports AXI configuration
> nodes named stmmac-axi-config and phandle references to them using the
> snps,axi-config property.
>=20
> While at it, add the 10gbase-r PHY mode.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - move common properties to snps,dwmac-common.yaml
> - link to v1: https://lore.kernel.org/linux-tegra/20260716212001.989872-1=
-thierry.reding@kernel.org/
>=20
>  .../bindings/net/nvidia,tegra234-mgbe.yaml    |  8 ++-
>  .../bindings/net/snps,dwmac-common.yaml       | 66 +++++++++++++++++++
>  .../devicetree/bindings/net/snps,dwmac.yaml   | 52 +--------------
>  3 files changed, 73 insertions(+), 53 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/snps,dwmac-comm=
on.yaml

Any comments on this?

Thanks,
Thierry

--n4di5mlilxk6ph5q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmqijBsACgkQ3SOs138+
s6ELSQ/6ArQVKQt4jXB8wXAaEC/UVlvgyRp7EHmuns+e8qZygBa0gYbCB3S0jwch
//6TroJgmHnkUVxkz7B7psQkYKlhXlYeq6vT9+tlQmtzd5iN7gAvt9hWm1ADkdKk
dsGaSA/0xw2uMTGIG2HheslpcXT4OEQ+2Y/GOXZUipIu9TgR7C9WatqTji75Ihow
xqu3wv+BrPzo7nrPsO8rjThriPITn/AjpzCq11fEI4Md0NbVC9BC3gfJ9essiHHz
yEEVyg6ep9ToqFvBB5zJYhJ0L5EUFStBHEk4rCbEhGOxS+N+GnPY5mT+f0kvXSHW
NJp19GE5W5KsaBmqGz4PFPL1dTXceVUNSpn/RPOIoJvr/PDzvkKwKOa/bkvQSw7j
fifod9xR57XWt1sSdGN0PD39HeT+cAjYSse0Mbw0U7szectlKohaWHhSZXy13UCB
kdUdczMOUWZH8ogcSF6sVQkp+xQ/UPqoNVbRNBHdYebxfjv69EhqFXHPHguTZE3/
YcA7mJ5jPTkT8n5LaVzvz3mcOOtdEHzofWMaP8W+YV8VndYzAHHJPV5Jqyu/lEc6
UbUiZO3invSj0QYetKPME7ZeHixhWBzRNYCjE6U8UU+ZJxe9ZEIqtAR+ejdUxo5Q
8G4XErg3wAawe31hDpR8SWfaXe6WnQuB52mAflxtIYZbSV9tWxw=
=1Fr5
-----END PGP SIGNATURE-----

--n4di5mlilxk6ph5q--
