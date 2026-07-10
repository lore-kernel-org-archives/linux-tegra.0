Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD783F7A95
	for <linux-tegra@vger.kernel.org>; Fri, 10 Jul 2026 09:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783676077; cv=none; b=XfVdS1RO+w7YiP4V7bEZ2+gMvVZYBUipKecVSqk7JNEGaD5VqO+eMqdkO18+0MrlBFSOOF4cRKYmR5TYBQngsB+dxfLppGutwOvA9QU7v3+HMVHmNkH8os/uKn2nib2n6jU9iJk5fUFO/Nx61cMZactiuw0hPqzYw6OMj4Esa4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783676077; c=relaxed/simple;
	bh=XMIFYRcBThHw/7oty0rMPMKh70nQX+1mS0NuTpDA8Xg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ECaEVgjOUFKifkAxa3iaSR9jc8SGiIPXJtBjLhaVbMv4Wekv59c9xYAHhX+nSJSLzi0R1LHhFtYHbOD72R7t3BIKYeenM05tUBTXDih06RWErXLY0XY2r61O3UX9h4PONIO3YAgMD9Lzrn+ONlskuzUyLuPIN6MOq3wwlBtACfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=huiijbj9; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="huiijbj9"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c15f6d667bcso99776366b.2
        for <linux-tegra@vger.kernel.org>; Fri, 10 Jul 2026 02:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783676071; x=1784280871; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SSCI/XH2UQWCmufgZ/8A4qPYjZ8EOCac2lEkZxpuEtk=;
        b=huiijbj9AZRhUXP26BXotn2Ppqb2p4VDy2ULVngDhP0pQxc2gsZAaX4ZZb2DJ4nxKQ
         v72WWepIi6aWs4wRvN7kw3Pa5uAAtgBaSbuANun96MT5I251chEqLcus1aac12yrjvMm
         Td0TqrQ6JFndd94AtkzYWpCGwW31KqMACfPSc0LDwXHlsK4ql6ObzuQFoBraV1LFUaP/
         VzJ4uYUerLasXDYdP/hdxa0H9IcoMcRyCRONPPz/mWZY0C6uiDm0qIprc9SHG5AX0Qeh
         Fe17TGk31IX4QOIBfTqWKhw09FojzTwBmr96x7CptIdXzrq50l3IEJSC+2eeqvJMWQor
         jxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783676071; x=1784280871;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SSCI/XH2UQWCmufgZ/8A4qPYjZ8EOCac2lEkZxpuEtk=;
        b=B2IRrjj9dTijKOtA+MYitv8M+jmtZwoQ/2RNnAh7zlJ2eE2IpRFdgMszB3BMrma4uT
         nZEJkgiUWZN6Gk8Cn+DZSC26me7RC10mfs5Y3CNhblAVJ56vBQBZDB4xfUKZmLYzAMtI
         06a7DXHP4amOu6nl1p91naTAU9jmWeh5+Zpkl40ngsKW7udpvcZ6Dfa8G8HY9dnfINAM
         KxfAba1vMjLIQQ/iqoFXxTARDhltRv2gVR/EMcNfdwfu29uv5B2Q/tvT7lLcSwTXPUCq
         f7AbzFi5ifKbz8bYpOUzTHbBpPE6+Tkp3tzFPEc0GeDsx5563FjHvBcSHpP089nflcG2
         ITvg==
X-Forwarded-Encrypted: i=1; AHgh+RpCyXPVX442yTD/NW6rg/41Riz6Y5yVqOgG6aZ18OIUFxH02YImFp0+h+Dt8eeZZerJzWm5/VYyt6iVSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHZL89yHEtem+fiOLK5vJ3jdO1BN9ubGe/+GTS+DkIV1c9NbIj
	fOf+B/zlwAXyh3wxQOzFZ+bScBSrH+ocYy6s5cKw40KaVO6bSWy7Ygi9
X-Gm-Gg: AfdE7clPLXc5lHdsq9Po2lZqmNiCEFvpzdj9g40C1C1CMCy4OgRtH74bbaEAZstq2GQ
	oM0WbJB9L9nqT74LfKZrigSC1UIdyB4f6ezFh3ZxOdmyWdea3TMUFYAVuga/dy5oheIhPjFbLP0
	pqDEcFPkHs67ZXI7xWhuWwk1/KPWsXha5F962TYcpQeN6apdPSBW0gIq2elY1a038dtgPMlv2zx
	KOP3XMDGDe6k2tVTa0bWHn1EWuM4Ngyiy6qRFBieeV6Tn6hM7JVnkvPyIKwWrelv+zdlYBDzo/H
	wqY5jzjFClqePbvRXwfrefiyYWYACLg3un9JhRBcvFVHQAmNWf53bdwWi1exQ1pDnibluiEWn7I
	sKVwdxMWDKgTj1bbufFjnjFsk7i7DMPZ88naMjzSMnt6yUtSdXGm5acug/HTC5+o/rXTxNkvh3p
	vpn0D2kAXW+PTkXpn6f/9kEdHsJL+nqOiVXDkfklmNuid8WWTvkpWjOC8cD9a/IEfblYXoA+wm3
	qk=
