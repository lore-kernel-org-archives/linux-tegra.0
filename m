Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FB4275AF8;
	Tue, 26 Aug 2025 15:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756222199; cv=none; b=AgehIOYxZtjAedSHLyyTAVrAvwVZGSAjGaQm6K+q68TB+VzQk7PoSezQx719i9nBEMbTdfDoQ4k6oief2rsvJ0frJSW03mXrNz54EllaJCf2/bvaz8OxFnqA+TIMgrYUy8fNrTQSUpdWBHR2rggsZ28+ammtM1NRzE5fr5mAq4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756222199; c=relaxed/simple;
	bh=cdZAbBYNcAIBqjuHfaxsx0jOau8nyLs0VgU9qmU9ovE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fqaDE6n8tTgiFelG7x+y9PQKXedsoDHEkepI0dFGLu6dGMjWYtTybkEoRz241/0WyO8zuBFOZ9qrftOF8ugoTet49sEmOZt6F/u5NvYkUFHkgrmhXVdduMOYcmZuZamBW98eNI77B/ll3Qvr/k88lqt8WJdZli+ydbLgWp/PYuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bMiQZtOn; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bMiQZtOn"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3c4e9efb88aso3153050f8f.2;
        Tue, 26 Aug 2025 08:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756222196; x=1756826996; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cdZAbBYNcAIBqjuHfaxsx0jOau8nyLs0VgU9qmU9ovE=;
        b=bMiQZtOnDGffaNae2zoM02lXJm0lVT4uYwGoX2p4y4rQEhhr0aRbNj8wkFOKGOuIw2
         r+ePcHXZoiuRZhNVa1EqbHeLjOmgpS3cOwnqYR2W15KLNsJDYHiJUmc3i92OGeF5gOj2
         PxsKEIiUEtXewMCG+OI2AOjP7MYBn+5gw1NcTlbcIrovRdQ/KBCZIlqTcWVCy4gq3I+E
         1eqRNdfsorEhvTdgtiNgEegNOdAZwf8byLwKRoHnpO90joYqcwG85/AOEWm6k3o4pYr/
         9SlFBr0CEWiNa/+0tnTg7HT+lslyDC0uER6cGua7DEJpsitiT819JTGSr9Xo/E9FV4i+
         +BDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756222196; x=1756826996;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cdZAbBYNcAIBqjuHfaxsx0jOau8nyLs0VgU9qmU9ovE=;
        b=GgRfSRJc0/DwJEXupylUvESDlbopRbeUILqxB5gm2i+PUrqEn9qPc3WEczuZSRpTUV
         4LiBQAOzzX9hEhz86ALX1J00UFnoBliOZ9XrO96ybL2SvHUdVXjOvBxET5jNDyZyjGup
         IdzPc4SMrh4Dgp5rDVxQtDm0tpRrC83LyNioVEjSX90JFfp679rIaJ3eHnMLtg50KdR6
         u8ikovoiFEoLGZAPoPVmz2kXf9NEPml9RMo6VEZ0T74ubHJC4q1jpQjUYAZTYQ7Tw31i
         0TOiJZyEAyx7A4O3XsKAhOR/r03cD9+HjjYSjQTk+9Mr0nsKm3Ut97X1WXl2g/+kkQhs
         3ZSw==
X-Forwarded-Encrypted: i=1; AJvYcCU7pTxqWOyQ9yeuPceH2X++nTUxq2TCFWT4bGmk6VsOE7p5eMtpRuObypgO4Aq48tmOvdHh5FmNH75Hmmg=@vger.kernel.org, AJvYcCWRNkCPd5zWEN0KvMBWH4LPGdU84bM40TfZWrNHBVCZPzsGTI6v8vmBds1vji9w5n4k/czA5JjTgq8e6cI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxCc+BX0PZR1P7gB4exQfwrvutqLS2kPmLE9gOC9BujQQXH4WN
	6K4S4cMsrjDg5C5vUrCRUpmgtMrXeflEecQn573rHfcserLx1qyWxV6y
