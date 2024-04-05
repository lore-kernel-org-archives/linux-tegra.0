Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188872E401
	for <linux-tegra@vger.kernel.org>; Fri,  5 Apr 2024 14:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712328104; cv=none; b=dWQYW097w9FOB6bQ4YdvmdytPU5rOFIPd5ujs1wAgpLEhlmYB69/dgTiyCVgSBNQY0S4ur+D3bUCm9GUYe31dCz300RkEeqvOkzEFFYmivTthDcf3R6FpnwFfpVrnLME2iorljOS9duxqVm5PVf1wUhxuQBC3E3Pqav8ZTbmzy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712328104; c=relaxed/simple;
	bh=axyKrBLYJU8bk0ChYvyMfzSBuhTwUECQ2nUOdMbrFLQ=;
	h=Content-Type:Mime-Version:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=FvbiIiJ2+GnzXXrcwZm++UbBjDR3/7o4fIYI/stHumfsGZkkX99MZ8JB7oAArnxRhDUsOzfxekKvq9rdqZmpUg1EdF6D2UFbcIF9K26F5S2Y7NJ1ZWcQHgKp9BFYOUKKHJ+jxlC1JRGdgw4u29k0/gD+e17gJd7HOoBQPJX/Tuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kbCtvvHc; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kbCtvvHc"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-56bdf81706aso3117170a12.2
        for <linux-tegra@vger.kernel.org>; Fri, 05 Apr 2024 07:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712328101; x=1712932901; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lux9770p2g4yYGoDpk/hDoVbiDQ5CWxnulzXkmZqTfo=;
        b=kbCtvvHcmc1Go4HlLJ+pHU8SMdgoDHCX+1UN9dbjoRcn1cCbXj2iV36CziTEIpP9DJ
         5XFIsa7izqkufKLwKi7CzAXqOI01lrwJVQG4mf1lzROHdYSBoWGaA20TFuy9/4ux1CZ2
         ef3/FVTgUCjN5HvHp95CYrOvsJFbGfjsYS0+Iz5wJPCfZA2rWABqTAL4/Epgza6P5I9S
         nwRhJ1NMP89TQtqKJJEOerY04RzhBqaOAzyrfpPehj+PoT0DH1hCahmB0jVx0BYqrpi7
         eTRbqgcR1DMJUXeO6CcMHpOFEDlabfMpyJ0Li2/ZjmIa8rawKV4jDTwPwacovmZpoUtI
         Xkdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712328101; x=1712932901;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lux9770p2g4yYGoDpk/hDoVbiDQ5CWxnulzXkmZqTfo=;
        b=UYfInmR2kkKs7iX+4n46U7bbAfnEG/SqoKLGlzagzn+kjbLvJymfmKs+Q1fcEn0FBt
         37twPeO/HU56x1li45l7IEJ5Fc5nyfJOx0FFhJ0d3Y16tMW7JKiZVhnHfjsk5dTy+rCo
         cmdmQjVYTv/9UazZ4nbtcK/Dyayhkdi02+tiOfG4CsYfW8/qdE+LBjd5gqZ5Idddio5m
         z9+U5RojoE5GrsdLynFfT7zh7dGAahorw72jIZ1saBuPgDcSnCVZyekpk7hd1/+7G6qk
         BVxA2Caixj38wr8iJLl5/Ld14Qchg3mi8J2xainTL1SFdm7If0kXdWYoOLRHqMm11C8L
         nYxA==
X-Gm-Message-State: AOJu0YwHfRgIll90SZeAXSMFyknkFnDZpfiV93TkmU6dwey/MCUs6G3U
	sSbtw/691ol2Gx2K9p5AygiSmOIgBCAGxWkNDOZUAOzpBeCwJ5XP
X-Google-Smtp-Source: AGHT+IFL88rv5Z6iA7KwxxXkNqA2z+OsN3A8mITTssz/aUkcldrWeMAtS0XUPo3Kg9+yZi+D+ugT6g==
X-Received: by 2002:a17:907:78d7:b0:a51:9911:eba8 with SMTP id kv23-20020a17090778d700b00a519911eba8mr1131483ejc.4.1712328101402;
        Fri, 05 Apr 2024 07:41:41 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id d9-20020a1709061f4900b00a519054d7ddsm905357ejk.61.2024.04.05.07.41.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Apr 2024 07:41:41 -0700 (PDT)
