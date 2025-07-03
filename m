Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C84293C4F;
	Thu,  3 Jul 2025 06:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751525739; cv=none; b=Syr38fDXpPzBevQLmRwVHH7a59SX0uVq4WkyYNj5r6E4mmSTbQPj89ZdowxxWrHHAk5CFlIXGZBd7NGKwrPstJxQYqPkmjtHssDpNNBmJYMj1NOhY0guT8r+Bc/x25aIIKG6HI32Y4Tte9BjnRY2QV6GWRggtgG6NnXu/2hFW5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751525739; c=relaxed/simple;
	bh=iS+0DkOwQzbP1Q5ALEQrz8N0WPbKUv/4LJTGcD9I6mo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VB9/InGjTz4wZ/tW/wMhDX+NR7wpkiByYwzW8VeewtZKhvdwR2gpBetlXCVZHB3TkgAD2Sx3N76TxKf7bq5rFRfkf+03Eyb0sibNEM8DNZeiampC9tsB373JJ4xfAMiSeUT1iA1sLyUrlUq7JOGEIDHpAqhWZcbT8ttM4D2a0uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dkr+HZR2; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dkr+HZR2"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a575a988f9so4954566f8f.0;
        Wed, 02 Jul 2025 23:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751525736; x=1752130536; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8tDNNLWUm0q27spE/jkR5VVfW2HO39G95sAIMz10wc8=;
        b=dkr+HZR2pao5fg9xP8uisZ+F2Rprqc8PZeZzLVve3Xmdp78pgKyMPhOmKeD4G0UYDX
         eSBWQb5M8Uo94AvzII47VK6lNM22cNvpBG2p7Lzj2hVh3eac5eigSdByYsqJXmFw5wVK
         73bPAVB7VvVC0s0ZTe9uCnEeWeOivV5w0ugULNHGI76MkZNOmxE5OvLSZPIeCt4EC8IN
         hfwBpGERy3N4pw6S9MPHR5NWzchEQodNts7Dcq+aDSYPnZC63eFbzCxYEntocvg3hFKF
         3h54mdGxvq8UArZ67CGV8p40dswEZXyTGx2dLst+BSOYWKYmOmL8qthaEyBqtaSLjjD1
         BSSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751525736; x=1752130536;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8tDNNLWUm0q27spE/jkR5VVfW2HO39G95sAIMz10wc8=;
        b=hP1E8g9Ve+iaM21keKf6C37Z2lWVDpw1JAF5vB3GWeeGrEk4AWq7S+AGOB3DLOnsN3
         YAA39QfUkO2sEQlUdu8KxCxa5IOgm+WITQ4OTPyLhOzdvj7LOM1ab4y//uv6sDBck5UQ
         SaxZ6jGhaZ9N3nxRfjGz5RAs6+HE8OCdAibBfLHET9MYzdtNqiftSawGZTbFuM7+qSNS
         4I+D85C1M8gdKJmd4U+AoJFLEXDuFBCveg9Uk3J2p8LaXhIEVVaf8ogkhyQZvI/qmc1N
         OR0qLL3BPQ6jT+g5kfgszfjZ6KJe+jvYJ5NFYNmQgpB6nFflq84sINwiTQNIhev5OuCH
         9frw==
X-Forwarded-Encrypted: i=1; AJvYcCVCtzeazOMtEKu19T+ASN4QRM1Bg+7h/PJZQ5t/qLvMtEbb0+C0teOFLhux6UAna0q9KO5mEPHpNlpYWd4=@vger.kernel.org, AJvYcCW9ARI8CIFfUnxoYX32CjGr1hUzHUfHgoY8ymbcLYegtTrAXwSj7QEOU6Ph7fdlhQEKZXLohR9IRNK2vm4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSQ/F7wbar/GyLb/SSrvvbuyRfoZqxRv1LZkUi2pQ034aC/qXI
	LZLkKgANC3HIit/IFLrvFiPQUrvZ69DSohiDwL7wE9q4Fmmnegr56qwM
X-Gm-Gg: ASbGncvv74umUcvXrq+cMH/C3ot+VjMbPEOjdtl2S1IruvwwIZVGkPhCpdlCClUvP3z
	ySnL1oeNUjuz0Bvf3arCiikqdu2WI0ejUB4kCSRv45q3nSCS2pEkiDnEifV0gWGsa1qeA9tru35
	2KS1P6vGlJPONZo4f6xIFzO6mKaVzV6QK+fc63YiGZs/W8W4WCXByKYchg0NkQZc2laWrrOFdhg
	uGap7bCsWvJlFmx0LEjsARQRfN9ZpQetKIdvz/luzMAnEaBk08KUftZ6UMixlAZVnFHTerpSbtB
	dUDJACNNcORGJsrCBqdk3d0jSLRGUpmHn2d5OvYAu5yw1Bsd54R3g6dVi8rBBJJiLhLphXWItAH
	W0fLAEcGbGSPBuWdB57jtDs3V/7He+eC172WsSRFdicbA8etZ
