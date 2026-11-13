Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588596;
	b=w0mV1DZ61QmMHFOjmYuQdTjMhP+dPyDdEFfxULtFJlA8ouvbSAyZgk0Zq4E3fLTbVByy
	 Pqoh0nK8hz+ax+431FS2XzcGTrsKY30owmAiQB3m02Y6uTaRmri8wbK1Q1mlNc6S7jydz
	 4Od1uX6rFjmKPSXqtEWvSQIfsOdHhEV3W5HkufX74T5G6hk9C6UI87NRyt/4+pGfnWdn5
	 Q1sixJR//3Ost4RPzmt0QDtW3ox1iGO1smS9TrZtcHSTDibz1UzkoPkDJVBlo4aH7uEqz
	 IscduEXcsbq7v9SGZ7EbYt/0oiFkKUVSwcDc5+etSUsO91ttZpE4wLP/gRHhQLCwhxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588596;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=u5fvYQ8U5nIl+mFeWLnbldY7ZoGJvcVN4i4XVhyP/9A=;
	b=bKClpE4br+M3CYHKPBovGbAlokiC+1e2loD1PLHOWGz0BrEVIDbRGJPGwgHb5ROBkhvx
	 66+CiuD4ldRSjR5fqBrEzW9t6sCDVraJBpD46JfuAIjKAKNEGz0CTTJVV82Ok4aTz5BMY
	 vIZVnGZo6t7/S9EOApR+TdiW84CKp0efJMBFLAwHtPEbbxW4MNSp0Ut7FQ+2A3ZanlQVf
	 qxrWTq2KEF+oGOIqdlEM6tasfXyGnjOieD1fCl7R12Vm86O+Cz28tgiHx2vkgYLnj4EKO
	 5p3DTEGTM6gfLLA2Kom/PbBhMFw1uhETNLdwE4ZbbmblQuHGIttGC+MEop2DGnN4K4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eTIG26iv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33588606BC8C;
	Fri, 13 Nov 2026 16:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eTIG26iv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F3E01F000C4;
	Fri, 13 Nov 2026 16:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794588596;
	bh=u5fvYQ8U5nIl+mFeWLnbldY7ZoGJvcVN4i4XVhyP/9A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eTIG26ivmrh97LKlE68YSe+9Qp/5sK9sXfFFKnQYhBwXV0HgIHsUGSsMVosVqjaTQ
	 UXsk3bVp8Is8zLJkhQc+9Uz4fWzOQNolzFd8qMqZAyaGG/14uxm7NBjg6ErhXp7iV3
	 Hm9hYG8st8dWdMELVGM7TIPNSGV2OlQfa1QD1u6elXu9aucZkpqBhKBrfuXtOj9Mfo
	 91uIbmiOaVTGwdL16uOwyCqdC43FefoeBrl4GIdZHPwjoO2NckluJpDgj+1+jPHmgw
	 0qLpYjSKOZJJhWvBtMvevlZ8YLZKV+qAVyPk7LVMZCM80KVZOmFLmjKFS1DiiJfvcL
	 h8EPqaWtzmKEg==
Date: Fri, 13 Nov 2026 16:49:51 +0000
From: Conor Dooley <conor@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>, linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: clock: tegra114: Add IDs for CSI pad
 clocks
Message-ID: <20261113-brunch-rectify-96bdf183eb78@spud>
References: <20261113145708.261530-1-clamor95@gmail.com>
 <20261113145708.261530-2-clamor95@gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0SAHPjNnz12osxUM"
Content-Disposition: inline
In-Reply-To: <20261113145708.261530-2-clamor95@gmail.com>

--0SAHPjNnz12osxUM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 13, 2026 at 04:57:07PM +0200, Svyatoslav Ryhel wrote:
> Tegra114 has CSI pad clock enable bits embedded into PLLD/PLLD2 registers.
> Add ids for these clocks. Additionally, move TEGRA114_CLK_CLK_MAX into
> clk-tegra114 source.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/clk/tegra/clk-tegra114.c         | 1 +
>  include/dt-bindings/clock/tegra114-car.h | 3 ++-
>  2 files changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-teg=
ra114.c
> index 97f5500b13b5f..80b7f64125d92 100644
> --- a/drivers/clk/tegra/clk-tegra114.c
> +++ b/drivers/clk/tegra/clk-tegra114.c
> @@ -47,6 +47,7 @@
>  #define CPU_FINETRIM_R_FCPU_6_MASK	(0x3 << CPU_FINETRIM_R_FCPU_6_SHIFT)
> =20
>  #define TEGRA114_CLK_PERIPH_BANKS	5
> +#define TEGRA114_CLK_CLK_MAX		314
> =20
>  #define PLLC_BASE 0x80
>  #define PLLC_MISC2 0x88
> diff --git a/include/dt-bindings/clock/tegra114-car.h b/include/dt-bindin=
gs/clock/tegra114-car.h
> index a93426f008acc..b53f5942f4bae 100644
> --- a/include/dt-bindings/clock/tegra114-car.h
> +++ b/include/dt-bindings/clock/tegra114-car.h
> @@ -341,6 +341,7 @@
>  #define TEGRA114_CLK_DSIA_MUX 309
>  #define TEGRA114_CLK_DSIB_MUX 310
>  #define TEGRA114_CLK_XUSB_SS_DIV2 311

> -#define TEGRA114_CLK_CLK_MAX 312

Good riddance.
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

> +#define TEGRA114_CLK_CSIA_PAD 312
> +#define TEGRA114_CLK_CSIB_PAD 313
> =20
>  #endif	/* _DT_BINDINGS_CLOCK_TEGRA114_CAR_H */
> --=20
> 2.53.0
>=20

--0SAHPjNnz12osxUM
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavc/rwAKCRB4tDGHoIJi
0twiAP4scZZmgN7SfazyyocDgaxHu26CVIKnSORhO8FWJslLhAEAnM8Qo0cMyccx
kEafOA6qqeZSOp8sz+Mt1YOVi7yMvwo=
=kaTu
-----END PGP SIGNATURE-----

--0SAHPjNnz12osxUM--
