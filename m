Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9931ADFFB;
	Fri, 13 Dec 2024 10:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734085268; cv=none; b=U5ts3nhlYG1x+kettEXwbCUbx19wKxe7nhIYCs/YcBTfucJBApWfJjgnz0lds2PJELrQrnHRsexFJ782tvqR/eTb3ctjBVDiLAPnClqgAJSt89dt+5+Acdr+OcJocv5dAJyu98XHsmcESwI2T/opNBpW7BUK3Jxz4bP+rfo2/1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734085268; c=relaxed/simple;
	bh=X60/ueBevlj9FPXR1hwqiBoboFJqMiNnkFv5joLjNUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EUs6tNpJ2HxsrO2zcihPmk11njBe/0ph7+kSmlQqv3VAoehsBuHeViGSLMXX0QgccCxPA3fXMtIDpQWPhR+PRQ8LhbRG3MzPLfldO+eTHKf3u60I9DboJSZ5up5FO/YFyPAFkxNoVJc6nOefJrPYmyukkv+O3lcX5GQJXoSv4PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PnwDeYnw; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PnwDeYnw"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4361815b96cso10508555e9.1;
        Fri, 13 Dec 2024 02:21:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734085265; x=1734690065; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uEsjRzaL1WWl8yuLJGJBc1KP3O5DmTy2P2A0BNrfuW8=;
        b=PnwDeYnwOTPP8DOLVctiFocv88NDjLhUGF2yCT1cgWjUQE42l2bUD8q8WRpEubGLhC
         i2Ja4nHYhAPfWkIn3Xv9pOOAjbbFNG252voZaMXcT2/QaDGcCh/i8zGDgvpkjiIXW2Nk
         ncBT3QdX3Qz5zbXhbPv+p6scdoHj0Kp53dsmQnczbBedtNPK/Xh8JRtwxwrTpf8/1Pye
         jASXpHIY0wpDG8kdwyfnwlktwqyg88WgTZ30RqPOgYEFUft6/NdGEG1RxSB4SOpZtmbF
         vg/eAKfGejyDr8nN+C6VVpzljrSjfWd7ssdXFx02m0JbplcGGx4+cwMCEe8TmGQDDgVu
         r9UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734085265; x=1734690065;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uEsjRzaL1WWl8yuLJGJBc1KP3O5DmTy2P2A0BNrfuW8=;
        b=IvCq3+3PXQpS74P0zBsYwGwmFFohT+tbL6mx+26F9fLLy4hJ/Fw181pb6NTC25cAQ/
         ydht0Qb446FpTm09cYD8uZ9l3fmbr/WJ4i9+u0ay+VKWkkHtMK2BcnSSLctWnKh6V8oU
         ZyR+mrkncgXfQOyVyn6tkImnK2BTes+9sPZp8I/xXdoFHvyjn6ag3QKBTBHUESv2xv/6
         Rp56SiUKjpsiYxRJjN/WCxU9a9sGwQSdAqW4t0CdNsYNXZdjtXnYxV5m6uPnd0B8VFJY
         09nZr/I4yCOTKMrxzMAYinBJ/n50YK5VjLuHxi1cRaMAU+ldUK4pdf0+7AHUdlHQClqi
         mT0Q==
X-Forwarded-Encrypted: i=1; AJvYcCULa9m2+2Z8P7ETAYkw/Kk7KRHLTKhS9CDFNvAb7kgmBGOYaECBaJ8iCoJRKj7z35KcIaqbkLYlBWSZmK8=@vger.kernel.org, AJvYcCXhIN1nyWsIphJu5Tw8EfffmKCdQfginPg6vMDLTDni5SO0vbaZA/VeSSnDM8znt2YQVwVNhCIvpFOS@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/ZZ9d1NtV5ADkv2DxpD7UYXZXj6dGO0kdOJP0v08tXS5j/Pfa
	MKYiRu0fhxS4pHcHQytPxHIj0cA1LbUOrh0NjURAiPnwxjHEiox0
X-Gm-Gg: ASbGnctOX1JbceBI4oI3V+Kfcf4Rn6l+vx7sg9hHMAar+KEJJ18r9lXorqu8edjhlsc
	Pe0/FC6tc6wEzcHNcKhUP2yIBDJoi+XvD9DjA3eNryb4u2zVtMZ7a1UkAp9cySER0rt3rjOqQ5R
	7I0oyhzn7TOky5vViVWgcNwIPNE2Ys+1ia0eR5bBsRZSojHRD+WYdfpp0gl1li1l0tTMVfzFG/z
	rP5FkM4l9df0SgeZYGuvqMYGUjicr4KlafWOwW02Ih4crGjf0S8RrSOdd3FWyixfGqTgYFuChJw
	91ulmYmA3ccrojGOHu2bCZst5lHgdNYOolo9OXwQ3d8=
