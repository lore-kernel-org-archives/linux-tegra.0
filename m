Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942F21F03D2
	for <linux-tegra@vger.kernel.org>; Fri, 10 Oct 2025 13:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760101448; cv=none; b=JLz02FqwR8X4Poc+NvfndPOLzfYDwdrbUXlDYKrLymVGb2c5WSBSj9aCgj/32aNXUXQyGQZq9rjQp1ipTyjzeFiR442/v1Ug0cPXZ2mmWqPoTguRA14d+gZ8CqKILKaSm1XoaBVMSUsZNNkWxWdw1W1sQFmg9wA8k5U9375xUqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760101448; c=relaxed/simple;
	bh=2fBUTn5JHSmdXy1l08iLHS3auLWgcZKX0u7ZoOON8iM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZmpRF9Y9zEe7NC5b7o1Zl3/dHuKWsBNfb5fUE2aIqHOlHHXr2sCdFwCZorCgfntb+eqERcF4iuuE9IRuuV/BpwdyQEbq7cwuH2eKfknQeEf4rLvk7p/U3PNyHvIyEvZRBwwrHyvLFtyk9SFA1eM+ZZ6VIlQ5/hoLbAQw4LFoFLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l44pI/Wn; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l44pI/Wn"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-46e6674caa5so10753805e9.0
        for <linux-tegra@vger.kernel.org>; Fri, 10 Oct 2025 06:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760101444; x=1760706244; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GUep6nRJRENnGzYGA7OV1aJqhmKF9x6S8pmHSkpOTbI=;
        b=l44pI/WnLyK6xvfT5YGbswVVnOFpoG8N07EtSssEpSuMEsomts9BqX3cd6I/NfmVQs
         LcFTuNrOiCjDHNT2+oZCI/VgdZHUFrXoBR+Zl8FgkijHCef5UfUHeMFQllBK4xkqT9s+
         m6i40hdKc9K5whxsAmgu0vRIvc7qnejs4GD5xkBuxArNEzaHf1XMlWDpeT+3MOCylYuO
         iAx3CMLKHNF+GhS0mKmHnnzgAY8xQqWKF/GX3kwAVNDlS+nelIbwFYKergT9Cn+WtXpg
         6GcxlaO0/rzvZLBnsF3pGAEbsYbhAmgD9//VlqM9PI6IEzTKMmOcMLlPm4sjXhQ+Dvk1
         389Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760101444; x=1760706244;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GUep6nRJRENnGzYGA7OV1aJqhmKF9x6S8pmHSkpOTbI=;
        b=prpH2BpwKfO+8uXvT7yjhUyjTWE5fgvzno+ipg3Y74cbKMynS99GaFODUJOn1fpDp5
         c3iBb6Yf18JBfXX7FDvBbgCzHyx5Fo6oGHkSxMVj/WGpnhrFRlHPOIQW7cHeH0i7nLsJ
         ARc55tq8z76J0XydYHSKUHe7WQZRHqGs8XC9VXMCIc4PHF6vSTkCSDvyWcr9nTt0ILWM
         pyVbYnBojqjeQxdk9LCRmeVenASTc9csXTFXuD0b9ALRL2aMGq76uS9rVj1KyD+Ulyp6
         lxNOm6GbEdLlN+le8dmSLTkF4UrTdD1i/y9sOkJflZ3yJxkcES1sXAg7+i5BRan8M4Ja
         UOVA==
X-Forwarded-Encrypted: i=1; AJvYcCVGss9SPn4Bv9kRCM3ds9d3J50w/sMpjIbzgZf9xp5qneW+f1xfb8IX8b1oySEBaPuxBidlGKgQN6xr5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKcK/UwrgkzB1Ltm+Lb9BArozERwdZJ5BGjQfZ4EeSnV/e3l2J
	lQ4lRqknq0oNz3xAPr34/6jxZSUEavORLaEjT+7LSufUZor7RjoAaNjA
X-Gm-Gg: ASbGnctw/WLE3W7Pf2QhdyhJ8C2nWNMDDLJJaGu5BUk+U2Uk49oEzM8Nb7DP/xAGAi2
	YkI7BnylqHcylI8tSEejxAiyCslL9FhWGlgWdfrFaxDuDfXp71phz0Usn24HJTzJvLhpR4VK449
	ymnlUjVrM5mP/6m07INVM0p8F9hP8EodFgIVYKQHATjL81G6ue7slpJYZcTEZBeK18nGNzlEQLd
	R5a0lvTw9Mvvin55PfII/kWaVDUfiuSJg6B8daCA3RnhErZl3R3F7K8osEIhKalUTqQRoyEVyTs
	rnVwDvodPEvvgV0knzxtQRdkPoX+3ZEzA4R1AkJIarF0YMVHCGjTJ4d7FTJTxhXaMy/UgEKqTZv
	wJha4t2/MTBB9N+m5qIKyZUHTCSakOWuaixLn7YPzUSZRz8qeNi7CDgTrwoDEUw0WJ9tRHrhU4D
	LFFcwzKaQ8IKcphoKWOr88g6G+ZAl6+9BXqSUzpjE=
