Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F54539FEB;
	Fri, 28 Jun 2024 15:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719587177; cv=none; b=mjYEo3Nqa9hKaJ+cZrO6orjjH1T4srC/GJzmkIKrvSUkkwo9fUTyCAs5QCgyB9Y0u9ApsUEU7hpRDkUG4C+PIwoUPCcSHoCuFRsn92DD1ktd+17Aku/40iGsINwqpjtq7U4KCANXjzNITv2s3uxIeyBaYKLTBHxx3x8L02UC1W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719587177; c=relaxed/simple;
	bh=teoHZ68BbeP4g0FUcov5aAf3qrdoD1M0ZAbGmspqrO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F9OmXo/1lwKwFhYNggge9zH24uI0Lj15OOYb3iLrcX5jfeAwoJCUNtaywbbKxroqiyl+fRNx3EO3AiczqMbfAdfCERDVrIe0wVzJLiYeOp0wvRqRNa+JBJTSuZ+i22f06zEXlK8spEZjjtzy8JdSfC6R0+Ai0VHvVJg06Q03VO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hpqbE3Yp; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hpqbE3Yp"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2eabd22d3f4so6800271fa.1;
        Fri, 28 Jun 2024 08:06:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719587173; x=1720191973; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=byFX7b+g2YFL0Se4495noznBPNIYmBdRduirs65L2O0=;
        b=hpqbE3YpCOW7IUuyIO1IazoGhgfQKLg8kNC01Ktdod26Y38q/WnEQ+cPa61WOAf7Ac
         qLX/k7OAmjhqyBzTefBDAzZ5GMzRyWT5VnZncKQ5gHfstIhn2GAoZK0llStCBSbiK8f6
         qvtF2rSDy2xZ2NBGMNID72gZVHwFrZVOxYVcCYcNMYMhbBrQ8vpyi7rAL1C1L5aHMNeb
         XnUp6v23/WgPgEPcbJVO74HFUjN7toTcD1zI+RYINyIHRByZcnDxYJML8kmabdb6gxrI
         bKbkUnHZ9U8nXHgTJVGsR0e+puoI+vXaqhjabtGs2oHGHl4MM6rIfOdsBIlW4l5rNnmh
         BjDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719587173; x=1720191973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=byFX7b+g2YFL0Se4495noznBPNIYmBdRduirs65L2O0=;
        b=eZtx4EMD2OozOvw+IB5m5C/UVk8GbGS3D81gYdl4T3hDQrq2RZO5LzM1hawm7hzaDb
         v8Ka7KVv/zV5kzL3yr4vifFdsemEbPZJO5xnbwev6QLY5TgH4lYHV8nyPxMrRu87AgKF
         EfyZa3zIyrixgWm8LH7rVOrSYdNtiiuSiSpFFTxmse60rJT9YPdEuu2siajJJZWACLpj
         wQYL3zzFfAMVgdY8SGWBmATDto919vXI38QeCuG3zhAO+Krqb8Dyh8Kkwf3LxaO5cAeI
         VPEp/V1svk4wGBzR1kkp0RPu6xC+S4OEYgm4RLFVadNvx9ZqV6RmWEdgpZFzu+dcw3RW
         BioQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8lUkaRzsmQwm2xsM3NPtRoq1ocLSOXNnJh7C7Y8U7x+e3Hhnkj7wBrRIWCpiEFSxl9lI2IfD6Guanll5EqfakH63ymlA6lBekT0kNtL/8ShdTNTWPvo0bYgQ+9gO5arVuz+aYZ3lAiv6Y/SPxC7WM9HfwD9TzqCf/gfGPdqMdWiQKbPnf
X-Gm-Message-State: AOJu0YxzSx1m7Jszj5kh9EBt7r3J8eJvQTsN1Y+ZJS/LazZEBzscW9CO
	ezezAl4NDruMj5Owwk9THDiEYO0edmddS17cQxsl8Mq9erk10Ekx