X-Google-Smtp-Source: AGHT+IGUsBntbwRa0zJq1OFmwUtwxkCo7cj5uM+Sxp5aky3l/QgvL2vXvRlxhgULkj5fFJtCF9DtjA==
X-Received: by 2002:adf:9787:0:b0:3a4:dde7:ee12 with SMTP id ffacd0b85a97d-3b32fe1179emr1228664f8f.53.1751525735870;
        Wed, 02 Jul 2025 23:55:35 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52a35sm18100101f8f.57.2025.07.02.23.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 23:55:34 -0700 (PDT)
Date: Thu, 3 Jul 2025 08:55:31 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Kartik Rajput <kkartik@nvidia.com>
Cc: daniel.lezcano@linaro.org, tglx@linutronix.de, jonathanh@nvidia.com, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] clocksource: timer-tegra186: Enable WDT at probe
Message-ID: <3wesm6syeqmjdzyyj2mjp4sjfwl7ebeahqxwcvub6gwvoifuh4@43tunmtjsq4h>
References: <20250630110135.201930-1-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uz6esihmdkbfdsuq"
Content-Disposition: inline
In-Reply-To: <20250630110135.201930-1-kkartik@nvidia.com>


--uz6esihmdkbfdsuq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] clocksource: timer-tegra186: Enable WDT at probe
MIME-Version: 1.0

On Mon, Jun 30, 2025 at 04:31:35PM +0530, Kartik Rajput wrote:
> Currently, if the system crashes or hangs during kernel boot before
> userspace initializes and configures the watchdog timer, then the
> watchdog won=E2=80=99t be able to recover the system as it=E2=80=99s not =
running. This
> becomes crucial during an over-the-air update, where if the newly
> updated kernel crashes on boot, the watchdog is needed to reset the
> device and boot into an alternative system partition. If the watchdog
> is disabled in such scenarios, it can lead to the system getting
> bricked.
>=20
> Enable the WDT during driver probe to allow recovery from any crash/hang
> seen during early kernel boot. Also, disable interrupts once userspace
> starts pinging the watchdog.
>=20
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> ---
>  drivers/clocksource/timer-tegra186.c | 42 ++++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)

This seems dangerous to me. It means that if the operating system
doesn't start some sort of watchdog service in userspace that pings the
watchdog, the system will reboot 120 seconds after the watchdog probe.

I think the convention is to enable the watchdog only via userspace
request, precisely to avoid this kind of unexpected behavior.

If we really want this, maybe a better solution would be to add one more
watchdog that is specifically kernel-controlled? We have 3 watchdog
instances on all these newer chips but currently only use one of them,
so grabbing another that is then entirely under the control of the
kernel should work for these cases.

Thierry

--uz6esihmdkbfdsuq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhmKWMACgkQ3SOs138+
s6FpUA//Y6SFQ3l/uVRfwyNHSFwv605/5L3gJzEg4fArocFt8k//xfwbylAkeo5q
TGz+7P0xtF/KBDL1UAbM6R31qbNEb1yKILRSH9UhyChtoRU5tcbuYEMFydqDCFBz
X6YxPT2b43RgiubvJXN6FAFX0T03VpnAM7TdZUmB72SHw8E30YOf4OoCT6tMmn5R
/WLzsPltuQFCJM+mOUSTgtfNZjJhNCObPVusAkYhqIK+QNX04pUCc2UF25viA6x9
FN1CrwhEmZhrXqlXE3KRNcQB4NNc10dhnGPr0UVmnkmcm5FtWCixTPhgHXc9OLwc
MwsG/IsL3HIT8lmdsKX3ncYybcgPcI4qDCR0+FYz2IJI49oOR1UNj7ZBWtcHSts/
VmSbzISThKbwLyYnxIQzNXK3oiB4kd0d3PVv2P0AWb65j0D/AUliLi9pZ3FsVXaF
CkPOV0ZHoDAwRbdnZ1xuE49jVkRtZ5FixuEibrym4Qxvl1GH+eUg9exMBrSOl2qi
YejRC9GkyFjRbnwwnvDCTPoZuEkDPfxuPS1tacGPzf/OhFOmD85XSo9Mz59VJeQI
zkgvuXjg22rRmMUp1moNvXcFw92k/qd4iWKs/oF/bNp7W8cHCU7v8xSm96G3Cz4T
nvNFo4vxiW8xfIKRO69vQrTQ/x+JSDe1VzJ176XnH2Sy8r3juBk=
=1giI
-----END PGP SIGNATURE-----

--uz6esihmdkbfdsuq--
