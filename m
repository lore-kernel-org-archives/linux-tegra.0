Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997442222B4;
	Thu,  3 Jul 2025 13:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751549767; cv=none; b=sFMfLzK9Oiv2DvvBmeuKc3ZMJNjtzKSF1T0sEuhDedIOzCgE8tkpDaA9iJMt9nVP7fjKzmH/0fmke8UqFz6hCfTCSO8rLJKH42MieF9dMYb39NZaiwc2q/Hdwbbo4sNFO++xKpBvJFuYIp4kBCpcQjU8RbzPM5RJkDCPIYfOVt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751549767; c=relaxed/simple;
	bh=1k1nNforTg1H+m/lskasznYW9O98NgqbVeC3Nuw/WwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KA0R40WrkzbNBmG+8OpbKjcPUNPUbKkV3DIhcBDuzmzD4TIW/+nX6gcCXbjjWIQnEV4mJiA6Bsih3Ebn7UEJvhHD1hrPB0DsQYxc0mpucpDCyDkFXRbkQtxCzWrE+dMwcmE5aAfmHr2aXxqkBsk93VSG1nmLBjWLO9xB3rvClh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jlhIpLLR; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jlhIpLLR"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4537deebb01so29912245e9.0;
        Thu, 03 Jul 2025 06:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751549764; x=1752154564; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ezufD/i9YQ3WT6a5r0cNuhA5MSrU2Q57Xu2pvwBKpN0=;
        b=jlhIpLLRDQkX6bzq3FntN337x3jPEbbwxmO72k27vcY55/xlHYudnWKi9qXhVPiQe6
         wc3x10/jgo2nf+md5qbFrehessN3RLqx8wA1oM6vLLCkFU9qlMhabZ6cKGwQ30Glcl9h
         HBJG4RWjwk8K0gSSfNbZ6l4kPtMO4xi4H6aKpxRHYQq8ZhSUMNu8fqhF5TFDVmrHQ/N0
         GpPDkkJmOSqZUv6mvkfFO9Cw2J5O9czGuKSQS+HyZHexqLRTMAJDKePC71P2JjZAeIjd
         vHVVXfdbYcp7LrFAlghVUqHNVg6nHyyydkOW4asrEwvployWk69ZlpTAaEaWvymZaX+A
         LCcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751549764; x=1752154564;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ezufD/i9YQ3WT6a5r0cNuhA5MSrU2Q57Xu2pvwBKpN0=;
        b=FOxIa+J1980P+OaqPP8wqfPlWmzUknwx/QhwObCR0itwezoOTfE/+4nKIIQqCux7W/
         6LjSIImauaTluEJyAkEQV53nLd6Ful4kQDB/HY+J39Qw/6ekzhf0hIMW/MnWKI4mva/e
         2w5+zutuEySBSFAbDf2QjS8fbWVZqy5D2K98YgY/UIxQv2NORBIy1q23hTmYt1+4Od5v
         osPxjxvVlHZIfJuhkcZbwIbCiBKBOOOF1b5tD4ZlekzEGQJ3gmuwa723veF8PuiD2gjJ
         3igSmcYKYWg/B3Ib13Sa+swmaSd1kVM55Ba59lEQH1J+8XDRbFuKuC7ZGGOt6HixyDMm
         Pz0w==
X-Forwarded-Encrypted: i=1; AJvYcCWJQRvdurAvtGdMiHzVUgE1M2y+5ciOuqG0JCEEyp9wesCpt46KoUiGyiMHm0UmP50OIy5K2WBxpvBsHqo=@vger.kernel.org, AJvYcCXTt1yVydFeUDQrMubaYbDJacgst3ZWOp7KVxcaQS0PmU0gVvMK/jT7jJKbyggBeA91ovcLTYdDxycj8L4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFGxsFzZGxrHaGeTwsUiHrJrgQzAa6ON20QOD73gxld1RNQVFj
	2kr0F9tbz7sGH2UZX8MBtXppetvsz5NHUpzoA2H/VQGFL2Cs9jLqvHTV
