Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22925275AE;
	Tue, 13 Oct 2026 15:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791906278; cv=none; b=VCxNUMY8cjlpohlClLFEwYRjERJpM3oiTHbT5oSxVrh8bOD+MDAtWhOwvEK8jqhTDYT9hp3lHTkUWJ83tcYpZXuyqU1lq50IWALph06hweT7iHBDPSxSCaCXfzuR0RAaTAyOfqW7tCcK0/SExBj42PVfi+aWmoDQUv0FjvJeUrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791906278; c=relaxed/simple;
	bh=l0H5Qlc/PH3/u7SQQh0cqFPLqpvcc0kCasrNiwZvpn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tOwpije1PwY7OKxtl7nyX+ZeHe5/x8lkhsA6kRg0EOaUttY1mnhPwXccUw4t/GoIp+F9c1v6KoVMg9QYBMhEZRUaVGAxkKk4GtBKecMGYB6zjzYpKji3stX0C3kllGNG18U8FlQ9okY8YxyMWpzmQokJYlIAI4p6bLB0SGavq9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I8D9GRAw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I8D9GRAw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B47E41F000FF;
	Tue, 13 Oct 2026 15:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791906277;
	bh=o/DpTvlnWWp99dowUQXU1BLV47DN0YMWpoqq38I7qzM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I8D9GRAwFmo1rdK/lDmYrdYP1YtZci3aovsdFYF6SlUWAmrRy6mV2wciVLzUMiFEf
	 0LFgtUNNx2SIuZBrwH/T1ItrWhdZWqkeC1tBUrlPaxjC0Mr6nxhUvGLOujWy1YLOg4
	 9NEbdJY/QRp1sIgZ6Us2XxzCei/qNgx18/UlWVSm3fRMrrKzDeY9HvpWpA3BNBq4bK
	 b7OefKLXCbieobbOpN04MxglenF/Xaoj6LcWWvFoJEj2d8LSYZ1347LawCsnbyBeJK
	 jumvzfADljgZcIcLRYs1Gx09iTkpCwlhqR+DgQUlNG9p10kBQe3JqbsXncWo2OAW2p
	 dSgG+v5dFQZmg==
Date: Tue, 13 Oct 2026 17:44:34 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Aaron Kling <webgeek1234@gmail.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] drm/nouveau/tegra: Keep the fuse clock enabled while
 the GPU is powered
Message-ID: <as5Q_Ukc9Ivzpzg0@orome>
References: <20261013145210.103565-1-sashal@kernel.org>
 <20261013145210.103565-3-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rs5rzstks4prssel"
Content-Disposition: inline
In-Reply-To: <20261013145210.103565-3-sashal@kernel.org>


--rs5rzstks4prssel
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/3] drm/nouveau/tegra: Keep the fuse clock enabled while
 the GPU is powered
MIME-Version: 1.0

On Tue, Oct 13, 2026 at 10:52:10AM -0400, Sasha Levin wrote:
> Since the GPU on the Jetson TX1 was enabled in commit d1b725476104
> ("arm64: tegra: p2180: Explicitly enable GPU"), nouveau often fails to
> bring up the GM20B. Either BOOT_0 reads back garbage ("unknown chipset
> (5ffefa47)"), or PRI reads of the GPC PLL time out ("MMIO read of
> 00000000 FAULT at 137000 [ TIMEOUT ]"), or the first register reads in
> nvkm_device_ctor() stall until an asynchronous SError. How often depends
> on the board; one board fails on every boot.
>=20
> nouveau powers the GPU up with the fuse clock gated: since commit
> 24a15252ff04 ("soc/tegra: fuse: Add runtime PM support"), the Tegra fuse
> driver only enables that clock around its own fuse reads. NVIDIA's
> downstream nvgpu driver enables the fuse clock along with the other GPU
> clocks whenever the GPU is powered. Do the same: take an optional "fuse"
> clock and keep it enabled from before the GPU rail is turned on until
> after it is turned off.
>=20
> Tested on eight Jetson TX1 devkits, on mainline and on v6.18. Without
> this patch, the GPU failed to come up in 27 of 109 boots; with it, in 11
> of 291, none of them with a garbage BOOT_0. On the board that failed on
> every boot, 38 of 40 boots now succeed. The remaining failures are
> mostly a register read that stalls until an SError; wherever the console
> shows when, nouveau had already finished probing. Such stalls also occur
> without this patch and are a separate problem. The Jetson Nano, which
> shares the Tegra210 GPU node, still works (24 of 24 boots).
>=20
> Fixes: d1b725476104 ("arm64: tegra: p2180: Explicitly enable GPU")
> Assisted-by: LLM
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  drivers/gpu/drm/nouveau/include/nvkm/core/tegra.h  |  1 +
>  drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c | 13 +++++++++++++
>  2 files changed, 14 insertions(+)

Given the failure rates, I'm almost tempted to say we need to break DT
ABI and consider the FUSE clock to be required, in which case the driver
should use the regular devm_clk_get() instead of the optional variant.

As you said, we probably got away with this for a long time because we
either didn't enabled the GPU by default or because the FUSE clock was
always turned on. Or we might've tested GPU as built-in, in which case
the FUSE clock might have still been on (not disabled after early boot
yet).

Thierry

--rs5rzstks4prssel
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmrOUeIACgkQ3SOs138+
s6E7Jw//Ra2WC610+ntOAnEJIGZQnFcG+pqpEU+qyfYMtfOhjSe/1LsDl+RjcyWP
L5QyNudF3CgNdrrdIX4GgSiP9GTndRC/HpSlzhiVE+dzC09OIzeBW7+DQhkqE+b5
hrA/50PY72fOmVnVQMh+0hJZCpuLXBXsKACfOxe436YP3KRm5ifKIrDw6ISn1NTL
YwZzwfForf/VA07oeGPYhEiKoQ4aTBnz16Wo3lPO5l3lJySvPR4LHt4TLvOxq9IP
asx5zqy1CGrQ4Y/WLBvY/ken6ftOqLhfj1vwGa9nY8z8LdQVzB7FBn0icnF4YhQy
PPvmUlVYLOS0wr0bZUBkzgMXf8oTa4QTSFgd9RBnowKaFSFTvpyZBsLLaSSngvI8
se1zFuCL+Y24z4ymXkC1G3cWnHBUdWRHEwW8YIXDLmo4BupTwuSaBmoMRI/koO1K
05ZaItgd6Mg+KRGGjdhxtKGDpC+mui3bgaCnI20yJ+c/7sgoge/7yJc6v+l5mEIJ
mXQoJStSjCcFI1otGSomsqYrdhr+GSDdz/F94iA4YBj4mImVgr3elFAYwOD5KCqw
AgrHyC2Ji0/wOC5RIQGsQ5AcSavBD12YN6pLIxUkOQiq9MB4MDqZtpdSx2a2IACw
HQ+iUVypNFyvsry686OpVM1gnyNIYUQtDvOZuCoXfismGNlLwM0=
=3s21
-----END PGP SIGNATURE-----

--rs5rzstks4prssel--
