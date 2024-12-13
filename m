Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D861AF0BA;
	Fri, 13 Dec 2024 10:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734085735; cv=none; b=VsPMG7uIQqdJoMCBWPAe/fflekFSSIRqk1c/n0YD6mDinUvc43fASMBkzGkhewN+PMdfSe58oumdg4wSFX8Lak3C4PSkPVkzDcrpNZHyFGypgpSMy4gEd45DDg5BtC39OC32ySiiYRjH3Xx0D1sSFYYI0LAxkQz2Ng/TwrXUpj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734085735; c=relaxed/simple;
	bh=BXnyrsgsdHGiV455w3HuHCeFEa/SFluCgKXvenSew+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JNejusyJ3uHyDK2loGJ5NcE6pO8SUIGL3Eff+y407ROO1zSYkDY0nNU1VgEx8uJvPK9KznTWaRBXI2YmfAW+RzqwkH8Ias8dQJgITiY51ICdYSwkFozwfSIi3q+/GyGr5Ud08Msb+iv4S2ME7qFHReQyLT45NX4TF3TUA5XJ+1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FumeYSpL; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FumeYSpL"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3863703258fso1619260f8f.1;
        Fri, 13 Dec 2024 02:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734085732; x=1734690532; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xYHxqXx2EMQGflFWtIwoQJfTlQ0gooxKN8SBXQ9zX4E=;
        b=FumeYSpLAdt9ciPuACVgka8SCR6vtvyYRaX6/3zJQV879+64Z6no1QskVFRGScSUcE
         BkP30tzOn+fVq3UmVtBlAWUO7jeChvuOtrWlAubyGB3NnLSTjllFH5HwFu70QNOw13sI
         bpq6ipqKA/Q74FFU96IBuqncI9cLlYXzbcq0bjIzoSbonKEk/oYk0zWP/GozQ9gvMZMx
         ax4K2OHmvF0jnOqCkM7IXsBmAOf0/FksxJ7y9ccDJTY7asiI4IVazoPF6UlbU1kat44G
         dTHHpjJeRwy/isnU1gfu002Gtc0qB3zkbMk2GynULHedKXMUSxRWYgDoOxeMevZycIPL
         9bgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734085732; x=1734690532;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xYHxqXx2EMQGflFWtIwoQJfTlQ0gooxKN8SBXQ9zX4E=;
        b=Ka0nSXCCgej5EiaVSosDySlna+EJoG7cPHSKqVdcmJrFghnYu6iww2tCz/MsJaOhQZ
         fcpNS1Xmi8rHp9sMieQsEEsVKKwhPYcJezCBlYnKyJtbjBQNj9cGxMGZ9N8xdYMAwwo3
         Ogi0MZIq6K42owq8NcAG1/c37SPA+ubsovFqGaCIHzTOBydFyrQHTU8NW0uRWTVsKa/R
         GqVdmTBHICw04Cmiiks5b3Ejazn1+lG6VRDyJiM603ueMywnFnABUS4pA7DoxWNnwd2j
         BDF57t13LkrRdrwlx0GTDH2KPH8yYVZujzhydUe4DNNm8W82oEYq6rRx+T0wPvYLQAoR
         FqpA==
X-Forwarded-Encrypted: i=1; AJvYcCVUoWUn/mL01WPEj2BcIyJNfCBCujC+1rKnild38izy1TuNzd5vjH0BRAvLOjEg8Duxa8ltZDblrVz7WP8=@vger.kernel.org, AJvYcCVgl8rRM/eVydzvi3SBiOMnxQgzps25WD5jMJxBbqIfMEcwVvMJG/R3PJDegwpV8w3NdBk9+9Lkv7ps@vger.kernel.org
X-Gm-Message-State: AOJu0YyPmSWteQJmfZcw7TRJ3nmKaQys3FV+jCfN5SBmxPiNnp8T6PU3
	tn8gbEfrQt5bLT0Lax6j7t/uzPxy8lhTyv2eqwVXxuIf1DtngN3B
X-Gm-Gg: ASbGncsDqVy+I3DkofXqVHQTPanatYjjR7COLD3jgdaPlZVHNrrK4nDWj/7apAIPobm
	pHrcmcjoEvgoHo7tMnhkZU7Qp2TLRjNSpXwLZ6iInOTeTaUx7zYT8C6+il8j9JoTLUH0NFSpOep
	bJz6usXwOPwxDDgVV1iFe6Yy0cPkH70mpqwrolJEnWAAly95LP6V6+I9OUp7WC77ZRSgVfmYmZt
	4SDNkxcUb+IcAmoJSWB1TGIZuse/GSRKKHISVgQipaT3lRvY8yc2HyNi5a2fgPLh8p5BQGuv5Q1
	fRZRpcHVgIdbEuYjIC1CQNdprT8L2wZ1Gn1D3vxzjrY=
