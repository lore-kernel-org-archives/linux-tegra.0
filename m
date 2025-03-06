Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68FD212B2D;
	Thu,  6 Mar 2025 17:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741283725; cv=none; b=SSiFE6WMVDSfEOIk+RlMTX8r4lqlXeyPmXhMK1YAvntUbgHy+wbrmLNmSDUqVbzSn76Cth6J9j014NTYXNdyM6mGKVc5zrI5iOJEYoVqVfgmCUw9Xq+0aIKLnTL3f0jG2Zkv8/j/cIS3NVz75Bam6G75NaPn0Z5szNty7vFi3E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741283725; c=relaxed/simple;
	bh=Uy3+bxU9Jwox38fdOsRMxJe0NwmFPqkH9qkHncJp7u8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XxRaE4lZ49EEbo95R+Kmceoj2AjLiUFXaFdjh9h4eSzryfQs+foNuEEHbzdkfF/yfYsc/8FRA7ag//f8LN+XbwOjVPQcqDEe/krroASHFzfDCrulkiBvZzhW3MtbETSsHw3ywNY4dBn6INW2babsHPPfyr9L6xfTTmZJLpTeCBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dXQMigBr; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dXQMigBr"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43bccfa7b89so8393815e9.2;
        Thu, 06 Mar 2025 09:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741283722; x=1741888522; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DHMtphsFs5Xy87V25XvADAfBc9IfwZSxeEWKS0R98pU=;
        b=dXQMigBr2iTuSESQLOuwE5jeIKQCmE9eKqa12jc1upLgb+T7QRPCp3WqjzhWEKErB9
         ykhG7EV4fHfEXkUAKXoOdXg4jPwkw5kaTEW7/U4IVe6jkvxs2s7/vrccCoIVBgum4GDL
         4RPHnmTw10jvcOLTtOu29lZBEkSH8IsdFT6kYjyPQQ6mKvq2DBOHPVvfk5RyeBakmMtf
         btuRycUV75sCYgmtx4DPoE0lyDjjr6NxJphYqgMbXynOJt353gM25vkStIt5DvRxdgIp
         dnzpDnjkK68j2E+r3nyOeVlkuVgGdtobWndXy5QXV7ocNZ1hsOTbI17y3DxRviqnN03H
         usSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741283722; x=1741888522;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DHMtphsFs5Xy87V25XvADAfBc9IfwZSxeEWKS0R98pU=;
        b=SUzEhykr5ELYu5QMHZSTpKS3oHNcdixRGKeMmaV+K5X6pEjL/k6GvpZTAe/jnIf8ii
         OyduVJJiEHjmZkLE8MHwmoki3xmu3ALxurvpzKJvrAapkrHPhu3crID0ABrWa0eDA8qT
         LXDs0psvbRfwZahMIwWtfldh+GE7cw7VxFpQ8Wyj2nmXzyxrSucfQAgfXCz5ra6+khEA
         7NdxKhX1SAF4/RDMEEyL9wbDQvudZ1W7mo5YY3pPYOZ3fHENsZeMSEjvpdKLt9fDjFX8
         nS91tIjII02MygoyDxGXYFlNC4RUP52e8Vboqtcuppek/v8uEHMw75pkvir4qKOB8gaw
         FHiA==
X-Forwarded-Encrypted: i=1; AJvYcCUMSo3On0eO2n7JqDa7YWJqUd1L4i/kcFA/JqGcD5jjmCbphb+UTg8uzgjXEkMNYBDfkZbyC+zmvWcKc5A=@vger.kernel.org, AJvYcCUs5q4lBlNA59Uex5K2Jr7J09Usuer+RzpGxfAKongbBZnuCTrVp/yU+bEPxRFDyzZ+i+LJRJ8fcbeM3ZNF@vger.kernel.org, AJvYcCXGXilb1AnNbznQ+0IjyGphhaUtL5a7pgYfN+HKKDnDKHelTffQto+mhXWT81Ko4O/2sC2xEK1DConR@vger.kernel.org
X-Gm-Message-State: AOJu0YxNiSNdWA/0qcXXxkPOqbMwQWEkXGsklob21WzU7oSuyLtl1vre
	4wnaeO0tAY+3RZ9j4rZkOksnIoG09n2f6Im23Jo1i//wT0ZpZTaTA9jSfg==
X-Gm-Gg: ASbGncuVhytE8xydutOEHXhwPlFgJG8VYQtfbjPihiHgXNzwaiJiZeYLX/Jo4+zFS3x
	VVgsk1WqXYwis4iL0TT2vtRQJyohJSzPjk4e2j6N5VcMiQhElSzh2uvJg1e6C4kLQMVElOnz8UZ
	GoA8kBFe3Yy+h0sBzCimekH568vsCQ/kTuxSVXhOEYl1JHklMZjPSDDyxos0Wy6rW1EDH/Glcwt
	O7kQZOAfjZmq1AOwVGn54Nv9Zt+9Dl+XlrDSNOGl69l5nyEsRTW0PA3Dyx/cF8YLDUD8U6Vv0DZ
	LFc3iu0Ikr5SGoehkX1HZ4ZmLTmEtQpXQxExpX1rFCbo0rZ/OqDKZZZmLKYsoyDolwRW7LQ2kXb
	s9SldK1zrR4/QE8/0huKiO2pmSkRgVrc=
