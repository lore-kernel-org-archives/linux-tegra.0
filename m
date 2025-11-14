Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314F031BC80
	for <linux-tegra@vger.kernel.org>; Fri, 14 Nov 2025 14:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763131259; cv=none; b=DsKZqu2CLGK2xAiIa+PsezvwL/E9/OM6n/EUH6OFyeRSVtac43WpdRw+r1DDHhEizdiQCDazuvjlMCZMJi8P15NKBSqbKDDbQzqBybRJDVBNPzbIVql9GhiLh5B9SDkd7V+GSULLAIYd7fVrhOmyTafHt6s2AwrW9qi3VcWc2hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763131259; c=relaxed/simple;
	bh=PHf/UD5k7iA3QpAzqpaWJBmkuPz8YpybdOls4UKbOTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O0/eD1ni5c37uiSkfKSKiU8TFv4DJdNzPgblXC3TXtUGYw1XGqf2g+6EOlYLY8vws3khC2EDw6w5EG8fwk21GKSlrcGIMjVMx6buWqpWCswjfZjAQOIf2H9jeEOIv1bclf9RsvUOmJscY+on2bZJzPbKKZG0gRHoV3NpX98wWjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XFrc4leO; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XFrc4leO"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42b387483bbso1714082f8f.1
        for <linux-tegra@vger.kernel.org>; Fri, 14 Nov 2025 06:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763131256; x=1763736056; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xc869ErP0/mjwRDHtCdqaTd8Ttz+Jrltnu++tMGoZm0=;
        b=XFrc4leOjkvBXjTTioADwNiMUkFPiSNhX2758cATPM8xRW04oxnWRBTc8UkIM05OzD
         DMPRi6o4+6GzFpvdYw4ZjxcB4zxOx4XFmsFVUQI3WDK83A1JElaui6GaTE2zWSuZNcAg
         GIxttrxJAXoYGCRmo4jNMjpczizWe6Ns1x2VCOM0hdXQ4OE5BIeZ9uCZrkEkdqm+iw8W
         pmUooYSv+nzoJ2MWsAdoI8X8BFol5Iu0eikBp63/bXZkyEApEWJk1EQ9ZXPGy1ftSada
         uVbm4l/1FHScvIueaUqyN9GCcCiEbtI2tlYEV5DDJIGk8JIeMmJf45G9ZypqpK++A++c
         vlOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763131256; x=1763736056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xc869ErP0/mjwRDHtCdqaTd8Ttz+Jrltnu++tMGoZm0=;
        b=vx0t5uprAN3sE4X4lHfvfNuTZWi9oNZX56SZ30XUzjAZJ8He9JIql4FYGlbxR2g+8o
         uPO0dMfnC3lkjphwuiJBjYPjvy9BiKU+VMkSgGebUHcLzk6odd1ZeYAwn/xCqLUjei6T
         w5O0v9PjghNfFdyQPGJMtD/UsRdK7iFJGlIev29IgcD42udHp+jkOU6A2ad3CTqJ6T9u
         XViD1zmXK6ndLGJzvphDSpeKqQTchhQN6Q9FTwC8ULMvq+z3U1/IefxzR3XxZ8pFFchd
         E/feqUkGSx5AnfPbq9JFBYU9B4qPgsP+PNrBHhLU+ufq2apptBebElwOpTBHPGteRxH2
         82/g==
X-Forwarded-Encrypted: i=1; AJvYcCUMrCTNBKDTbxg+p0r/h2RuH+0DlQkqYyG8I36kgmn6D0si++WYd6k2YITTA0poheRJzIyUjZ/21bWjRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwE7tueK1dvWSHY7GjyGMxus6vuH4bDlJtVVOmBsWiHNdjh9a4K
	2KyVF4g2tscVuEB3Vc3112eHKVMaAZHXbrVhXUPHgYQvymO7LaWLigxR
X-Gm-Gg: ASbGncshqJQcQYK1SQJFbIwPl2twFykcoUdZZh7NSytmnYxUNJNvJPi/4ptkAKHrisE
	xEGGwzU164rAc8vhLTpOIOLJFxfue55uqA0aUtTytjsjF9G4+Gt9vsTpYVecM5PXs9Jp9Fo0vN/
	5yBskaviLtH9+j37ha7eNPW/NyVeHx1uWgZrHn2F6E+e0oVikagQK2m9AQnW39bmkHlW2/ief3/
	XkS41rbL7wI/kWlgLzOjfAeq0SY2S9/tE1J6Q2iOOjJ0z3w0PBS7Rak+b9yRJccDagmLfM53ZLu
	BZRfImHOWomiydoka4yC1i4ec+Nt7tAGkM0faKZIe9I9aFF8REK1uTaEwiZ6EBqhdY+HxLp1UuO
	qsF8/YRs84C7vNWMKT20MD0Npsz32YJtIHE4CQluhcZDBnY5nyF3vQh1tD+iddAMB+QALU0MNGE
	NUTKScmdoON3xsX2EqqN6vgotQI4tz8CD7fl10VI/rtNzbXNqkpt1OUdcvVf7g6w8=
