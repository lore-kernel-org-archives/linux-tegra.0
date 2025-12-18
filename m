Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B314A2DF703
	for <linux-tegra@vger.kernel.org>; Thu, 18 Dec 2025 11:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766058980; cv=none; b=mj9pnD/fy1Ar64w0xAW231yJvPZRVlYb8EhESIEA0f7S2x7Q1egCJI/fMZIdUZ431Xwju4Md+UusJzqhq71R22DzffgQMQpz2Oqp8MX3/mHhR01ob5WbsNCCjEY7id/7zMNv0hIvt0GfhScZl2TrSZCRJUL04S8GOQNv6Gfv5UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766058980; c=relaxed/simple;
	bh=o/f5qG0fB8BBMiDPrl1dIu9DCRfziVECUeUUdt0apcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g9vHJaXbBDMzIE8U+iKm/K68kytBNw5yOhJrEQ0ZFjcm3MAERKs/1nFV1oAcTO9DVAiSI7NMnw0mlDTY+AX84Lm/JRDAMxacqnhWnYjdpPEOg7PRAipV7VMFqkBnqimIphv8wWd7/MQYlbetTiduNga9hMIkar4o1m8aSedcqZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e2pKReqU; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e2pKReqU"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso5972915e9.0
        for <linux-tegra@vger.kernel.org>; Thu, 18 Dec 2025 03:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766058977; x=1766663777; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Sirw8Y7pkirUUd1z1lvj9vBpxM3O2QyNtSUkQSCiIMY=;
        b=e2pKReqUfM5et8d/G9umCXaoM7nKouKp9D42ZTm7JQPBbfkP8A7SIOlGAcObX9Llhe
         4r2VMDFZ+LjnDjgM4nIiIX5Mjf88zMU3SggSPW4NxesB5NHcIzNq5tDwJfhzDw09iVBg
         K7YZMd/FthNrxMJdDq1zDD4EFTlbfZ42kp9D0B3812AbHKFg1rYhjwtpNMC5zcmEDJp5
         corPXxvZwRXIYmPbNJq2bX3u9WawUV+be3CO3i2xgxcLWE6QHScWGWFWdxylBRKLbiTn
         lZYNYyjMzcMaEKMg86KWVR3Pqe5iYpTwVlmnXbhusFATMTRbbjwfGArY9qgJLqpqpGAw
         Pu5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766058977; x=1766663777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sirw8Y7pkirUUd1z1lvj9vBpxM3O2QyNtSUkQSCiIMY=;
        b=hV5XD7qi9r4KatdZkWlB9oOxCEHlgjbKNzz7XJXDtEVegcDQOyPunpRMGCaxGYWLil
         A6uHREEjXlb6OyH4XfY4pVAT1mEcRpT0XePML+iUb3kPdia++5U5mcTU6eNoAt0mNal3
         nwjmQDxAFma6ZTGTIxD2uXZ0dFsLCZ9Y7hTD3E7UlmPm62qzeHSdx5QLVj+fxtV9Uf0o
         EvvDW6+MUaqZZGo67Hvfv2xOfmywBbOJ4vyZfHPAuYmH3ckJmRPrIXJIw7oeVnl0bFne
         bwUT4OU4K50Ril+GhtkjE6WcitTSXfHhIeyAqqI8cRINNQ9gE87JynEEhE68wfxRbwIE
         hg+A==
X-Forwarded-Encrypted: i=1; AJvYcCXYokSMDaMtOsArllYNBQvo2nvQEQeymLKhao2cWLfpf9Uu+uxrpvH9qmGhG5PJ4NYVah6w7Oua2Lu9gg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9KuYTHTYDZvUep3lI7tyBUeHPL9kv+D3q7nTxxTuUy9vzVsJE
	ztiJ6TJwc3i1mAcl8V281S9tv04W8tlXCTcbNHGQXeaHucufoT/x1lw2
X-Gm-Gg: AY/fxX6Cn9zamA6eFb/7jDwM8v27V3jzQ4jFc/o5zLUUsyvQsUFG9DM3STOuiRLmPJ2
	V+8NIeFFyoVY8LjuGhhK92LhmEapAmlkipiUjXsQAp7OaTZMrD7c5fz81ALPVH8/DWdUnS/Qc/c
	759e+I0mIH3s7GUn9CmQpj4HXrpOFM4R3Zye5zMW4d6BstTqAlShw2PHK7E40CaDJMwMfBbQHde
	e1YWcZrQPfJuK5hLt6llFYRQO1lqZyv8MUFB9/EEtLmMoPELjLLhiKRnVMvgXP5ugWobigPgghR
	BeMUnAK8nXlYmdOknKcwb8EFdBcAe3hUNYJFvAfXh59n1J6xz2PRQ14ujaxDu5428XAyIInRwz5
	KVF2vruc+nm1AUsqLI5sdA7I9XJbaH/LrJJAthk5pogy5rA4NgRxkq7OYHZGOuwBHW4RzwMB40c
	BWcRp+/KQyDV42AeP5KkFnchxs80atECeKstGDe35T5tcvkvZJDhp2vpV9tJZVa5C0FVCWX9jTz
	A==
