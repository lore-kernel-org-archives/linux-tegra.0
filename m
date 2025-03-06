Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436F11FC7F9;
	Thu,  6 Mar 2025 17:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741283585; cv=none; b=RA1ZH4PJfpJQovDIUf79skg5kpGqqubD4U3ybXKmANVn+aR3vq+vY/a/Vvk5Ki7TVG+8AK7kL2yYu7J6QuAn6EG2YjR5f7a2KCNoWYI1g7MgH/27bbiOOJgPSaheefJOVr2B0XAnzQPmna4l5BTjJeg4VV/Pw6e1fJ/dLIdbVjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741283585; c=relaxed/simple;
	bh=c6I0nLrVkfWZQz6+G7cnrTCJ+R+DQozU/B38AUSSt14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=szygTbUIhThVHBLvG4Jm7bec46KK4+03W2MuTt4e8krOV7OppbE6yW//92acedUEYfwUYZ1DxrIAlVVVbqJEJvu98SG240XeZyYUdJxKGHVD4/GVRerBoXtwblvd3UWFEEKbQUy88RtGknfZb5KaMMaF0+BV0dypOF+05IqxJxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K13B35LP; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K13B35LP"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-390edaee0cfso744954f8f.2;
        Thu, 06 Mar 2025 09:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741283582; x=1741888382; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c6I0nLrVkfWZQz6+G7cnrTCJ+R+DQozU/B38AUSSt14=;
        b=K13B35LPSGIbA+F6ICYnvZAgjHu6zwPSXELKuda7HFjGkg4OJXCVtGXhC7rtTLUiU2
         DOG1m6AA11+cLJhBVaSVZXfOL3lOUpBbav8A+0J1haNy/PG3CuhDs32Iy/s5rQs4lEop
         WKmoFxK8mZH2/gphs3gXREgz+5CHUAdOJbOnfGsMQU9Q/27jtgwZZj4OP1Ur9s736CIA
         sl+GCO5C279hce0ZVCz81CrnQkuOvuu3W5gMoWkrR22kfaWOua+2+oKz8v9zoQiEpUZC
         OTOFxbyDERkhfJmD+lQRv9rUZTl/0jofh6GC+tgdduTUUqUsYyTRFlp/TRRgJtkBLT3i
         w5SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741283582; x=1741888382;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c6I0nLrVkfWZQz6+G7cnrTCJ+R+DQozU/B38AUSSt14=;
        b=nJjvrmqh+kgfH926d3CJt3lF1K8yd/mcdJs9WtrqPDutnrcNA1T5Su6E/YrGS4rMi7
         V6zZr/+LoTAt8YzJur9/Anhd0haoRrFXBUQpfsFhJERKxgbhVpGilYouIKPnGTcdyZtT
         ZwvHGngW3EzhCmW+EHbhpn1vE4AAW4MEjJGCO9KT3sGkbbxfOq9PJsqVNr+z71V3U5Hu
         xVp+CZZRlIwKieMUP1+CII9q4U70ar/fqJtmQw1u15XSGmzrJKr2JZlVFPafI1H32RIM
         0TNHT4j4iahlElyhLvT35H709CdcLtEtiMILAkxU/v4rrvJhCeZ8giXiIGU7YCkbLSrv
         S7og==
X-Forwarded-Encrypted: i=1; AJvYcCUL4rRA8o8l/NvMepbCDA689iQSKC8fjOfmbmmtMqq+kEgEt7wVpGf9iSGOgoc6Kptw/pGO8Txymb8ZcaI=@vger.kernel.org, AJvYcCUVBQsPDUKVQ5qPupGEsfZYdQdnxG8b74TRSWxb6Zku4WSpf6vYN2BekqIjLuwr0pBGafWrmUqjoppnNZl1@vger.kernel.org, AJvYcCWBTxwKsR4l7Nre1BrTedD0MCF9aeVgsgh/kvxHpgAVlsEqFM4FevYeKFVzoX22chJFmI5sf0mpY5Zo@vger.kernel.org
X-Gm-Message-State: AOJu0YxJWyqIXwCGvAcvzaqkNWlasOefAwrixEzORqEtQ281SWGRbe55
	NbG/g8g8HSmM+ktCdxeO2abrztRzARXEFPLCPno70NoYp24u2Pr+xbTvKg==
