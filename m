Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196A52FD584;
	Fri,  4 Jul 2025 09:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751619857; cv=none; b=LXvT6eZ6UYqiREF1VTqQJN0kawUx1VhFXIXLNejkhNEsHVikVwb1qPbLhIQ/saQFoLjFJ+KsNSJBnnXgZ5htVmzsPcvMWV9HiMJIUdEpDO0LDF28/4+HVpk6gsAlvZ3cGVOcmX4srENRlaxadZnl55ZoOy8wPcwNrLKrYe9PEIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751619857; c=relaxed/simple;
	bh=xmoB8n0Z4syEgccodxuTLOggzIieavLdMU4wg56tJKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lSA0PNbb7VIBImndFwE4eR9lbE/HywLFMZ4s6QoX2gPZSM+0DdsQY3EXzQzD+yohsajc2TKNt/QgV/OOMwP5NO6ySTWFdozZ+9IcUWOJ7/7pLYdxI7WLSNkcX7hNDWzepev6BefbSb0SWbgq1uXTBm/J/R2t+zrevSlaG9rRgKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+64bhTN; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+64bhTN"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a54690d369so686625f8f.3;
        Fri, 04 Jul 2025 02:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751619853; x=1752224653; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xmoB8n0Z4syEgccodxuTLOggzIieavLdMU4wg56tJKc=;
        b=D+64bhTNZKz5/Rg8n7O6HsgTkFnMbuliEY/5RbWz9NO7Jc7CuJfSDi8cQNMimn4f++
         LEVevxIwqmXDN1XtPW0weLoRAfxdfuWxpUepc0FLk/RrTNPksQ26qWPoXSBL7R2xKiOg
         sWE91h+qxx1WCMGN+XSHrmCw/wRhdFenRlwaq5EaQ2Ly4fYES1DpSpgAStZPZtHX2kAp
         mHGIRSzL+inVlQfecWpq6jADHosSWZ62mtxnIAOdRy1HVX5MK5fu81U9c66yKVfqRtsq
         oNZE/zj9ZpDdmzYoit37hlxFOohuBUasu6IEUeRvEUG5KPjWRxk10G9Zd3W/vi7JneJ+
         cKLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751619853; x=1752224653;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xmoB8n0Z4syEgccodxuTLOggzIieavLdMU4wg56tJKc=;
        b=Qy7FWQgZ9MID0R2IcklhlK7SHpJ4a7kCCE5VLsGY7AYjSITIdb77mQYGhh1f99kcvV
         jRMekcbWEtjpbeLSZIqp05P1GtjTRMlvUAQQ0I0lwl2hjq577LKizai7qcGeK4IQqomA
         Fi62lWopnPfKC0bnL/w20cQeLNR1eCw8gBag0T4zjU226dj+NnT1HSPSOthe7b5oOtMz
         BTT5J2pi1+fNFlT3cevq0kjLOwFBzEkFrj4j9QE4cN1t7NPajNbwBURmjuu157+yebl6
         YyJw0hkBDycUWALY6rlqCzugvORE67G0uxP26k+LVd77+JiWJUM0u/qNiWT8UaDMnWYO
         ulZw==
X-Forwarded-Encrypted: i=1; AJvYcCUGphQDdfdm0i9nulapfTbtjMc/ghxAx00fTJ8QimWlVR2rl2O3zW75arfR8vQ5yUtFENyPtyO9EjjF5xpb@vger.kernel.org, AJvYcCWc/1T6Rtpj15KfFHddyNUjEA9IxvZU8w5FADahiTVpmXJbwB3dV4HoKfRXPklfxR1cNrGH2ZWXnPoxrM4=@vger.kernel.org, AJvYcCWdxC0XyJIyYxoa+OitMBa9RVyZQaT2Di8FF7KALjZWuKrCcmswVD5BQEuCQ+7szNtSQJhM95SaFfv4@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyk57+lQqOXcliQiWk8hygLH3v5Suw1giHa/c8rvUr8qOoaRsa
	FwdcCRa1sF7Eo0AxUq+J/ceBALuew2YvzaT7D9G/mYNP0v8hu/QV+NGz
X-Gm-Gg: ASbGnctw1qeeKY7n/1YdRBYyNo3KtaB7CK4ixSivjHGCgTpVhohM2H48pRnxtnheM2d
	Xw1IY+KwHzm1KOJxYVfCriO29e1oygbxWjSLKIR4utAntrI1xOqe5zTp3BLfRfg+AYEPMB1bIPY
	lalZa+s7wiWYDCpFQ4j7RYbrs+cLbmKcxHLcTpV35NnAnsLyTw+tlWvTtKeaRt0w0//TY0wfnso
	Fx2w1l5GxUEnGsALL0+bKfEVxRLMRz71wRPWjXJ6slPw35grJa2TM78+arcR3Z7CxwXZb/fucu3
	oraDeg9Ts6NLsbIBGszIvrk/Ns7zn2w4HQoXj0zwcuDZQFbLX2n5Im39gX+p7zUPv86nf1znOoL
	K4CgAKSLtR4pJv3s/kZb1UOxS1jZEzCvyHVMxrBg9gVwdusXg
