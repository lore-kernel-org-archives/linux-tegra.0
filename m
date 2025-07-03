Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A788323A58E;
	Thu,  3 Jul 2025 10:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751538642; cv=none; b=LOshqhb89IfMyTWZSJCPKHJvHBvFK3nz8M3iWSaveY0x0MNxDaUEEgC53T+eixcrPqYQrz7Q4GEWno1cAnMgIZ6jNVh//K5gmJeZQCbB60nuPo2XbNzgTXfqFrqjO4f4BXHIAOoPg8RvGJD2serHjss6PDt9ajYhYJzDK0/4x2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751538642; c=relaxed/simple;
	bh=xepNjJXberJeQq7IvBHUErYxMBu7AAaPOtmc70ER3hE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PGV5a6cVgsQ2gUxcS5EB35/BIITjO0fqK+t3Te0GkLyAd+KiX0gb0BcCEQb3UBr2c5629GmOS+Q0BX7ga1bE0kZZI5GRRDb4kw3WaTV9n3ds/Z+LmYH71IE/yf+oDpXrdhn6+gPc0NwWUwwTro6i8TPJDEexpMXUqjbxxOvBM7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DgYT/CdO; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DgYT/CdO"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a6f2c6715fso5575183f8f.1;
        Thu, 03 Jul 2025 03:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751538639; x=1752143439; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BI4ugJqpUpaLGQsQ+EDdZxWC0RxUSrdZP/cPnbrYvqo=;
        b=DgYT/CdOStWKmD0DLj/7eTJKCtQpHSRShc7GPajflNeNCqg425gEPULlmv3H8Oxphj
         CYVpjiSJZsn7UA3M4/K+VgWpozf9p94Hvn9Mc9t7Xdk0TkYe9yYU4nWRJTsnYdmTIVMH
         Okk5M7TAe7umlQ+dZw3AYliaz8qV7I6bujjdtHOWBYhifhKITZViM1hiO0iTs5fB3rTo
         pqcvxDcAqR1p9jA3wVz2wm6/SCaxwNPRz8w6WEDs4UrzkossHqZ1ywkWpHS8+SEwzySr
         Wk1BHewKpDn/TNdPS9fyyMI+SPTrPmgpA4qqWmkWfOngSCWxHql4vuoTCG9sgV6r89PP
         URgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751538639; x=1752143439;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BI4ugJqpUpaLGQsQ+EDdZxWC0RxUSrdZP/cPnbrYvqo=;
        b=aXmCcuwyXG+dEJ2jM4joqee2OmZjRmEGxzaIRrfJwH2VgOK7t2w1zRWN3r8p/LfVIe
         7Ttgjcbq8E3COgPvcM1eP4JVztB/vqnNBk69HWc/NmQFSGYSCbniTTRok98bKlnMbzUq
         qvzZC0lxwyC6LT86GTLI+lZJhsnkToM2/73IYCtHqZ3zKAYzDSH8RSYSMy0EbBzi3fe9
         kX29fzimNqlPcX/vcbGqtDdFz1QQAEqgV4G1Oa77BsUmxp0usJXkYSF4O1p90jxlZUT0
         ford+bRec5NOocfxyAFbWWhG20ApkXRn5yL97rqFFCNDKPUqNvvYoO2LBzUdrCQLGSjd
         fl6A==
X-Forwarded-Encrypted: i=1; AJvYcCVwn2DiUsTnskp8ag0kOXN9ouQCuOvokr1iAHep0PqE4CPuX3jQgTes7+iyHQvj0JmlSOW5TdwwxbtVzhc=@vger.kernel.org, AJvYcCXbth21Xouzuc1vGgw1b8ntgS5VqszlbJmMzMS7pv9Z7QGHzl0P45w6//PYx1sBvNKa6C6FYA7BUwYhsSA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNammO/gka8JZWRLtZuJEqFQPhxMmXlgBzVB9NTQfJWh6gG09r
	HbDXxCfDys3T1nZeTeAcHYummboQYi1abGCVewjQPBJ8hW7CibdMtu8w