X-Gm-Gg: ASbGncsQEKUH90OF0lFo1Yo75tZ0BnhXpbhRH1hkymk3ExGb+IlekgfbOUgmQpuzX5s
	VI2mP0hnlalTqcyBYi3ARUH8jRfv1DLafkuaiYx8yYY0IpTtWYKSmBTY5ggn6TJseyJJSmtDkpL
	XP8QRdNPeX7g/ZFJoLgpT/jWniQ/cKt7L64716YIDzewnFidbmDImsxTyLWH5ZGxbjltLK4owlw
	mGgjw6Ahe9SIckSWVSDxgn8bPPJfRY2T1go5fcPUPFqdfBvzpJrP1XKf01+LX2QuD5QFiBLBZtT
	hPuSVKjnD+1EGFgeOQkcG1VjSDDUM4L+lbT+TAtR76Pj6gDM0UAiM//j+QSYbHvNt28WoXadbBt
	3oKq66tupjvM0Ph8Kh3TEE0wTKkGSb6T85qXfVBMxLJrQ9t/B
X-Google-Smtp-Source: AGHT+IEijHkoQh1+h5q+sni83AJXclydk45lyBlo1MgVHBKT2anc8skcZtpk0M3VoTx+zKP5iVGVJQ==
X-Received: by 2002:a05:600c:8692:b0:453:62e9:125a with SMTP id 5b1f17b1804b1-454a37fe36cmr52043805e9.18.1751549763638;
        Thu, 03 Jul 2025 06:36:03 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fa884sm18249048f8f.29.2025.07.03.06.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 06:36:02 -0700 (PDT)
Date: Thu, 3 Jul 2025 15:36:00 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Kartik Rajput <kkartik@nvidia.com>, daniel.lezcano@linaro.org, 
	tglx@linutronix.de, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] clocksource: timer-tegra186: Enable WDT at probe
Message-ID: <q7fi2hpswm2tsowrtbanlnidxnyq3fyb2xxr6gcowxv6sglhop@nsvwlol4dac3>
References: <20250630110135.201930-1-kkartik@nvidia.com>
 <3wesm6syeqmjdzyyj2mjp4sjfwl7ebeahqxwcvub6gwvoifuh4@43tunmtjsq4h>
 <a0d7a8c6-af60-4f70-9d60-a87e0701bc91@nvidia.com>
 <k2t3dkh3acoenhxtsd3ekvpnwl5yir6qaun52h5prdfwcx5lsb@h3ieoj7jfu6t>
 <79974980-7218-4fa6-b5c2-f3936ecd1fce@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ulioinvcaaofacjw"
Content-Disposition: inline
In-Reply-To: <79974980-7218-4fa6-b5c2-f3936ecd1fce@nvidia.com>


--ulioinvcaaofacjw
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] clocksource: timer-tegra186: Enable WDT at probe
MIME-Version: 1.0

On Thu, Jul 03, 2025 at 11:26:28AM +0100, Jon Hunter wrote:
>=20
>=20
> On 03/07/2025 11:12, Thierry Reding wrote:
> > On Thu, Jul 03, 2025 at 08:55:04AM +0100, Jon Hunter wrote:
> > >=20
> > >=20
> > > On 03/07/2025 07:55, Thierry Reding wrote:
> > > > On Mon, Jun 30, 2025 at 04:31:35PM +0530, Kartik Rajput wrote:
> > > > > Currently, if the system crashes or hangs during kernel boot befo=
re
> > > > > userspace initializes and configures the watchdog timer, then the
> > > > > watchdog won=E2=80=99t be able to recover the system as it=E2=80=
=99s not running. This
> > > > > becomes crucial during an over-the-air update, where if the newly
> > > > > updated kernel crashes on boot, the watchdog is needed to reset t=
he
> > > > > device and boot into an alternative system partition. If the watc=
hdog
> > > > > is disabled in such scenarios, it can lead to the system getting
> > > > > bricked.
> > > > >=20
> > > > > Enable the WDT during driver probe to allow recovery from any cra=
sh/hang
> > > > > seen during early kernel boot. Also, disable interrupts once user=
space
> > > > > starts pinging the watchdog.
> > > > >=20
> > > > > Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> > > > > ---
> > > > >    drivers/clocksource/timer-tegra186.c | 42 ++++++++++++++++++++=
++++++++
> > > > >    1 file changed, 42 insertions(+)
> > > >=20
> > > > This seems dangerous to me. It means that if the operating system
> > > > doesn't start some sort of watchdog service in userspace that pings=
 the
