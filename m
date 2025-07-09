Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC762DA74C;
	Wed,  9 Jul 2025 12:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752064580; cv=none; b=qzBzCDMxKAwwSuAtXEvG+vQLhnMF4ruHQMqEHmLTgzx9fn5TgAcZm/Lyyy1iQ7vH674mxWqBtlY9OSYzY8q7oOrjuNHz989Zpty79DVHvQDno/X+Zr9+C8OdbfYT1wAC9/duHzHay6idTLglvrpm1Z5zUh5zy3jTH3wfd20WQQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752064580; c=relaxed/simple;
	bh=OH9RJ22f6HnRZKb1/JJVgz3oFFeduxOoMrFvKyaX/gA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C4js3QpFM5z/DjrkVwRytt64jHhm7FL8WFmEOyq3J9DuYA5VefBAnrMkzxfI1BltoOICZcb59GfM7/0o/KZA5dbQfJ8tCKIbktwiZx9qsaoce8EfiiPwKuxtW7L117/BPIB246L+YIDLtvv7FhS0gfjk7CLbtSAuxp6qEJaF7W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P5G3/sZs; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P5G3/sZs"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso3005733f8f.2;
        Wed, 09 Jul 2025 05:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752064577; x=1752669377; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F7pXgh+7Em51b3M0K4QNjuqFHVDfsI4ix4PKTFQyaqo=;
        b=P5G3/sZsW3N/vWpx0k0hJ+NtS9yI2xewausCl9tU8td/7uKQ1Il1W+H/czBgvlopnj
         jWc4usGby0mewOtdiZxKcyZ0aOdpvwyr3AEBuxFoULIx/7sFpzvE26vEQBapec+ZDw0K
         zMBvzBDkE+LuonZ8C5/7ebgQoLuGZCa04XSN2vUJ4B3fDxOs29QD3j5lpTcckfv6SoEK
         u1+K1ESQB8QxTZW+6l92T+01p5HWyDJtxLkwo2xfWDFX+DbBrgrOJn68rKXuOBReBJkR
         TR1eC1i1RHPdU+ZtYdc8VI/j9O+BLHDjto0g/AQev1cVp3btnXdk5QSBWpKVwUQ5F4HP
         cEYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752064577; x=1752669377;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F7pXgh+7Em51b3M0K4QNjuqFHVDfsI4ix4PKTFQyaqo=;
        b=XV0oH7hO0absI454Eb1JvA90S/sZJl3tEWTx1LaMLCNFV1LILWpNYS35bXz5JMpgTb
         w6G4QB6s2Pi9aQWFJrEZ3fmdFe86lr3K29pGKDLfPFT0SpnXn1I/t5yrgWh5l+hYz6q0
         T7an/YhNo7zGubKp3HDF3Yw0YGrVbXHZWD1hFnECwAgiduF94QLF1Cg3UIdblq5GhZmF
         h2klTu/Cdey8tRhotCWL1OCHaoklys3EnFyB00yetMCSPYy6q5DG81Xaa0i36X5piTT3
         os4+Z7eBnOvpvp4J+nujFbp+TOZtX/Th5+rl0QzHzWGSXvVoHu9F7hsuheKMOoHm6iWH
         OsHQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6opr6Pj4KSj3ddPBnlLo0/G+Q5mF8F2Nqp8oi99+p3RcNe7lIwr7T/6cY9dy+SR1XKqyhIQGG1KJCwWM=@vger.kernel.org, AJvYcCURKxr5E26lBQLYctThgFEeOVzJ8InNTGQanXpFVF9nRqTPqLU4s4s9niFDweMjNmbPRnJYzp8DLoL6@vger.kernel.org, AJvYcCWeKNmftCSuY+hpYvO3cAfsnH2PiHmYeWOTbnOuwcFA7T1wmiLtswPfEB2wrdcryU0LO6aEUle8lTXt5naz@vger.kernel.org
X-Gm-Message-State: AOJu0YzevOg0ZmhsK+1ks8AkF52CF2DfeINtScXbuW1ZWM0twoExJBRC
	Rim9zSNq+4A9MEN+tLGl/huVWEsAneaJH46AcOhv024iFU+DamRP0kqu