X-Google-Smtp-Source: AGHT+IGb7Z+gqsmkO0AJw8/NOqY0CM5WThp3oPPb1uqxhGCRWRoFZffU/dYLohNfLqYEYJAOBeU/9w==
X-Received: by 2002:a05:6000:70e:b0:385:e8e7:d09a with SMTP id ffacd0b85a97d-388c3645ec2mr1356055f8f.2.1734085731798;
        Fri, 13 Dec 2024 02:28:51 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38782514f29sm6847351f8f.77.2024.12.13.02.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 02:28:51 -0800 (PST)
Date: Fri, 13 Dec 2024 11:28:49 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Ivy Huang <yijuh@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Brad Griffis <bgriffis@nvidia.com>, Sumit Gupta <sumitg@nvidia.com>
Subject: Re: [PATCH 2/2] arm64: tegra: disable Tegra234 sce-fabric node
Message-ID: <l23rd5dt2it4tvh26225a5ortsl7wwhwl64tyncn33mpamdkxa@5mo7hiasunki>
References: <20241213000305.3533971-1-yijuh@nvidia.com>
 <20241213000305.3533971-3-yijuh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nswbtxszuhelgfc5"
Content-Disposition: inline
In-Reply-To: <20241213000305.3533971-3-yijuh@nvidia.com>


--nswbtxszuhelgfc5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] arm64: tegra: disable Tegra234 sce-fabric node
MIME-Version: 1.0

On Fri, Dec 13, 2024 at 12:03:05AM +0000, Ivy Huang wrote:
> From: Sumit Gupta <sumitg@nvidia.com>
>=20
> Access to safety cluster engine (SCE) fabric registers was blocked
> by firewall after the introduction of Functional Safety Island in
> Tegra234. After that, any access by software to SCE registers is
> correctly resulting in the internal bus error. However, when CPUs
> try accessing the SCE-fabric registers to print error info,
> another firewall error occurs as the fabric registers are also
> firewall protected. This results in a second error to be printed.
> Disable the SCE fabric node to avoid printing the misleading error.
> The first error info will be printed by the interrupt from the
> fabric causing the actual access.
>=20
> Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
> Signed-off-by: Ivy Huang <yijuh@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra234.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/d=
ts/nvidia/tegra234.dtsi
> index d08faf6bb505..05a771ab1ed5 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> @@ -3815,7 +3815,7 @@
>  			compatible =3D "nvidia,tegra234-sce-fabric";
>  			reg =3D <0x0 0xb600000 0x0 0x40000>;
>  			interrupts =3D <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH>;
> -			status =3D "okay";
> +			status =3D "disabled";
>  		};
> =20
>  		rce-fabric@be00000 {

Hm... so what's the purpose of having this here if we can't use it? Are
there cases where we might want to access this? For example, could some
firmware *not* firewall this in some use-case, and would we want to use
this for error reporting in such cases?

I don't have a strong opinion on keeping this while being disabled. It
is a fairly small node, so it doesn't hurt much from that point of view,
but overall this patch seems like it's taking the easy way out.

For example if there's ever a case where we might want to use this, then
there should be some other entity (UEFI?) setting status =3D "disabled" at
runtime. Or perhaps it should be setting status =3D "okay" if it is not
firewalled. Generally if there's no mechanism that would ever change
status from "disabled" to "okay" at runtime, there's really no point in
having the node in DT.

Thierry

--nswbtxszuhelgfc5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmdcDGEACgkQ3SOs138+
s6FKExAAvf/o9UE/b46eYB8uD01lyvI//x0eUxtOKRnqfgX+d9bjf3brs26G4hdO
E/7R03LG8lRjMWx1fKt5eDh0w/tXrjBrswAHfgax8fuNsGuDPhES8cWMz+HWlKrT
qO8G4TJyDZVXZDbdPnBmx4J0a97QThdY5QIboZpWzM/PFUbMpWoOkscsYluJUzLU
+WQfkQyOzwNAdZxVugcWwfykC1EW1mXcp3QuzEjD/XnhI0E3j3w5H1Gsuc/9J2ve
VU/8BlODeeTraUCR5ulx5gxVCGavteQQ7hBxWNA7SFgz9r9vjhSCjGlVBPtpWEf7
kpQYkCEl9TvpRYkoKL9yIlij9obreueYfDQIfTI4aX/8SpzYiCRZSE8otnmOrSXf
0oDO5b04iyQcVvR/4yZyoKCGOYAfry8gqDPzdU85OJ+IhyF02l9CiqbCXcXNIwAA
o78OwNW2Q21S/hDen0ltdVT9xARBH7mz5BZoMDz/5Z52s+S6eOo2DGD6fxKoCnnT
KoH3mrudnxkUyQClyrGrhfhyopZrrapslwFTEyiaudW6v1FSVjRWkk5F86ff2UUP
jyAfVFBezuEn2vhYECGtTyH2C+416wqaJ5sDkn0R71RhvGx0Y92ZA75gXDVhlEfN
WVcOmVz187yeRP263sC5mN2faCjYPUcSI8X4Vuu/k5iPgXhzilY=
=I9dc
-----END PGP SIGNATURE-----

--nswbtxszuhelgfc5--
