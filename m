Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202B1322B72
	for <linux-tegra@vger.kernel.org>; Fri, 16 Jan 2026 11:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768563212; cv=none; b=eE9SEFagJ4dhEdiuV2Zb3F9sjNzJWT60oYWH8A/qvglPHr6hecMbhHyjlbU6rMTsoFEmfxTncP8FGHBj3KyrVsAG7sBqCpzROPW5h8VKwpxa+eK/HKq5oAtFLJ5hGkIXBpv3C3dPi9QUSmAjPuqkTWewErYW5Ata50C4C4e9K6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768563212; c=relaxed/simple;
	bh=sKVwaRIJGakMzjFvymsGzhNLuW8Yd5r2F7x3lBcurQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PAO9w1ynxAaCeNCb+YyCWFsZrg/5YyvgvzVXqURxulMv4LIsISwQVLtCyZG16hnCrygBmpJp64/gCqXVaukxNyNH9VQEBhuhORlmESN1blJ8iJo5eKXCu17Qffr/6nG5GEWU+Ydtqwq3bPdmV+kgbgPiQA5NUDcCksxroRz2h6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f0Xn2fY4; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f0Xn2fY4"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47ee3a63300so18609685e9.2
        for <linux-tegra@vger.kernel.org>; Fri, 16 Jan 2026 03:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768563209; x=1769168009; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v8lpLmtsVMm1ZJEKvRqGvkoSwsG7V67ihU5aNYoZaVU=;
        b=f0Xn2fY4pMpptVDpmwlwaLDP9dn24sgeB961wIl/jIL+wMgsaJ0aHTRAdW3RO8DF7l
         IHYl5x9ETLmfydNfV1kdEE+Bu+m+RCoSHkyAYrkoe9My0CfmdgiQ0wAcYTiIJ63yGclK
         AIVo50NPrMByaNnhXeUWgjJJ6fjJFLNk3unIofKYzcJ+RJ0XvNa7UT+ziwHPn46t0dtb
         Ec5QxkeipRmEyH09/c32mdgAvKiKGrqTFqL7VoeqsCHov/bQ52NhSGJe0ymLrxJp1k6s
         k74gFDhy0kkgb4xw0/zd5rYofCCOJPnIjNPKpsyQtdleu5rB6yquhLBCbE3LkzqM6RMU
         s+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768563209; x=1769168009;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v8lpLmtsVMm1ZJEKvRqGvkoSwsG7V67ihU5aNYoZaVU=;
        b=iLpFxQKpXLHcIhMO4KXtMsEdx2HcnqAoD8cMEKIUftvoELUtc71MqJIERoyqGvG2CX
         ZRaeqhHHOh065b1I48jKm/ttiHPOWeYNtcEpXE3JPRloZAWnoJi2lGDDCBSSnQ4cUAqd
         VLurbW0mn+4Z5PC5Gfkv+n+wHjPpnNQezAo+4B0/Qj7EAEXKEigBroPMjYwtfn0JNQYd
         yjmK6sEwjynFCUWc3pyCJjB+F1P+dO6XxPTvw1qPmJZgE/dJFtC5KohuupU2H+Zp4oGs
         GjOhJgWPsTNfcEumVkL1LqHCM05DLY7eAFFwyFeiuS/zFcRalCGfq/7pqlZfRHZnQXcz
         M5AQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXAd5lrIPw+cSUcQHqHR13ZcKb37LbQg3+2fL4pdVi6XPdEA32U5/+d99fj2oMKLNfDGuwpO+i8gtZIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQJNK2CEgHtdnYHImKGMAC5zVL8Qr3T1e4Jydkr3yjd3tULRvG
	ZmSRE83lOZ0jGBD8Ezp76jzrjRX3640SwTvkZpLHhETYFSJuan/lqYq0
X-Gm-Gg: AY/fxX4iIKRWaOaVmJSahAefPbyottwZJQMHeNDN16Qno33Fn9NEYf2l9lrEexUWas8
	TG4viC2X1zzvvIed5nK1nhPn3VkGiy4bu+6ETWvED4UP4jbeZst6wQY5QbMcIHj1hM5FlXyGGrc
	GAqu7SGXJLoVQGCcRaEcNRBUsYAXNQ0TKkmSe/of2ErIkDkviNINxxyNqG31G/ZMTk5ozevyTGP
	fS0vJ4eMTeBmlmXdQ8h6NZ6ppFl5xM21RcNltniQbRckHmVxh9d9B24dDvuc9TY8OOX145zL/O1
	EzG7BWEcWXp1bI6JOgdqDsFcjSJvotU2l6ibFYMgE9qploWjDrmZxYRHfp0Rq/O0sbTcCZZDdOd
	lVZ3JyDywMDZ41j0g2alyeheBnSJlZ/377dAHlY51D+v42EJIkmG7ecXj2lDpM6AGqmeQYc/pE3
	TqG2oC6oTPTtGna/Fzrqx62l+IeDKu5l1VqIpWrYd3dIPGpblI1s07Ir163H5ixwW++WXs5MDWD
	Q==
