Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51A6325707
	for <linux-tegra@vger.kernel.org>; Fri, 14 Nov 2025 14:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763131530; cv=none; b=bNfnwNuCVLTYYTDqeUDXY1voo0bCNn+JKmxZzPZ2hHqTqabJgAKwKIwWgMCZTP6e/nSmQPOpbtsjfwQR9FEAaXXJGCKp9mtJFN28OyDPcenVl3hBtcvuwKYBmV8rZ6Tvls90n6eGeElhza8/l1asNUE6sjllUBSwQ2gXB8E3wZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763131530; c=relaxed/simple;
	bh=/8fTrKl32AYfmZ+JOPItTi+DGwmLh4U+5Eurt3NQikA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EdLTX8+4Mtr1Tmw+p6Mn2EZ/WfNBqkltMOvAHocfc6FycLmGY0LxRK2/fqjICGzm+yeyeEUpqX1TklqOr+nmyR1NqtbIXn5MbzWdnE1sypsMtR/HdUFApsXbIr27mpOhGmjMeRPijn35/VcOE4T06g8v6jWHMyrDf7vNMu6odVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TU3ahgRA; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TU3ahgRA"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64320b9bb4bso4363866a12.0
        for <linux-tegra@vger.kernel.org>; Fri, 14 Nov 2025 06:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763131526; x=1763736326; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7Tk51PdNGO35AHnU9TdGMHBjl7SifZZJFLFafuvE9vs=;
        b=TU3ahgRAZFea6FVleBMHLcKCDx2IGdnfVJxtvFibYLisvcwEQcPqYILKjFly9GoMTL
         Im13IowC0R7r+MVf5SX8U0lThVbKD5NLifImZgVYgFklEBuLOQcGq7Enh6zLLUOnsIGO
         3vT5EHGEcUMGTl6pVQeGrgvbq9LgYfftDNXX19zkHjM4UXVVRIvy7UOstpSzLl92UhWy
         hl/wZvLIuOvHgdHp+N2MDy/R4114T2JKKiG7PdmkOY/h700uPZDj6mXLXs8SsVrDE9iv
         Sc67eMlJMUKDBqmDh63zrUHP381JoOCVBDIeS5uWBVh1CX+1fY0sVgauFfj1VKjLAeR4
         BhSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763131526; x=1763736326;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Tk51PdNGO35AHnU9TdGMHBjl7SifZZJFLFafuvE9vs=;
        b=vnptb1ULtFNBNRDaDRmSxOi3VIFKwNk+i3YMfmGcWiwkf5zCk/9SNB8L94QXxKYWwC
         qTpdu/27Eg2zsCPY8n7ZUPg+bpH9e3P4EqOeM7Y/8DnWq9IbqNrKesrqUAoqsZeYK4nZ
         W0fJ0YEt3NihmLYtri2q+tiE0H3RQfQfct8iD6ZBwhWSOAlsczap/0bZJ9+njfgvbt7V
         np0JUIduoHGg9U1upPEwQU/t5GCmIvsUVhfjD4Td3tBxDy2JzFqkrCS+pnLXwOBfiPRh
         tNWcfCq5Fwn/LET96boDoNub/L1XUhGdpAjmKGAIpE6TqENLRGgrKX4cd7mrPgWSX7xM
         hPEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGS77J/1MyMruFBaM1Xzvef3Po8BMFB8gLqBoEBAjGhPIULQ6zOfVGwiZSW9jQwwiFSp4AdyXYLw+Dnw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzIDsFL68vK0sPls2weZgmDyHUyTjHUUURDJFeGeHezyKyqRa1h
	JHsvQuHeZwAcXqn6XGqg/pBV/UxZGgCN9MT87Kl/XXCIm+ZEfLO2cu27
