Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474612D29DC;
	Tue, 29 Apr 2025 14:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745936610; cv=none; b=q2ZxgH9QPAtIgoxAcxAdHyYrbyeYusLgktKUG6nYtKQrxugjm0FHYA3mpoBMDWeHHXnbPsJl9t/b0GKfiRjB6rxmZnWO3mWf2hHJ+3lze6Mye4apXVl9BnLXkjNtJHuFQLIrPjhtJ15kWjMkHhQHQnuGg+Ix6ObbclUwW4+/F48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745936610; c=relaxed/simple;
	bh=nU9XKYiNGeuo3s/l5Z8xZBtFKmwbNfC25YmdIjW55M4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VSxFq0rLqgMKklnEzzFk0kAaQeuz2LkWVFJusAxw0KP39Fware4Zy8FY6mM/2cIm9dkgwzusci898o+FMScr/B9t9RJB1g8ZnXVGwO7LNttw3tad1hPh+pnnWco8FM1cII/Bd2vi+vOVk5O5fNICmoMS9Eme9WpjwCgvG2ayro0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eTeaBTGN; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eTeaBTGN"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso68998745e9.3;
        Tue, 29 Apr 2025 07:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745936606; x=1746541406; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nU9XKYiNGeuo3s/l5Z8xZBtFKmwbNfC25YmdIjW55M4=;
        b=eTeaBTGN24u4DYIM68OdY3kyyOCnq+JbW/tSIrERnYIJ+RvvTrbjdrInsc6taOCS6k
         upa2uU5JfJecwEXhet+9QXl2kHNyhAQlr8fHgXpELZS8Fe87mQCWEyBiUkhJcZrSRBTj
         24mjT1+C2yxCb0KqX9ylRUO9cWNWXq24/l5BsqNeX3Je/hzAecF4LW2wbFoHXteGn4Fu
         OrYclmFQVqx2Tnva78NvqPKClfCaFXoynKqLehNiCrvVVzy/hNTxTa4582D+lK45ifgz
         YpdaJnkMI97i9GZxMfDqpZdPF2wr8GBAYuuulhOy9JJtXMlHycVbhy04QbqbahQ7lg7Y
         2KqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745936606; x=1746541406;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nU9XKYiNGeuo3s/l5Z8xZBtFKmwbNfC25YmdIjW55M4=;
        b=u6ocvtXvOPVC+RIvAGJwBSTA0CDWdn4HZ8/6ozPEGbEh5RjOrjrrvNEUuMqACdZzLc
         7vrDjT4wL4Sz7tmsKi4Yks6bDncxW0XJyH/xIktogcU9mXBJ8Z7hcJx6TdgHImiDm4ts
         w0IuxWfEW2t3OWOz5ZiBKLbMk5YeqtfoJHy6S95o6tzineMuGo0wnXqysTOL25xVlFOp
         V8SEy0uXh7Rhh8RSUrrpY7AkjLo8OH7Q0zTKG1dZ32m5BfqNMQ6c/43tl66DAGgXY9CF
         wY+LLi3V7CfNQ9WySVoSslh7fcnm1z1t0o1SF5sbXQ9lVn1Y8ZzUEo0XO9Vo4vIFaZ0y
         FIHw==
X-Forwarded-Encrypted: i=1; AJvYcCUXav4ry/kxqVFDJuyrEvkdKEHyld6L2HLap6MnLlIGWhuMqIj77JXxPR1/iNOn/F7vkyZUUpRLfUXv5y4=@vger.kernel.org, AJvYcCVVg1L9OgAqJjAF7n8364cXubbaSRaj75hzaH69E/Jcs1017GHh7WeU8xN3uzSXnwxiMbadThtARJcilpw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRpWEJy7js44tZIC6riO1uvljR3Mu1GzpQp8n6qztHVffhdY7a
	POmDwYhzqLKlhkAkJOjp+uFtsKvMtb29o4wR5CdPTPr5aRfcm8p/
X-Gm-Gg: ASbGncsJXuUh/nCugzb7qGo3FyjEZWxaerK83Be0vJLWNf6Ei4XNcIsT5xtB9BSNe6P
	owMrI6thesHiplWGUoo5+ut0J07VCTi0uRJ5j5/hfn8utG0RhikH+J/nPVUQf1xej9P60oDGP8G
	uRarPVaFjPPIGD4AK3ft1fGsq1CjtO9PuRFZSpRLwpLLWnMpEl4QVT3m/tIYOvRVdY1JcehEHYY
	OK4W30Hb2BsSwvnTKylcmrqDqOhaSCjXaDtkQA9i/C5+ouLEsWx5YCH4rzNe+Hgs/Ls73Rp1IOy
	zU53MHBmgXOOgX5fQmSugLiqpUZGPE157Wzv7XtDdR9olJ3e6bsLkZO5oFBaAwMCMyNESfSJGzB
	vOb8eEjVATMrIUBB091lkVGYhFKw=
X-Google-Smtp-Source: AGHT+IFbYMRKhMh0IkwwfRrVxeISBEaoYAkZcctN1ia6oAGRJHTmPfZ1tuhKxiqAp+zSK5GTPOcgeg==
X-Received: by 2002:adf:e992:0:b0:3a0:831d:267c with SMTP id ffacd0b85a97d-3a0891b174bmr2519524f8f.18.1745936606219;
        Tue, 29 Apr 2025 07:23:26 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b0232267sm3752385e9.39.2025.04.29.07.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 07:23:24 -0700 (PDT)
