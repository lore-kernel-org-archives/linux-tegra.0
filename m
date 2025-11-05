Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1453321B4
	for <linux-tegra@vger.kernel.org>; Wed,  5 Nov 2025 19:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762372191; cv=none; b=iGso11po6vtNi1merKDhJ0X5M52HQgcXmt3twP4soZTCbARPy24z2aZRvDBc7rfWQPjxPmiAZsXq6AvtW3HwvLhSu3IwQyfFzBvbk1zuJ9eFmmJB9A8H1sslPlkbgk3uC2djRvgco8/cpuKp8NqpSf2t4sUSdCBR8+PZqLBVdeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762372191; c=relaxed/simple;
	bh=Qn3ey+tGjMWZVlyisbgTj7dDw5cJIWX584klbJqpra4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G8NeKQckuDC+UvLj9y0zWGcjadWtfqRrLF/PDbrvbCQ3ln4YnRFPh0Mwixux3AytfLKwflli8KKfn4Gw9z84+0iOPO/OYNM0WmJu4UZqmMbFb6OZm6q9la/ikLshxJksJcZfBlskMr3CmtYm80Qn8vCxLYcuK/1dFHZeU4Lt5UI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XiJxh+nS; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XiJxh+nS"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477632d45c9so166885e9.2
        for <linux-tegra@vger.kernel.org>; Wed, 05 Nov 2025 11:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762372188; x=1762976988; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MvyrGUvJyh5x1Y73UqVq7sR5SMe0YxpMsmxupXaTnGc=;
        b=XiJxh+nSqu8d1jhHi1XHlS9SFg1615KDsML8SPKMP+I7CJo+bIFPuLLF5fR/bHWeOF
         qrLaRG1CfGqdUqiNGwGyyFh9X6NdrFsuDjmtq20apF7HvEob8zpLKB7dO0+wG9mRaNUl
         9kfUzJQL4it/zRZ3GWH7X0TSI7m2ZtHHZZR0KqL4YE5VJ9yBIvg1wnwWx00Xn9dmPwWk
         CY1w5LFXxegycUBwky/v0kALz+VK5VLFlT3J0j01jNHdYH0Jh7oRjKr2Yy6Z+TO7bMOy
         /ujr9YURgsrxSkEuqedfYHwzH3BjFeHcpdGcGqpyXG8iutwB8kMp8n3I/uoDtkbLF/Uw
         raHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762372188; x=1762976988;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MvyrGUvJyh5x1Y73UqVq7sR5SMe0YxpMsmxupXaTnGc=;
        b=oiWrRNVjoCf+YlSwjBzntlKOlopvwtbBxDkX9IVDdotzN7u/qV3qq1JqBMrQZUfU6H
         mTdRxHhIPDWeH7wRNQLGqj+TSygh0wtFfw6hxO1alCkpUYBoLrdqNG1MT9dFYDA8iDoa
         3ocAFC5SKIRHLGXS+lj5EtHKk4xpfc6IszVMJ7chpgEM0oqZmcKrLiwx2WmvVpuGlddC
         mnKjQIgAKyH+bMOvHU2dBfoc3cWADH1Dt4y21RMwZZfcCgNM/Skv9dvu9PKpQawtmcHX
         p/kaB2PTqnZ5t8U+sbU49Ygdfu+FohR3sAkCgZBw+/ZPz93obvWmnMmOhQB0OCGRcb9e
         LZIw==
X-Forwarded-Encrypted: i=1; AJvYcCWBU19LKznVpc/zioel7xoLuah2cpSl70Fxj9xaqNM5H0OHJIsFLVdyT0/Risu3DPd/zzzK2/yCz0Qo9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvN/mXFpZFEM/6fX3nAsQhaJS0Y6Jf/8MXTaDy7IQs+GO2yTLR
	7r2J6ok+6P7NPi/lPN5CFNgKHi23P5BvdQ3kvG5jeP4Zvl8QboV5nbqD
X-Gm-Gg: ASbGncvKodaRaFxhLePKyWJrjJjlHoK+mZP9iLWdP7zrBHZMloSxezRri+W1DP8WWjq
	UX1bs+utnlx+gWHZbQt1hZZfSa8q3CIG3nrDlDlMBUOwgFnisPalz997IKGoyYaDTj0ZZVwOSLn
	NLBmXI4ceqZ1uGdF6kFhAXmupBZfewsp6bpNt0K/v5yBsYL9dYs51mKcXX2ZGSdB8yUsBg8zgdS
	RyIz0jQQKVOuqmXF0eFabGt5hO8X8PFI/ni03GuuRPRMfBrarB+AVYu91/IXs3URqsQSfqfT3Ln
	NOXN7MeP4gaUzHGw7LNg0dLcG9sxB4ytlTxoKNMNWreu8Fi6TkI9cqh97bJy7lAFkbq2H6mMp+R
	yIAx+v3PMdmyhmwlUWmzWs0ZsO3xBvXFrBy4vnZrAUxDHmcFt+f//IufC6JA53dkboofMHbGvLa
	IbUjP7F1/kRgw3TRhXO+BxumWn9j/ZKwv+8rm284sydDkUhzS4INvwpERW36Lqw60=
