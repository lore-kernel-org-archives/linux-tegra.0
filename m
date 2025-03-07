Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E5221ABC8;
	Fri,  7 Mar 2025 15:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741362432; cv=none; b=uvVR1zNO3gMRPGB7/ylqcTN3u5OJDwyx1xzH8mJPBg3C5hJPee8UBHMvDH1KhiU1EVqFmI7f/J2EBXHuTtkwYxQVv30IuQUxGeCCAmWzDVVg6xDv/E4ijjPcahQPDcicqcTtrtbfZ9g3YoyFh5xIdyAuUFa2FoL9LtLPnkCoeDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741362432; c=relaxed/simple;
	bh=x/CERfZyKM/rdHcgijO40aVAeqKltJT3gaT1z5p7GXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RnSWYAk4DqNWT74hsj/27Vg2lGaVDsJUZKV4ovtaxSdGL0tong8HGmP82dEgDW0CmCLOAdef3DZ+fVe0sZDd4gC6W2InEYo1QNkuXlj2dKpzNPohEKqh+PLVznzCr8Kx+9itcVhY36kB4W9Ey2hic1nVUWsAyk+2b32IyKaPPn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IVQ06ypS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IVQ06ypS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04E5BC4CED1;
	Fri,  7 Mar 2025 15:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741362431;
	bh=x/CERfZyKM/rdHcgijO40aVAeqKltJT3gaT1z5p7GXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IVQ06ypSeVPv0ZhynHki34xynvoryCN9UUZ0Mt1R8NgxUYneuOt0lfymTVrbHHkM3
	 RjAJaTYPJmNDw6zYmDQrG+faizH965OSZeAgEEks2pwGflI3HbwjVSZW/7wGjCJGda
	 Z/v25xqMzIS/bp5vqVl6wVNumZ/uJ5ar+LU8ssClntAeNP2E0NRK6SXm3+ECXDFWPb
	 y6Mmte0dmM26BPrg1Sln9myk2jQgn1EP5gadOC9WAQb6/N04ruE1MLDUR9c+11xDFW
	 7o7LKEBlzA+yXezeyhaogsOjj1laviTZAq1a01S3FFb4Vhmda7YwVl19nvzoNiTBqh
	 TJIy8FtcR00Lw==
Date: Fri, 7 Mar 2025 15:47:07 +0000
From: Conor Dooley <conor@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: display: tegra: Document Tegra124 MIPI
Message-ID: <20250307-oops-anemia-814894c038f6@spud>
References: <20250306175931.2028613-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="u/5QmGjouEpEm4b2"
Content-Disposition: inline
In-Reply-To: <20250306175931.2028613-1-thierry.reding@gmail.com>


--u/5QmGjouEpEm4b2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 06, 2025 at 06:59:30PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> The Tegra124 MIPI hardware block is very similar to the one found on
> earlier chip generations. Add a corresponding compatible string.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../devicetree/bindings/display/tegra/nvidia,tegra114-mipi.yaml  | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra=
114-mipi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegr=
a114-mipi.yaml
> index f448624dd779..193ddb105283 100644
> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mip=
i.yaml
> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-mip=
i.yaml
> @@ -17,6 +17,7 @@ properties:
>    compatible:
>      enum:
>        - nvidia,tegra114-mipi
> +      - nvidia,tegra124-mipi
>        - nvidia,tegra210-mipi
>        - nvidia,tegra186-mipi

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--u/5QmGjouEpEm4b2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8sU+wAKCRB4tDGHoIJi
0rAPAQCKX9qf4Y4lGvF9CoFtcPz9b1A77ZMQh/HzfOrf8dgQGwEAn/F+ye38ztkZ
nvso/P13VPOUfDmtN73a/YmEDGypdgY=
=sWD6
-----END PGP SIGNATURE-----

--u/5QmGjouEpEm4b2--
