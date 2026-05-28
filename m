Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E0F377009;
	Thu, 28 May 2026 14:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779978041; cv=none; b=CByOkv05Ezo47B5lr7ixjYVI+/+sU/Gtn5LEhtI9lUzLusNWEHRytZHCWXk1W8oY62LzPsQo5esGWYA1vxFCdExVNKOxhrLZkMyf4eDf6485Q+A0ohYrSV/HyHYMEg41qLmkYI3IpU1uuqI7wwxpQsEXIK89hNHWY+xJAeh9UaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779978041; c=relaxed/simple;
	bh=NkRlrtz4Eb2Y9Rsf0oIU+5DDjXqHLy2+kgmyPB0McWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j8wlS53WBJud8A+NoPEjhNDDgwNCN8bTyaLYr9hINcr8xm9XdeF8Bw151IC2sO31QSTHVQ6N1kN4TGnvDyOeUwoypDz2X05qji39cU0I62vBtCOFKtgj/9+LULKnUZAZeBOlAvFAYzkM7WFgVIb1bh9olOWWPpJdGPIxWHY5Dz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KMPbH9MC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KMPbH9MC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAB731F00A3A;
	Thu, 28 May 2026 14:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779978039;
	bh=owd3yHcdZZk9kVBZfXXRZcFgZI3DQoqnNBNYxcexvmI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KMPbH9MCmF9mOEsS1NCjDqSBVX6tA37KmiqpwOmyO/6qlDnDJGjM9eP1vfZNhJFDM
	 HmWrThGx5s2FaItFKeci91fl4MS1Spz5C0mpVhANv6pMdlmF60GIZplxFhK+8avCL5
	 He5wkqagXhCe05KYx1seLWY9nln28qhh+SIrxVFDsgbBeUiz5QSOuYtiPdkg++F+qB
	 FNeha83pm0hEZpttwjoEdzekjg2F4anH2Y90qqC2NKQaND/rbQ1Mdm34+ux5V3etnO
	 ncTekxVCvE22Npl3kSILz9HFRBNRBTfr7PuPkE0jWs0pY31qkkjAa0hu8ukXjd+THA
	 jJfEejhqD0QJA==
Date: Thu, 28 May 2026 16:20:37 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Thierry Reding <treding@nvidia.com>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/tegra: dc: Fix device node reference leak in
 tegra_dc_has_output()
Message-ID: <ahhPH___c7pTjYUZ@orome>
References: <20260128-dc-v1-1-a88205826301@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y6dsoxirkzmzvozk"
Content-Disposition: inline
In-Reply-To: <20260128-dc-v1-1-a88205826301@gmail.com>


--y6dsoxirkzmzvozk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/tegra: dc: Fix device node reference leak in
 tegra_dc_has_output()
MIME-Version: 1.0

On Wed, Jan 28, 2026 at 12:43:10AM +0800, Felix Gu wrote:
> The of_for_each_phandle() macro increments the reference count of the
> device node it iterates over. If the loop exits early, the reference must
> be released manually.
>=20
> In tegra_dc_has_output(), the function returns true immediately when a
> match is found, failing to release the current node's reference.
>=20
> Fix this by adding a call to of_node_put() before returning from the loop.
>=20
> Fixes: c57997bce423 ("drm/tegra: sor: Add Tegra186 support")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
>  drivers/gpu/drm/tegra/dc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Sorry for missing this earlier. Applied now, thanks.

Thierry

--y6dsoxirkzmzvozk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoYTzIACgkQ3SOs138+
s6GxaRAAjgANXnfe1wgqu6b9m4HuFdaycpwxk4CcV3WwqHprSpxl1qFYVt1ibS7t
VeTme3TXMEQfWtWtjpmZP+v57XEl4GYqJbkwfWxe07IQ8J69VlW9SO1zuD0r2fDf
4Tne3aFpMyzAcnw6xdzwMKss3AG2kZSRCXL8lKStb9ukJBuodwjnCPyr7Rwb9I8R
6sEskI+ZrNxAQYhpO29NRnmMcbpF2ISammOI5BxpLJ3lidf1va0lP5J9C2v+g9Ev
50kAAmX+PmWJK8rVyKvrxVhjVA9fCFglWyGFxXk0Dv5Xe1f4dfPSLpBklKuxi3Xo
HnmFPiyagcl2edZmjzfpfptkrgpEtbqkWR6/K/KmcqVi6DOqNzRaZZO7yaSdKBat
19AggK170KetHSoynu2dFWNtH/z/NIhfEUTgZuZbXaQaaX+rvD0++RgcuzklISr+
6pT8QG8/aKTmuYZtvmOxyDwRGML+gR3LS2HkazV2c5JriN0xsZsZjWgt8a7NfVdv
UZajs6ifGkCtSa6zN8hiDeLw1yNBj1MNNb5f1qSnY0/jlNsnAZAxb1E8zE5fV4TI
9GGF3GZJzq6ILu2BIJ8cEWI3VTUbDEHD/eb8SJjt7hedRqU6fv/kgZNvDMA4cX8z
a+tVDxRXRhsxjbQhPh0z/HitFPVSe5JTHJ4mlJ2HniKMEuuXqcA=
=2DYb
-----END PGP SIGNATURE-----

--y6dsoxirkzmzvozk--