X-Google-Smtp-Source: AGHT+IH+IBDKrbwb67wJZQY1PQz8Vr9gonBlqgAsSdkyvnNetOBliXJAAb1ffJe8fDb9NRUkMKWYDA==
X-Received: by 2002:a2e:9087:0:b0:2ec:4d48:75f3 with SMTP id 38308e7fff4ca-2ec5b30765emr99738851fa.45.1719587172823;
        Fri, 28 Jun 2024 08:06:12 -0700 (PDT)
Received: from orome (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0e0661sm2557180f8f.47.2024.06.28.08.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 08:06:12 -0700 (PDT)
Date: Fri, 28 Jun 2024 17:06:10 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: soc@kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: Add/fix /memory node unit-addresses
Message-ID: <lbv5dlpvjfolp3tidna6ft7o3c3xswu6udp6savazegbfovygp@uzf2yyrocfuj>
References: <20240430191856.874600-2-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pjs3gbaie5x227iz"
Content-Disposition: inline
In-Reply-To: <20240430191856.874600-2-robh@kernel.org>


--pjs3gbaie5x227iz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 30, 2024 at 02:18:54PM GMT, Rob Herring (Arm) wrote:
[...]
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/b=
oot/dts/nvidia/tegra210-smaug.dts
> index 9ebb7369256e..2e5b6b2c1f56 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> @@ -25,7 +25,7 @@ chosen {
>  		stdout-path =3D "serial0:115200n8";
>  	};
> =20
> -	memory {
> +	memory@80000000 {
>  		device_type =3D "memory";
>  		reg =3D <0x0 0x80000000 0x0 0xc0000000>;
>  	};

[trimming the recipient list and adding Diogo]

Sorry I just noticed this as I was doing a cleanup path of patchwork.

For tegra210-smaug, unfortunately we can't do this. The problem is that
the firmware for this device looks for a hard-coded /memory device when
updating with the proper memory size and this firmware can't always be
updated.

Diogo, you're one of the few remaining people that I know of that still
use this device (with an upstream kernel). Do you have any more details
about this? Is there any way the firmware can be safely updated on these
devices?

Thierry

--pjs3gbaie5x227iz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmZ+0WIACgkQ3SOs138+
s6ETww//fKn/izh6941gGmnNr73X80O4LhJqg2ssrOGsboYQJ9Ca2/+LImPyEeIv
Hp4JfswrF2kNORV268f24OZ9dZG/XehTCR5yJwi3MRmF7uawKIItDOsafq7yh1GG
B+QatqpwOlvX9JFq+uK61TIF/NR7NP+ILo1H4OnnbHmOfNfnm6wG/8bcV2GWGyHg
Xax2H47PW+TvFKAi5m4yM/qzEfj6rCOOsANoqfhoMyzVQ3+C4SY7JyeHX3ZPn5uD
nt1MJNxktXZkP45t2s99mEW3yDD5Jia88jIVgBvIRq/VWiT3RRqXoBOCfNxy4ne1
mE06ZfEGZZeqQsSfdgcs1ZRsG2//h2EjCgOc7+JaE+yvbGC0LsIqoirH8foU+74w
vrgQd9kY5y3XpoOxQuGJpTsKmVrtJDm1ScLcr3zAcpqR0HMLTEXxInL6gOFv2Lfv
CI9ACx1cJsmzNNHrgrSWk39HeeoegCtrm+7DKrgaD6zUMUYbug5p2E3BfIKRMdiu
+yMZ9CMYUD7dylywUIgrQXnsbgWWygMJUEuaLYFZHThzJ2jdCY1vX8FvvWVbDxqn
Pa09zlWUsN6+BABlb8kqjPhU9FBS6o2FJ1eLFS+lpCwah6KE1fPfPRHhZHtn0oO9
FXNNCTagT0b8RJc2RPiMTytbtHwherbP+QyYlfpIoHp6qSavTo8=
=qW8X
-----END PGP SIGNATURE-----

--pjs3gbaie5x227iz--