Content-Type: multipart/signed;
 boundary=27974007a207ffd0e3d4f9bc7be25653a3c1f0d54297bed1813bc73cff9a;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Fri, 05 Apr 2024 16:41:40 +0200
Message-Id: <D0C9NHR6M7S7.2VBPKXMPBMHG0@gmail.com>
Cc: <linux-tegra@vger.kernel.org>, <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 0/4] Improve robustnes during initialization
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Marc Dietrich" <marvin24@gmx.de>, <linux-staging@lists.linux.dev>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240405140906.77831-1-marvin24@gmx.de>
In-Reply-To: <20240405140906.77831-1-marvin24@gmx.de>

--27974007a207ffd0e3d4f9bc7be25653a3c1f0d54297bed1813bc73cff9a
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Apr 5, 2024 at 4:09 PM CEST, Marc Dietrich wrote:
> This series against 6.9-rc2 improves robustnes of the keyboard and
> touchpad initialization with the goal to eliminate the ugly delay
> it the i2c client controller ISR.
>
> Marc Dietrich (4):
>   staging: nvec: make keyboard init synchronous
>   staging: nvec: make touchpad init synchronous
>   staging: nvec: make i2c controller register writes robust
>   staging: nvec: update TODO
>
>  drivers/staging/nvec/TODO       |  1 -
>  drivers/staging/nvec/nvec.c     | 39 +++++++++++++++++++--------------
>  drivers/staging/nvec/nvec_kbd.c | 14 ++++++++----
>  drivers/staging/nvec/nvec_ps2.c | 31 +++++++++++++++++---------
>  4 files changed, 53 insertions(+), 32 deletions(-)

Overall very nice cleanup, thanks for tackling this. I've left a few
minor comments on the individual patches.

Thierry

--27974007a207ffd0e3d4f9bc7be25653a3c1f0d54297bed1813bc73cff9a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmYQDaQACgkQ3SOs138+
s6FQJg/+OMsJvyNJc9zGXH/fo1NeO4S3H13VXexf4fLF+RMRvLcIQRkaVx618nX6
g4Pd3M+j5XI+UAo/14Wph2Zoh6U6PSuS4UAXvlt2tDCRct7XFznTz3leU2sLffxh
aVAW9IOJLtApNb5kAO5ZCu/gbgXDy4Vw4QYdzuJyAPl542HsWYXbyu0WfNuSup/W
OOaa6+wBCTwPOpSMbyIBCAmeSIj/Ge6AC2VOpkPviR9oo46fX1g16fBvLIKIZ7ja
N+aj86idy7hz9c/27nSbtJBdLYfuc/zUC1Gv/Embe0/tpJ0JexX+OfPTM9z4niYA
ROA+dj+oyFTlVoV4I1fUDnaZ/4RiuVQd5/57Z4FXNAD5LpuBQFZZvab9VznZBKL/
xrGkNEmYcvRLjxDJwohvnfi+9+lvDQA3VRBRlS+n/qsLdG1Q9lyTEoAYB1YrsFvz
SZJ1Vse0Oa30CUTH+q1Yre2WI9VPzHYvph0YR2E4MbA6HG9PIOVhn1Z/tnq6wbdP
B2Ahyn45O0Izkr2tjOxDvr3dpfr5cWFWCo9OFosxwJJvukIMGm9NgnZgYzibV6jD
8p/mzcU9hgX/oKN1iyvKLIt+X41H0HizPYCipKZYm9bTkqzShdkYDH99uBz5/9WX
t6moxrfG2XJtYr7Xodw9MkrDrDNRRKwLt9nc1GlYVGKWJyXVrmA=
=aRuy
-----END PGP SIGNATURE-----

--27974007a207ffd0e3d4f9bc7be25653a3c1f0d54297bed1813bc73cff9a--
