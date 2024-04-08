Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4791411C9
	for <linux-tegra@vger.kernel.org>; Mon,  8 Apr 2024 16:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712592019; cv=none; b=RWCBRRmgvpkktk+xJO9AHvOlBoOmoxDElleTfg5w2wOHvHzhgOC+0XggIqDkejplzf386EdokCdEkvQSPQjV2Bvp7Lo0vYlcl0dtzRfAT4OYifXNe1I7m9KX1jbz5H8zWXO3SYdc2XMSJjOlmXu2DHrA/Gkey+LY7EclXzOfLV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712592019; c=relaxed/simple;
	bh=q4A0q4CY0dlGjUrm9hGGFb0Y1td45JeLu+vneFz5POQ=;
	h=Content-Type:Mime-Version:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=lwvykGWdYgiNcr+3g091npgVL2eqvxduB5xwCWDTSyAigtlOmnr5RB5/Xx0NRjeLEbAFT8pvOGXOK+bsOcU2OkRsOBRygqfPeEIESfqtSsGTaToUrptmGj8vA6Bq0PwdH4NxvUBoNjQAKZNMAUs2DiVh7Xi3N3aGVDkwRcWTVSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VSxdCzHd; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VSxdCzHd"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-41691fb4c8fso3512395e9.1
        for <linux-tegra@vger.kernel.org>; Mon, 08 Apr 2024 09:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712592016; x=1713196816; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KretQ/XJthMfpetGqVPtsA/B99c5VeYkxe5u1D2zWxw=;
        b=VSxdCzHdU4k62RRYV52BnV76ZS8OSg1EG6NH134HxXcSDO+aWiuWrmVUQyeeIoIth8
         uYZ0UgQqfBcCTv8yCNcDITpCBPB99FgYbIkvt7y2hPgzC2F/x+t8+pT/qxcsVqEFhZJg
         PDRpXKCSC/o9zmQUxfnaWAT6Tmn24q3FTGcdF8CYUgbxIYwBYn5FMXPUv7r872guEe3V
         8HZXK7sFaqDO1VDYTUQ5Eb+Lf+eokblExhiZc3dH2YWlzDCY1KzfZzjadbQYtRRulpNG
         qBsYutD47qXH1PCCEiRAszjqnLslDfRGfd/ougYtNB4of2aWzHuwZesOTzsZ9osAQ7y8
         TRLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712592016; x=1713196816;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KretQ/XJthMfpetGqVPtsA/B99c5VeYkxe5u1D2zWxw=;
        b=eZlZA6cX60bsRv5ypopVrkGAOub66lT1gYWnFmdBQ8TMbe1gcqz/30bnkB+v2gt5S2
         LyM3wyGfoPatTzlPS/drVWbT83CrqiIUu6l7ad1rcpVG+1+CW3rZMpn8if2tQPgVyllZ
         Obyu7nvJw+h2fqQLMolmwhmwfkFFQeFRPVUnRXaEqvsr4I2N9g9kjZQ1v0LmAuQcHd1M
         m9zJTGImgr8HoT2+X0qtsm5qVCwg9+xFgs5vKRoDlBHZn3xMNXo+Ny0mcU85lX7UG07/
         ZyfGmk5XBI0r3pAeJULGaQEVbLdl39Xfqyk7lL7XfTmO1acwvWvQ2KMViQoiMgM0G86t
         iSmA==
X-Gm-Message-State: AOJu0YyhUpl/qg3eaKwuTOmNRGJWC5A4PIbJZgzfWmoBb0/cvm/n2t1l
	k+8FXxSRKgI6RkU8KhPOA6W4BXqTrHJDMyXAlUsa7GzJPjBhKSMzattmYR63
X-Google-Smtp-Source: AGHT+IF8YX2xAwt++T3H3IRvgCwCICC1zaadZnJE+9lQz7DBFM24xag476lWdYkXf6ter6tEl5IvOw==
X-Received: by 2002:a05:600c:3b8d:b0:416:6b95:c63a with SMTP id n13-20020a05600c3b8d00b004166b95c63amr2189354wms.8.1712592016050;
        Mon, 08 Apr 2024 09:00:16 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id m6-20020a05600c3b0600b0041668162b45sm4926247wms.26.2024.04.08.09.00.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 09:00:15 -0700 (PDT)
Content-Type: multipart/signed;
 boundary=b22096a8a7b5cc5c8f3d4d91d1d45c715f103bcff9dec75c350963c40108;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Mon, 08 Apr 2024 18:00:15 +0200