X-Gm-Gg: ASbGncsa46rjowU10sGAirN8CdUgPoR/XoeJoxYOzlhFmbx9iyHCO/3x4vy7P6Z++/Z
	PD3tQHTMfttZSkVq986RK1oBAL637lkwKkv28dZM4Q1tZT94r4CAlwR6tNArb1wnmtnL87KVTn4
	3sfRyO++UbreqdbjxaqzEvrXg1JQSIam23st68pf0ov5jzpdbL2aiS4MTpSikgQKPJeD3ELilAG
	XMUmHUjVl0Emwsr3P8giiOGw51cuOCxyJdSwGtLg5C2niVXTC6f9GprV64sUUsKaKdlVP4zAlX/
	98W5r9uYj3x5iRJPylGBxAF8QzOB1WO+47xYxQ7Nw4IlcYNv4jPAEPwQd57QMDAMzWpDyBjevSu
	ZfoKCgLhDn6wJsDDhZ83/ABjnyNJCLkKoNIGWHdHMNTeI2tdX
X-Google-Smtp-Source: AGHT+IEqcDm9FXin6E5d25wcn/Q1WhL1S759lH+zkxEhX3WasWxZ06JBuMRqSlkf4cLoHCfTMQiPZA==
X-Received: by 2002:a05:6000:490e:b0:3b3:c4b1:a212 with SMTP id ffacd0b85a97d-3b3c4b1a50amr1136564f8f.7.1751538638564;
        Thu, 03 Jul 2025 03:30:38 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52a26sm18479317f8f.51.2025.07.03.03.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 03:30:37 -0700 (PDT)
Date: Thu, 3 Jul 2025 12:30:35 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: webgeek1234@gmail.com
Cc: Russell King <linux@armlinux.org.uk>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: tegra: Use io memcpy to write to iram
Message-ID: <aotsm66e2g7cedpfc5zk5cjjba2wg4eiwwldl2jshwcvpuvxxy@wphprcezmfd7>
References: <20250522-mach-tegra-kasan-v1-1-419041b8addb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ffoynagzvtqusef6"
Content-Disposition: inline
In-Reply-To: <20250522-mach-tegra-kasan-v1-1-419041b8addb@gmail.com>


--ffoynagzvtqusef6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] ARM: tegra: Use io memcpy to write to iram
MIME-Version: 1.0

On Thu, May 22, 2025 at 11:11:24AM -0500, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
>=20
> Kasan crashes the kernel trying to check boundaries when using the
> normal memcpy.
>=20
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> Change-Id: I27714f45aa6aea6a7bee048f706b14b8c7535164
> ---
>  arch/arm/mach-tegra/reset.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Looks fine, I'll apply this later on.

Thierry

--ffoynagzvtqusef6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhmW8sACgkQ3SOs138+
s6HKvw//Y8GzaJfNevR731uobzZnEb3hGURGs/CP4gtMWK2GMR8GYYMZ5enlMuge
dFR3PoQPlmDrAINPczrafOMzQr5KXbOBw+A68eRwj/e7eLP8WbNN0b2+a8h/PQdB
EqtyWjr/aka5l/qnjj9G4AVDEU2DqIktnxrRVYsUhsqQGKHyX2Lo0KZTKI7+VM4b
QBEFAgkevH6mcqmj1FffC8MgPjjsrk+Xw7X4lsSueB08WNwTrqxCkJRtxpIiIuIL
qpWsQyaqx0U2I8CJ3DyzvyvMZyHqo7ZkgeZ8IIhmb/KkFgRid+05/6GQeyPQakof
HoWbeZ2AmV4jMi+5fJ9E5IWytygiOAAobQQEch1lnb2aJYdF5KzGGRWwTLLOihor
3U3k9HLvbRmiaZaAybAHmSz0GphMPUV5y8FxXiF9twfEe4JV6s3x+2pyfjtPddGA
uIYV1xc7N2tvSDLAzpu08LFBWtP3qafUSu5UXCan7ompLUbxsM/81KsjVCr2Cnlh
ntUNLFSob6apatjvqeFG+JqsmQ+MTOEbCxA1dLqJJdo2UiZ6f/j0A4TXu/uJtrZf
5JEGEUGOmba9jy6wYw3KOcKO9Fz4IjF0nJyGZpUD2k0265v/eCExC9S9w5N+Pm6P
HwDPdX3vTtWfY3r552sO3pBIHuv4YzZy8ZJmxgXyplmEOH/BfRk=
=yhpd
-----END PGP SIGNATURE-----

--ffoynagzvtqusef6--
