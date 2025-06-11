Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F55613B788;
	Wed, 11 Jun 2025 15:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749656875; cv=none; b=uOM9vg1V5xagtWJMfa6iKSmluUnW0ESJvVMDFsYevCROwItIBrvC1iWpSQ7Ifsoa/qPfM3FELuYe7iSQtS42R1xjqemXAMAWB+mTkyhBwQgfErSoWQzmUZHkrfOKoqGnzkGgU/N70qA2Fg+k2CCaJsSEUxoLP7xuRyNcr/PUvKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749656875; c=relaxed/simple;
	bh=VHwgOCJw6brukfd5mySsXJGFq+O7pc5kZ3ppV+5w+as=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QH2Mvd2zG0zYGKAT0HMA2SH/AGcWhv7A/BseQZu4+abAu0amFOmeqJyoVsCg0dU9s+Rp08OebkGkfvI1shuCZmJXwkRQzWW6EYr9kyIayQcthIdF1nUdQGe4J/vXQTm+yW4qTq6tAMuukyV1dU7LoCJH6bnfT6n+Kqg+s3YHLYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LsxUoNrV; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LsxUoNrV"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-441ab63a415so71631205e9.3;
        Wed, 11 Jun 2025 08:47:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749656872; x=1750261672; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tepMLiRIKYdeU21aisSe1zHfoI9euizEl8L1Slp+2T4=;
        b=LsxUoNrVUmzud4rlBIe87lrGEMWzDICMQN+iwgvOcsPEAykyMXC3sESfcY5kAD/0l3
         YxPPqJnJ7lBB/ePdkneEgBvfoTyz9dQNmuhu+Ed7lbREd6WpQ9vIt+b6Yk9OQtJs2Bm1
         6VT2v8BJIpcKvNDSG5ZueqVXc+O35auFMG2m9qvbau3Kg7tiCDuM+2MjDkerL+yYrtbf
         Kx4ACsnaIXufW6iFiBU4zVgI/fg96IH7a4GF7ABnUETLlX9vNj5VdpkGz6/NVCXbm9Rm
         M1p1HhBO2kS46EPRDPItcxmcNginNZblAvYekC9pAV1LTjmq4k5LP8FR0X189K0fSa+L
         3nZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749656872; x=1750261672;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tepMLiRIKYdeU21aisSe1zHfoI9euizEl8L1Slp+2T4=;
        b=fOAJexrenMLq8E9kizVfZfG3pHQRXcbC3HYPuy9UwDwksM7ytCikGQt4ocyYLLajQ2
         /tCGmjSZeD+fY05aGT2oTiYEd5yx5y9BTgxUime1EHZ3IyRSMaRvgZ3qU6tMq3xMo8Mv
         5ltgCoxioMQM0lJ5XWer333BJeRwxwedDgp81ZYSitVX/mRQM6D8HO83lzEanWZkCmb1
         AvPCITo2Yhm7UIKutuMAzGmYrYoQIH6H/Tp3zWb+r7F5MaR1cSz6YMUHHmrzJyHo2lq0
         NeDMLw8HabhSsMQc/gp40rRTKyd/Q8LfejoRSLTInZ7SrIu0J7c0GAU0Q1oTFzRyHiHo
         5m1g==
X-Forwarded-Encrypted: i=1; AJvYcCUcOy1XHs8D91b2L1wAteZWYw6tscGjuRMkIgiD/5GE9+FCJ5LvZ6Z1s7m0gE7lnrlXh02rRW7NRgVDgrE=@vger.kernel.org, AJvYcCV7lIkXSOMBBfF9ySEqKE8YuD1hjyISHq6mX6w/nbEjNqM7tRZfnHa9bU63C9yHgTkI9YmF7gp0yec1ak8q@vger.kernel.org, AJvYcCWKWfZR514BeNhHYPzoWxhM3y5WzZoGvWGRXtEduEX2od8gma7DI+um/DJbuxq7dyVM1O6FUrddiA92@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4YxiaLT+0IQycAAAa1QVFtEaPjhrHid+RgQuIvFvkMG6A998f
	01EeuI7zfF9fJAdFMFZUtVLthVdP2xVg+T9r+3VXoa9ahLqQMg9EvFZA
