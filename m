Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660923806C9
	for <linux-tegra@vger.kernel.org>; Fri,  8 May 2026 13:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778246589; cv=none; b=LDtnvu17MJ7bDs2SEnrqKpJCrbSQt3CPvp5nYjc1pWG8cL/iVwg5lMyEOIwLUMOzAzacPw2HNoSZnYbEJT239xHVC2LWWOl06HY75uOpRZyHO6NUecSnYAEWpf5WkvYInvePRw4BZOOKnfHkeOZTXSoELXi8B3pAHnBYqPJSjZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778246589; c=relaxed/simple;
	bh=pQGCzRlQrkfkEgpxdgTufrDmEoOJUM4jF7iGXLAtU58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A51AP9qyiesgrLL9hCdcAhs/iZKxRFG3xYBJxs7XXbR/ErEf4F9vqSNCEmplb2mJMbpMsilx3a7+vJeGB4j1XlA9MhhO1aC30vlwHPJE1NtfGp1cTi1LBR6wIgIF5HbZCbl2F/I1LkeuaUijKwRltWoE88NlwG7ZOYgYT94Kp8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H0rV0oIJ; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H0rV0oIJ"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-130b2295ed0so5842996c88.0
        for <linux-tegra@vger.kernel.org>; Fri, 08 May 2026 06:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778246587; x=1778851387; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pQGCzRlQrkfkEgpxdgTufrDmEoOJUM4jF7iGXLAtU58=;
        b=H0rV0oIJDhI99YTezNdUliwkTh5+Ia5s4rbBIDFGuLjliL8AnFo3AVxB8YkClCbKRW
         XsviocdbiqHrN2mBNBzSF6yHQ74Wv4wJYPE8ZHAia9SOjL9V8huUnJGsWHi1K4QyVJjp
         O5WvQ15f/YbPSbtWu41kF6cr61oULELCTn0zB5rYZdt7+Nnu6FrUTBk540CHT6hRb+jk
         xwVdKFbXj43cMrJ5kZkO7Z4dTxxOFP/8fBu6DinPcsbwIXkoQDK+elsNaVEWzE8kOmNi
         M34k3fxrFTmJMv6drnoe70WasN8r2a7frIpimxZrwu0Qka6rsX79sUY1hUSTpzzXKlwK
         hJPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778246587; x=1778851387;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pQGCzRlQrkfkEgpxdgTufrDmEoOJUM4jF7iGXLAtU58=;
        b=S/hL+UUCEYcqqjWp5MsPgII0+6jzsWTO4SGWg65rj0lpJO2G/ggnM83dBytGVccrkT
         l02JHdXsfubXbdUh5vuJACRiCftqs1VS9trBkDyFZHM67PB6SypOVkJVJpN31lQMEjGE
         VT2shS7QFdhHYKRl9OjsUpdpaeMwLFbRALZQskM4I1KXTZI+y6L9BE1ypVOoIdfpwLDh
         bddRbtGZnEmp6ndkg/0rKxVLrFK1sjYs5ZXAUIPmiZ5NEAT38OtcDTD91Ws0OHpcVHYT
         6anG7OxyW2ihMvR3Sdm9viWMPOX+M4s8kg/GJnB0R/eHrvk6YJotbOWhkMWaox2gfrpO
         flpQ==
X-Forwarded-Encrypted: i=1; AFNElJ+KAibe2hPqd9pOngkwgBqmGP7NsZfRlY8GpgW1Mgc15oEl+4cjGwsUP/glVVvKFijqRyJ84DqdnoCN+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVxCstAWufdRf7IQPuvsOOWVY+GkHDlAqAphUKdtk5Y5fIJM98
	KMJpCxMdO76jUE/zoBcomj5rgOVlgAf5Vv56Qcg0Kb7CTCTa+VDbqmKE
