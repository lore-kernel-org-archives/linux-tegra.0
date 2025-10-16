Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C7A2192EA
	for <linux-tegra@vger.kernel.org>; Thu, 16 Oct 2025 09:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760607989; cv=none; b=aYIYERAcvfyxIBF/+ATqk9DqTceKMW5X3m8gjx8aPkz2vss8Il2Xzc38LUqce27fZzn9ojGNTQr+g2CL97LtyT9dxBFyZ7ob+3hcm/K3ajfA2Zoc2xJnjMTs/Ne3ZQdn7ou5mG5euINk2bmmHLwLKQK7KcE5fuH3Nzj60YsyxoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760607989; c=relaxed/simple;
	bh=/ba5AaFa7bNN/UhfGu+VQQc3WN2W96FpBmcTDSy7nWc=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DNoX+HFEJigdXPYq6DHTp0FycsTPVQa/0X5X5QNJyTW6MN8f9pEbMa8MkA6XxIiXfadGa35sRCopVYxoZoh0yMp6qeL63RuoIC42722RH71jzDevSdHoNITct9bo0X/yhlpDTv9hQ8jsUgCrVQgPPYG2HzYa5YnUa2qEjRYjtH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aPsI2P1f; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aPsI2P1f"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-63c11011e01so497659a12.2
        for <linux-tegra@vger.kernel.org>; Thu, 16 Oct 2025 02:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760607985; x=1761212785; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MX/GylLCSmUvMwDfmQ8pxHz76UfDw4zqtxp+hu8raE8=;
        b=aPsI2P1fXmzipnbw2ifi6SUNh7CCIw3d49/cuVhn1eunTaD4Fn9mcJpwJieq5BBnPl
         3/WlnMjYTGYOijShRWTxEF8gDMgkeyX2x6ff8MelQxA/PrphEqNxSboN86r/pZv48ZBK
         aOTqZHV7Uhw2AKCFhfmYwPzcMF8uv5ds6U2WJT/x4IgmO68dKDVjqTQXgtgEDL835BBh
         TmNsSbq2Ob1qH8CgqKQQBs4MQ/NDhbOHbs9ns80i29DN1xQx5WLz1a5kSwUaF+cmFWpP
         LZ6wVmbMgkZ5jcVKmSX7c7otHYBexZ2/TNORK6OnzxfAMAqhQiGIDxeozIwSmo8ddLy8
         6xmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760607985; x=1761212785;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MX/GylLCSmUvMwDfmQ8pxHz76UfDw4zqtxp+hu8raE8=;
        b=SUq7oHtXldS0f1/3ivREJvnpiuKBAzI+MEqfp3xp1UQ2nZnfZ498rI6cZuol2P9TKl
         4g2gWFo8gT1dBH+f0rZmlfBU1pbqAwo8RwpzNd1c9LQpsdDrA24L6RYIlVMnD4K9l1gF
         JvRT65bVvlC20s38eRXMqG/9dDEGc2B2kt0B/94TbY3le6pZ0QFm7BFafaeit2ZAUf4n
         U8ua1NhZERsd7Vr27Dh71utDZ/Iqc6YkwMnQLWKTPU3IeE0vWSTsLrYgXfxvbFGn2t8R
         KC3viF76jyru6VqbIk4XWIWgSoqYY/8OMRaWDJWDQP+5ESvaRX+cG3lekGfCjwigA2eX
         56Lw==
X-Forwarded-Encrypted: i=1; AJvYcCXNBMB3fqX7XIfcNqfadx6HA+UZIB+i2nVHkFSN2UGwzQnayhl3478tHN0sWprSQH3V4mN41ogYCOMw+w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzds4AzkVkgjqxKupKiRB4CAb7iKFEBT4dBIeMrjpR3UvvpvK72
	yhnUFzvyfONZhmqYu07mqkayKtyvAoNmvhmCxunDu+WZDtFuuQhnlocN