X-Google-Smtp-Source: AGHT+IE/wSOJh964hsRl51P6BCrH1urX7lyRtls65YxyHli+/HhkrEEnHnqcio2fY8WWADS8haI6QQ==
X-Received: by 2002:a05:600c:46ce:b0:475:dbb5:23a2 with SMTP id 5b1f17b1804b1-4775cdc8e4fmr34171475e9.16.1762372187615;
        Wed, 05 Nov 2025 11:49:47 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558dd04bsm52402155e9.1.2025.11.05.11.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 11:49:46 -0800 (PST)
Date: Wed, 5 Nov 2025 20:49:44 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Jon Hunter <jonathanh@nvidia.com>, 
	devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: memory: tegra: Document DBB clock for
 Tegra264
Message-ID: <i37vfuritqx5vs2wds4euomyt27dkcmzvvosphxd633aq7sis4@bsjn5yv4pq45>
References: <20251105160513.2638408-1-thierry.reding@gmail.com>
 <20251105160513.2638408-2-thierry.reding@gmail.com>
 <176236389129.1455984.6215917313928055462.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ich3dhap6fs3b6m2"
Content-Disposition: inline
In-Reply-To: <176236389129.1455984.6215917313928055462.robh@kernel.org>


--ich3dhap6fs3b6m2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/3] dt-bindings: memory: tegra: Document DBB clock for
 Tegra264
MIME-Version: 1.0

On Wed, Nov 05, 2025 at 11:31:31AM -0600, Rob Herring (Arm) wrote:
>=20
> On Wed, 05 Nov 2025 17:05:11 +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Accesses to external memory are routed through the data backbone (DBB)
> > on Tegra264. A separate clock feeds this path and needs to be enabled
> > whenever an IP block makes an access to external memory. The external
> > memory controller driver is the best place to control this clock since
> > it knows how many devices are actively accessing memory.
> >=20
> > Document the presence of this clock on Tegra264 only.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  .../memory-controllers/nvidia,tegra186-mc.yaml        | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >=20
>=20
> My bot found errors running 'make dt_binding_check' on your patch:
>=20
> yamllint warnings/errors:
>=20
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/m=
emory-controllers/nvidia,tegra186-mc.example.dtb: memory-controller@2c00000=
 (nvidia,tegra186-mc): external-memory-controller@2c60000:clock-names: ['em=
c'] is too short
> 	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia=
,tegra186-mc.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/m=
emory-controllers/nvidia,tegra186-mc.example.dtb: memory-controller@2c00000=
 (nvidia,tegra186-mc): external-memory-controller@2c60000:clocks: [[4294967=
295, 58]] is too short
> 	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia=
,tegra186-mc.yaml

Ugh... looks like I used the wrong hash in the format-patch command and
didn't notice that I sent out an old version of the patch that's missing
the minItems for clocks and clock-names.

I'll send out the correct version, sorry for the noise.

Thierry

--ich3dhap6fs3b6m2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkLqlgACgkQ3SOs138+
s6FvhA/+JjAdSF6J+xyphE5ibJBXmjrqp9zOBE52ZjEg0CRywTgZ4ojsS+lDxq8/
QdJOmxNbHxwJWrmhZSEm5oaJ169TirEx4XY/vRlOpZdOaWZTBLUwVjx02nDP6o00
z7jQ3oPx06i0la68sxrFY7xE88QefW5ukuEcOpEWrs5jcsJCP/HuV4zhAXHPCZQ5
BBVqX/d6S8ugVwR0EGzuEMEM8PAUEn9zu8wJpvLlAbwHMZ/sOMwh32Sv279qokm0
FRgMSIPgZIy8qTt0veYagCS51x39AJRybyqlFvkd0beImhKpqPcuPyDGNNDJFZP2
Tf7rS0vXSMmUnDCTixpQJBRZ05gKvY8gn3mYH/pkdDJ3Wml7swKXyrq4g97klfwW
x3s3M8A89NyUFtrq2biWTuM52m9Mm5qk2CB6JLd6NVZdEW1gWVKJFZhei1FWhqK0
Nl/bXKP0INNofg3LSlezhLu38zDGvOYDy7q/OOhuRKwPky2MbcfHasfSgDTbIUgq
lZABtmf5MycsJD252WViFaqydCTRmyQFMsQKuCWRIjvezfiN41xLy4Z6WxD80kqo
+jUM7OQdHQpz2PSh5vcr3R8Fa5Bddqmpz2gYgbhWct0IzlOP3DU9QtYbfVmp7AMv
DgrkrpprCHMrBh4aq9/murXAgoeWN7PW34YuIXTgcaH1Qj03ZYc=
=vmRC
-----END PGP SIGNATURE-----

--ich3dhap6fs3b6m2--