Message-Id: <D0EV7AKFJ1G4.1EED57H68IKH@gmail.com>
Cc: <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH] soc/tegra: pmc: Add EQOS wake event for Tegra194 and
 Tegra234
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Jon Hunter" <jonathanh@nvidia.com>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240403114208.35147-1-jonathanh@nvidia.com>
In-Reply-To: <20240403114208.35147-1-jonathanh@nvidia.com>

--b22096a8a7b5cc5c8f3d4d91d1d45c715f103bcff9dec75c350963c40108
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Apr 3, 2024 at 1:42 PM CEST, Jon Hunter wrote:
> Add the wake event for the EQOS ethernet controller on Tegra194 and
> Tegra234 devices, so that system can be woken up by an event from this
> ethernet controller.
>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  drivers/soc/tegra/pmc.c | 2 ++
>  1 file changed, 2 insertions(+)

I don't think we've ever tested the EQOS on Tegra234 because all of the
upstream-supported platforms only make use of the MGBE. Do we have any
platforms where we need this on Tegra234? Also, do we perhaps want to
add an wake event for MGBE?

That's not to say that I reject this, just that it doesn't currently
seem to make sense for Tegra234.

Thierry

> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index d6bfcea5ee65..91d0ad6ddefc 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -4074,6 +4074,7 @@ static const char * const tegra194_reset_sources[] =
=3D {
>  };
> =20
>  static const struct tegra_wake_event tegra194_wake_events[] =3D {
> +	TEGRA_WAKE_GPIO("eqos", 20, 0, TEGRA194_MAIN_GPIO(G, 4)),
>  	TEGRA_WAKE_IRQ("pmu", 24, 209),
>  	TEGRA_WAKE_GPIO("power", 29, 1, TEGRA194_AON_GPIO(EE, 4)),
>  	TEGRA_WAKE_IRQ("rtc", 73, 10),
> @@ -4210,6 +4211,7 @@ static const char * const tegra234_reset_sources[] =
=3D {
> =20
>  static const struct tegra_wake_event tegra234_wake_events[] =3D {
>  	TEGRA_WAKE_GPIO("sd-wake", 8, 0, TEGRA234_MAIN_GPIO(G, 7)),
> +	TEGRA_WAKE_GPIO("eqos", 20, 0, TEGRA234_MAIN_GPIO(G, 4)),
>  	TEGRA_WAKE_IRQ("pmu", 24, 209),
>  	TEGRA_WAKE_GPIO("power", 29, 1, TEGRA234_AON_GPIO(EE, 4)),
>  	TEGRA_WAKE_GPIO("mgbe", 56, 0, TEGRA234_MAIN_GPIO(Y, 3)),


--b22096a8a7b5cc5c8f3d4d91d1d45c715f103bcff9dec75c350963c40108
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmYUFI8ACgkQ3SOs138+
s6EIUw//V8xd3GakiuroXA3G4m460IO4Zb/TKFHGYl+EettFDfibH3M6Cdc12zj+
cFxw92SeuTtgUvvYgtMok75YinGTnYi+GpsKKaeXhtsIUIc5Gv0YxNOD3lbEWut4
2VWJ6oU2H00fP8CBLWDHcO8Ri9A/aTb7RrE15z9xjpSdNMYSlAriiIzunGAciCLL
Hq9EQbVdq3QAQ90Iv4348jyTTAUD0H06qX9QpqThqZF5jxFKoEARQj3h5StGKI78
JWdiaYlUmBSSkYCUeol1hUhQW+UqbVDFhqvd30/KJ22PiqegYAr3gbGn7Eg+TrBY
BeZQkCyLLihlJAldoL5pVh5x/HpGEOANMTGWehap4AYPyEjAnMHYEVQU3EjJB6Xm
Qts+ebWKu/eZQiUzJcObJpxaKVpRNpiuHhrDltFl3xkoh2gzA7hZoHE7Y8QZ14fL
z634oXiMzbx2gNTSnZyPxlrClZ3vabvqnfSSP/ZbxIYh0cRpNJQHWDK3dLjoMPqT
hcytk8xp7luniMzUziC7Tcf52nGyNbwyft3rEiUsNUSR7upji9dT5eJlH2F3FnXb
pE+E0EApDZt7np3WrJjV7Ek5+NyI6eybkKIksMBOBcOCNfMISi6yNCe1hleBrzy4
avSsdDwfMGv+VFOs1bJYSnID9VJxnxCDYI1JZdQlqc6+M2c6Oa0=
=jSXJ
-----END PGP SIGNATURE-----

--b22096a8a7b5cc5c8f3d4d91d1d45c715f103bcff9dec75c350963c40108--
