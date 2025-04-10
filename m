Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4A7280A37;
	Thu, 10 Apr 2025 10:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744280155; cv=none; b=cpTgdlzTk8Kw19LKcwb8npQ0Xto9J7qMHiL7cWWLUizWNbKhWeiEtRXsPWiXq38A0kww0VUGUrLWDKnVIcsc8TxfeeCfvtCQXgcaOTdV2fv5myXvAirg3AuyWWUyR9Sip0DPSDnhouqazP9mhRyNMR3bYJZyhzvx92xYPbmas38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744280155; c=relaxed/simple;
	bh=0BQhgcnpFqywVcxk1P/xWoEwrMoPWaTg3UyJddGCSb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fT+FlEc5gjiNCm6nj0OPw/H7hMo97hZ8UYxxwOhE9vnXxzW4HglZLH9GQnu+WLeKBxZ3DAEfbItAeitkhkIwbtHSVgo7Z61YAqBGW4g4B4xHhN9BeUcn5fGa3SlgtzadtqQPZIdYIm5TszaslEkmNzq4AV9gGAJX67/6bhas4fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MTpvQIUv; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTpvQIUv"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3912fdddf8fso1230292f8f.1;
        Thu, 10 Apr 2025 03:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744280152; x=1744884952; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R1LkIXObRvzsmdTgUjkNUIkDB+ldRmSlPOJE5eH1tuE=;
        b=MTpvQIUvj9uzWT/g5xHx00XkcZl8nlrIVSO4KQHJ5BKtkPcfAEATXQxL/AfEgWNRdp
         JQ1HPj9w434Cbs2WngfrOD5f4FX+cB81FfMDrpiOwEHuub5dC7xKK7zW/mnL1Jjt3fvt
         YKtz/bJVR61sU+GaKvH91vLmwzsjI5x+VeehL3mFFFyowxGJfEHkriE0K5EnLItAfbnV
         Afd8JL3cCQ8x3tx0wUf6vaVD27wHoCteU2oJGklNDhnLCJHAezZFyglheklQQwQdHkBk
         NwbVdqSIl9eGz1HIammXsaEIP+J7TasgSMeQTQS/GtD5d21kBn/1dgWMTns1ZSpXg3y9
         J5MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744280152; x=1744884952;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1LkIXObRvzsmdTgUjkNUIkDB+ldRmSlPOJE5eH1tuE=;
        b=EbSFKRUxGlc1wp5AUZ8gMQRYASep4+0u8mF3e7yrmzUlCh8MXsI+QIEgR4RUEJQywj
         qXc3JGXGBzro/+uQw63wZoHlMeiq1LLKTJTWZuc6ru0/St8rQJLVYfbI6NeCz9DyX9Y6
         xSVvuKAb8nJS+rDKdljir5lcct/mz3vZVjRdqSuhyVV3DhNyvPFMSYcE37ywGVeYSOin
         4c/ueISq+AJuXUPHpBp9IYsyKvqN5LE51V0XYfyl0EOhjT+GRcwDYKOM/QxkLcAUSadT
         wQxDyG2PZ+nWn1iUbMxS2BW2U12DpazSrUr7n97BXbtUGt9/lAD8hNkJk+CMb1vr9Q7l
         ErZw==
X-Forwarded-Encrypted: i=1; AJvYcCVCOxwC/FGb8c8NNDFr810hxi1qqYHSKFPVC9bvyN1WcznQufcfUjhUo/lZW+2wPhSrNqyWW92b6KZKHxU=@vger.kernel.org, AJvYcCWnmVl3f8MQO2BlJAzRiVScCoP9kxe5KLkoiHCyKSy6lbndsITA/6iONNiftAWBx0IY+yCntqr17DcNxHs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLTI8FDodOZSXub6fnhD9BwoCJFml3BzK+5LR6jNfnG90e9at1
	5Gfb8I6uA8gJUxrqcMxX1olyZrY8R8oPhcLMMb7Jhx/F6sVtS0RK
X-Gm-Gg: ASbGncvvAIuYCQt8qPoevlsSTjVEPKw3Ls63vLIOMXFDh+Mj51fn+RTGZFthd02GC5u
	xLS7nfMz7Wfzt3yvnttjFnc+Y5Okewsy9LN16DRSgX8qGPeEZoSE4p8moFEajHG+U3D6myt/btF
	30lRNZTvNiZL8z5Z5RLEE/NvxHFs/TAN3CaMoNWPO8gh4NMVwmII5EvIeYeXE8n1gZjTsTa+ZJM
	Xs0aO2BY0XT+VNcyFbFBZ5goTfJHM68j4Tb0mZgVYHFku0sq2YWcjysJXZPesKAnzS0/923C8Ze
	NlCfqJzYyn2lAOKc8CFku+SN0poYb2lk75cPbGZVCJN8tmGVtU+n43IIlwP2qcOT7yNp05WLFCk
	XCIMihHKyCA6SRqwhcupMj1vckT4=