X-Received: by 2002:a05:600c:3146:b0:477:9986:5e6b with SMTP id 5b1f17b1804b1-4801e342f9dmr27406265e9.28.1768563209333;
        Fri, 16 Jan 2026 03:33:29 -0800 (PST)
Received: from orome (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e86c197sm39946025e9.1.2026.01.16.03.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 03:33:27 -0800 (PST)
Date: Fri, 16 Jan 2026 12:33:25 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Breno Leitao <leitao@debian.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, 
	Mark Brown <broonie@kernel.org>, Vishwaroop A <va@nvidia.com>, 
	Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com, puranjay@kernel.org, 
	usamaarif642@gmail.com
Subject: Re: [PATCH 1/6] spi: tegra210-quad: Return IRQ_HANDLED when timeout
 already processed transfer
Message-ID: <aWohoynjH9ruUOWK@orome>
References: <20260116-tegra_xfer-v1-0-02d96c790619@debian.org>
 <20260116-tegra_xfer-v1-1-02d96c790619@debian.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="szqy4lwbrlybsct2"
Content-Disposition: inline
In-Reply-To: <20260116-tegra_xfer-v1-1-02d96c790619@debian.org>


--szqy4lwbrlybsct2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/6] spi: tegra210-quad: Return IRQ_HANDLED when timeout
 already processed transfer
MIME-Version: 1.0

On Fri, Jan 16, 2026 at 02:41:41AM -0800, Breno Leitao wrote:
> When the ISR thread wakes up late and finds that the timeout handler
> has already processed the transfer (curr_xfer is NULL), return
> IRQ_HANDLED instead of IRQ_NONE.
>=20
> Use a similar approach to tegra_qspi_handle_timeout() by reading
> QSPI_TRANS_STATUS and checking the QSPI_RDY bit to determine if the
> hardware actually completed the transfer. If QSPI_RDY is set, the
> interrupt was legitimate and triggered by real hardware activity.
> The fact that the timeout path handled it first doesn't make it
> spurious. Returning IRQ_NONE incorrectly suggests the interrupt
> wasn't for this device, which can cause issues with shared interrupt
> lines and interrupt accounting.
>=20
> Fixes: b4e002d8a7ce ("spi: tegra210-quad: Fix timeout handling")
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  drivers/spi/spi-tegra210-quad.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)

Hi Breno,

we've seen reports of similar failure and we're reviewing a similar
series internally. I think this patch looks good, though, but I'd like
for Vishwaroop to take a look at this and compare with his notes.

Thierry

--szqy4lwbrlybsct2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmlqIgIACgkQ3SOs138+
s6ECLhAAqhJ91elXZIqMdz3YozUJThZvM49qRSCPObqMJrWaAgbErVGxVo6tEOfg
50u17PYkfftEaxCg5wJ+WtXzIFXIywCaIKuimL1xHcYMbOQXPdrBwI6EFX8fRDQd
YBvGoIoQ0ziUZJVnD9DMqr/JBLpPWbuuQOx9C8bkvhWWbRl0xAQOcZ3Go+qVDUsz
790KzX9mVT5+d6ndYMd6ScOy5GwGzEy626nURqcSKFbbZB1msqfMAdBPzAMGz/Fu
OPaj1c55qhnu6dG0qsHw0Nl0ET3YlkOzCKncMwu2dDKo7by4ASZ+gv2ki1g1RPdY
ODrrxlVwfN9l4+KaNp1vQZq4+pSN90OyqyySM3J3uactBbYXPJEXECY3Mw+rIckU
cy4ZCr1mR1cRiLFNA12gk8aZJ8ON5x+k15gYUy/5KdIeghdv23Bb+UdR+uJynh7L
3RZ+Cy/UisWIhXVIVuKX0VTseLZnLKlg6PQvpVB0rBmUNaNL5eRER/m6Q0NYOwH4
tRuxDGUMtuiL5iG37ER5CvYgP5jMxPkDfX2tmKKdJMzXPpgiLc7XJHuBAox3N0yc
k6JuOtxIbKeqvjBvxoy6uwf5LFPYLxEy20Eq/27rjhI/i7WBgazU9u9NbjYYgJL5
D5IjzS96b7P0ygwzWJkhlLMWKv5/Y2Ao7PUbFZdAEqCK5Mo+pJ4=
=bXms
-----END PGP SIGNATURE-----

--szqy4lwbrlybsct2--
