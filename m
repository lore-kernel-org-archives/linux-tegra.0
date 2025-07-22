Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0143F244695
	for <linux-tegra@vger.kernel.org>; Tue, 22 Jul 2025 12:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753186908; cv=none; b=f9pZEl21IafBUIW8UFfgutPxxwZhQscFPSE3RiJEhoDJR1SLGrHVnn7blKfAAQ4ezsH2fTSLalLkZroSuFaEVw5lAN/qjbG0PZC1C5gKhVc2Zl9snP50OVgO0J0mak3MqulHE06uRmv7REhaWiDTuYxWXz/6Q5pEsOWpgieqPPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753186908; c=relaxed/simple;
	bh=r4A0j98fX4E+4Q/9RTrnc/Om1DtxQKVU6EuU44MAwOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XYaIIhcNIXA0VxSX655OBRXoeyUS5E9l2vPgNHkxFtaSSmqfdUz/rN7sYMe6oAzO0395qQIv+kkK0xURKGQf59Kin9gBDKIUxD7mG1bPDVUrme79YrhDlbp8PK1A+rdiJyHABpd8K96AHWSzT6brG5lblp00s/KBDNMwxmMzcXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YAhAqFA0; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YAhAqFA0"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4538bc52a8dso43227335e9.2
        for <linux-tegra@vger.kernel.org>; Tue, 22 Jul 2025 05:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753186905; x=1753791705; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ad0eWcS05AQtec3r1PLfGkWoKzWnCdTiBnJpsCLhEdY=;
        b=YAhAqFA0QYv3OJHJeWkfhv9hAmiQfvU2bwDa6tEfAY095k7+pZgYOIKlI2TU6Rqnzu
         kX007nTIZHrL/8Gl/ueVNgESGF/Yn5SrBs0wS8Ni2HdQ12JCzBkBMeyQXR9vFhvvVERL
         S5zV1SpYUPBdG1M2XCw5V+fKUF0VA0RQbjdp13By3k2Jug6/5j7iEm22WtzWYMoymUdO
         eM2ledAOidV5L8XjTsdzVm7/9lGiWbsZcfNyLy1JnOY/e/JwLc4Xn1++CUcdecHGLgJd
         6MGI8QKOtKQtM4wsXJ7oI/WMRORsF7oGSOU7KRIiRjLVq23MQ07AY6YcU7gcEO+37wiX
         7MOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753186905; x=1753791705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ad0eWcS05AQtec3r1PLfGkWoKzWnCdTiBnJpsCLhEdY=;
        b=hmfFC+BFk9NH6mz6d+hkeEzS7TJ8pQzHC6s94nU6YfyOjKe1oKsKEMuzGHJ+aABMXj
         iqgY7dIjoQ2358vUeRhojRngSVH1I0KMbtJUIkRgLD7t8yo+8chDAW1kQVHsy2tcAlxA
         HMjRw1pVq/hgjehAYKuUoEc2oMTW/4SERurs1yeYd+k3siVfwbGx4zyH+6YijwUnjHzq
         azRN/Tc+UMdPccnG492g0nfj2rrICACisLexWFNXe3trYJm1TWwkaHGWJkHiMk6VjtCX
         +KJ4G2vlCwqAPOnlJTLbWYq7JLWKio7DkZ6NH4IS1UXUKtLHQWZo5O/0RhXYSEMFyb24
         nf4A==
X-Forwarded-Encrypted: i=1; AJvYcCW1ullvBjOr5aoBMzkyOYzm1EUCf+oYSspLTWMRhvqDUPp0RamUCzeL87DsgWuWddncYw4TTehv4bPwBw==@vger.kernel.org
X-Gm-Message-State: AOJu0YziiZTpTqBKjKidWbF+bOjMAjCoQB1Gv1UMaclgw4yEJp3+RPAn
	km0TW6k5Zh5JEMpYB546b1R3W0bX3Phy4d0OO6IoPNKoeMpuSeIZ5TzB