X-Gm-Gg: ASbGnct9/2V1pOY8WGMXn5TywO4DA7YB0yMM5aVMF8XUCBpP5T+L8o1mhgpFAsdude4
	TRUF1Q3CewM11HsOrVnKw43eFP/sPYYFxbVk1aNdPhCDskuJ7VVirElLL4H1af91dK+B7FY5iWA
	u6Lz8V0dfxneq9AKihOVuspupCzPTx1nXr/uaSQuWPPQUS0aKnFSR3op15LbQpYkdgU7NdVpcqY
	fR83nY2GtZLa42VXQT/0nR5fob7LiFTsuhEn41ElazqQiL0mtHUlO20DauUsiqKjWdEnPcsaWrU
	uj8ZZAA7/QdIToccBeaDE/qS6BYiN7Jm4zZ4vp5eYUdCjvR4a97IF4nOgMufFt/ueL1k5DSV4eE
	hQeV6re3cjIeRIlYEDQYxEMO+Y23au10l968NTOzxpGcTRcsMTO067NgrIvo=
X-Google-Smtp-Source: AGHT+IF4JfTBcT8gzEYg4AtRTRbQJ48L53vM7WFCoOTGs9IyCVESFFaJ77r8MiezEnYK/dxMRlp9bw==
X-Received: by 2002:a05:6000:4a0a:b0:3a4:e2d8:75e2 with SMTP id ffacd0b85a97d-3b5e4540b24mr2049528f8f.50.1752064576971;
        Wed, 09 Jul 2025 05:36:16 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b4709c6e28sm15774029f8f.39.2025.07.09.05.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 05:36:15 -0700 (PDT)
Date: Wed, 9 Jul 2025 14:36:13 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	David Heidelberg <david@ixit.cz>, Ion Agorria <ion@agorria.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] ARM: tegra: Add device-tree for ASUS VivoTab RT
 TF600T
Message-ID: <u3q2aphdsmc4toqxzicgk5sjrkcyukksa5nuwccllbmm6jptj2@ld26fmpsyweh>
References: <20250617070320.9153-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hkv6it553fkcsq2y"
Content-Disposition: inline
In-Reply-To: <20250617070320.9153-1-clamor95@gmail.com>


--hkv6it553fkcsq2y
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 0/2] ARM: tegra: Add device-tree for ASUS VivoTab RT
 TF600T
MIME-Version: 1.0

On Tue, Jun 17, 2025 at 10:03:18AM +0300, Svyatoslav Ryhel wrote:
> Add device-tree for ASUS VivoTab RT TF600T, which is NVIDIA Tegra30-based
> tablet device with Windows RT.
>=20
> Maxim Schwalm (1):
>   dt-bindings: arm: tegra: Add Asus VivoTab RT TF600T
>=20
> Svyatoslav Ryhel (1):
>   ARM: tegra: Add device-tree for ASUS VivoTab RT TF600T
>=20
>  .../devicetree/bindings/arm/tegra.yaml        |    4 +
>  arch/arm/boot/dts/nvidia/Makefile             |    1 +
>  .../boot/dts/nvidia/tegra30-asus-tf600t.dts   | 2500 +++++++++++++++++
>  3 files changed, 2505 insertions(+)
>  create mode 100644 arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts

Applied, thanks.

Thierry

--hkv6it553fkcsq2y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhuYj0ACgkQ3SOs138+
s6EDjxAAi7QmKcrIYPm3Flr756hbDKinhzsdxxiZ+ZCEy97lFjTc2/DQyD3y/8Kf
VdrgfzUeC2HhheMSoBhhUJFbcv0j/OjGcyN33mCr+cPEUGemeY4+ESDeuVN4lT0Y
QeOezLzRfDR1Avvt6lfe1mkOlFLh7aR82QBWy+zSQLXuCclXrecllnd3dkQ+1+Gu
mD7f+MVIatEGlo93u2D0gQ+WycTsrgwjLUtzrE1CJ6X2b2SlDcX+wgsdpDxxWYkg
joJNQLwKFrlwld2UPb4zbkeBzlBiqPYZEc7I1aWjgGe1Vw9Mq2UNaWQm+0GKvtp2
AkprFuZAmcsqCWGh0VSXC6/vimhNiZCF1TGwZP/WxTgZcka/WxBAyEyuGhUHFUAg
PYf0uCap1tkTB1g8diRJPelLsw2tWK2Fuzy8FRY3x65x6x92em1r2sjGsqh2cjAr
s+0pPVofYLJwV+gNd+uIB71GNIP5V9qyttTBm7iCDf94vI+kjuQfSq/uEvPwPHm2
My6zO4UuxnQqjmlI+wcQ79B79uqUfHaSJ+LBpOx3Z5WgODkzHGfLsR48FPmZAYcd
MAmLIL8k+lk29+HvmUk5zvaoPceFuy1paHwkkKLM2P/a9zDJavtGxFnV5Lusfenu
QteHogap3WnZ1P7ZAHB4ZSAtg8DrRyEs8QAyhXex0D5N1Ye+ECs=
=uTw2
-----END PGP SIGNATURE-----

--hkv6it553fkcsq2y--