Date: Tue, 29 Apr 2025 16:23:22 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, Robert Lin <robelin@nvidia.com>, 
	tglx@linutronix.de, pohsuns@nvidia.com, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, sumitg@nvidia.com
Subject: Re: [PATCH v5 1/3] clocksource/drivers/timer-tegra186: add
 WDIOC_GETTIMELEFT support
Message-ID: <4ks74upuufmt2ibh5ur5zpazvfj66ak4gyq7v4rtz2zi2u5wsi@rls64ws3rukp>
References: <20250421100821.2907217-1-robelin@nvidia.com>
 <20250421100821.2907217-2-robelin@nvidia.com>
 <aBCU5vec0XMX5VRz@mai.linaro.org>
 <fbb3a1b3-3949-402a-b51c-f5446a392e83@nvidia.com>
 <0fc89d71-6510-4ca9-a789-290e1818798c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="we7lvdduikiwor5b"
Content-Disposition: inline
In-Reply-To: <0fc89d71-6510-4ca9-a789-290e1818798c@linaro.org>


--we7lvdduikiwor5b
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 1/3] clocksource/drivers/timer-tegra186: add
 WDIOC_GETTIMELEFT support
MIME-Version: 1.0

On Tue, Apr 29, 2025 at 03:19:25PM +0200, Daniel Lezcano wrote:
> On 29/04/2025 11:15, Jon Hunter wrote:
> > Hi Daniel,
> >=20
> > On 29/04/2025 09:59, Daniel Lezcano wrote:
> > > On Mon, Apr 21, 2025 at 06:08:19PM +0800, Robert Lin wrote:
> > > > From: Pohsun Su <pohsuns@nvidia.com>
> > > >=20
> > > > This change adds support for WDIOC_GETTIMELEFT so userspace
> > > > programs can get the number of seconds before system reset by
> > > > the watchdog timer via ioctl.
> > > >=20
> > > > Signed-off-by: Pohsun Su <pohsuns@nvidia.com>
> > > > Signed-off-by: Robert Lin <robelin@nvidia.com>
> > > > ---
> > >=20
> > > Hi Robert,
> > >=20
> > > I realize that this driver should be split in two and the watchdog
> > > part go
> > > under drivers/watchdog.
> >=20
> > Are there any other examples you know of where the timer is split in
> > this way? It is not clear to me how you propose we do this?
>=20
> Just keep the clocksource and move the watchdog code (everything related =
to
> the watchdog_ops) to a new driver under drivers/watchdog

That's a bad idea. This is all a single register space, so we can't have
"proper" drivers (i.e. ones that exclusively request I/O memory regions)
if we split them up.

I understand that it's nice and easy to have things split up along
subsystem boundaries, but sometimes hardware designs just aren't that
cleanly separated.

> BTW, there are three clocksources with the same rating, what is the point=
 of
> having them supported ?
>=20
> Is it not the architected clocksource enough ?

The TSC clock source that this driver exposes is different from the
architected timer. It's a SoC-wide clock that is routed to various IP
blocks and used for timestamping events. This clocksource allows these
events to be properly compared, etc.

Thierry

--we7lvdduikiwor5b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgQ4NcACgkQ3SOs138+
s6GkBA//VVB7+gR+Wj7fb9j5POgNtYxcMSsq7Y19VQ0s2gNo3NaT3GB8tZ9r40QU
XuO7Jx44Tneja8SFODlFCMOWGVlOQ6g+dAwAvCWTmOGqyhnHPpwFwa9k6Q4+hetB
VCU9AQRw/alHH5/RT79HjWcvzZ7lHRjYINPQyUlVzjrTaZmxXIiSw3T7zZPeXBYa
8lOc6jMRbxTBQ2JQPdDXP0JF07MqRaNzF/3zLVtcm7aoom/EUqJ+oz+pAjAneLA3
Da3+gqBMwzMeNUW0kQkdYnycXGox0YkjdDgp03cvqfrQ73K6Wo5ukEpKUUioP/s0
F8aci+qxfLNlPLnCcZjWI9Qcjp2J75J8gj2YHakEvOt4MEyHfe+Sq70Jf681seic
8PhsLb1QkbcwkePyvsSlE5CGbW3alHkCBdYYnqDaQSAwCBHO5DiyDacuJJWace1b
4GrNfLJs5MGlXAyMc73WNIhPhOtHaU+kKojtYtpBNY3Kvpy/ys955IC4W5PKNqD3
YTgRuPMU9RM0d3Iu8/HTkbV9psAE4RUjKHRi6qgTSEpC1P+ktTmnf+cDNFXUEkgj
EkQgsfnHKvPBym29X8RTdv/dRnOgaVSjFuonKw//YK5H25UYGYvBWzbDO0uC7osW
H9JUaqaHgQ7Ht3mHY9JRsmy8JVG6VM6htb/AlxyqVxvC5osEP2A=
=ZnLj
-----END PGP SIGNATURE-----

--we7lvdduikiwor5b--