X-Gm-Gg: ASbGncvHlwl/vyL8biOoWsDLALarcwZpI/3hNir0qYPSux0Ksmic6gHlsXUws9k9ZCG
	6fUI+w42c46RgPlsXd8wqK38998h03cXqUcqsCgqZE0cjKGyVAGPoiCmwWk8LihVDLs0zMwkDRL
	O4v/8+JWVdtOH3qajDLFA4KKtxxLQl1mdMFlQ/TbgCVI8us4C4jGSp0x4j/tmPYRAcNZTRv+V/5
	wyQ7TI/L6Dv21lNHbh9qNN8HQwk2sAKbfp3rtmhvvyNxPDlRUb/QiMo6ktCb75Y6x++5qgiLmLz
	RWXtU+Wxjg/hIB5WB+c8/vn2OfmC7/21mbTPqr/L25K1Faji/ROqEs8Cvpr2PxdnEDy5410SJm0
	L9ZFEKwY+ao4JdlFUqCNC5WHvqeT8uvsiIT3GVHmNoM9WJ9+v6NNnP4VB1xHBp83H0QtiqRbq01
	N22yqd4ZkO5SxQ0pS5fzo=
X-Google-Smtp-Source: AGHT+IGLXIM9W2WuBw5JktkgzEZ7AUbO0CB7mmCye6JDHjueGoccX5wbLqZC2YfqOof691xXdtIc9w==
X-Received: by 2002:a5d:5f50:0:b0:3c8:6200:3385 with SMTP id ffacd0b85a97d-3c8620034d2mr7067869f8f.29.1756222195340;
        Tue, 26 Aug 2025 08:29:55 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c70e4b9e2asm18172838f8f.6.2025.08.26.08.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 08:29:53 -0700 (PDT)
Date: Tue, 26 Aug 2025 17:29:51 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc/tegra: pmc: Ensure power-domains are in a known state
Message-ID: <sgsi4wia74nbvme4ik27waec2yuipbw7hfh7jyygxlbfhvsc5q@4onfx46nle56>
References: <20250731121832.213671-1-jonathanh@nvidia.com>
 <CAPDyKFr+uVDYBMvsN+L9XPToaD+Wr9P=SnnXyKB6ucqQ7se=7A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6z37v2e7krj5payp"
Content-Disposition: inline
In-Reply-To: <CAPDyKFr+uVDYBMvsN+L9XPToaD+Wr9P=SnnXyKB6ucqQ7se=7A@mail.gmail.com>


--6z37v2e7krj5payp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] soc/tegra: pmc: Ensure power-domains are in a known state
MIME-Version: 1.0