X-Gm-Gg: ASbGncuXeGIMqRBFgQcsAWDD5snnEFGbz5ZMHRCb7ud8+11pu7bcKi833d6ehSV6XhG
	CE/w37dRseGyuhk0qF0G6tE/NaTEtc8hTDV94+ylPB2Dem2VtZ4Ni1bznt/2Vaw181JlRk3DBMU
	sm6veHm8S42t8/GLv0aXJ4NHc2iwGNfV+IvAIUonb6DoTwySKpNsNTq7Z1dcqnfmWvOlzMDh5SX
	aOBfacEJHFD56AUC7V53adiD/+U3E+++D2qUFlLsAmU4utnR527s8tpNi428VrZDmbBc51nSC3O
	jP7SV1EPeUnLi8UIbFdLDO00GiR7/b9GTlRfJEL4jpmgvM2jQPGxjVgRCykIZRFE0dQWTgWo+0r
	bV3Cno+SakTN7+GUbiaFcRq/VQnF8zos=
X-Google-Smtp-Source: AGHT+IEQY5OcJUB0sdW/l6Z/hIaVtwgVmdyAdNPHYbc3geWNFzzHLS+BOgy6BhlXJ/1/6zxpiCTnag==
X-Received: by 2002:a5d:6d8c:0:b0:390:f902:f961 with SMTP id ffacd0b85a97d-39132da8ff7mr29874f8f.45.1741283582302;
        Thu, 06 Mar 2025 09:53:02 -0800 (PST)
Received: from orome (p200300e41f3a9f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3a:9f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb7aefsm2684828f8f.20.2025.03.06.09.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 09:53:00 -0800 (PST)
Date: Thu, 6 Mar 2025 18:52:58 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 6/6] ARM: tegra124: complete HOST1X devices binding
Message-ID: <tob3hj44k6rt6rq2o23fn2dqvq4qye2yezxqbvqcek62c7h6vq@r7jakxxf3whx>
References: <20250226105615.61087-1-clamor95@gmail.com>
 <20250226105615.61087-7-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hiw3l23uohoylxof"
Content-Disposition: inline
In-Reply-To: <20250226105615.61087-7-clamor95@gmail.com>


--hiw3l23uohoylxof
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v1 6/6] ARM: tegra124: complete HOST1X devices binding
MIME-Version: 1.0

On Wed, Feb 26, 2025 at 12:56:15PM +0200, Svyatoslav Ryhel wrote:
> Add nodes for devices on the HOST1X bus: VI, ISP, ISPB, MSENC and TSEC.

Same as for Tegra114, we're missing the bindings for ISP, MSENC and
TSEC.

Thierry

--hiw3l23uohoylxof
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmfJ4PYACgkQ3SOs138+
s6FwPA/9F3Nxec0GTI6FIleP0IiwQkJiu8tujBm4hwBpqpIRic+AhSuJkFm4FqQi
PrXypIf5dmUnKwv4gQ3XWC3SAwdpQVRyn1URSFtpTbiE+/2oMIt71SdHkFE8uen4
zmT+h/depJgWYhF5N2M7nyfmZp+QPA/iyCFT78ODD5ulFeDN/3hIFAkC/KdM3cLx
1GK2nyiQ/GzeoRZ4UdqYXpclkwtPNdanYO1Zl9WBsPHs1YghBPmuN6pz4mvrlrfm
1EkW8Mc+qJ3XgUI5K/TAMD8Vjm5t8kyNpdynWmToyV4UG1cjGQ0mpatBj2i4PUEj
Y7+xs2BG0rtsB3BTf5edd01n/UQB/qWUe7fuSsL2PVpWNxXtYhx2qwMviD8xgDSX
OPxz8IpgrGJ5myrnMi6TiYHZx+pNZRocNJ6xf077QAYOg1KSCbOUuiZqlfozTKMS
rVoH9dzJtxD6rLYgPnSP7Mkwzz5Ij4JvQ9s7DfA9an4ZYNM9c8JONqDa7Gu5pqoX
dZVKaHF675Di9qeKftrgyDw0u6d7tILSUrIHdbIYvPtWqNMhKYiCGocp9XIH15Ue
MKEpV/Wys3ykCc2Kv3+xrpDL/6OS+ckjlyi1xn9s2qw9nTWhHq9h3WckYBA0nhrU
4k7emmyYNOoJD9Au87cb+PBFsL3JIn6Fnubk7HxzG4vWoObt6Ew=
=v+Ha
-----END PGP SIGNATURE-----

--hiw3l23uohoylxof--
