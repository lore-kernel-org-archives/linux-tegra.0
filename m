Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCE32367D3;
	Fri,  2 Oct 2026 07:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790927511; cv=none; b=oouJTFDxz5AXlJ8WY5FFfQ32459yEjoE0NcGht+4gXgSb0TMVneKmWtgtvmb+OfhKeVuW+hLGlMDpfjUPu2o5d/MSGlifjkMyxOjgUNN0c5Kz/EavTBXHqIISYTehg+n0qQXBgEhKddZ9voHjN/wCipSJORbgjgNiKkHsnYVqvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790927511; c=relaxed/simple;
	bh=5R+k9abLNvJGoBCDqU44FoixsMAIlze62c2YpyQ3nc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EbzB1xkPG/9FIPe9sADtqhZHAmoSBckTPOPu6SRMFo8Z/HzD7M858IpseSvmCKKdbOnXD2hkKdJZJ+h26LVxVJpqBg/tnhcaAfY7fWioNgpX8tD3oAiZhA4WkHa+LjZvNPMvvYDEg0BSG+3L89AQdCSFK32KOZSG6C0RDyx/J74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gkTQTGZR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gkTQTGZR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0671E1F000FF;
	Fri,  2 Oct 2026 07:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790927510;
	bh=CAYg48TtPx7y4JcPN0KkBMKNKG+2zqMXTaLTFJCvI40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gkTQTGZRUvFXakr0c+sN2hGtY3hszu6zQg7UaOniQ2xv2w2gpUxR1z/jYA1RZuL+6
	 KG7lyS/+hTKuXFgHyk8WKHd/FJBmoGPzm1e5PHsBee6qhRTlBpEqGF4/7wnN4VhFEa
	 O3GPNmVSmm6cpcy0izWys8U3tUctX6GUWlOI5NCQv/WKDt6TqOfGSmP5+k2ociN2+D
	 yi0qfs6QQjoE5JeGZgMN5MO+eSyWeYvLlKVdNLrGJjxlnhl1sNz62G0+kVpkhP1Fvj
	 efS2UwwUQQ7/SVllKLH7ixHZs09pcg1Fkf73gX1WQcu+s8dXlYfUYYf+3uT88UkB+c
	 suU3GsEXMVBzA==
Date: Fri, 2 Oct 2026 09:51:48 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Aniruddha Rao <anrao@nvidia.com>
Cc: jonathanh@nvidia.com, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: tegra: bpmp: Allow BPMP debugfs population to
 be skipped
Message-ID: <ar9iizSuhHVj_tZk@orome>
References: <20261001050716.2256810-1-anrao@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v2ogujaw4rr2uq5f"
Content-Disposition: inline
In-Reply-To: <20261001050716.2256810-1-anrao@nvidia.com>


--v2ogujaw4rr2uq5f
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] firmware: tegra: bpmp: Allow BPMP debugfs population to
 be skipped
MIME-Version: 1.0

On Thu, Oct 01, 2026 at 05:07:16AM +0000, Aniruddha Rao wrote:
> Populating the BPMP firmware debugfs requires a sequence of synchronous
> firmware transactions during BPMP probe, which impacts the overall boot
> time. Currently, the only way to avoid populating the BPMP debugfs is to
> disable CONFIG_DEBUG_FS completely.
>=20
> Add a tegra_bpmp.debugfs module parameter so systems can skip populating
> the BPMP debugfs with tegra_bpmp.debugfs=3D0. Keep it enabled by default =
to
> preserve existing behavior. The parameter is defined in bpmp-debugfs.c,
> so it is available only when CONFIG_DEBUG_FS is enabled.
>=20
> Signed-off-by: Aniruddha Rao <anrao@nvidia.com>
> ---
>  drivers/firmware/tegra/bpmp-debugfs.c | 9 +++++++++
>  1 file changed, 9 insertions(+)

Applied, thanks.

Thierry

--v2ogujaw4rr2uq5f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmq/YpQACgkQ3SOs138+
s6HPxQ/+N5z8WUszN0s5jUuK9emMAU3b6vVOGnlKAJb1+H6Fz7PIo+EtHw3KiXcd
K71miKi9IPdhImuUIGr93EecXYWgp/fqT1zuKd4XkpfR1Z3LTVIUCS1k7KX73xaE
YT3MKkE/gA5BcE0WaT/blkmeZqnblbW5px3G4k7pRwldfrbcYtYl5JR68u0EbNdS
t/UhPN38U+Fz89jmZoFmB3BCiMRC/Njiin0XogU3fve/4F+LRpGyFJF4Q0dsBIBn
xH0eYwdK3f3rhUo6bDvGoXDNIfeg+2yT6uNBjgh1gnzSK7Y7blkvYTiLJSHxNTFj
ycSOhYUH3S45qsyzOkbZLRwnmkrGTNtZQvXGdCxZMENd10OjGC8bvvrgEuHcqAt9
kWZGqA5SlC1Xu6oY8rnhUHGc5GMSr4Tz1SrYPvxwoe28DtZby5fo6HCxuUFiBOrw
jHosYz3Ta2Bs7haRKRVlh19peK97WzKOPgZ32r9C5OrqsjR6kGmP1ce+RvlIICnH
KqTVd++Bx71n0Z1BZKrvkqOvdQJFHiUdYUMXFLTKQAzyJZTCGN5+1B3s5KgE2AG0
oAXOw0t3NjBEt2jOu3yz5PuGnuet7eE6VxY1LcKaNqqAomcv4dOpJn5H6nGviaAR
KPiZ3L4zAhGft5BIyNK8xK5ngRpfZDsbguXCPJJGkCBOEg1qn6Y=
=imZX
-----END PGP SIGNATURE-----

--v2ogujaw4rr2uq5f--
