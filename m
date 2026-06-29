Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F27A265CC2;
	Mon, 29 Jun 2026 15:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782746353; cv=none; b=UgZ245KGHyAJrqcX+Orw3vpze5RU+x0wQG9qctNWxIB+c+weErFOXDscRilEdYGYh18yVteq4Y8+6gPnR4t0RsT7PiCZBWGy7AvBDLECzuaEsCgmuM0JMF1acR1/8LmzAYUo2PxaYu802KbjAFsp82X+j6d/LngL31r/J0CLcPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782746353; c=relaxed/simple;
	bh=iv/fiKg3EuQ2jv4GyHWtObJl/Zd75MjEvho8+pDnZ1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U/FprdJp79rslOJ4JhSvBETXkc1dm5bn29cRPHJIXKJ6kxxuAevr4iBEchdftyucO4gVz8gzcMF1+WcjUOW4NnzXNAJ69k4O1+jV/bkgqjg1oi1idTQj1/eb23T4+oHYWyDC4WclLzl2iT/4qg++p/rclyh6dgSootKkBPonJyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HEmZvJtK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HEmZvJtK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 079AD1F000E9;
	Mon, 29 Jun 2026 15:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782746351;
	bh=6FUFc8VbJurEpSDevgOvU/4VEZEQWETJDf8GR/IYV3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HEmZvJtKwhfG6+2u9YMDRUtu8arFt06cJRcwTdMJHDbr2BHORKFUmM8gzS6+Nuf59
	 JYOhNUCmlBBHYF4/8GdQhH8elDIxldPzftRRCbyQdOym90+G3RJsaxiTmlJsRPMyXw
	 cmHFhugQ3ScY89DeGqRHL0sT3Pa2VJZbvS578kDJ2rES6+ZhkK2iWFbxB9SjZEnRze
	 cYG9qds5ZcxWY1O9CXAb4WrhnjMiTNVfz0VLe0pimYobJ+lyt7cdzICzOD3zsrBLoc
	 Z6VNlufBJhg7Y9FhKrBdhGHPxBAiOT1o6kA/lutHXLf0sYWPInSBvkRrdiU73lP/MU
	 zApxhoY6JGLbA==
Date: Mon, 29 Jun 2026 16:19:07 +0100
From: Conor Dooley <conor@kernel.org>
To: Wayne Chang <waynec@nvidia.com>
Cc: mathias.nyman@intel.com, vkoul@kernel.org, neil.armstrong@linaro.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	gregkh@linuxfoundation.org, thierry.reding@gmail.com,
	jonathanh@nvidia.com, linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/8] dt-bindings: phy: tegra-xusb: Add support for
 Tegra264
Message-ID: <20260629-baffling-gag-05e20c9d925b@spud>
References: <20260629093406.1118594-1-waynec@nvidia.com>
 <20260629093406.1118594-2-waynec@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZivZHyQiMsJs/gWz"
Content-Disposition: inline
In-Reply-To: <20260629093406.1118594-2-waynec@nvidia.com>

--ZivZHyQiMsJs/gWz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 29, 2026 at 05:33:59PM +0800, Wayne Chang wrote:
> Add the compatible string for the Tegra264 XUSB PHY.
>=20
> Signed-off-by: Wayne Chang <waynec@nvidia.com>

Why is a fallback compatible not suitable here?


Thanks,
Conor.

> ---
>  .../devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml     | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-p=
adctl.yaml b/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-pad=
ctl.yaml
> index d8de900a4fce..f6fe3c90b5b0 100644
> --- a/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.y=
aml
> +++ b/Documentation/devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.y=
aml
> @@ -45,6 +45,7 @@ properties:
>      enum:
>        - nvidia,tegra194-xusb-padctl
>        - nvidia,tegra234-xusb-padctl
> +      - nvidia,tegra264-xusb-padctl
> =20
>    reg:
>      items:
> --=20
> 2.25.1
>=20

--ZivZHyQiMsJs/gWz
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCakKM6gAKCRB4tDGHoIJi
0kBcAQCrqgOOerZugKKmjKtKayBzITE7zLM1L51QJ4kOU8RpIQEA2dvPt7Nwz6Xi
yE/Bh7l6FDgrHCL0xL46jpuiCDlmugU=
=iSW+
-----END PGP SIGNATURE-----

--ZivZHyQiMsJs/gWz--