X-Google-Smtp-Source: AGHT+IE/ARTh5Bc+/UOnITq0Iw6DNobv8+7UuMp4WV8aSSdfi9Oc51R8SOVJL7vW64ESh0Zm/tV/Gg==
X-Received: by 2002:a05:600c:6011:b0:45c:b642:87a6 with SMTP id 5b1f17b1804b1-46fa28bbca1mr81018285e9.0.1760101443287;
        Fri, 10 Oct 2025 06:04:03 -0700 (PDT)
Received: from orome (p200300e41f28f500f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:f500:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb48a6069sm46763055e9.20.2025.10.10.06.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 06:04:01 -0700 (PDT)
Date: Fri, 10 Oct 2025 15:03:59 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Kartik Rajput <kkartik@nvidia.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, jonathanh@nvidia.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Prathamesh Shete <pshete@nvidia.com>, Nathan Hartman <nhartman@nvidia.com>
Subject: Re: [PATCH v4 2/2] gpio: tegra186: Add support for Tegra410
Message-ID: <jcfsvqesvpvip3gj5gu625khah3as64lohpevjco5v5mlpekss@tq7u2g4iewsi>
References: <20251010101331.712553-1-kkartik@nvidia.com>
 <20251010101331.712553-2-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y3y5hlym57ezrkmm"
Content-Disposition: inline
In-Reply-To: <20251010101331.712553-2-kkartik@nvidia.com>


--y3y5hlym57ezrkmm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 2/2] gpio: tegra186: Add support for Tegra410
MIME-Version: 1.0

On Fri, Oct 10, 2025 at 03:43:31PM +0530, Kartik Rajput wrote:
> From: Prathamesh Shete <pshete@nvidia.com>
>=20
> Extend the existing Tegra186 GPIO controller driver with support for
> the GPIO controller found on Tegra410. Tegra410 supports two GPIO
> controllers referred to as 'COMPUTE' and 'SYSTEM'.
>=20
> Co-developed-by: Nathan Hartman <nhartman@nvidia.com>
> Signed-off-by: Nathan Hartman <nhartman@nvidia.com>
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> ---
> v3 -> v4:
> 	* Remove TEGRA410_COMPUTE_GPIO and TEGRA410_SYSTEM_GPIO macros
> 	  as they are not used.
> v2 -> v3:
>         * Add a generic TEGRA_GPIO_PORT macro and use it to define
>           TEGRA410_COMPUTE_GPIO_PORT and TEGRA410_SYSTEM_GPIO_PORT.
> v1 -> v2:
>         * Move Tegra410 GPIO Ports definition to gpio-tegra186.c
>         * Rename Tegra410 Main GPIO as System GPIO.
>         * Add Compute GPIOs.
>         * Update ACPI IDs.
>         * Set instance ID as 0 for SYSTEM and COMPUTE GPIOs.
>         * Added Nathan as co-author for adding compute GPIO support
>           and renaming MAIN GPIOs as SYSTEM GPIOs.
> ---
>  drivers/gpio/gpio-tegra186.c | 76 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 75 insertions(+), 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--y3y5hlym57ezrkmm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmjpBD8ACgkQ3SOs138+
s6F57w//URrSrOC1Q7LkrOnqIzjycY+wbsk0E8W+eaDuBt6RlP8R2EyPUquLTKRf
NtBFtLaGjCwTcUpmOzD0gzlwY/Jjre3OeSZtLdkuwzcmeR8b/BCjz0h/1CXKroF7
bB8RFJ+Y+i7czGr6J965DjYGw0Ou/rHBQuoi1Ah8AHLGGk1FqgARILV2O/EE+t97
5gzuqqSkNAeacMb2tZzvObGVK6VXUNtaUBSkZU7N+tbOcuzxq85JYN12vHr0VX/b
KoHOLsXFI6J0yECazzk333cxJq6GVJn3luT5L/QDQgqYglMuDX7sPs2PvS0cXyVp
51zp6npK1fNVbB5D0SxT7VOryPmU39H48vnFWkLF7v1Ty/YS+f7jpBUJX+mYVc09
hVXChW8UdvQ8EKeEALrzhJ0iVRGeamYoaAyaOigbgcN9NI6mX08QeD6VmmY7vncF
wk6cxt0d9WRXOlOdTbhpWpEXocy/y8ulEV5nxI6xQhqatRIh+BEmNIc3G+cCjJIy
XTa7p+u6JA54DBU5JHJVILDReNb395cY4+yoVDbCxBqTuypzuV4ovLII6ZYNr5GY
3jzlsU27Q3cljqkbcHEbpg2GmkK/cu9u9AA8N6vb8ggzLdwUOS0JAPKVKEw2DaRk
oL4mi+DfX587Tgv5NUdrPNF8vrQM4cpwyAsbIKbuwbwz0xIShec=
=ZcE3
-----END PGP SIGNATURE-----

--y3y5hlym57ezrkmm--
