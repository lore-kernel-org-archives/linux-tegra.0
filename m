Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EBA22DFBB;
	Tue, 10 Jun 2025 08:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749545058; cv=none; b=Aiq489R4AFO+wQSgxku51b+mUJjhRPOJ9UCqUKB8HOgaFIvONW3crMujE6WlXZPMgMtuaWLw8e0NW4lqbAXsZ6fkyptB8W3tU3oMQ9h82cRwbV1j1sNf0BFke9RZlTxGH8q1AYAi2jKpJMQrp8TZZxS4vTm/Swb9g7XB+RtCf8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749545058; c=relaxed/simple;
	bh=ybgxTm+kvB6cJ0D3DyEVRKBYFC8Z0+U7/NRwx8tLwLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=heSSyInBmnnVEbXCE6ZOLDFEz5n9aaa4Oo5QuJcc9Ql0xHEotFAHEbszmyQI7HeO1DDArKqTrTacmK0GE1iyaRjccKnn9QZnianAAYbSm5r4i5th2RiICEsVvpsPxXJK6QiVKuWN/J88Sgq8ARecn12TpSK7sYrcuIoXb58UZhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f8vwcNtU; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f8vwcNtU"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-451d54214adso42213985e9.3;
        Tue, 10 Jun 2025 01:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749545054; x=1750149854; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ufg6uwyWwGQNdeZaC5T+n52EK93yzGWyzvZoh5XZFzA=;
        b=f8vwcNtUnKy6qZMHoBLqDQyW/S11geLbj7lsOq1Gzqj3RgwSOOk6yxlEf92zK0Ccun
         BV+6AwzYRuzSWLPiImp68NennUC0vfBLnngu8q1QPuLr/Km8zQBj1wN5OetnpQmOM5gX
         HuzUUAoeIprfHO95Ljn372PGiOuxLGBjkqedZBr1zStxkk6lobUf14Xw4Y2VxX/JwnSD
         dhd2yZ7AaS3gzQFwiFLTCpbpagt3GTerL983WQmwAVqZBFJIaIvrzycYK6vj17lkaNjD
         oEPF6UG4qualjwXRUgWK80ohzWt3k+ngL4vmvrIAq2lrPLn5jdnMLmoA9PGINqRGDCdw
         4VAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749545054; x=1750149854;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ufg6uwyWwGQNdeZaC5T+n52EK93yzGWyzvZoh5XZFzA=;
        b=W2IerGAvhfkkW4vlrM5jNPeXvOvConZJjw1Gj447XX2ZFqQXhOb5yH4qf9+ECYslfM
         e2rBGco6P0q+ElJ0ktUFyBml0Amn9zOuZPQDhvPVEXz7AU1MmEewMUrpPIveMKo83RaW
         l3mhSXo2eLZ3aGHEeyS9v+yCwuWPfBc8PJoIWtuPmZAPEiKGGZ0nuSUgtT5KsfBQ5Vvg
         CkAizT5dc3JWS6senCZI6wv7Hc97nthY3R19Ddx3DFSMUq8Xg0SwpRY0TW83o3/fIjy8
         xfsZj78QIFxb4Uv8FZu8Nt+XG/4qd8HHX2J0vzRGHTCAoyrE1gfewhKRzy+0bEtwFY1J
         473w==
X-Forwarded-Encrypted: i=1; AJvYcCUN62rokCTKnBiBZMRgZ/9qWEkjB9MOIQtgW5//9rXcOuZN1BmiyJQTBE71+q7jeijSTV1BuX730pBReDS6@vger.kernel.org, AJvYcCV9qMCBDUMsidm+lO1sX8hFfmM0j8hfYnmMaBd6/B0QqOYAkrCZtcEUf6v9LtJhlMU/bwJJkKPf423M@vger.kernel.org, AJvYcCWRcUs6GXTINnM8YQXOejYvcyqyVj+jVSzPINfL+3KgvcwpIZQiej3TqokeBzscviKK0SEps7sp7ncDoak=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4MyId7ElAdMpZKWHSjfYfPTqeIUdcRLz5NzqthmllPap2aAe8
	pWJRopvABdiLdbLfIz9+teIhyDcbltYDpVUK5HYbisVrmGIQsLvWStJ0
X-Gm-Gg: ASbGncvwbN0BtydCqMNeINfNfuPr1o195iHyHWEDxRW8U4Hpulf8E1gzpLN7hscAEU/
	Y/BNZp01Z3/l17WOKJO9ZdgUflZO/FCwRFKqaKXt4pIzXzS3SDiflmej9cVIyq1bzQ5BH3rrd7P
	Ln/tPAnphnr1OREbAjxrkuIL9FaYC1cJugQv3XkVlmkKc1mTrm+apuvBYN6BZJ9SCVRxkStLZzi
	IpENHwOnGbFP7oeVX1BGlgPLPTmwc1qw5QZ9ca8alQML1VGpfypkO4UNHB1vuCqFustI2fVTQ7K
	nJ44JI90NDDHP8w9xWwlAcu9ihqthncIIpbcHO61w/SEONcCeOVM6XnqasZ4iHatFeqPT2xvjK6
	frGsEik6BffztXyQdvr+rq+1lCOuQQ1pekP35r/NFSFyE4ApP