X-Gm-Gg: ASbGncuECiq3xQTyVa8FbM+KH6JpC48Erz+Qi4Ryxe0kImf3y6VjaSWmY4YtlzQYFUi
	hoRcy6Z2H20lLkzBPe/Qv+zRiqQkQZcEwFc0FJLCxjXS4M+TCv0xCSrhpID93C17sKVFeRmPxuE
	PkdF9NwLoI7eAm0r/urBPMtGAI9QtzZHcgeyE+V9MilvpgZVk5KogHPhTAh3ifRHe7Csm74NTk/
	8KNuqdBjS9IA1Bjdwlxm3tOOhHX5+QG41gD0EJ+RbcfRbhb1f+3sykQfg6XcxDNN31ngNhuQlW6
	HMSPkBFd4j8I7mo5yMNyPyTKZ+Y092/mXjjWnikaNx8hhvVJRg18nQdHX3CSX0WJk7YnxEGAFQg
	T0KsASLswBefNM3+QKCkNP7N8AzlRoWuIhCmdQs8kv59q5eS0Yrl9YPNTtbPs8mUD+KgMllhFkj
	R0cERrVgTENiZSOxwDo/uADl8b779uNlrdT+fozo1cG5SMRg+9FPx5acrWNmMWtVo=
X-Google-Smtp-Source: AGHT+IECGRp2VkHdcpMnxy+9lKviJilSbUG9J75N+N6tFZ3+Ma91NvJiRQIj8MoUNErZO8sLouaqQw==
X-Received: by 2002:a05:6402:1469:b0:63c:3f02:60e7 with SMTP id 4fb4d7f45d1cf-6434fa7f209mr3600412a12.17.1763131526117;
        Fri, 14 Nov 2025 06:45:26 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a4b28bbsm3733440a12.28.2025.11.14.06.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:45:24 -0800 (PST)
Date: Fri, 14 Nov 2025 15:45:22 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/4 RESEND] ARM: tegra124: add missing HOST1X device
 nodes
Message-ID: <r3u5slhvazfnkxxeisndhgnuulackua3pe6iglfwmgpepqoyaw@ynm7vouilarp>
References: <20251016074152.8759-1-clamor95@gmail.com>
 <20251016074152.8759-4-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y46ujsge2wpndcqb"
Content-Disposition: inline
In-Reply-To: <20251016074152.8759-4-clamor95@gmail.com>


--y46ujsge2wpndcqb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 3/4 RESEND] ARM: tegra124: add missing HOST1X device
 nodes
MIME-Version: 1.0

On Thu, Oct 16, 2025 at 10:41:51AM +0300, Svyatoslav Ryhel wrote:
> Add nodes for devices on the HOST1X bus: VI, ISP, ISPB, MSENC and TSEC.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  arch/arm/boot/dts/nvidia/tegra124.dtsi | 64 ++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)

Applied (with slightly modified subject), thanks.

Thierry

--y46ujsge2wpndcqb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkXQIIACgkQ3SOs138+
s6HEhw/9FMRFDhExTUdrfX2hp2eziEhkDgGiVKBNI441pHj8Lfj8ULrF17kSTMKU
lqANmRAWFllRqTxDvrStf097wrW/LZKVmv/xevMmjj0gw2FRLx/WayLzrN6aUvB2
R0vE8sn58USftIo+7VmCewaAAxE6VfFaxN1GegNFyePqFchaFTnsUvXxZf8n5vDT
uhpmY7KKQK20z/w/BrzvFB31T2sfjHC7ZEtytmZ51TiI+zRdZkCsHXW8wTBxkAUr
CZs27fIdHYiBX3YKYtGuz31RwiFh1/HLJMGek5GL77Dr7XtU6Pv6tuiK3oRZtBuW
F5cIHr4f69PFz7HXOjIxTORv7GTX8mUlAYnmB4Q9mnhG4ilyMuH/d6EJPUkUcqRJ
r1vvAw4nCrt6BtQh1/hWYOM1PO+JoXo4y807DlD8YqftHyeJx0gqmpu42AEQe5bP
LAB32Fnb0FQc/66jOt9tK+epo8Douhae1cJ7jAWvHWT1tKDQTypSO6ZDcrpnGwhi
3jBKKps7aYnOtbgUxCtiH3uhba1xSc+8t5yJoS0e9IOjWsT0KT6Tu6HfHqD0U2IA
oKZgk9DJ1Zidc7eoS89haJZyxmqG5z/N/LAVVIM0bSNHSGGnJui/JEoWzPapkBR2
P3EGYEOqu6Ey4ouIKm2FoYRe1eKfRxDnECAregel9jTjgwXxZAE=
=F1ok
-----END PGP SIGNATURE-----

--y46ujsge2wpndcqb--