> > > > watchdog, the system will reboot 120 seconds after the watchdog pro=
be.
> > >=20
> > >=20
> > > I don't believe that will happen with this change. The kernel will co=
ntinue
> > > to pet the watchdog until userspace takes over with this change. At l=
east
> > > that is my understanding.
> >=20
> > Ah yes... I skipped over that IRQ handling bit. However, I think this
> > still violates the assumptions because the driver will keep petting the
> > watchdog no matter what, which means that we now have no way of forcing
> > a reset of the system when userspace hangs. As long as just a tiny part
> > of the kernel keeps running, the watchdog would keep getting petted and
> > prevent it from resetting the system.
> >=20
> > Using a second watchdog still seems like a more robust alternative. Or
> > maybe we can find a way to remove the kernel petting once userspace
> > starts the watchdog.
>=20
> Once userspace calls the "->ping" callback then, 'enable_irq' is set to
> false and when 'tegra186_wdt_enable()' is called this will disable the IRQ
> so that the kernel no longer pets the watchdog. So this should disable
> kernel petting once userspace is up and running.

I clearly can't read code today. Seems generally fine, then, but I'm
actually really enthused now about using a second watchdog for kernel
petting. Since we don't use any of the other two watchdogs, is there
any reason why we can't cleanly separate both use-cases? It would let
us avoid some of these special cases that are not intuitive to
understand.

Thierry

--ulioinvcaaofacjw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhmh0AACgkQ3SOs138+
s6GDKQ//bl79B1sViAyoXlo/QAO4LD10z/MrDkYt+VWzIh+o4l4WepuBD1LUfskr
b5sjZ1q2296rPhyuojnODWsi+DWpXq9daCTiAlqfHM35H85Ov0zSlS941n45QO8L
PjgGC9BAQ/IR4pz7miJbvYlWCkszLjdjS2IUOv3YTg2esy0xgFZtqat010O7iQCU
BJXCtzGb1ScvwAC+LLX046qQw878RCXkpx0DQOJXn93ygL/xzfxOTQtUaYVGkxcq
FY+kU/hNtfd42ommvdoVlCh8bn5M0BjwN/D+WEMqy0n/46LW/eokUcLAEFCbfuGc
wodqVmPlGOA3DxdP65GLkyuojQ+Yp/PCA5V24s+EzQwExokH+lvTRQFoeT0hYm5m
lAoTZNjeNY7PBxaQ3AqQ7uwzOq0/rKm3dJm9CrblPvE4HIt6b3sUtFtsTWsR+yG1
YNh8O7gBI5g4KkTQvsyOP+jhx8QjoMy6eqTJ22vS0UrScjtSLmWWlFeGitYj42ya
iTY7oT+JZay61oQRcbRhZyGDDm6kATHZCInEK8epJmAW134AtBHL/hTmYMXu1wSz
zIacJm1HVB6d7xZXSGPbFbzKxkTVTpXus1rLduOHbGtNsZTPg1yHgFFjecQ4d4zJ
Gb/MOGoLqxMf+xaWEHAkvABaNCqRfOomYMC24PAGtk7FcGlAvP4=
=UgVl
-----END PGP SIGNATURE-----

--ulioinvcaaofacjw--