X-Google-Smtp-Source: AGHT+IEI6U/wlkyv60EtHKpGkOxvKNc8dBNCAlpQUDw7Gbe+DfsHFVL8q5OU8MIyrQVeRvXJaoxmiQ==
X-Received: by 2002:a05:6000:2082:b0:3a5:2cb5:6402 with SMTP id ffacd0b85a97d-3a55226815cmr1210790f8f.12.1749545054244;
        Tue, 10 Jun 2025 01:44:14 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532452d7esm11567635f8f.85.2025.06.10.01.44.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:44:13 -0700 (PDT)
Date: Tue, 10 Jun 2025 10:44:11 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <cyndis@kapsi.fi>
Cc: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, 
	Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] drm/tegra: Add NVJPG driver
Message-ID: <fhumfjczxcohn5h5mnrdmz3x23ituxktzudtfutly35jkziiou@ocffx4vennrn>
References: <20250606-diogo-nvjpg-v1-0-5f2c36feeb39@tecnico.ulisboa.pt>
 <20250606-diogo-nvjpg-v1-1-5f2c36feeb39@tecnico.ulisboa.pt>
 <811ad406-4afb-45c5-9783-683779f874cc@kapsi.fi>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4tgir5eftbmngfvg"
Content-Disposition: inline
In-Reply-To: <811ad406-4afb-45c5-9783-683779f874cc@kapsi.fi>


--4tgir5eftbmngfvg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/3] drm/tegra: Add NVJPG driver
MIME-Version: 1.0

On Tue, Jun 10, 2025 at 12:26:07PM +0900, Mikko Perttunen wrote:
> On 6/6/25 7:45 PM, Diogo Ivo wrote:
> > Add support for booting and using NVJPG on Tegra210 to the Host1x
> > and TegraDRM drivers. This driver only supports the new TegraDRM uAPI.
>=20
> Hello Diogo -- I'm happy to see this driver!

So am I, nice work!

[...]
> > +	if (IS_ERR(nvjpg->regs))
> > +		return PTR_ERR(nvjpg->regs);
> > +
> > +	nvjpg->rst =3D devm_reset_control_get_exclusive_released(&pdev->dev, =
"nvjpg");
> > +	if (IS_ERR(nvjpg->rst)) {
> > +		err =3D PTR_ERR(nvjpg->rst);
> > +
> > +		if (err !=3D -EBUSY || WARN_ON(!pdev->dev.pm_domain)) {
> > +			dev_err(&pdev->dev, "failed to get reset control: %d\n",
> > +				err);
> > +			return err;
> > +		}
> > +
> > +		/*
> > +		 * At this point, the reset control is most likely being used
> > +		 * by the generic power domain implementation. With any luck
> > +		 * the power domain will have taken care of resetting the SOR
> > +		 * and we don't have to do anything.
> > +		 */
> > +		nvjpg->rst =3D NULL;
> > +	}
>=20
> I see you've taken this from sor.c, but I think it should be unnecessary.=
 I
> imagine the code in sor.c is overcomplicated as well, maybe because we us=
ed
> not to have the power domain implementation.

Agreed. SOR is also slightly older than NVJPG and used on Tegra124 where
we don't use power domains, so most of these quirks are for backwards-
compatibility. If we can avoid them for NVJPG, that'd be great.

Thierry

--4tgir5eftbmngfvg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhH8FcACgkQ3SOs138+
s6HO5xAAuFcTDTd//elXh91lR+ye68vqyuQs9ieD1JizLFCjtviETpAU/eRizVY3
nptiSkEPE3sVenbPIFwveqnkYiAGWAk6oOcixS3TG7GSEJg8iZKhT9firLCNNp7h
lJWHQVN4RLywgBHPeZx8vpupyZBWi7Qv8uiSu37b6EsOWiUacvI7nQgQGY19/Iwe
H/EnohUJL5mN79V4Y8P+8gwuy+8gJAl1iAa39oeFBR9xJFtxDMm582nWb5txhyY+
8smkQfRYdNmsyxJtzewPIoUTxSpycM7OjCv3idK6ezYQ1kaXtx55IVzgwlaKO4SP
oOW6U7Vzj40bufDjOyKCCIc1BUrnxsiQGBKdqJKTUVQSVC2xFiafHWIDD9w9mLYN
Cspt1zyGIM0rAF+RB+Az4FQwly21KVlyruZ5BnhES2LrZIEDcFWhbjvftqvSFV8r
EJDSZyVDyGg37Sgl3VkRWYdtt3Ao/tv/Lii0VBOS8v5wvkZ9xv9OXN1GSV4DGF18
G40Ixjy3362iiecmwA8DU+ExFQGx2JTPtMIf+Cqb6yP9qHGY6ZrN00ai1Gu8ti3U
EpMs7y7hRbuLP4TdZGnXMhGGUh1wjF/h3dLszxLUKunYkDRegAV6N2cpal7NwiVv
JBrwR/L8nJMVO5fkhMlybop1j0c6SwJaVY/7BAe3U97G9GyNlCg=
=tF10
-----END PGP SIGNATURE-----

--4tgir5eftbmngfvg--