X-Gm-Gg: ASbGncvwN5gEP2/a7quoooO65N9vYE+OD4tlnICfix5tWCKEJ3KXZrLNE8B4jkfVGw4
	ZXT45zTYZO/9slS3Sr8oNYmvOssGUsJ9ZvacZAVuW0txc9gQMEueBXvNJrFOO5KeYWXNxjih+LL
	/5rMejldlZBifqT3bllBgGO+WHmg/g9E3UUA5axITeoVMEN622wYXvN+/X9sen/NdMKtDyLVSVr
	Phg2V5YbOMfl2RLEBTtdL1zQ++YTJXNPrIoszXEnKJVY4s0SxH4OOr8lVp76wJ38zqYCXKSSVzK
	MYIEZT+qz/i7BUvFEhu1Uejaee3wTPxhG/F8grwI4dDm8mQ69gq6NpjKrqxEbI3AU4FCPF39iGa
	sYa3yKOPxho10ymKUeF4Aj+htdQ+ErOKX3qgS3BJxEOzo4/70da8sTWDD/v4Edk30rFtHC3shvD
	htIlZc/IdT
X-Google-Smtp-Source: AGHT+IGNcA3sbhxOlCqY/l1NPEPhYR5vIqHTTHrl6r+GnoE5v0L0OgDqGJHa+qfDhsDIJ6agL7cTFg==
X-Received: by 2002:a05:6000:40cd:b0:3b7:662b:705d with SMTP id ffacd0b85a97d-3b7662b7496mr910235f8f.48.1753186904968;
        Tue, 22 Jul 2025 05:21:44 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76455e57asm1897701f8f.21.2025.07.22.05.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 05:21:43 -0700 (PDT)
Date: Tue, 22 Jul 2025 14:21:41 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org, soc@kernel.org
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 7/8] arm64: tegra: Changes for v6.17-rc1
Message-ID: <izdiwbkuipbzunqot7zhillohtfcm32xrk5ydu54bamumfgkpx@p6ikuhkv3bkj>
References: <20250711220943.2389322-1-thierry.reding@gmail.com>
 <20250711220943.2389322-7-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fqns36t46xkf43gi"
Content-Disposition: inline
In-Reply-To: <20250711220943.2389322-7-thierry.reding@gmail.com>


--fqns36t46xkf43gi
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [GIT PULL 7/8] arm64: tegra: Changes for v6.17-rc1
MIME-Version: 1.0

On Sat, Jul 12, 2025 at 12:09:40AM +0200, Thierry Reding wrote:
> Hi ARM SoC maintainers,
>=20
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd13544=
94:
>=20
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegr=
a-for-6.17-arm64-dt
>=20
> for you to fetch changes up to d01e4f1e7aa8833f549ac61a0bbcdc395533269b:
>=20
>   arm64: tegra: Add p3971-0089+p3834-0008 support (2025-07-11 16:57:47 +0=
200)

Hi Arnd,

it looks like you haven't pulled this yet, in which case, please hold
off for a little. There's a missing dependency on another branch, so I
need to redo this. I'll send an updated pull request ASAP.

Thanks,
Thierry

--fqns36t46xkf43gi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmh/glUACgkQ3SOs138+
s6ERKxAAmFMQZ/Cz4E1/SKyZNnC9aV8KA+fjrVHYHZzCnkwFSKmoC9NkwCWgbdrF
E1h3r1fxrb8nPtej1NiDuwnKhxs6aOsmtlRoBhcUGKO5PatgVWtjSgb1cCcIjdPk
rQnedQ0CYn/RHmB0lJbwST4jzqFL5FHGJ/90/XBA9AXGi0JqfWtzUeymAXk7RbpQ
YANpZwnoLtRNx/F7zEJRNXEA7pQR/5tizYVJoEREqJjS+wSpcNJzwA7d45wYmmkS
AnFmFNut+Uxt+UeY/DE7I8Xk+Lisex/EyirsiPsjRLWp4eYOOZIOlBqZjqIR99da
RqoOqIhXbuqYiZF2pI1RrJDQW4xlSoo922bQvr1EjmMKUZ+A8DyURYGkHxxxf95g
x+yjya0vWkFr5bZI4JoonbEXpBPkE/WJx84fnKH8t/M4xQaxtsWtdZTO9kpJxsGF
mzLtIpwdIxr5uXL07gwcoE/BjBxvmeCig1rqhTt0VL9RLFDAhe2eVLd9mEe5SkmO
2PIyCknJfDDbSpt5tDbzd+y5Zn0/hWfxbqZtD1KEg1QUGxncZc4/rc/s2fr2LQg/
SjlgViowGlhj/+o/QLBkyfp5hy5kK0ZjSi5rJsOC+iUefpXgLFhehwGbX/OPfI+R
qwtbt/DbrtWjMNS+/jCBZ0ZEMr4tIdFHnDVzCj0Wx9TzZokl1PQ=
=rtRy
-----END PGP SIGNATURE-----

--fqns36t46xkf43gi--