X-Google-Smtp-Source: AGHT+IErat9sO45QnQPqPZ8QrrNfFXZ76aDLAWPSpad0A3bG94czyNRjm+fqEy0Ri22Oqay5e7i6Lw==
X-Received: by 2002:a05:600c:4f92:b0:434:fbcd:1382 with SMTP id 5b1f17b1804b1-4362aa2ea7dmr14611615e9.11.1734085264298;
        Fri, 13 Dec 2024 02:21:04 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4362571776asm43679575e9.40.2024.12.13.02.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 02:21:03 -0800 (PST)
Date: Fri, 13 Dec 2024 11:21:02 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Brad Griffis <bgriffis@nvidia.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH] arm64: tegra: Fix Tegra234 PCIe interrupt-map
Message-ID: <y5d4o32bzfakxdzi4bihsditxv3em6jt6j25noo6obnwujidcm@2uikino7rtvd>
References: <20241212211114.330245-1-bgriffis@nvidia.com>
 <e3a566cb-fe72-478b-b0a0-b866be7d4e93@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="75vph6qackafis6r"
Content-Disposition: inline
In-Reply-To: <e3a566cb-fe72-478b-b0a0-b866be7d4e93@nvidia.com>


--75vph6qackafis6r
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] arm64: tegra: Fix Tegra234 PCIe interrupt-map
MIME-Version: 1.0

On Fri, Dec 13, 2024 at 09:51:30AM +0000, Jon Hunter wrote:
>=20
> On 12/12/2024 21:11, Brad Griffis wrote:
> > For interrupt-map entries, the DTS specification requires
> > that #address-cells is defined for both the child node and the
> > interrupt parent.  For the PCIe interrupt-map entries, the parent
> > node ("gic") has not specified #address-cells. The existing layout
> > of the PCIe interrupt-map entries indicates that it assumes
> > that #address-cells is zero for this node.
> >=20
> > Explicitly set #address-cells to zero for "gic" so that it complies
> > with the device tree specification.
> >=20
> > Signed-off-by: Brad Griffis <bgriffis@nvidia.com>
> > ---
> >   arch/arm64/boot/dts/nvidia/tegra234.dtsi | 1 +
> >   1 file changed, 1 insertion(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot=
/dts/nvidia/tegra234.dtsi
> > index 984c85eab41a..e1c07c99e9bd 100644
> > --- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> > +++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
> > @@ -4010,6 +4010,7 @@ ccplex@e000000 {
> >   		gic: interrupt-controller@f400000 {
> >   			compatible =3D "arm,gic-v3";
> > +			#address-cells =3D <0>;
> >   			reg =3D <0x0 0x0f400000 0x0 0x010000>, /* GICD */
> >   			      <0x0 0x0f440000 0x0 0x200000>; /* GICR */
> >   			interrupt-parent =3D <&gic>;
>=20
>=20
> Can you add the fixes tag for this?
>=20
> BTW, I had a quick look and this appears to be a common problem across all
> Tegra devices, Tegra210, Tegra186 and Tegra194. Should we fix up all while
> we are at it?

Yeah, I think we should fix these up going as far back as Tegra20. I
don't think we've ever seen any fallout from this being broken and I
don't exactly understand why. I'll dig through some code and run some
tests to see if I can get to the bottom of this.

I can take care of fixing up the older boards.

Thierry

--75vph6qackafis6r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmdcCo4ACgkQ3SOs138+
s6HwsRAAqO8j0nYsLHorTBE7doKhPf44BTmi1wr4dwY+xZ6owFOBNdXY+a/XKQ0I
LG3nmyvLP6RAKZRwW7LCOw/5adYYhssuExOX9qjm90/NGokNx15u8Af2qgtIGqVG
3AmtH+dic2Z2mccc4fWASu0c0b1QUkU6lrMWYcBN3ed4JPRDtUst0VCj+h+bIsTh
44f37X0k5h1luHhpf37oO3736gZfZeOgJrFBd+JAzsPvUnKyP91FBplZwnwvlr0a
l+cElrC8seiBrBnCNyTu/FuSDyL9hiJ/WTNOsN3pRsJ4cG//xr9o5ivPeSh0xlR5
o3P/LIJAPWws4XBl0IqdhUbC5L6UpOQoL3xASyTsrDJYJRrQ3lTIoi68z+UVtV5b
pX7UnyA1NzdO9jbhFYQBo5CGKuoM72o2DI5zMTPXxehm6YVgss4kht5qGKR4SjH2
Daea72zfezaCy3i8+lnD+4pODX+O4N9rsmnMcvgQOAnhg1A0CxeH7ynUScgq877n
5eosgZUz0rFn/iCqqdCn5e9NlVLkcau+/p8MS6lGEaU8LL/50viKLNiIjXzXl2ug
a7hep0aSaCmCpUroU8nnqnm2xsMb5BQ/Gmaft9wlsrznT3Ns5CUl7TCGTwq9QrCI
NIRIKxeHmwrV4L18RtqP7QNI37Rz0DndERl1xB101kvVME9NI18=
=dwAa
-----END PGP SIGNATURE-----

--75vph6qackafis6r--