X-Received: by 2002:a17:907:6096:b0:bd1:ba38:c724 with SMTP id a640c23a62f3a-c15ce0604b4mr463506966b.32.1783676070732;
        Fri, 10 Jul 2026 02:34:30 -0700 (PDT)
Received: from orome (p200300e41f023e00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f02:3e00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15ad694736sm589377566b.0.2026.07.10.02.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 02:34:28 -0700 (PDT)
Date: Fri, 10 Jul 2026 11:34:26 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Aniruddha Rao <anrao@nvidia.com>
Cc: thierry.reding@kernel.org, jonathanh@nvidia.com, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] soc/tegra: Add Tegra410 SoC Kconfig symbol
Message-ID: <alC7m7aQ8iVgraod@orome>
References: <20260615083731.888055-1-anrao@nvidia.com>
 <20260615083731.888055-2-anrao@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vvsiihywp7pijbi5"
Content-Disposition: inline
In-Reply-To: <20260615083731.888055-2-anrao@nvidia.com>


--vvsiihywp7pijbi5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/6] soc/tegra: Add Tegra410 SoC Kconfig symbol
MIME-Version: 1.0

On Mon, Jun 15, 2026 at 08:37:26AM +0000, Aniruddha Rao wrote:
> Add a dedicated ARCH_TEGRA_410_SOC symbol in the Tegra SoC Kconfig so
> Tegra410-specific support can be selected independently.
>=20
> The Tegra BPMP driver will use this symbol to build Tegra410-specific
> BPMP support, including the Tegra410 Memory Bandwidth Throttler helpers,
> without enabling that code for other Tegra SoCs.

That paragraph is not useful. We want this in general for Tegra410, any
specific features are irrelevant at this point.

>=20
> Signed-off-by: Aniruddha Rao <anrao@nvidia.com>
> ---
>  drivers/soc/tegra/Kconfig | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
> index 073346c1542b..72b7f5db8179 100644
> --- a/drivers/soc/tegra/Kconfig
> +++ b/drivers/soc/tegra/Kconfig
> @@ -149,6 +149,16 @@ config ARCH_TEGRA_241_SOC
>  	help
>  	  Enable support for the NVIDIA Tegra241 SoC.
> =20
> +config ARCH_TEGRA_410_SOC
> +	bool "NVIDIA Tegra410 SoC"
> +	help
> +	  Enable support for the NVIDIA Tegra410 SoC.
> +
> +	  This option enables Tegra410-specific platform support in
> +	  drivers shared across NVIDIA Tegra SoCs.
> +	  It should be selected when building a kernel for Tegra410
> +	  systems.
> +
>  config ARCH_TEGRA_264_SOC
>  	bool "NVIDIA Tegra264 SoC"
>  	default ARCH_TEGRA

We have traditionally sorted these chronologically (with some exceptions
like Tegra238 which is sorted after Tegra234 because it's from the same
family), so this should go after Tegra264. There's also some benefit in
grouping this with Tegra241, so I suppose we could move both into a
separate section to highlight their relationship.

Thierry

--vvsiihywp7pijbi5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmpQvJ8ACgkQ3SOs138+
s6FT+RAAh3zOL8ZD9boWE1MuUlwM8YchVGExAZ12hK7E57imX/wkCu5Uoqa5kN91
ytLmmcHOby/YEp/RFsDAz54ytpxt11uekhvrd76UriYlySVQCwU/i4HTCcVYO3Cr
bXJhVMsjApBqxEH/gseoicj2pmJlMf4y1F7ZKK74UJmk7jx8r1HULaYLvMNxgZb2
4YlivK6/EX2aVLJhRU3yE/FFt6/q2WZbIblegGbFAItHsfnMeaOsk7OETvB8HpWH
Y1kmKjYaCmPebbuGYm/qUX1zyf0CFP6FD6PkJopydXTFnCHbv7WTtSWKFIAvnzAE
qJXYBrfklR4t/35IiVzelcypHMO0QeNhfYN5K4Gmv4IWjqj6OV0jzz6qJINiO9Dx
i2TCoNWGKykid6dwRVQV2tW96Zh3x+wjRsUi75Bf89HNbEyM8fY5//V3Ug0Qg1+u
HOvRE+qA+pz1F2T1/bgssdvK7/nPwixeZgUru6OPBZ8rBondX1U38/1TFFFCfGae
NT54xKIsdlw4zAFtLyO0p9BNG11n4LWBlygObV6/60R2BC50NbVuND2Gf+Wo9Gu2
1vIc/pCwRKfPhDt/sbxmL91YYGDcLRk0tNsnB4n1JNLR6Nh3HGHZPmC/HGwDbEO6
7wQqTby/lmYr+DS+a0fS3Tpm4WuW/toF0YMBBpd3W8R+t9uwskA=
=YUyl
-----END PGP SIGNATURE-----

--vvsiihywp7pijbi5--