X-Gm-Gg: ASbGncu2myJ3lQlh+N25pd9zY11aOM3cZT6AJ4oFNRlWudF8gC9ApdsyY6Y3NHL/hMB
	iHUcORQGYzkpp2LpQFk9hCgCV85218mIae08nBL6ZnYI4FMzN09AUjQunHutMsnsoknwcaZMIDw
	oDDJFyEXaEpMgBJGeiBOyGbFFw3rmtGqaPnZeb8/19JSDs8n7jNIm94P09yuVH/kXBb4aEhvtvd
	t4TSmXkiIagRf11VptRh7D7NBbLhre83J8O2vZlgeOIE6HKvJk4sX7jlJ0Y91/DZqkDzcVb8oBG
	fY+XhYZgQbTP44GjYt6/0dcFgKq9PiV7LJ8ZUsinHRZjMa+eUHRQJ2NhyjQ8b5XJrtcnPzTmMJN
	zgDB2bExhctZJSm/zMJRPDFehlMn84BvOTUkVfCFcmQpIEFzIa+PkgGmMW1OdgDgeD1YQBo6oxK
	a5uANln58EZSxVaZMX28MiTvcVcybhB5CmrwJsrxz4KmCircVpM1g2sRrcYWoUO10FfnF109c5d
	g==
X-Google-Smtp-Source: AGHT+IFXZN5AuEtML9DWbKOgUi+kfLk+S8DYALrtRGnSx96KUuPtqrYJ1KgZi7BeXM9gM6E2XDAC2g==
X-Received: by 2002:a17:906:6a14:b0:b3e:580a:184f with SMTP id a640c23a62f3a-b50aa48ca99mr3637434866b.4.1760607985064;
        Thu, 16 Oct 2025 02:46:25 -0700 (PDT)
Received: from orome (p200300e41f28f500f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:f500:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5cba076bcfsm464699366b.32.2025.10.16.02.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 02:46:23 -0700 (PDT)
Date: Thu, 16 Oct 2025 11:46:22 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jon Hunter <jonathanh@nvidia.com>, Sheetal <sheetal@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: power: Add power domain IDs for Tegra264
Message-ID: <ahbxtlhlx5xxbld6w3j24y6y2hhvhhyevsgcv6sglklazkbgq6@uu35o2yqtqgb>
References: <20251009161039.1766845-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="22y5rwyjiy5fwlbu"
Content-Disposition: inline
In-Reply-To: <20251009161039.1766845-1-thierry.reding@gmail.com>


--22y5rwyjiy5fwlbu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] dt-bindings: power: Add power domain IDs for Tegra264
MIME-Version: 1.0

On Thu, Oct 09, 2025 at 06:10:39PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> Add the set of power domain IDs available on the Tegra264 SoC so that
> they can be used in device tree files.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v3:
> - rename to match the nvidia,tegra264-bpmp compatible string
>=20
> Changes in v2:
> - remove _MAX definition since it isn't needed
>=20
>  .../dt-bindings/power/nvidia,tegra264-bpmp.h  | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 include/dt-bindings/power/nvidia,tegra264-bpmp.h

Applied, thanks.

Thierry

--22y5rwyjiy5fwlbu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmjwvu0ACgkQ3SOs138+
s6HEeQ/7B988NarGOanoLre3aEoRq7O65jz09QUETHt+4/exJD3nffY258jszf6J
dRadnxZhYS7vdywJP8XdWrfi+vPQtHaVIAgffxWiTcBLSw7xMzsO4W6mJUSqw05E
H/rq6+Gc1HAaT+B6IOBeRyxKnmeKnSNucgxwUP2OpS3fKVFzl62ThYh5eoT7Q5XU
Wj68UqHKcvJrUIrl/SGOIzi3JFln1oYR9Q8E2LmAWy1GbwoaI52Dc1nOsbhe61xB
nf6stXmt0DGGusHks2r1lgSyspu9g2+fqvrvko5X96Fw4+wOwvde8F+LdPFY1e6s
OKzh09OIerjw7CHZJmYelMXc88exJBnIkdp7q4Mok/O6m6/8D2afLp7k/wSX+Fa2
4U/p1bgsvsfssqI04Vv5d/82yd2nixR8dz43sdaL9pcqdO7uKOpPYs8Rn4dKGMHW
PP+IxV+nc5VBqq0tSyEBIByD2GDXwCOmGmwONDa1GzJCr3+ga1KOEx+x8S7F0dqV
g9H2rzvHGlqZTOR9zrCTsVNKlo57jbeudA/C/nVfTVR66XAZwy3Vs6XnCrjuwq9j
FojvmuXUWqtW2/UD8oQisuZC8NFVKACvhM29wXZHH+ZfTeFtfgW8J0s5WTbQw17R
iRO+0Ysf2H82avSSUSc0tZhfYiCFj5bCaUck929XFUowY9g3zp0=
=VY1X
-----END PGP SIGNATURE-----

--22y5rwyjiy5fwlbu--