X-Google-Smtp-Source: AGHT+IFJzuBUZQoUNCnvDmPwB16Bmhy777Kn9Cs20ip851c8+j7zobt9tyDy2OdLtI0fu0nStUXG7g==
X-Received: by 2002:a05:6000:2f85:b0:3a5:1471:d885 with SMTP id ffacd0b85a97d-3b497036450mr1143833f8f.56.1751619853023;
        Fri, 04 Jul 2025 02:04:13 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453b35309casm62086065e9.1.2025.07.04.02.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 02:04:11 -0700 (PDT)
Date: Fri, 4 Jul 2025 11:04:09 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 0/3] NVIDIA Tegra210 NVJPG support
Message-ID: <yvzfp5igm2trom4kil337wfsyum75amvgmxkadi537dohmnbqy@wgbm3zxojldc>
References: <20250630-diogo-nvjpg-v3-0-a553c7e91354@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gvr2nbabnfc4vmvb"
Content-Disposition: inline
In-Reply-To: <20250630-diogo-nvjpg-v3-0-a553c7e91354@tecnico.ulisboa.pt>


--gvr2nbabnfc4vmvb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 0/3] NVIDIA Tegra210 NVJPG support
MIME-Version: 1.0

On Mon, Jun 30, 2025 at 09:48:41AM +0100, Diogo Ivo wrote:
> Hello,
>=20
> This series adds support for the NVJPG hardware accelerator found in the
> Tegra210 SoC.
>=20
> The kernel driver is essentially a copy of the NVDEC driver as both
> engines are Falcon-based.
>=20
> For the userspace part I have written a Mesa Gallium backend [1] that,
> while still very much experimental, works in decoding images with VA-API.
>=20
> I have been using ffmpeg to call VA-API with the following command:
>=20
> ffmpeg -v verbose -hwaccel vaapi -hwaccel_device /dev/dri/renderD129 -i <=
input.jpg> -pix_fmt bgra -f fbdev /dev/fb0
>=20
> which decodes <input.jpg> and shows the result in the framebuffer.
>=20
> The firmware for the engine can be obtained from a Linux for Tegra
> distribution. Due to the way the Gallium implementation works for Tegra
> the GPU also needs to be enabled.
>=20
> Thanks!
>=20
> Diogo
>=20
> To: Thierry Reding <thierry.reding@gmail.com>
> To: Mikko Perttunen <mperttunen@nvidia.com>
> To: David Airlie <airlied@gmail.com>
> To: Simona Vetter <simona@ffwll.ch>
> To: Jonathan Hunter <jonathanh@nvidia.com>
> To: Philipp Zabel <p.zabel@pengutronix.de>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> Cc: linux-kernel@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-tegra@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
>=20
> [1]: https://gitlab.freedesktop.org/d.ivo/mesa/-/tree/diogo/vaapi_gl?ref_=
type=3Dheads

Dave, Simona,

This doesn't add new userspace ABI and instead reuses the same ABI that
we use for VIC and NVDEC, but it does technically add a new driver for
one of the multimedia engines.

Given that we have Diogo's VA-API work on gitlab, I think all of the
criteria are met to exercise this.

If you don't have any objections, I'd like to apply this for the
upcoming release.

Thanks,
Thierry

--gvr2nbabnfc4vmvb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhnmQUACgkQ3SOs138+
s6Gvrg//RBWFOyzIiciJCnRpaPXaJguaqWSDT3ITFN3DgPnwSglQ1Ct0MBe9Tit0
/IwLwU8UwWqodKMZ2Jx+VAYQOG6zGt0aYq8oXLHk2aS/ZB28Wn9vcEfF9Ahm75XL
Ujrt7l1TAxSQm/I3TlDbcyNb1rBF+14RmbH6O3EXx17OTneM/VTVH9nvrpGBXfxT
cYHpnq2o2leHEGvulcslwXYSWgMKpc2avCZpxjc/Qd7Cw0OMciJ2PEmADv/fU7h3
JWWfCFtGH0wjVtBkSp/tvY+7rW4ZtySAzMIcHQj0GlapPK0Jemfaw+R29W9xxMZ6
q7rf3Oopvc63Ye4GC1HbDr5k4TFVfP3qNi9MBcDxOkerLclhRRSZUGC8+9YA7HXU
5amDK7JjIrWrhfvy6CwAqPG8DYHN+ueYVBmvzYeFqd6UGXiVzoXNYbEXlF1pXgUr
RZjdoWXNLGodF8iuWwTyOsFbFG41/Uf/WbuubzlvV0PpEIoxKyFqH2peC0tjZcPh
aOegvyojSZ1U5PJ5qWpxUHB7EjHEchjE+NJ/wTyvasWOW9DiE0npAOOQ8aLWJDyw
t+AvriA2bkX9v+Gr+nXni6/N78wT5oqzsUvZFp5cgAPLn0h9dgtmI/aAdfyTMT4i
bBSscD0/FJQlFUyFIuw8vfffpXj6EgSfxr3ggB/ut6MpiItdtjE=
=gKHf
-----END PGP SIGNATURE-----

--gvr2nbabnfc4vmvb--