X-Google-Smtp-Source: AGHT+IHRcSZ29A+PddLskNnFZhBchA0KUCvXevXJCVDr0syq4PFng4cIKjNObk2K4UBPbK++koXBXA==
X-Received: by 2002:a05:600c:6994:b0:477:a54a:acba with SMTP id 5b1f17b1804b1-47a8f904080mr201336975e9.17.1766058976598;
        Thu, 18 Dec 2025 03:56:16 -0800 (PST)
Received: from orome (p200300e41f07e000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f07:e000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be3029f37sm38329635e9.7.2025.12.18.03.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 03:56:14 -0800 (PST)
Date: Thu, 18 Dec 2025 12:56:12 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org, soc@kernel.org
Cc: Jon Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Aaron Kling <webgeek1234@gmail.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] Revert "arm64: tegra: Add interconnect properties for
 Tegra210"
Message-ID: <aUPrVFWKfFYmuwhB@orome>
References: <20251217104744.184153-1-jonathanh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wl6sai33pii6l6ws"
Content-Disposition: inline
In-Reply-To: <20251217104744.184153-1-jonathanh@nvidia.com>


--wl6sai33pii6l6ws
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] Revert "arm64: tegra: Add interconnect properties for
 Tegra210"
MIME-Version: 1.0

On Wed, Dec 17, 2025 at 10:47:44AM +0000, Jon Hunter wrote:
> Commit 59a42707a094 ("arm64: tegra: Add interconnect properties for
> Tegra210") populated interconnect properties for Tegra210 and this is
> preventing the Tegra DRM driver from probing successfully. The following
> error is observed on boot ...
>=20
>  drm drm: failed to initialize 54240000.dc: -517
>=20
> For now revert this change, until a fix is available.
>=20
> Fixes: 59a42707a094 ("arm64: tegra: Add interconnect properties for Tegra=
210")
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 24 ------------------------
>  1 file changed, 24 deletions(-)

Hi Arnd,

this is the only patch that I think we need in v6.19 for now, so do you
want me to send a PR or would you rather pick this up directly?

Here's a link to the patchwork for this, for convenience:

	https://patchwork.ozlabs.org/project/linux-tegra/patch/20251217104744.1841=
53-1-jonathanh@nvidia.com/

Acked-by: Thierry Reding <treding@nvidia.com>

--wl6sai33pii6l6ws
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmlD69wACgkQ3SOs138+
s6GOsg/8CjcraGpbQ/5+n8XTP/H5o3bObJEbJDalfjw48fO1XUKkjmY2KDYNk3tH
jP8JMNYSIhkntLFTr+0Z9JjK8IUZYbvg2QjOgjS5NQt2WEcoVY5ZjZH11a+pBA4h
IyPYbq3dXxYZvj2AMMYRAQvsKB0/ltokxbfaXvqNzluXV6oOsCwVle0k6TV8jUWH
v3i1b3U+Iyu8MoTvH88RIMPspYmmzNMN1nfJ5+XX9mvNvS5NrvujTe4zsYmtoSVa
HyKe8l8NvtCNW8HNBLPP95FgV1wxHhLHUbuaYLadpIS0yaHRiDgbn+EQXNLM/OBl
qwK5Go8ji7Id5FVtno1JQvsnDKYcTId5IBBcKPAdL9PUk818h3IeLnJBQXELPAvT
HV2FnMfB5LFZt7t5f+BdCmxf9TxptRocLaVsAF6VJCHgWerUNnnEx6OuDKk7Uvyy
RdzP6ttDMk4hnDKGzVNjmaIXjBy7qW2/j1QLOPFZxMepAWVgJHehyR5yYl2ekeOZ
P9vsebHQeabpXVQFJFO0UI9Cgh788xQb1boXgfuric9IXQrG1OJb+R4NsfznsvJ6
vc1WUfxGAepFo8cH/K3vCPpbyujO5+n5jRDvn3IuT9W0HNTHJ82p35ciVJ+araQN
8Xstha0OfmhcMPM/Rg8/nmT0mex/y6IvE+MSULZY3eSLX9EcA8k=
=w6w4
-----END PGP SIGNATURE-----

--wl6sai33pii6l6ws--
