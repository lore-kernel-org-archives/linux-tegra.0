Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE4F226D17;
	Tue,  8 Jul 2025 11:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751973733; cv=none; b=JVjnidePYVL63junWNZdDBEV0pdb5wiWiGNYFPAZBmz0eEs7bVo4BttyDAt2nhk1Y/FdQ7RCWumgwybue+KgUx0D/t6/lLu6PpNUX+ixAR2bnapsDuavVQLdoeaFNLDORBd2kRcb06Wnjuos1GEfx1zsXXlQ9dh+PIp8b3flHic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751973733; c=relaxed/simple;
	bh=CBMdc/YECtqc/SPWQHs6SAi81ZqJdFUUX2xLa4dM62s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VnjXQ/Lab6Juc7HRZKEh2aiHpelZJtDKRS4ehA43DN9DNQ2KIHLwMQDIOxV8Wnkwmu9KMk5uqslJq69gd954FGGdOhgoFtMrXvPteK4foh1QbFqyguHOgSnAp2qbugdmjp7EqLbTj2kzyYfPw7hMnnrFOMCNty5oU2/LopCP3EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WzhIUFpH; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WzhIUFpH"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so3858883f8f.2;
        Tue, 08 Jul 2025 04:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751973730; x=1752578530; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CBMdc/YECtqc/SPWQHs6SAi81ZqJdFUUX2xLa4dM62s=;
        b=WzhIUFpH78VbwWr8oCWIvtf1HK2fPJasK4iGUMrzJ5shBltkRF/V9xCwy0wCndwLpJ
         VSyf0ugh0tz+4G+GdcpI9YEa4czlMdbwzZqwvArThr3QuinCZdwkbiPxf/T5DyIKNDLO
         JdPhZ5zdFo7ckf9jmL6PdCrBLfj57x6sXPhvfMd8QAvX0KuOhYjr15lmykXWO2xuuqHo
         AENCnAQomrh4bKyUzZFXMKCKq7v7ikFRTeWEu2hmMF96PC/fN3IQIVoqtPVTq9XkQFl7
         j4mdhmkYkKSIZ/UJbUkMkJ/oGBH3+rwR94Nuu4ohehcpKJ153RqK7X4bjHNeEG3qNK7/
         e5hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751973730; x=1752578530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CBMdc/YECtqc/SPWQHs6SAi81ZqJdFUUX2xLa4dM62s=;
        b=hK39ubbmQYlzoFQsggfxXFIhw9IgdCN0+4AQDoES1vNYohKxkwi6gjOnSegraaFFLH
         kE/J7Y9xjuFH0E+HlgktRxg5wdu7RDnNs/e1yDT9kDUfsHYO4REGSVLO1wYyBT9km7IY
         qWjbeW0RmMQO/gISFPEHs3SV0s9ZGZ2lpkComxTX7EAGtjBaNpC4Ps9i1DWJE80oN5Tp
         BjMwiWqy/Lu7BCyyoy8UXwrJt5Vq+8q9FoVyd8XEZ1q8ubxCcEj3N4gWU7nnlfU7ApMG
         KcJvYXUUYUq6wq19Cq6XKj62tJ1XDL5g6/TcdyMH1mRKFvNqQzaY2dYlP96v47l7xVE8
         sw8w==
X-Forwarded-Encrypted: i=1; AJvYcCUvZDF5Ht8KrwCKpvQj8jiK6RWJ3/qqxdGtzZpNRtlcbIBY3Bm786CmEOqfXk93xiWPRJyRXTxkPiJhPTc=@vger.kernel.org, AJvYcCWf+geji4cnbEsjAxbmGx3mDfgYnJWpzOtzXmrIi9yGDGKcogCDoiXB6hk3zXec0Z5AlT0rX37/2oI1kd0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWCNDA98hO6ToOOcsuY3INIPVYRW5VX0PgjBWJ6BhGnIV0epet
	xHKGN3I8CINCoumASxCrRlkr8lIKDHtUAdSN2SnC58FVp7CP+Hmdaad1
X-Gm-Gg: ASbGncuvcrlWR1DMOQ7SkLInv3hpjtWwJPvoc72XWdm2wIaDQjE0GqFpF7CqS9UcHkf
	/4nDuPET4rSCnoxF1oE/x3jgCZKd8sXdbfCh7tIOqzustZcm4l2VbkLpk+JXRkRkimXQ1iuLfA2
	85gOnaWBes/5G3Eiki8TG9hdK92SxRqcsvdlfXsOQFr7+XGiLzxg0LnDYR6O3VMC4ewoUsMJjvX
	VzSXhNTzFV5hCtLljtkDaUm9vsePiqM+z2mGAAqK/KTJroRg/oIEV5qxY9ZAoYO53QKLXUBdaAB
	hEyjoIeSuJEwiESTMEqn3/cT+Mv7G7EfhhewTmfp5MY8V8fp8rYTJHtPQzn5n5LBlEeHX52/2p8
	3vQvhbp3RJm8kEqbtDVRynRxiPcAzX5x0geff7o/Xy5ftYvBY
