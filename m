Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7266B3C9428
	for <linux-tegra@vger.kernel.org>; Tue, 31 Mar 2026 07:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774942706; cv=none; b=IwSC+2jSpncH3cuPsbPT/DM7HqJOoeQWtkzU/bchQa2RD51lgHl6+wtt8n70COyJq3Q8pPxHKkXDRI1gNK9YGY8JO0JCSjDJb0/XHN95wsIITiPUxOEx6HdtF9zw/oKsd59Gp1sRYWe9FMB7aKeaG5wwMPDf1AdlDHRY37ZC8H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774942706; c=relaxed/simple;
	bh=G9HJmQU8SgdtwfrY1W2nRepzj5FuKeUXX3qsWHsDCvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pipAVnyd95bzOn+jx8SoUKuEM8DNdJMvjdsQvOk2Cp2Lg4tXM5cYvbyF1doonmFp9SSmiYaldOqznqYssC6F0oJpvvyGNzTOWgWM2mWqZafz3pMQNJsb8TH4dAMOqIiGtshbYMpo1oQkJ4rMu1svOP1kOhHAXwHyDeuUxu1P/OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=esOVEi9Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="esOVEi9Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF8DDC19423;
	Tue, 31 Mar 2026 07:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774942706;
	bh=G9HJmQU8SgdtwfrY1W2nRepzj5FuKeUXX3qsWHsDCvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=esOVEi9Q1nK07gXwMY08B8PsSZHCRWRw0S/fnTeEowEFPwThZBIAtm4W7K1RZuaC1
	 wiPgTml9x+uIEgGEc3TQAKkIVjNjSpHoelM1q5bETCLZLEo9wsQJlU4A/+R8EmTqRd
	 8K0LnIJASz+rYrIqLI/BZUyPxJwFVWkTeNCqFC8zv5/S6Q6a7Oui+xlRIeyrLujemw
	 jj3gzElrEHw0R7D1HH1HdDzD72sVl3sunK5JvzXMMWwaXoPjVAVrmkfAthyojba9bb
	 zDrKhwRlSwz/i2vGBO08JIcSv+ysQ2yi1RC68j0Sn09o9aEL12f9s26upHDQbhLwMs
	 cxSQiQXn0HAcQ==
Date: Tue, 31 Mar 2026 09:38:23 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: arm@kernel.org, soc@kernel.org, 
	Thierry Reding <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 4/7] ARM: tegra: Device tree changes for v7.1-rc1
Message-ID: <act5kGG-4mZl0j3p@orome>
References: <20260329151045.1443133-1-thierry.reding@kernel.org>
 <20260329151045.1443133-4-thierry.reding@kernel.org>
 <058d79b7-3d4c-4f0a-a95f-b2e3582a4fa7@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u64yt5slajlaoiug"
Content-Disposition: inline
In-Reply-To: <058d79b7-3d4c-4f0a-a95f-b2e3582a4fa7@kernel.org>


--u64yt5slajlaoiug
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [GIT PULL 4/7] ARM: tegra: Device tree changes for v7.1-rc1
MIME-Version: 1.0

On Mon, Mar 30, 2026 at 01:46:32PM +0200, Krzysztof Kozlowski wrote:
> On 29/03/2026 17:10, Thierry Reding wrote:
> > ----------------------------------------------------------------
> > ARM: tegra: Device tree changes for v7.1-rc1
> >=20
> > Various improvements for Tegra114 boards, as well as some legacy cleanup
> > for PAZ00 and Transformers devices.
> >=20
> > ----------------------------------------------------------------
> > Dmitry Torokhov (1):
> >       ARM: tegra: paz00: Configure WiFi rfkill switch through device tr=
ee
> >=20
> > Svyatoslav Ryhel (8):
> >       ARM: tegra: Add SOCTHERM support on Tegra114
> >       ARM: tn7: Adjust panel node
> >       ARM: tegra: lg-x3: Add panel and bridge nodes
> >       ARM: tegra: lg-x3: Add USB and power related nodes
> >       ARM: tegra: lg-x3: Add node for capacitive buttons
> >       ARM: tegra: Add ACTMON node to Tegra114 device tree
> >       ARM: tegra: Add External Memory Controller node on Tegra114
> >       ARM: tegra: transformers: Add connector node
> >=20
> >  arch/arm/boot/dts/nvidia/tegra114-tn7.dts        |  13 +-
> >  arch/arm/boot/dts/nvidia/tegra114.dtsi           | 221 +++++++++++++++=
++++++++
> >  arch/arm/boot/dts/nvidia/tegra20-paz00.dts       |   8 +
> >  arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts |  21 ++-
> >  arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts     |  23 +++
> >  arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts     |  33 ++++
> >  arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi      | 174 +++++++++++++++=
++-
> >  arch/arm/mach-tegra/Makefile                     |   2 -
> >  arch/arm/mach-tegra/board-paz00.c                |  56 ------
> >  arch/arm/mach-tegra/board.h                      |   2 -
> >  arch/arm/mach-tegra/tegra.c                      |   4 -
>=20
> Why does the DTS branch has mach code? Tag message mentions legacy
> cleanup only and such cleanup should not cause mixing independent
> hardware description (DTS) with drivers.

The DT additions for PAZ00 replace the legacy code, so it makes sense to
replace it in one patch, otherwise we'd be introducing a bisectability
problem.

Thierry

--u64yt5slajlaoiug
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnLee8ACgkQ3SOs138+
s6GasBAAqfoYj2h+7y52qfWeJW22QsUTtH9yfVzleXtd59ZqOEw2GR4p6LrZ6Uy+
n4zg/h9yxRstb3K323jMfBhTDYLtotMPPnoeLzy5nb46PubAJD8AOTeN/aWoJWwx
39E7lrbXEdlwJPC857AHAbVtoPTKIh46PoCO7vCQcDqBHemo7umd1CNnJ+0GfY04
4YgCZRkGI9AMdPWzGJbzodfBd+TZvw9SfD4hl2Ey8QmAmp0E2Axs13p/4uqVIbFE
p3HdMVyhXecVuSWGozVeViahyqZPnWNarQHBcC+xiku6QWeZF7UfjFWi2E2XiWFc
STOrIZ7hB2Hy7BpzbVygvTVoSWD2/Rt9Duelp8glKmt+Q9t1Vn8e+dL0yLdeZPzh
QRK8rbE9RPQfKuPYeeS8OFtsOiZPaw7+So4DxkZmauhd3VzAwoBxkrXs7WKqFkdW
Y5m+xpsr9MFvkTlbnTPnZU0AOjFqkC1jlynKmjkbND+jzTvOnMWFdR+W4Yv2zmTV
QMcczdXYG1CyTXkII9Rz/ZCM5TsQ5twa5Kdemk4jf+TMgS9oepr4Xr2yjfvKwoXE
SnrnmTlTqjz10fsVsIWzC0005eG1cCKqHAX9fFByMVyYdpsMbLWydEoKvZ2Raadw
NUP2OtA124XEqquTBxxXYrpDfyekys7qEg0ZG9DBCJWhQGZ3k0o=
=ZBTf
-----END PGP SIGNATURE-----

--u64yt5slajlaoiug--
