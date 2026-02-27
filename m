Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CBB5313E31;
	Fri, 27 Feb 2026 11:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772193366; cv=none; b=YbF5rkzCBrp96mB4P3nrJd6zcGo43qnDLm9qSoGECNFxlJek3Kpigc3LeyTZLxuSvUlafIRr68aIPR3FslL9wRktGK3l3YTiuxmIDrkJjHW9B9YUDeM8EeRcWqyOVpeElnx2cnhOk8Bx3Fx0pjrQgsVoBbfozHcnSj0BRb9xfe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772193366; c=relaxed/simple;
	bh=uylix+PB3eoPi19v0k76zcuri21daV/CykSO8B8lVNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lMsLjQCQVKRpPUfwE7RKBU7zTUzidW7u5V3wuFvODqX58UvzI/7gvxyzOOHxb8Df7OceZvy/eXISUqO16Z1sgqv2sQ65cVRD+0fsRpdjnQ4ulunjWx6wGHCr5/iKjl39AHyHhQMTK4kVzaHjClFMXKWB+ibvuf6aaRkTgmTVtLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IL3nKpFk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IL3nKpFk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6720DC116C6;
	Fri, 27 Feb 2026 11:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772193365;
	bh=uylix+PB3eoPi19v0k76zcuri21daV/CykSO8B8lVNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IL3nKpFk+QG3AJ6BgZlmZHjVhdT7gdWcBMqv1wNUYtRMg+xA4MiAMVJou4nvH1qQ1
	 /GAeA+RUaGS1WY/q5cr7di9/sd7ToDZdxuXKNSE4NMbrqTpHtT5OYwBtAOF1jKYCil
	 anc8z+5lVCrxV0vqIjOiL8h4FKyjHxkC2eI+GJp23r5Hfyx8lWA/fqkFamKCg3ANOX
	 gOWYtv5PjbONBVu4MIavYtlX7dz0UeG0b8ojjh5Fu2k2FHCktvqB3hOdCmZ/lC60or
	 FF7uYFXRcVQO/J9/c7hXLl5UyTbvNZ/wPL68u+0K35VPRu0MQe9Cl4tAvjcrXPBSYt
	 3aFLG0xMe/qqw==
Date: Fri, 27 Feb 2026 12:56:03 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 3/4] memory: tegra-mc: Simplify printing PTR_ERR with
 dev_err_probe
Message-ID: <aaGGTdejOXsubDv4@orome>
References: <20260226-memory-simplify-v1-0-ccb94f378628@oss.qualcomm.com>
 <20260226-memory-simplify-v1-3-ccb94f378628@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3qgqfemvnd6sm44e"
Content-Disposition: inline
In-Reply-To: <20260226-memory-simplify-v1-3-ccb94f378628@oss.qualcomm.com>


--3qgqfemvnd6sm44e
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/4] memory: tegra-mc: Simplify printing PTR_ERR with
 dev_err_probe
MIME-Version: 1.0

On Thu, Feb 26, 2026 at 09:35:26PM +0100, Krzysztof Kozlowski wrote:
> Use dev_err_probe() to simplify the code and fix Coccinelle warning:
>=20
>   tegra/mc.c:513:52-59: WARNING: Consider using %pe to print PTR_ERR()
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/memory/tegra/mc.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--3qgqfemvnd6sm44e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmmhhlMACgkQ3SOs138+
s6GVdBAApdhLOjARmEozQhB25bAPg1HToMZQd4otUpYdoeoOzw9x6VfiHPaEl6hK
rC/Yzi7PtfL9FRZAUcbuszYgrWSJ1xAYXrKJnm+5MyEOyXPmDatYkctmfS8sCEH+
XeoOQRrKACVtTmBwRWzy/Loyn6qYwz/hbQsrvlVUu97Aoru/thCeaAnkDkQokqxi
jTowqeoPc70GzRB816oy6fLDDHwptCKqxm0klG01Ykbh9wem/RaKFqXXZOPAmpIw
7F8CrE7EO6SH6lcBrpzrR/MU1JBireqOezWmsecfcu5tKeCg+5lPBx5gNjDGZoT6
fR60cA4O3AgWlt7a8XHLyks4UPmJe39zy8gvCCsYOh8PY4A1/0qPes68pLtcbKLu
wG6aHZKFx0TxAUHCefQhPnCAfr2Uxg4REc1EiRlG3NywkTQUR8Zjj7eMKH0TF+b6
2hRLX0xfAk+WFEk72nJaSHppDxTziOVuE1eA+fZARA5XFkk1Eqc5pnM3ZU1Z67ok
dvsp/x9b60lCp0sglPZQJVNNSEFAMB0DnlfgEiqy4NXi9e1EECJk+Zab4Npm1PG0
KxVhey+mvjvpWIp5R3NUFhxtH+nb3SwNycM/0oXaQjsd1lqhy9wX6PKh3naZX+vI
5y6cCRJM8F/KHunhjif6IC31Oreeq2MVKcTepASBdJUEqrDzG2Q=
=rO8V
-----END PGP SIGNATURE-----

--3qgqfemvnd6sm44e--