X-Gm-Gg: ASbGncvCJJkTWZqo2aAn8tK8kB4kuRtys9qPcfS42cN0V1chJk6saI4HrmX6Z2k8VbJ
	FJ2cRXdZJ5oF1oCIWJb9oqwKJ9PhNgNX67VvbvCtnU8Ws8ddUH3qk4VI/O0tN/baIa2Ic0TblwJ
	TOwMbWd6IhhcWicGhyNZFGBSgKZX5/zFFnJH4QbNmlJKXPJCgZGzBXJhluOETQ3bVYaxAPvPPIo
	23aukLQBOvivKr0N1XZglnwVI3wAQ9LWZBp/IekYf4DLv8/8yUwpLgEsGaJrQdMHD7qauGSk4UJ
	pDfD7yUYltjFlmf6I5uM2X6pPvu7+P8fP1p0yIgEkYk9ATs0ZbXxOeEzNrtcJhJd5kDiTYKcOve
	efxFiwqLJ1X8Zck6MlnM8Qgss11NDeUq1GWIfCrbgIwqeIjQC
X-Google-Smtp-Source: AGHT+IGbynWXzKwXrMnPARnYoL8bf/EjXkekYTtvshdZtqHmzwDvrxvGVk6wsFnqojD+VstE9NxIkw==
X-Received: by 2002:a05:600c:1d0c:b0:441:b00d:e9d1 with SMTP id 5b1f17b1804b1-4532486c39fmr32655985e9.2.1749656871351;
        Wed, 11 Jun 2025 08:47:51 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5324360e3sm15921790f8f.62.2025.06.11.08.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 08:47:50 -0700 (PDT)
Date: Wed, 11 Jun 2025 17:47:48 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 0/2] arm64: tegra: Add NVIDIA Jetson Nano 2GB
 Developer Kit support
Message-ID: <w2xzqdyg4pcblpwhk2kspekcngkfuzahqgm4xsw6ofsqgri2nk@a6377d5aiq4l>
References: <20250608-p3452-v1-0-4c2c1d7e4310@gmail.com>
 <CALHNRZ_Zo6w2KgRTEPcJuZi93bOqQD4Spzr4+YfqnxJZVnUPsw@mail.gmail.com>
 <tx7zodgijgip7jhaxookffpa6g6wdnbbl75mz46aff5ch524iv@ky3ltt35amon>
 <CALHNRZ9Opg92SfMWHAJjDBwwnYG1BwW2qhscok=Sm+GacG1W9g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6gbisdch2s5nxvcp"
Content-Disposition: inline
In-Reply-To: <CALHNRZ9Opg92SfMWHAJjDBwwnYG1BwW2qhscok=Sm+GacG1W9g@mail.gmail.com>


--6gbisdch2s5nxvcp
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC 0/2] arm64: tegra: Add NVIDIA Jetson Nano 2GB
 Developer Kit support
MIME-Version: 1.0