X-Google-Smtp-Source: AGHT+IHU4qQbpMW5sT2VyXO+jYwcpDuxPys3Hd+1Sg+WB1inlKWAPXzl620l5SLiMVS25lY/hqJ4uw==
X-Received: by 2002:a05:6000:25c1:b0:42b:3b3a:5e52 with SMTP id ffacd0b85a97d-42b593721e3mr3298833f8f.39.1763131256345;
        Fri, 14 Nov 2025 06:40:56 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7ae16sm10226305f8f.3.2025.11.14.06.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:40:55 -0800 (PST)
Date: Fri, 14 Nov 2025 15:40:53 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/4 RESEND] dt-bindings: display: tegra: document EPP,
 ISP, MPE and TSEC for Tegra114+
Message-ID: <g3xgunfzaalilp52nbzg3axkuqx6hbyrgc6dpixb2q5pitrxjm@fcn2u3lbjawh>
References: <20251016074152.8759-1-clamor95@gmail.com>
 <20251016074152.8759-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="efwuts6eddagfwxj"
Content-Disposition: inline
In-Reply-To: <20251016074152.8759-2-clamor95@gmail.com>


--efwuts6eddagfwxj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 1/4 RESEND] dt-bindings: display: tegra: document EPP,
 ISP, MPE and TSEC for Tegra114+
MIME-Version: 1.0

On Thu, Oct 16, 2025 at 10:41:49AM +0300, Svyatoslav Ryhel wrote:
> The current EPP, ISP and MPE schemas are largely compatible with Tegra114=
+,
> requiring only minor adjustments. Additionally, the TSEC schema for the
> Security engine, which is available from Tegra114 onwards, is included.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  .../display/tegra/nvidia,tegra114-tsec.yaml   | 68 +++++++++++++++++++
>  .../display/tegra/nvidia,tegra20-epp.yaml     | 14 ++--
>  .../display/tegra/nvidia,tegra20-isp.yaml     | 15 ++--
>  .../display/tegra/nvidia,tegra20-mpe.yaml     | 18 +++--
>  4 files changed, 102 insertions(+), 13 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidi=
a,tegra114-tsec.yaml

Applied, thanks.

Thierry

--efwuts6eddagfwxj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkXP3UACgkQ3SOs138+
s6FXGA/7BggCUZev0gQB4+nubn15T4/Uomy1O7up6ad5zYYm9jlQzcdQuR0H2DMp
+d6zQi9or0Cu7PoCV7TXRefukOmOK96NjxXJhe8yeMIE7SvS+GgLtBO/M3aKw4YJ
z51yZqqLUAwt0TGYWI817h/TWSNN3NVINjQhM40Kxq24+Ixg9FSpH7KE22ST2DVA
3fo6SNTs8qQZ6s6Y81duUZqe6gJEfNoQbj7OEFQ5++BMIl7UF5cFUqoNa9gLoSZc
NUSHVANkw9PsQ70LVmgcoMxPeVeisO4MOehFnsCNCwGvipv4KVyI2haqCU1DRnGa
7pKT6fkdDs1gdR1ul7m55T++eYzbzfEiwnc3AC2tOvAxfO6bBX5n7NWAtvmfpwDO
IGgtiTen+zU1Z2vZVz+3qiVZWb10BTGfkpmK0wAQ41vHganHUGHhMbURGDKkcDcl
CUasQPWxFRpHvFKpwcm4YzYrunk+zVUfzyRnCZdkRazKRYQPKUrr6tmzwVYa6B35
u/zaxxkhLnOVVMZ1G74PPvnE1iqOZLOOyIx7Vnt/1HY5Rxa8uiVtkcsjHxMAn3qT
G51Ettazq8+00Epu38gUNwAMWPVOMm39e1+8y7IBKqN9R859V9pOLEF0WRq30bwx
ThRAp0CZ1qafLfHHaxdB77pRgeDIUdGNXPxAB4e+DgH8OBki/G4=
=Cedg
-----END PGP SIGNATURE-----

--efwuts6eddagfwxj--
