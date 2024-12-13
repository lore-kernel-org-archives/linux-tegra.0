Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA23B1B4145;
	Fri, 13 Dec 2024 10:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734085358; cv=none; b=gQ9XNI/9ziWt+gzsdVPfi9RfuU59tY0y25YjEaRHdgS2VcfDrjZEsr7V+v5hcIeDFQ7oOYObdRfBDmoA2GyrSgmDcJFp//awj50yShnw1lA7K58pdWAnXtUyJIkCFt5vG6LagvYWQHTbNAetooZWd0aWhah5DS7AGbDxSyIf5rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734085358; c=relaxed/simple;
	bh=UkZ6UX3wbhpTMWKhfGVviIfRnepmz/D+4/sLUT9R15g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kbncv+gxCyCEEt/BfbCcBTN5sRX7xwSPS12XWN8pJi0kUrTG7NlXAjYgJYXqq8aYaei4aWb8IerQB1KxzxvBWpYSVh5N4G198uSsl8jp3k86jI4sF40Z+2AyYSAZuQhpntew0ejGQ+DvvzXlNv3xsoETUtet6qdxjcu5XzsijYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gv1KlQTY; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gv1KlQTY"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-436281c8a38so8299905e9.3;
        Fri, 13 Dec 2024 02:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734085355; x=1734690155; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=giZ9jsyVfJWeS3+0vIYhnScRBVjh9bK37ZKfH//2K1Q=;
        b=Gv1KlQTYrFrrPo2cPXgpfv11/KmdoXrpyrbJZnqT9LPYnWAatamIzfTYpDxThwKC7E
         u7hSeDT1CwWBkpN/mkZWwdBVCJmt3ZpDH8RfOC5/7gSaXH7hXWopRybOx40nFEtUUTzF
         eb8yC4zb5F51iHG95rCefjVxUxS8GBwqqc4t7JIYZpSkIwqCca2D1yVv1YaDgoNnhZnN
         924KtT+JD5UjP7rIbEihwDvQThrruODfFXdrpykIcE2Bin8kE+OG7K09S507OTgmF6S2
         HOBwWmaiOFKdaH3MDBk4tC1Dl/72sTunHHAWky5hy2EUb4ydIFiYGVdo+KJMewt7Ts3x
         z2yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734085355; x=1734690155;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=giZ9jsyVfJWeS3+0vIYhnScRBVjh9bK37ZKfH//2K1Q=;
        b=Zy8HTap3OLD4pjHo16xKmei9HqP9MS9m7xTBu09g6yERPfkQsiNQQuVj9jnuEAfc+B
         WLUKaArTYnbn0VFzSPKkP7SzhvZDUuwHzhqrGmttd1kgbnHGfPvQORxllqx0EKFIY5vd
         SJCcmRmoSN7+I/JmJCXqJH8vufIYlvybxTi6pv0ZUS3MEYXy+CKPqvjGr6PV2qSLjLVU
         BXYX8BXUr3lZ1Dxh3sm/JX4n5TLQEgLWgbMxRAw78Ov9nGPU9CJVQfl7MYrjNDbKx3q8
         M+Lw0Hv4yNObuwpJf8QlMLAbtGUbRfHYVAhQOBIlUD8RgQ5uFYNmxFgW8T+xwYTKdTo6
         8ogg==
X-Forwarded-Encrypted: i=1; AJvYcCWcJRBI0k92f9OEmWQGJSMUqvf2hlLwpLp8+YBGAdhkihIOWF3UWifEgIxImQ4rmb/7mhzwEOFdQokKhYI=@vger.kernel.org, AJvYcCXpRU5aFWFx2FrUouzU708dtJuXlK1j2x2QdCjUx/+4gvv2vB9tiKtXXtF50PGuDjQvETxffdCC9FjH@vger.kernel.org
X-Gm-Message-State: AOJu0YzInYmHNuBmTEaiDCbCD+b0x1FQ1x8iKg+Y2CSgOtSZu0Oo2z3U
	qjONTEJ3ni4T8VBL6CFfnhDjF842V+Kza0t1SJiwmelgVnByF+5x
X-Gm-Gg: ASbGncs+W3Kn69D7wS+9F+mZHYq9GfieAps/MFqVpeWtrdWQ6AdCsbFy74X07UWrwUz
	33lbkjXKwrG48uoYWT+LZQNEg5o/KHIosiQ40s4cayfMVKz5MIY9gzSk6lMJQ0bP3CU7Td/uJ7k
	KcxagWZRPaVCXgH1iwPRW8u0zZvXp1XEhtuFvQkwsn81apKv1DcqTS4n8Fkk0vQbrAOT4UQm9+f
	xxRPFHtkls5PZOtCJRE8MWFNmN/HRZAGchPKnYwhVCAjWn/oFaIBUQv9LLSPjBWiqu1PSnO82wH
	IC2cTozRf/6n01XMBHr/suDXgfK1rG2RBhWdhaFbUOk=
