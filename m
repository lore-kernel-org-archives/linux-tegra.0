Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F5D320A00;
	Tue, 17 Feb 2026 10:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771322637; cv=none; b=czfFO+vdXQ09lSnidgX5gkSLqrknlHaOelUTz4eqI/A++9Qaz1iJxwccPHrtQunJ0Ly/0KIb6u0hvi37JeH20LGXWC7PvertpNLPOEVUPzdbtopQFGp1jabC35upU18SQP9HVCM5s21TWN4KIP1MnaMb1Z02vdfQvOg9zSwWdAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771322637; c=relaxed/simple;
	bh=TUwPDbTunD5kmKcSfeNkBt7yJAJr8lZ1ams1gld7aVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MoVmiotSQEvNlhLpCrwj4bDaiYiFDtVW4w63XT2+zg12BNWQHChjaLHsemVqZWRqOuPmYjjzFOWdHZXBi4ndPlZ/zsyYHedkm9Y1vgLwmQ7ictfK2VMsvxOrvna5DqtG2GqUHzXKEc9GZ3+P3iIAjGxgA8oTayTV5gIo2wZLQjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CqSeo6Mi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CqSeo6Mi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3467FC4CEF7;
	Tue, 17 Feb 2026 10:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771322637;
	bh=TUwPDbTunD5kmKcSfeNkBt7yJAJr8lZ1ams1gld7aVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CqSeo6MiWIQ9gDbvBcz2DnsWVH4DWgD2X2QdAxnpADThg4FaPTcIQajqMMP1LLv4I
	 LIbNA+rhcnV1z8eH7q/PgBZdpGq2qTsNpVlOTo4+KP5wQ2k3F50Jl8xgcmhGXH+4yl
	 Yi+zDtLExYkgMLxUi+LjyctDpdwiEgw8Mmmg7j4Fx9AM6zUb8dn9fFfdlATqoG0gCs
	 aWpGq5qxi1IoRIXXzmIdAHqTMNQJBvDx6ssyb5F5csj8281O/4x7Aja4Ud19+H7pVC
	 Ksn1ZxdOTNEgSH0Vqg1zx9CQFRuzJlezFEQmRuVE4W24ArulzLeawp+9B9HP2Ish5+
	 Hw3mYxqwv2QAg==
Date: Tue, 17 Feb 2026 11:03:55 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, 
	Russell King <linux@armlinux.org.uk>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>
Subject: Re: [PATCH 0/3] arm64: tegra: Make ARCH_TEGRA_SOC_FOO defaults for
 Nvidia Tegra
Message-ID: <aZQ8iBRKLfzrzJcm@orome>
References: <20260217-soc-tegra-arch-kconfig-v1-0-81bf5674d032@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hwhpsufjpg3xf5w7"
Content-Disposition: inline
In-Reply-To: <20260217-soc-tegra-arch-kconfig-v1-0-81bf5674d032@oss.qualcomm.com>


--hwhpsufjpg3xf5w7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/3] arm64: tegra: Make ARCH_TEGRA_SOC_FOO defaults for
 Nvidia Tegra
MIME-Version: 1.0

On Tue, Feb 17, 2026 at 10:16:35AM +0100, Krzysztof Kozlowski wrote:
> Renesas was fixed (thanks folks!), so let's fix this one myself.
>=20
> By convention, only one globally selectable ARCH_PLATFORM is expected
> for given SoC platform, defined in arch/arm64/Kconfig.platforms or
> arch/arm/mach-*/Kconfig, because we target a single multi-platform
> kernel image.

Sounds like a bit of a made-up convention to me. I don't have a strong
objection, though, so feel free to go ahead with this.

> Dependency
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Further (2 and 3) patches depend on the first one, so should be taken
> via one branch or some cross-branch-merges.

Maybe we should ask Arnd to pick up this series into ARM SoC for 7.0?
Most ARM SoC stuff should be merged at this point and since this is
essentially just a bit of cleanup merging this now would avoid any
potential conflicts for 7.1.

In any case, the series:

Acked-by: Thierry Reding <treding@nvidia.com>

--hwhpsufjpg3xf5w7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmmUPQsACgkQ3SOs138+
s6GC1BAAvfy4h/23klguGd2eGNVTW+67XFmGmNer98k+vYN2BdEoIgUvrGbAmDb1
fTr9fwy8R/lDL559mbH//HDDJcF5CEDtF94VCJfO9cIAr6nJcHB7Hz6QGCo3FYBr
4mioICOtDuk/CEDLFzaE2jVX0qZdrKQYWVvLHVydTvQPqYjo2XLV2uCAaAToM1AZ
s2JEloKbSSGGPNWruArn7FsQFLH5b+WDBTOzwTRTc8xkXcocuwyy+joEt8qS6Xge
R+MAHRSOYGRISCCgIDMOoxvIs1vhX72UurWWb7C5nzhd50OnxgWDFJT9fy7/zKra
LdIMvcqslt4mfgcWg4ipkjGIIl7SzwZodEaitHP8XTRK5XG/STVP1hCgwJCJovEN
jzGEarK4T5XoXqwoEF/al+ErvHGgtDDX83/ur1KuAIpf82vZA5+UiaDPd6FB5+vJ
FGsdwE7JUmh0yNCHPeGAnA0xnrbDv8s62uUHExrtaftZROdJIClSAbKzQ3oUPzSE
7sRbJYlvkc2vRW8cURhLS1M/0RbWYtMbjkzxCvaOo14qLyDCzi+Hbd0Z/1YIhvxQ
DBjV9Ci0OMY4dd+kBSp0/RM4qE22+scXR07KB7kO5G+/GLv9Z0ukXZHkXvam5Ij3
XOcyo5eGhvPvhcg8X5q9ucffwOhWarA78/QRZhVPtkAyFCHHuAk=
=wNB3
-----END PGP SIGNATURE-----

--hwhpsufjpg3xf5w7--
