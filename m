Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78930291C37;
	Thu,  3 Jul 2025 10:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751537585; cv=none; b=pZHJyS7pivSKX8lxv7LGy6yMpg2ZH3b6mBfdmXIob/sX9e6xstS98ZzA7TSXBGy0NSq5adJJCO7Gr4bfvVqLBBhcFHICBGX5udxvMoe/Q2ZbZSqZOnxhTiQBkBeIYvAP6pfLJa8bIDsDqRFhkJXeWS27egyBM0sY++QBZZI81DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751537585; c=relaxed/simple;
	bh=jI5y4w4Jg1M6SSOkvsxhZhYUU5dmWJp5WydaZEe96Kw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SHaRo7WdWv4DiF9Pedz88t5shb2ZQ+Myypu1No76RptR6w9jl0zb5kMf3Z0BIOZzXHsmLunapskTECK2YYppFxAQQGYEvGW2BJ64weiIYzhzyjVV4Ot/o5FeAehrTcCjd5lBJDjPYpUFx6Ziocwory8TnuXBWUnuynsyardeZeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JEQVR8L+; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JEQVR8L+"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-454ac069223so2675515e9.1;
        Thu, 03 Jul 2025 03:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751537582; x=1752142382; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iS2Kx1MHtdS+NqOiTgmuiEvuCx54VIe7tsJZ/SXx6xc=;
        b=JEQVR8L+4CTLUWqKvplJK7qK1RBO+uWl/yCHg+UyHD+jUegr5atpVjCZBSx7PItD4Z
         jPO9HBRMkmhPA7buVubLfLEFcGhlHqd2tKE+GHIi6d8l6GycZjM8G+/PKD8mSyWcP84B
         WU8ud277zWo4R8m5y1C0tv8UHLE2TOsUL/8cr838gV/mYyu0R1D6Tc3IIQ5OO8NI1hr1
         VInxScCvTkGXB97oebRvNmijubqjpCPyI4rZM4loxzjBnwd3zYKNTkIlKntZIYCVG7Pv
         RTB9wOMXHEpc2vs4/uxrDNz/KblodCQP2qStrBdGXas6f1/GqKGPGzmR9sFTkmhxvNtR
         CN1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751537582; x=1752142382;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iS2Kx1MHtdS+NqOiTgmuiEvuCx54VIe7tsJZ/SXx6xc=;
        b=Tj2sYS6kBQg9yZmApfLYMOqDF9pHbyZT38BRta2CDE+4p1eQKXlJ53CfoOMS/1qSPc
         0zobWNCifkRDdq3wFzXhYYtILvrczQWX3DNCbKretR6Ynt9OkZu4lHEghLczkKu63Wtq
         q/Px2qBl7lSOH1yKnuuHCIKyo55IH+UNr/8E0WfV/iRjsA3wdaED5Qv6b55Nm/JWvEyE
         gKMXRFBQWWQj8MuY6XT4+KXdtFTU8kI3QuFgKOVvfR6eJ8G1nmvI4kigWkysJw9UoGx+
         dglSVBqfITIVOEKaHv95V6dp1YQWMAMzxJpVV4Dy5oKghS4rcbYN88rpMmpJ2quN1gkw
         HWOw==
X-Forwarded-Encrypted: i=1; AJvYcCU4sCB1YcHQ0D24qmmEUYx54D+Hw66xEnI9mFTUKO2fF0WRmccRunTLNqJGjsmsguFi9ML8cb5mYXgqNdY=@vger.kernel.org, AJvYcCX7KWS+sd8Oxfm2JdKKEPakF1LJjzlrryyn3zbyDhJ6wOYHeCKqSfKX3TIc6+X8xHxIFqMnvsKBO7cL2tw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkFU+uBgIftwRxneZrMAjGHQnTkce3t5qYz3QSJ+3Y2GFf4LE8
	c3GE8u3WY2w5SMD22L1qIiEtPPHFeTYsugKRt6uKjqCUDB/q3R4zl0xVA9kD1w==
X-Gm-Gg: ASbGncsXrU3c5vENaRHfPM3lGOoRxgq1C0gDIXTJiwpm5huTmKMRzMIRBQF1u5m/R7r
	+UZiM+2UdSpYayTdOzXsDk6NrVVdmQjXAuw1VfBuWdbCXl5Q6CThrUGchwZo6IVzBcWG7PVTtCL
	dJwqg8i5hStGQTkhXGK0UFS7bRYY5ICM/9IFWajUnnCbZJTHs8VMT+IwVMuKsJXEoc2SoE5J+0R
	2zYQebzSqslkRb6Huzq3K1oB8NJtQlRLJjS+PBR1GFnk54sBjWcgt55acSMuevCyQ7fB5Q1YyMS
	fZkgb5bY4xc3lX9kQrjhz1u5MZyhDLTTD7Z46i3Q2vQJNQX90CiSe2UBKiXWcW80bFsE27Rozv4
	PYZkqkPxyITT2BXoSfm9q7ZmOhwC9Z+YevdtQs4qRm83fP7PC