X-Gm-Gg: Acq92OGiGT539kGLV4TF0mL0/M4dPB1fvH0M7bKwBFVjuizCeYteYW7ZC3pLqKH1FWl
	IrOPrJ4YopvYf7FFy9QUP7DeaCQejFQ6LKCLzOrK77dfWG+mcwTdWZbNAq73eMyldmtejHIp2bG
	z+Fw0DuU1Umdbu3nTQyHro9FoF1+Fu4hMB+mPD2GrOAwqax9e9kdykvnSOVj/aLL4eWL78PMSrT
	cp84fj989tDaKSmZbxvq2MpA5/Ux70AVv9ZvYesxQ3jVtYGOoK7DdZboHhD1C4nJOF2EWyhefIq
	a+0e2YpjeDm9LnyU/qI5YNOB4zm5B+STJbJTDbCWAiML744i8o26aBcS12Qylf9dCD3gxu3ArWi
	V/mjZ6MTxYtqfUzVxWknuJOi/Ki6PY/UOiB9XkvmeXHaSKXyonIcWVELnbUoHgdImI9KoOAjFko
	3behcDZYwqgBoZ/Vg72+rM6uFmeEQlHaqUIRNDEWd9SU/IV7+CrixIt0xzaeMGUgPjsyHx23ntd
	I9BL3b6/svTXA==
X-Received: by 2002:a05:7300:dc04:b0:2c0:e404:8b08 with SMTP id 5a478bee46e88-2f54b79a394mr6742776eec.29.1778246587236;
        Fri, 08 May 2026 06:23:07 -0700 (PDT)
Received: from orome (p200300e41f291e00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:1e00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8859e8389sm2162307eec.3.2026.05.08.06.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 06:23:05 -0700 (PDT)
Date: Fri, 8 May 2026 15:23:00 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sheetal <sheetal@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, linux-sound@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: tegra: fix build regression 32 bit kernels
Message-ID: <af3jqFYgesIHY-J5@orome>
References: <20260508080031.4064272-1-arnd@kernel.org>
 <af3cT4GSj5rxyLaM@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kefzjommscjjvan7"
Content-Disposition: inline
In-Reply-To: <af3cT4GSj5rxyLaM@sirena.co.uk>


--kefzjommscjjvan7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] ASoC: tegra: fix build regression 32 bit kernels
MIME-Version: 1.0

On Fri, May 08, 2026 at 09:51:27PM +0900, Mark Brown wrote:
> On Fri, May 08, 2026 at 10:00:25AM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >=20
> > Compile-testing this driver for 32-bit causes a build failure:
> >=20
> > x86_64-linux-ld: sound/soc/tegra/tegra210_mixer.o: in function `tegra21=
0_mixer_configure_gain':
> > tegra210_mixer.c:(.text+0x709): undefined reference to `__udivdi3'
>=20
> Someone already sent this.

Indeed. Acked that one too.

Thierry

--kefzjommscjjvan7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmn947QACgkQ3SOs138+
s6F7vw//aNn7q0sS0rQdV6RN53xy2gcr/pnepFLOgTvSLlYeN0dRWc4Ku5eW4gbJ
fzv3E3/pA241F1Jn2khoI7AIqxRkCzYJ+XbZT18b62dOgp0wqfDJHbXrvCMnry5o
Giw9XH4jK1RfcL0wKd3rjGu/ZdfYomwRlMyZlJZnvlJK59ylAYNVzTdJTvyxGgHF
jRnJWaxrkNJtXbBB/Y85emezP3tXfg50qQQo/oK1FSE97up/8XNh0vU3FKU0/NjF
yBt4Kw88TrimljQJXkuVmDssy/ZtOQAftnjN3umyfBctr5cWS7r7YXqnJM29wkX1
RTD2ZqQzp4dtuXR4luupihzmB5DCMTTAignKpm/26u5eMYz5dX2snrFlAtgNHuX7
Taua4pF9USK2R8vzCB+5qltVcYYVI0AwnhXhqnyQoUHFMwBH6xkIFnMt6HCH/iJp
LcYixQ5Eu/XPpElLndG7gipIv+0e35JH8EJ2xh9LpuXgX1kzoYffH8wxtycuZdg0
0extbuAkZx/eINaKA2hJII8o6cmS6pbvI67Fzpk+mMyCS8YvDKTt1dxMfBgygZSb
8R+SVU9e1etfitf/uB7pOQl411G1ZjKocWp5GAi10Y2sjV9isR7AbiHcmP8G9Ydv
xf1NgQlN6uIydnrYdA3f8IbRz/4pHq16prfgogRQa0FeoJhZmLU=
=5aZL
-----END PGP SIGNATURE-----

--kefzjommscjjvan7--