On Tue, Jun 10, 2025 at 02:45:53PM -0500, Aaron Kling wrote:
> On Tue, Jun 10, 2025 at 4:15=E2=80=AFAM Thierry Reding <thierry.reding@gm=
ail.com> wrote:
> >
> > On Sun, Jun 08, 2025 at 11:25:53PM -0500, Aaron Kling wrote:
> > > On Sun, Jun 8, 2025 at 11:24=E2=80=AFPM Aaron Kling via B4 Relay
> > > <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> > > >
> > > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > > ---
> > > > Aaron Kling (2):
> > > >       dt-bindings: arm: tegra: Document Jetson Nano Devkits
> > > >       arm64: tegra: Add NVIDIA Jetson Nano 2GB Developer Kit support
> > > >
> > > >  Documentation/devicetree/bindings/arm/tegra.yaml   |  5 +++
> > > >  arch/arm64/boot/dts/nvidia/Makefile                |  2 +
> > > >  arch/arm64/boot/dts/nvidia/tegra210-p3541-0000.dts | 43 ++++++++++=
++++++++++++
> > > >  3 files changed, 50 insertions(+)
> > > > ---
> > > > base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> > > > change-id: 20250513-p3452-059708ca9993
> > > >
> > > > Best regards,
> > > > --
> > > > Aaron Kling <webgeek1234@gmail.com>
> > >
> > > This is sent as an RFC, because it doesn't fully work. In my tests,
> > > this boots and everything I can see works, except for hdmi. The
> > > hotplug detect pin never changes, regardless of hdmi plug state. This
> > > works as expected on the downstream 4.9 kernel. Based on the
> > > downstream kernel dt for p3541, it's almost identical to p3540, and
> > > I've mirrored those differences in this series. Things like the hpd
> > > pin are the same. I'm failing to see why hpd would work on p3450, but
> > > not on p3541, when using the same boot stack. Does anyone know why
> > > this doesn't work?
> >
> > My recollection is that the HPD pin essentially loops back the +5V pin,
> > so that would be my prime suspect. Other than that I suppose it could be
> > a pinmux issue where HPD is muxed as something else.
>=20
> This got me looking at which regulators got removed from the power
> tree in my changes and it looks like the 3v3 usb hub one is the
> operable difference. If I do the following in the new p3541 dts, hpd
> works. This supply is not used downstream in p3541 for usb and is
> instead replaced with a 5v0 regulator tied to gpio pi2. While looking
> into this, I see that I got the usb power tree mapping wrong in v1 and
> am fixing for v2.
>=20
> +       /* This supply is associated with hdmi hotplug and needs to remai=
n on */
> +       regulator-vdd-hub-3v3 {
> +               regulator-always-on;
> +       };
>=20
> This seems like a kludge, though. The implication is that whatever
> gpio pa6 is wired to for p3541 is related to hpd somehow. I'm not sure
> if the rail / wiring is different from p3450. Seems like it would have
> to be. Any thoughts on this, Thierry? Maybe a better way to map the
> dependency?

Let me look at the board schematics: The +5V pin on the HDMI connector
is supplied by VDD_5V0_HDMI_CON, which in turn is the output of a switch
that is supplied aby VDD_5V_IN and controlled using VDD_3V3_HDMI. The
latter is supplied by VDD_3V3_SYS and controlled by MOD_SLEEP*.
VDD_3V3_SYS is supplied by VDD_5V_IN and controlled by SYS_RST*.

Looking at the module schematics, MOD_SLEEP is indeed mapped to GPIO
PA6.

Despite the ominous name, MOD_SLEEP seems to be used exclusively for
HDMI HPD and some LED control, so it sure sounds like that's the right
GPIO to use as enable pin in the HDMI supply. Maybe all you need to do
is use a phandle reference to that HDMI supply in the SOR node's
hdmi-supply property? That should make sure that the regulator gets
enabled when HDMI is in use.

Thierry

--6gbisdch2s5nxvcp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhJpSEACgkQ3SOs138+
s6GO2Q//Uq2zLJjF8CVdBwR0TtHeKHCm4EkaY+IeUZuUEkKZ/2fU0ocy/CdlL5fP
hGHb2tkSZ5S2BCT7XpSqFudixAbMhquiW087yGNeG3lxQaOHB9oWKp/tGbmG2LSC
3iwfCJlUEWk8yqQpV5dPxlSWggpoxSUqtuKAI4TNsgu0yeSmgeK888mc/QYp3s80
O9Hu+Mf/5vce352K3EtiA2wPLXK22A+K6TwqUx9Ii432j/6vAj+e6Fot/j3E1Ck1
ar9jaYyno1eqZTfjjzTiK/rU4IwuUZ12tkpSr+0geuNHbKW542it2ciJp+d/X+bk
Ot36u6iGHcKxdFQuFnL4/YR8cTO4MSPbzhG0Fi0syjgZ24FV+VEV0HIHXRZEmu1L
GWKajuPl5Aj2mfrq227wo3kIjJas0tjNHndueswetFWfvxcXqk9blKP22gx0ODDK
LpYinTgrz5e6sKdvHK48AUkONhXycK0KtqSjHbqFbxl6h0hCDkidX0zmI7+6Dykq
/uud04z0+HUqyQ7607yvgbl/DBD3+GsqbD9iMFWHzP1u/7hwXJTlnacrQUGCu8A8
tcKU2tvVFAfabRDahJHn5IIgoHjRidPUL24DUV9E7XKAdW71KpiW4fEO9I/eiOHi
Fr7sQ8CbwF9JCx6gkwBq0X/bYhNK93v8gcUjsMoFZm3i8X2vqxs=
=wMXn
-----END PGP SIGNATURE-----

--6gbisdch2s5nxvcp--
