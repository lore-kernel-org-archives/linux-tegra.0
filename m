Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BBC3A8FEE;
	Fri, 12 Jun 2026 16:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781281023; cv=none; b=f5iiBBqpa99x3XvHh1CYHNBaI0wHTmw3WSvtEEY7q8YEBZ/BT+ibyhE0Q/S4mg7vhxvLTsHVQrwj2wj1CfhZzhPOKuWCznGDua6VUYqR9Ws8I4B+kEWKT3SIIXgdP2Cry2qpGRlTL51m7IaPMurf6pJLDM6y3JZuol5U2jUBaxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781281023; c=relaxed/simple;
	bh=S2ZTz/Lo5Tn3INXhm0x0Nw7kBB/WXRAxOiFtwBHf1wI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QBpZNemzJeF93R63ZUfRYegLWBgzBOf0s/mq2gfF0Nyiuex89r9S3LAf96JzoYdAl79IPfD/sAKve7sYaTHy+sLPPHe4hE+EuQ/3MeMKmtvi6t4XhDNCizTEVSewKGHkt8IlcdlzsMR3Z44k+50yiwizf3rfmv2RRy5dYkobeFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ojTzO6Gn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ojTzO6Gn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 764D91F000E9;
	Fri, 12 Jun 2026 16:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781281022;
	bh=6lcv6smypKBVP/k+IP4v2VpeyRBHll33BUw8mfEK7Rs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ojTzO6GntM09z9J7v6YDnBnhZx/ZiwgF70b86Iko3vlek1DtVUWYmVKHKh83p+Y6+
	 kqCBw/tdUPAnrJ3Sg81bnAig2ukDfF6w+bFzTdFudH/AumzW+KSGI5zpz0sguzF/il
	 aoYteeggp/cQ/wbatVNobFCqihOac9ZfdKSf70mVIX/0tG7rWEJWPucbAkZbbFjw1O
	 S+0p5pRQAyxkz1ngg8Fi1aPFBeQiLEBuEiHQ7gOo98W2FRf5HsVGn/sd0loeFXyUmg
	 7/q/15M3NzRG+YDeCrJirMRHfl6Ib60pBpmsX+WwTrd/PIrIL/mRdzI7ohD7hWDjFO
	 aN042dQdjigCA==
Date: Fri, 12 Jun 2026 17:16:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: display: tegra: Changes to support
 Tegra264
Message-ID: <20260612-iphone-racing-c2f1934f3cf1@spud>
References: <20260612-t264-host1x-v1-0-8d934987de67@nvidia.com>
 <20260612-t264-host1x-v1-1-8d934987de67@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Vy/vJYyMUcuk+IsI"
Content-Disposition: inline
In-Reply-To: <20260612-t264-host1x-v1-1-8d934987de67@nvidia.com>


--Vy/vJYyMUcuk+IsI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 03:32:29PM +0900, Mikko Perttunen wrote:
> Add nvidia,tegra264-host1x compatible string. The Tegra264 host1x is
> similar to Tegra234, but with a different set of engines and layout.
>=20
> The engine register range is no longer continuous, so two range entries
> are also needed.

Please restrict the new ranges of 2 to only the new device.
pw-bot: changes-requested


Thanks,
Conor.

>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  .../devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml     | 5=
 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra=
20-host1x.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,teg=
ra20-host1x.yaml
> index 3563378a01af..5b0e3158aa5b 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host=
1x.yaml
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host=
1x.yaml
> @@ -25,6 +25,7 @@ properties:
>            - nvidia,tegra186-host1x
>            - nvidia,tegra194-host1x
>            - nvidia,tegra234-host1x
> +          - nvidia,tegra264-host1x
> =20
>        - items:
>            - const: nvidia,tegra132-host1x
> @@ -57,7 +58,8 @@ properties:
>      enum: [1, 2]
> =20
>    ranges:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2
> =20
>    clocks:
>      description: Must contain one entry, for the module clock. See
> @@ -192,6 +194,7 @@ allOf:
>            contains:
>              enum:
>                - nvidia,tegra234-host1x
> +              - nvidia,tegra264-host1x
>      then:
>        properties:
>          reg-names:
>=20
> --=20
> 2.53.0
>=20

--Vy/vJYyMUcuk+IsI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiww+QAKCRB4tDGHoIJi
0ukTAP9Ty/QIkaqMGAQDKra+VKOj0SXchGyTRNzM0Vu4J+Dp9AD/edCng1nxpXOr
y7wJ5bLWUfsgvcyJ81a7C+uuk2wKOQk=
=sJ4O
-----END PGP SIGNATURE-----

--Vy/vJYyMUcuk+IsI--