X-Google-Smtp-Source: AGHT+IFMjLCHSZWa6yDpJYdUoupqViyQArWLvL56lvlx40Wsi1PZLkp9PFh6x7blSQrk2LEsAaoxhQ==
X-Received: by 2002:a5d:6f15:0:b0:3a6:d5fd:4687 with SMTP id ffacd0b85a97d-3b49700e1fcmr11374720f8f.18.1751973729393;
        Tue, 08 Jul 2025 04:22:09 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454cd38eee8sm19688945e9.6.2025.07.08.04.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 04:22:08 -0700 (PDT)
Date: Tue, 8 Jul 2025 13:22:06 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Jon Hunter <jonathanh@nvidia.com>, Kartik Rajput <kkartik@nvidia.com>, 
	tglx@linutronix.de, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2] clocksource: timer-tegra186: Enable WDT at probe
Message-ID: <rq2mdqmg5hnyg6tqluw6vsk4iecgvcm7muhwzr2bhwoi4y7bvi@3cvxzduzw5og>
References: <20250703110415.232741-1-kkartik@nvidia.com>
 <aGuYuHx5qlKCur8P@mai.linaro.org>
 <58d948d3-bbc9-4fca-9393-ce995a4e2567@nvidia.com>
 <5e8714a9-cd2c-4dfb-a624-8a1adba91da1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c3xoir22mr7wfr26"
Content-Disposition: inline
In-Reply-To: <5e8714a9-cd2c-4dfb-a624-8a1adba91da1@linaro.org>


--c3xoir22mr7wfr26
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] clocksource: timer-tegra186: Enable WDT at probe
MIME-Version: 1.0

On Tue, Jul 08, 2025 at 12:03:52AM +0200, Daniel Lezcano wrote:
> On 07/07/2025 23:19, Jon Hunter wrote:
> >=20
> > On 07/07/2025 10:51, Daniel Lezcano wrote:
> > > On Thu, Jul 03, 2025 at 04:34:15PM +0530, Kartik Rajput wrote:
> > > > Currently, if the system crashes or hangs during kernel boot before
> > > > userspace initializes and configures the watchdog timer, then the
> > > > watchdog won=E2=80=99t be able to recover the system as it=E2=80=99=
s not running. This
> > > > becomes crucial during an over-the-air update, where if the newly
> > > > updated kernel crashes on boot, the watchdog is needed to reset the
> > > > device and boot into an alternative system partition. If the watchd=
og
> > > > is disabled in such scenarios, it can lead to the system getting
> > > > bricked.
> > > >=20
> > > > Enable the WDT during driver probe to allow recovery from any crash=
/hang
> > > > seen during early kernel boot. Also, disable interrupts once usersp=
ace
> > > > starts pinging the watchdog.
> > >=20
> > > Please resend with proper recipients (linux-watchdog@, Wim Van
> > > Sebroeck, Guenter Roeck) and the changelog.
> >=20
> > ACK.
> >=20
> > > Can someone take the opportunity to split this watchdog code and move
> > > it in the proper watchdog drivers directory ?
> >=20
> > I understand that this was mentioned before, but Thierry previously
> > objected to this for this particular driver [0].
>=20
> Yes but meanwhile we found that the auxiliary device is designed for this
> situation.

Honestly, adding auxiliary bus into the mix is total overkill here. I
always thought with all the tools we have today it'd be easy enough to
have drivers spread across subsystems if that's what's best.

But if y'all think this is the way, then sure, we'll do that.

Thierry

--c3xoir22mr7wfr26
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhs/14ACgkQ3SOs138+
s6FtSBAArXw6ej9mii4/C1hY2wKHYS0u1zB6NL0BAI8HJu6v50D+qlhRpHG9p26o
BJOTnSttdmsJwkwMKe13JirVBBPIQe2A3cG93B6hm1AuVRYMZryj/MEhaZ8KXhJF
VJApC7ty9v12LVXGUvDNoW+s1Su/1Aeo+f2LNfmS+o0tRea0neEzPrvzBjao6HXW
nYaWHfaxZ8GcsVHy8LAE6qFaNYSeFhxE04xPXvLdMpzg5ZmvFDVotw0liRpt90fD
GAeX4VoXbBlpa/MNmmNkXK1cHmVhnIYuB1dfYTjonKF//gFqSxqiicQoaOULDAEu
a/iirKLzvKrb3AleQHTnwexhkndsIWKp88lp2OpGJgdp7vaJtX1scenht3o/GNFN
qZ+2PPWeOGjjuBbWBW7yzLUXmnOf0DORLyrPmx8ZX7s54qacHKSIS5ju/ESCxa2a
ALedwu57EWMdZN1qnZVbRlP2qak6VEAnIyDQ0nqHnLBzhzejElJC3M0iewOupvZU
6ATwKVx4T7gQb+DjtsbUbUUArWNhRbuB2Sli/ft8Gkxw5u6waE0x74rVveQCmRYb
a1eormWkSBfLtu0/cY0arCWGPiW4akYels4BtwgDT4oFE9D1Mw1hbdckca1XIADf
sHGXv1S0/I55BQt+u/6G+wQLZWf5D9K4fL6GXNVc5iTybVuW0+w=
=6diD
-----END PGP SIGNATURE-----

--c3xoir22mr7wfr26--