X-Google-Smtp-Source: AGHT+IFjIMRn+NRwFWkOqfsjTOiIDgsRM66RAjwM3mtaSDdfsv9XTy0D083hw/UKzM3E72D+pPvb8A==
X-Received: by 2002:a05:600c:348d:b0:42f:7e87:3438 with SMTP id 5b1f17b1804b1-4362a981141mr18292865e9.0.1734085354875;
        Fri, 13 Dec 2024 02:22:34 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43625706caesm44490405e9.32.2024.12.13.02.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 02:22:34 -0800 (PST)
Date: Fri, 13 Dec 2024 11:22:32 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Ivy Huang <yijuh@nvidia.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, Brad Griffis <bgriffis@nvidia.com>, 
	Sumit Gupta <sumitg@nvidia.com>
Subject: Re: [PATCH 1/2] arm64: tegra: fix typo in Tegra234 dce-fabric
 compatible
Message-ID: <jr6zj5znqckjg7hxgekn2vtculqu5lluf3tnsrxdgpgxgloqyn@epkjmqd2yqim>
References: <20241213000305.3533971-1-yijuh@nvidia.com>
 <20241213000305.3533971-2-yijuh@nvidia.com>
 <dd45836a-a4f4-4383-8ade-d81c1b11c660@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dghwowecb5yfj7om"
Content-Disposition: inline
In-Reply-To: <dd45836a-a4f4-4383-8ade-d81c1b11c660@nvidia.com>


--dghwowecb5yfj7om
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] arm64: tegra: fix typo in Tegra234 dce-fabric
 compatible
MIME-Version: 1.0

On Fri, Dec 13, 2024 at 09:44:23AM +0000, Jon Hunter wrote:
>=20
> On 13/12/2024 00:03, Ivy Huang wrote:
> > From: Sumit Gupta <sumitg@nvidia.com>
> >=20
> > Fix typo in the compatible string of Tegra234 dce-fabric.
> >=20
> > Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
> > Signed-off-by: Ivy Huang <yijuh@nvidia.com>
> > ---
> >   arch/arm64/boot/dts/nvidia/tegra234.dtsi | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot=
/dts/nvidia/tegra234.dtsi
> > index 984c85eab41a..d08faf6bb505 100644
> > --- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> > +++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> > @@ -3995,7 +3995,7 @@
> >   		};
> >   		dce-fabric@de00000 {
> > -			compatible =3D "nvidia,tegra234-sce-fabric";
> > +			compatible =3D "nvidia,tegra234-dce-fabric";
> >   			reg =3D <0x0 0xde00000 0x0 0x40000>;
> >   			interrupts =3D <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH>;
> >   			status =3D "okay";
>=20
>=20
> LGTM! However, we are missing a 'Fixes' tag. We should add the following
> above the 'signed-off-by'.
>=20
> Fixes: 302e154000ec ("arm64: tegra: Add node for CBB 2.0 on Tegra234")
>=20
> Thierry, do you want to apply the fixes tag when merging? Could also be a
> candidate for stable.

Yeah, I can add the fixes tag, no need to resend. That should also take
care of it getting picked up into stable automatically.

Thierry

> Otherwise ...
>=20
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
>=20
> Jon
>=20
> --=20
> nvpublic
>=20

--dghwowecb5yfj7om
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmdcCugACgkQ3SOs138+
s6GczxAAsIWKNCVU3zM6yRZLAOioiqomr0yqF26XHzeRRsUeHNWeMEjte4/6fSvi
C6j5vk27nhwtCATSC7r5GuM9gWV3UvPnT3sKanFuZpzIBOTd1RP8z9Q5eYKbeybY
h6nZenm8yPwVTCoh+UCcl6csLNHQzgHswjA0r54kURcXHacLUcCFvlVaSh+/E0HM
fwoDXDBCIQbxTp6fBMFLiLVcYIAFSF8izkuJtSH11BA33WFq/5SXEr202OJ+WzP5
lDOZehc5E92bpxco2PYOQkPy3EtifAMwS4NVkXdAn4/ghX/ohcO6F6X19/ARdWDN
k/o0MkzyKXn6jFfApeH0bMg2SKt0DmiQzG0tEdqYyj+eKZemK6HDkSKrUXBaQR/6
rjbG1Gzf35X2oSRU4HenJPrjEyJjjArKhGC53F4iwaRqeNm729aTtZsg1sEfzCy6
kQZMCjfhZw4awlqU30DNLU9bpYDBK4I1jMPm9EOKB/weFF2yVvSlbDvoIpUCUpGO
neh3aL8AqxIHPXu0sP9tYQHu9CFOvvY95sxRPyIie22qFv+UxC5HqpWh0d61KLB2
0gc/+GM3PUejbuNs8apnTv1O+EGjAWueq3Q7VhljdUo10R3Pl9r2MEzaJ6sU2OoE
5rkyaZ2Vv69Cs7HUxTDutbtdZvI28Jl1qtcx3pzm8O5I7ldbX3Q=
=KEzT
-----END PGP SIGNATURE-----

--dghwowecb5yfj7om--
