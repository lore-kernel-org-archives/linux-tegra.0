Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EE141F7C1;
	Thu, 16 Jul 2026 18:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784226437; cv=none; b=k8ehq6rXL/6GYnRcONRmn2nis0oNEc4V3zbmSu+aHqNGoHkIxVmVMHeJ0Caw0qgzUg71Uh3xa7sUi8JTxlg+Rx5gvKWWAmeG2a+c7cv6IaZMKlHHStf68Dss1IwR7k3bxGBVV47D6LRZ9Xx3CWh0kIpGkFRNxpkkIWpOn51G03I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784226437; c=relaxed/simple;
	bh=pq3IB4veSxlgD6uftiTsDfg5HCHI79EvxsT2PCBwLDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dEmbvY+9/AwD1DfXNZ7Zjjq7rKRF6IL2TKFXA0j1FmzzWrQhm/YNgPKh0AHdjgeRvnecNYDQ9E8w213AnLAkk6+seb2WCOyzFtXJnMGV30NxxSdXf93m1QfJ64Np20iYC4luoXWvuuPL3c3aqzqF/vudCSIUk+6AW+s7QixGvBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EOBqEywD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EOBqEywD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B4B21F000E9;
	Thu, 16 Jul 2026 18:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784226434;
	bh=aOGfx3jN2e0VB6SUEbEV3vWjHXwPPAQYU/krkLGSw4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EOBqEywDz4quZuG6Y6jfzFTxgRWaMv3CbtoxPKwzRN4ZJP/yrLYqzoM1zI0dk0Azg
	 CqfZkiG0YevCIUwvN2Hy+Z6vHG+7I529nwvwOq2oZYHhSj1T1idJq4HAuIrpvxzPGN
	 IfoWr9QPDbFZhanLT+V3Rp8/n6sUAa+FuXkbTkU0VdjKZZzIBjrKdaiRUZ6aBrPttt
	 ReRR3fvSpmrGaR7NMro9GV1s3Vix4hwdd0vhMO6JrAMWh+vEB3zWcpJWyrZ1OHnDdm
	 KwZMqth19IQr1Fb6LY5ovrAVMpQPKCsTDscEqhi8Os3B2pvR9Dt2mBC03a1HS6sYyf
	 O1Z1FqfkGH4TA==
Date: Thu, 16 Jul 2026 20:27:12 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] gpu: host1x: Fix use-after-free in
 host1x_bo_clear_cached_mappings
Message-ID: <alkidFSX2nTsQviG@orome>
References: <20260603-host1x-bocache-leak-fix-v1-1-494101dbfd30@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kzuhp2nzgyamkdap"
Content-Disposition: inline
In-Reply-To: <20260603-host1x-bocache-leak-fix-v1-1-494101dbfd30@nvidia.com>


--kzuhp2nzgyamkdap
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] gpu: host1x: Fix use-after-free in
 host1x_bo_clear_cached_mappings
MIME-Version: 1.0

On Wed, Jun 03, 2026 at 05:37:49PM +0900, Mikko Perttunen wrote:
> __host1x_bo_unpin() drops the last reference to the mapping and frees
> it, so we can't dereference mapping afterwards. The cache itself
> outlives the mapping, so use the cache local variable instead.
>=20
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/linux-tegra/ah6ErK6f4kVudVIA@stanley.moun=
tain/T/#u
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
> This is a fix for the commit
>=20
> 	'gpu: host1x: Allow entries in BO caches to be freed'
>=20
> that has already been applied by Thierry.
> ---
>  drivers/gpu/host1x/bus.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied to drm-misc-fixes, thanks.

Thierry

--kzuhp2nzgyamkdap
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmpZIn8ACgkQ3SOs138+
s6Eyhg//SENKmW1oTotuZfGqg+SpbhWkuzHr4s2hnvMk4AczIg2XDiehR3WyQHh3
azsMGK8VlfY6ASIYsDNVL93MXrpNNZCzx9REBy/M5gXPLu+ilGVHO/7AavEsXJyF
qsZsz0LBKJCoNomOu8hN6w77M8dJxdM8fgkt4+8KfEL/hOhthSew56QRLBLDxXuW
VfIjzIESdsxp7ZuHycU7RDFkoFBROYGvMW11eFeKynhbgOWjkwU7dmIEhck/Jy5R
DxI4FcIMCTOL9PxmyClTzEqy81rG3hbQlP4/RHSdxKLBY/fszPG5sGx7FBN+/sxE
JgHI0d+FL5+/i4BcX/9zjpgFs9fVoL8TPX3L5KivkYsWkfupyqUko83cMURCNjxZ
ri3kCpvlGpqjfpJId+B+fKJGNnl/JkNnOOkEdK1070uBtnavADV18rlozcR+/oD8
4RSB2k++HXTkdlJD/whudv7Nt/36jy7BDLfvOzChmG05iI0XPmmp9WXUQ042dX7m
y3i6i5oSrrHIwhIENileVGMh4Y/xAtlFZrgUu4Au7HvmjS3gUNGtWjCK3yS0v4Rg
PftHtA53jTnyLTS+Yg/XJMuMOS0YUAR8YTIITWyhVeaOppvrbiUWX4RINPU3SQpM
Q4sSniHL7w2MCELinhNmUyeuk96cImZb8RdQmW8ACefVW+cDYss=
=TEkN
-----END PGP SIGNATURE-----

--kzuhp2nzgyamkdap--