X-Google-Smtp-Source: AGHT+IErXdESFajqnBsL8aYRfiGNhcwvNsguEHlaNpfXMjMyIPib4tVbORyEJ/Ypkt2heXoYDm6dSQ==
X-Received: by 2002:a05:6000:1448:b0:399:6d8a:3f with SMTP id ffacd0b85a97d-39d8f630f5amr1874518f8f.27.1744280152155;
        Thu, 10 Apr 2025 03:15:52 -0700 (PDT)
Received: from orome (p200300e41f1b5e00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:5e00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d8938aac2sm4373599f8f.52.2025.04.10.03.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 03:15:51 -0700 (PDT)
Date: Thu, 10 Apr 2025 12:15:49 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Robert Lin <robelin@nvidia.com>
Cc: daniel.lezcano@linaro.org, jonathanh@nvidia.com, tglx@linutronix.de, 
	pohsuns@nvidia.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	sumitg@nvidia.com
Subject: Re: [PATCH v3 2/3] clocksource/drivers/timer-tegra186: fix watchdog
 self-pinging
Message-ID: <tthwz3i4iub2np6unc5o2jlaczi4wdv3t35m7ll3kcezhfm625@6jiehdzdtoiz>
References: <20250407102323.2690911-1-robelin@nvidia.com>
 <20250407102323.2690911-3-robelin@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="znvo6zf4ilezmvzl"
Content-Disposition: inline
In-Reply-To: <20250407102323.2690911-3-robelin@nvidia.com>


--znvo6zf4ilezmvzl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 2/3] clocksource/drivers/timer-tegra186: fix watchdog
 self-pinging
MIME-Version: 1.0

On Mon, Apr 07, 2025 at 06:23:22PM +0800, Robert Lin wrote:
> From: Pohsun Su <pohsuns@nvidia.com>
>=20
> This change removes watchdog self-pinging behavior.
>=20
> The timer irq handler is triggered due to the 1st expiration,
> the handler disables and enables watchdog but also implicitly
> clears the expiration count so the count can only be 0 or 1.
>=20
> Since this watchdog supports opened, configured, or pinged by
> systemd, We remove this behavior or the watchdog may not bark
> when systemd crashes since the 5th expiration never comes.
>=20
> Signed-off-by: Pohsun Su <pohsuns@nvidia.com>
> Signed-off-by: Robert Lin <robelin@nvidia.com>
> ---
>  drivers/clocksource/timer-tegra186.c | 24 ------------------------
>  1 file changed, 24 deletions(-)

Yeah, in retrospect this doesn't make sense:

Acked-by: Thierry Reding <treding@nvidia.com>

--znvo6zf4ilezmvzl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmf3mlQACgkQ3SOs138+
s6E9Yg//fT2dlk0j6+Rb/J4HvjXq9Mix1UofyVpWoXTWRU1ia7cyjFGmhvEaN9KN
CYwL4xTFAYCTJArQYX/gUKnUvvQu8FuttE5qTEH23UZBpWX/d7EeqoIm5RFAMsAI
oB2AcRz69c4wGDDccJ/V0wclCBt3IGul+ZmmW0mSf4Q0syMul9uPZdgE7vNcRdE2
hKdcPFkyidvatJlsDGMe0Li79mWxTXW+hMu2g4TLZbdWbHdWTO1Rwfog9H33A9y/
AExaTubW/qKaMRn6lMSDMMM7NxqndgzjcZONQtWegwP5dfnN3HVAF2t+w11KrXaS
SsOj2cb7u3nCYQf6v4e4TTeurpPzg26ME72o4DjQ29y80wFiASb6K5EIM998fwdi
XtM6Lz2nHNPBVdOEbGzCwtsgthCsMC7yhiclxGYdNzJogGiWj9mbUF99OgeDgERo
Ri34eqG6k8Aqr5XMN+cbCdY20SlAbmg2pGpX0s845hGtaiif03ab9ZfGEraUIJ0N
bHNMO2bUcE3FY0NHiEJQ9WEj/vmLFLPCSr91lSmKMkHzYj0SgBWHMSfBcTsY6/c/
j5O2k3CUnxPRQlKQiXG5DGT2wKre1Qpmg15TLwZVvJgbu1PI+2Y0M3qlmm/pUHVz
N/k+qC+mAfyqAQ6a/J6FoMT/Ng5KCdXa/kZ5IiKz6PfKHYDoxt0=
=VDlc
-----END PGP SIGNATURE-----

--znvo6zf4ilezmvzl--
