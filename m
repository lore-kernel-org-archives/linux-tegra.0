Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44952FC037;
	Fri, 27 Mar 2026 15:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774624203; cv=none; b=pRkAry8i2cxkXRQPyo7+ERRLfgmvZ11Psqy3fvHxrJ1MGxUbbFgDQhwXSelDov67Ba8wE7v0q459TwiKOfckuDreFSONPDFyzQONP6wTGqc0422yALdRegcPSjVQ1vIpeZqPBa4Y1628JLasSZVQlROewCq57pOKEjdw7UnnYLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774624203; c=relaxed/simple;
	bh=YSMgtoET2ajOwZlRycfMq3O8ISDzXwoIANh14wi5RrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iCc/dYALP1mgHoJd/6KiAmFr5/jW+Oc9Zv4rdLtRYbURc8BshdKuHi9k66GwRNvB9enpjLjd6T2KKBrTL9mFAL9P8U/v4jdUcymXlpzwqIvQV2e1bvpKAgFwTc4u0WCzMFyfYrs9kzfBMfLXX62CFIg7j/3KumOKElhaQIdAVjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MOr/birX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MOr/birX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0FCDC19423;
	Fri, 27 Mar 2026 15:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774624203;
	bh=YSMgtoET2ajOwZlRycfMq3O8ISDzXwoIANh14wi5RrY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MOr/birXi6JPpEEBkoBDyaohLGvmj7tsAGQKehvGisOuBnJR7yUZNlFZZT+N7q5ze
	 eEtdbWvI6v0cRvZ/rlfvfbJBzXNc89CBlgZAyAKgaohrlWlCT+23FHv5nIita4kRGc
	 hRE6VRx8WCsXwvvpZL3Q/xMii+/ZsjhY1aCP66ZwJvUH00rCt1Y0LAFTeS84+n6lcM
	 20zc2pBdVVO6TaqHP8JpK/71wDZt8L8uXZmRRqAlFIqYgMQ24+QcASsPx1ePbrga8V
	 sTRiZZGdLvIQ/a/xy/xV4FsDRW0ACug6eyhKaw61GQdFO1Aqfq0KJzFla/xVC32/JQ
	 nSTBAQM0zDveQ==
Date: Fri, 27 Mar 2026 16:10:00 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] clk: tegra: set up proper EMC clock
 implementation for Tegra114
Message-ID: <acadwXDbBi4y99e2@orome>
References: <20260126185818.78003-1-clamor95@gmail.com>
 <20260126185818.78003-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kvxihihtkli43s4t"
Content-Disposition: inline
In-Reply-To: <20260126185818.78003-2-clamor95@gmail.com>


--kvxihihtkli43s4t
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 1/1] clk: tegra: set up proper EMC clock
 implementation for Tegra114
MIME-Version: 1.0

On Mon, Jan 26, 2026 at 08:58:18PM +0200, Svyatoslav Ryhel wrote:
> Remove current emc and emc_mux clocks and replace them with the proper EMC
> clock implementation for correct EMC driver support.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra114.c | 39 ++++++++++++++++++++------------
>  1 file changed, 25 insertions(+), 14 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--kvxihihtkli43s4t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnGncgACgkQ3SOs138+
s6HXWRAAi9yNgGSxciFibLYryO65QYGi8dCxblgOA/GgCof4tB/n9Xg5MGzeG7fW
vZA/ndDoCdDwCdNSqDWEhf870psDyceVj6JpxlZJ9eEWBgidFL/wR/aICJxxs1ML
tMBpaki/+qc7/UlKS/o/mKs4tsLV1NrZbmCH/g0YDCzPe827BhFtEUSDp7Mur4hP
L6lnhlVQ+0TVSsiQjcbtyKnu0BIP/b+gX9srgemKU8RIYVwu2L8Jl6JfmvSXweQb
R4wOH7Nqx7cR5O+cWDuwnMv+MGHTkDo+LIeM3hknONBhJ8QkWX4jyBvpCUwAfkFy
tIIn3Me2r77UUIAzm7mTMHaZ2qoSk6pw2u2N+seTijGvYDBK0ZNuGXqE/osR3Jb9
QL7MJpxkXZmHTCykOb1qjEqM8elS0ntdXd7gpw1aCrT27qaZlNJWNQ5pmqMNV/Ja
/Q9D1RkTGC58LUqQ79yd98lRILH3YoEXvm6Jrqktbz5ljZ/EEe+Vf8FjEH5IH2cf
YRXOxU7k9aR3IWfuHihnwYHopUBcl/JGTXQiay+amOyKtKn52H7vg9tYtDSjjh/9
SDQuApb7cETX4sVfkOjkd2Bdb+zOB4BXMD3IrF2HwLBJBCJIuiZT66l58oOX47hX
bbD5RoeQFrtpj42O6nJ+Mntkf8RqzEShHmtNUyvS2WgrE5CwBdM=
=ava/
-----END PGP SIGNATURE-----

--kvxihihtkli43s4t--