X-Google-Smtp-Source: AGHT+IHbST5JYsCpKIPIjYrF6i+mlPXuzhNNe5g4oCOJOSphi93qv6EDNmEmyzDmVnyWCTQ0ozSgVA==
X-Received: by 2002:a05:600c:3ba8:b0:439:a139:7a19 with SMTP id 5b1f17b1804b1-43c60208487mr3024455e9.23.1741283721597;
        Thu, 06 Mar 2025 09:55:21 -0800 (PST)
Received: from orome (p200300e41f3a9f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3a:9f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd435cc67sm56520485e9.39.2025.03.06.09.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 09:55:20 -0800 (PST)
Date: Thu, 6 Mar 2025 18:55:18 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/6] ARM: tegra114: complete HOST1X devices binding
Message-ID: <v5cnecjkfrdee545ueunjlg5gc67ooa7eilhdcm7axwfkvhg5z@um7gbv3w2x5r>
References: <20250226105615.61087-1-clamor95@gmail.com>
 <20250226105615.61087-2-clamor95@gmail.com>
 <hs62xcv5t6dupjelauzhytvjyosyjy2pmpk2cf53dmastma7d4@clug3pqdi734>
 <CAPVz0n1Y59bv4-oro=KHcA21jQppHOzOfK8uC9GgMMynGpxrVQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tdyjgwr7zcc5f2c6"
Content-Disposition: inline
In-Reply-To: <CAPVz0n1Y59bv4-oro=KHcA21jQppHOzOfK8uC9GgMMynGpxrVQ@mail.gmail.com>


--tdyjgwr7zcc5f2c6
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 1/6] ARM: tegra114: complete HOST1X devices binding
MIME-Version: 1.0

On Thu, Mar 06, 2025 at 07:46:18PM +0200, Svyatoslav Ryhel wrote:
> =D1=87=D1=82, 6 =D0=B1=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 19:42 Thi=
erry Reding <thierry.reding@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Wed, Feb 26, 2025 at 12:56:10PM +0200, Svyatoslav Ryhel wrote:
> > > Add nodes for devices on the HOST1X bus: VI, EPP, ISP, MSENC and TSEC.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  arch/arm/boot/dts/nvidia/tegra114.dtsi | 65 ++++++++++++++++++++++++=
++
> > >  1 file changed, 65 insertions(+)
> >
> > It looks like we're missing device tree bindings for ISP, MSENC and
> > TSEC. I didn't see those posted anywhere. Can you add them?
> >
>=20
> You mean schema? Yes, sure, will do.

Yes, the schema.

Thanks,
Thierry

--tdyjgwr7zcc5f2c6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmfJ4YYACgkQ3SOs138+
s6FzZA//blQ+mDiXjgjsioqE91Tuhuhn8mG8bmEDLmyTVQz6221MNGVVSRfpE5gR
e7F4HlWVTGkL5ULoWqotG3NX/3mfP3V8xMCpK2AvArBkfo8WHeyXsp5rWwAqHtJU
UBsSf+ZIsjJ1V0kVzQTd7a1QVKP2sr8OJNjWUCTxrn+MedA9ur3eqy30QeHKDFiu
TVNVTgS+4O/iqXp4h8ago9Abmc8VTD8XkEEA7AqZTwMW1xmDAhC0uY1dZRS0sGcD
px0yUn0oKg+2K7MYC539AwOySNgO0vP6cOo+hn746aR3fRnxcz80zzYJmj6T0D7P
4mCUZtsD6cR69HEa86LAgtTh4fElvCpKugzG0DcuHqzWp9mY+mnLTJ5yJ/0qVEK/
3Rseip++RCk5vSdiGYCiQ2h3VpSz0NfhNC2V53Ccf2QKCh5bxIp3A0a7j4opwXY4
QvWWNOhECO9yrZsHyKgduUk60QTjmQ/RtAR3knudGo2kQTwCvjvtDmCpT7FWaHM0
ekqvWVnAVPudmaqSS+DlSPQEYKBvzEljCi6swU1z9Omj5IpzfCiYcKhuqEx9GzwW
ZmP4HpEQ/HJa7mj+Er5ftmzXQCDINiUe3XKwa5tuakk/R1tOvjdwPUBxxs7yHfuu
r6eflAnnE9UhnWE1OGw+rhtIZRT0CmtE+8LhQoV/0qwNio4z+vg=
=s5HH
-----END PGP SIGNATURE-----

--tdyjgwr7zcc5f2c6--