X-Google-Smtp-Source: AGHT+IHq43wos2q63DBVQ6dySg+D+Po9VRCWAvy4miSVcr5ICyaOEZJUULw4fEwfAx+/80oTuye5GA==
X-Received: by 2002:a05:600c:681b:b0:43d:5264:3cf0 with SMTP id 5b1f17b1804b1-454ab3462b0mr17374605e9.11.1751537581286;
        Thu, 03 Jul 2025 03:13:01 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52c23sm18405625f8f.52.2025.07.03.03.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 03:13:00 -0700 (PDT)
Date: Thu, 3 Jul 2025 12:12:58 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Kartik Rajput <kkartik@nvidia.com>, daniel.lezcano@linaro.org, 
	tglx@linutronix.de, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] clocksource: timer-tegra186: Enable WDT at probe
Message-ID: <k2t3dkh3acoenhxtsd3ekvpnwl5yir6qaun52h5prdfwcx5lsb@h3ieoj7jfu6t>
References: <20250630110135.201930-1-kkartik@nvidia.com>
 <3wesm6syeqmjdzyyj2mjp4sjfwl7ebeahqxwcvub6gwvoifuh4@43tunmtjsq4h>
 <a0d7a8c6-af60-4f70-9d60-a87e0701bc91@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ev5qopqwprgsmpbh"
Content-Disposition: inline
In-Reply-To: <a0d7a8c6-af60-4f70-9d60-a87e0701bc91@nvidia.com>


--ev5qopqwprgsmpbh
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] clocksource: timer-tegra186: Enable WDT at probe
MIME-Version: 1.0

On Thu, Jul 03, 2025 at 08:55:04AM +0100, Jon Hunter wrote:
>=20
>=20
> On 03/07/2025 07:55, Thierry Reding wrote:
> > On Mon, Jun 30, 2025 at 04:31:35PM +0530, Kartik Rajput wrote:
> > > Currently, if the system crashes or hangs during kernel boot before
> > > userspace initializes and configures the watchdog timer, then the
> > > watchdog won=E2=80=99t be able to recover the system as it=E2=80=99s =
not running. This
> > > becomes crucial during an over-the-air update, where if the newly
> > > updated kernel crashes on boot, the watchdog is needed to reset the
> > > device and boot into an alternative system partition. If the watchdog
> > > is disabled in such scenarios, it can lead to the system getting
> > > bricked.
> > >=20
> > > Enable the WDT during driver probe to allow recovery from any crash/h=
ang
> > > seen during early kernel boot. Also, disable interrupts once userspace
> > > starts pinging the watchdog.
> > >=20
> > > Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> > > ---
> > >   drivers/clocksource/timer-tegra186.c | 42 +++++++++++++++++++++++++=
+++
> > >   1 file changed, 42 insertions(+)
> >=20
> > This seems dangerous to me. It means that if the operating system
> > doesn't start some sort of watchdog service in userspace that pings the
> > watchdog, the system will reboot 120 seconds after the watchdog probe.
>=20
>=20
> I don't believe that will happen with this change. The kernel will contin=
ue
> to pet the watchdog until userspace takes over with this change. At least
> that is my understanding.

Ah yes... I skipped over that IRQ handling bit. However, I think this
still violates the assumptions because the driver will keep petting the
watchdog no matter what, which means that we now have no way of forcing
a reset of the system when userspace hangs. As long as just a tiny part
of the kernel keeps running, the watchdog would keep getting petted and
prevent it from resetting the system.

Using a second watchdog still seems like a more robust alternative. Or
maybe we can find a way to remove the kernel petting once userspace
starts the watchdog.

Thierry

--ev5qopqwprgsmpbh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhmV6oACgkQ3SOs138+
s6Fo4Q/+PaURXa6J4gH6uXIppGhNsYQx0Sh2GoEPy0NYy3QQoMXHFrod6KThsAXl
jLYOWqElHR9um0+Idp+vyLlgBprYh9dId9wHYdhRggSHxErTsqEM3qjVLjEI3nU9
NatfA9Fs3rcblhN0H3+9LTQuuqVCNj8wLkqDauZp+2OUcL4cRPvPTi1DIsz1qaQ0
y2LEvnvT3qyrBUanVl7rRXkbm6M2VdhSKv+LzP4futecebcMWEsHpYFiwF2sg/ho
rDV3Ax35EJ0e32/z75dWoMIR/ZwCqlMqXTksRwB52sR7Gahb3YxCrxaqU60nW2YM
f1mFJkb3dG/TvgazkE3dJPB15euiDVlzPyn3ntdDIogyFwgqBsKhTiZkFqheN0W0
ZSsDRTAZMwB5FFWXmvNZEwJVn+kU6LS+iW8v+uJGL0CebCuU1msQNYDrmCr7x5rO
DADwe2m3Gq785scz5M78sgrwcuHSpT5NhK1WL8OtSOu9SO7Fcbm6WGm2Uio64bT/
rq3zQsZCVCDOSLU+3agIsHBKCdDhOcGQdNg7hRYrR2E39zik0RUvpG9YQiRh3pqt
CxPBaiR4hbfxnUZSDBMn/tMBF+lZwClYF2WaVBxmi56bMy7cbE3cEAhk0FDnOs9z
kyC1wvI41J2MwdbGkIahKpKCnTRO7Rv8ABnAlH8Xky1RShGsoew=
=2/5n
-----END PGP SIGNATURE-----

--ev5qopqwprgsmpbh--