On Mon, Aug 11, 2025 at 12:37:25PM +0200, Ulf Hansson wrote:
> On Thu, 31 Jul 2025 at 14:18, Jon Hunter <jonathanh@nvidia.com> wrote:
> >
> > After commit 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds on
> > until late_initcall_sync") was applied, the Tegra210 Jetson TX1 board
> > failed to boot. Looking into this issue, before this commit was applied,
> > if any of the Tegra power-domains were in 'on' state when the kernel
> > booted, they were being turned off by the genpd core before any driver
> > had chance to request them. This was purely by luck and a consequence of
> > the power-domains being turned off earlier during boot. After this
> > commit was applied, any power-domains in the 'on' state are kept on for
> > longer during boot and therefore, may never transitioned to the off
> > state before they are requested/used. The hang on the Tegra210 Jetson
> > TX1 is caused because devices in some power-domains are accessed without
> > the power-domain being turned off and on, indicating that the
> > power-domain is not in a completely on state.
> >
> > From reviewing the Tegra PMC driver code, if a power-domain is in the
> > 'on' state there is no guarantee that all the necessary clocks
> > associated with the power-domain are on and even if they are they would
> > not have been requested via the clock framework and so could be turned
> > off later. Some power-domains also have a 'clamping' register that needs
> > to be configured as well. In short, if a power-domain is already 'on' it
> > is difficult to know if it has been configured correctly. Given that the
> > power-domains happened to be switched off during boot previously, to
> > ensure that they are in a good known state on boot, fix this by
> > switching off any power-domains that are on initially when registering
> > the power-domains with the genpd framework.
> >
> > Note that commit 05cfb988a4d0 ("soc/tegra: pmc: Initialise resets
> > associated with a power partition") updated the
> > tegra_powergate_of_get_resets() function to pass the 'off' to ensure
> > that the resets for the power-domain are in the correct state on boot.
> > However, now that we may power off a domain on boot, if it is on, it is
> > better to move this logic into the tegra_powergate_add() function so
> > that there is a single place where we are handling the initial state of
> > the power-domain.
> >
> > Fixes: a38045121bf4 ("soc/tegra: pmc: Add generic PM domain support")
> > Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>=20
> Thanks for looking into this!
>=20
> I have picked this up via my pmdomain tree and applied it as a fix
> with a stable tag. Please let me know if you prefer to take this via
> your soc tree instead.
>=20
> That said, I guess we have some use-cases on Tegra where it actually
> would make sense to allow powered-on PM-domains to stay on during
> boot. Although, at this point, it seems better to deal with those on a
> case by case basis, as improvements on top.

We're actually running into one of these cases right now. This happens
for display hardware where we have simple-framebuffer device tree nodes
that are meant to allow a seamless transition from the firmware's early
framebuffer to the Linux framebuffer. But since Jon's patch disables all
of the power domains, the seamless transition no longer works.

I suppose we could argue that seamless display is less important than
systems booting, so I'm inclined to say we want to keep this patch to
fix the earlier regression and then apply a fix on top to address the
issue with the early display.

Do you have any thoughts on how to deal with specific power domains that
should remain powered on during boot? Ideally it would be something
standard, but worst case we can also special-case in the Tegra PMC
driver.

Thierry

--6z37v2e7krj5payp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmit0u8ACgkQ3SOs138+
s6FFixAAqJoloa2yc6CVKOEehp+GcldydxFiQL1s28pKd6Gus3xbRu+uJYxzWsc/
HpZevLIrRExLv8cB3vdHP0Iw+fOiuy9Aecop2NJyfmGCtmdkE+TOWIIEeX872V/g
iY6RRV00xLgTHL9Gdrx83Rv+nUKwm5M/fw6Zga2Cq8xpE//fkfE0cPBnWrwAYqMa
TjchEyim7frnm1+ju210QC8B3uNVqpG5sPpDmYMRYO4e8jFzJjbfKf9ovU8rVU9M
hmE/cHaA+bJ7Rz6+A3YxHpoPYvcthpN94AakeLSrqVgVLkHsz+7Po5+9CdEJW3cU
qpk9MYPm1GiQCo4I3bXe/SGjaKVpPjVTEtaZ2+ZIIsZ5KiRXjtjhjbHh58or2TQz
8Vs7hlSFeOvSkGHWeNoAfJZ6c9yZzb/y+NV8L7ESSHcRzu2JqXWMC9gTxcxYv9DG
7eUiXQrRpyKemfIH64qbryUMmhUFYjKnrAfu15BFrWZx6pPiC+SUwf0xXWqE/Ky+
dpRbLymVt4k1EtfCPsBTpUhXnGZPzIjWFKU3WEUxX2qUO65QAMSL5i8jTBvmQqQq
Lu3JtQGFSuSMOassZdb6b9GDmx/g39JEjEKH35SRpMB5uZXfXtdoQRJe0AiBAFZa
kfWlqt19lzQ2HH0G+M/ooMqWOxalDPdI34ijbEpv8JKhD8Sjhik=
=hev8
-----END PGP SIGNATURE-----

--6z37v2e7krj5payp--
