Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4654681AC3
	for <linux-tegra@vger.kernel.org>; Fri, 19 Apr 2024 11:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713526245; cv=none; b=behJbMVPOSHf4yn2QX/62crXvnrogiNPWmc5Wf6YGqzmyHDP3T6Edg8wY35wYxGdG+8xzAj+RvZiAyBHuKlboLkFqvciK37ZT6J+9+QJK1qw28r4tDwOStwnGPNZY6sR0lQXJqYwRj7QG7lruPgSwP0XTHX/MTQIpGeL1WxaggE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713526245; c=relaxed/simple;
	bh=kwfvpZbsmfQ/Z0kbLRCQuJ7dA55NUh7QIk/bQeHZcl4=;
	h=Content-Type:Mime-Version:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Bi5AodHTDhZTWlHPdZSTOWWxCxrg2vEuwXYZpi+1dlzg634ykgzu4DA/jKaNmWu7Igr+ys/OFqTF++w2mJFjmZIG9avjvn8JX96+qXX2GbfNrCwsqsYWJzRivdQBKrikVmh1g/BryD4Cp3GJb2F+qqn56/I+g6y9/omgb/D3Js0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jw5z99BF; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jw5z99BF"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a55602507a9so226177166b.3
        for <linux-tegra@vger.kernel.org>; Fri, 19 Apr 2024 04:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713526242; x=1714131042; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=F/Af4iWVQkyplM950J09LUOzYoGi6+0INPm0Eq8Mzsk=;
        b=jw5z99BFpUM482dJ0bxQPsOl8KZT/4VqLUU7TrGFmALOBgO/0qDZa0Qkf9WKVuzaZc
         gIAUZBB4v6Vx5LvkVABA7ZrykrHzmK3r0QPrg7LYmpwcort9DdCXux4JfYshjgy08pCD
         8CPXNRwiAdzftU6Hku+2vV8G1r6/RjpQKdsEyjjtNbnwme09w0/PEArS94VUVz/m1iOg
         qM6EIz4vGddAu3BmKC2CQ3RP2tj77ZOqVmUGio+SO8lbPH8hfjcedEktup/PyulaxWEa
         SQr80SZe/2/7lxntIsecZ+iq9mMfgPNSWZYO+IxYS9JLOledcosDoDlz4xbhGh0ovy6W
         E48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713526242; x=1714131042;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F/Af4iWVQkyplM950J09LUOzYoGi6+0INPm0Eq8Mzsk=;
        b=dlUEGWT5jRgbkeXEbrqKDEZ6b4bSdD+AZHVTGShTDZkL41aI1Eqp8JpKCwk6vWxo/i
         fYbMyTHTBNH/F+OsVcjB+7cnR+y2i+mRhWfmkUFllBcGCdqvqySC2Woix/aQyFehiSU2
         YZ0Ow+l+JoEnW90oTwa43duL0p3aB+64bzOiwnJFP7mEwvSsWuomMdwGdH/1jgyfH8VI
         mBsncrvPMt865SzvlaUlrX/Pg1G1OSqEIUh6P7Rvw+rHexbzUgaCIGvT7Jljthzg8Aut
         mUvAYyxJJ9nutdqLBaVETj7grkdqlvBLOaMbIA/lpb0owXbFMru9z0bNDLEO+Ew1dk5R
         s88w==
X-Forwarded-Encrypted: i=1; AJvYcCVVGAOaynS8lvzDWObQYZLJwIgu4EMCgDbEjGMrPH5fH0saIIz6nujhDnxj/egfy/wUM1WKM2IfMOIuQhMqN8l5GHAobz/vuUzV/vs=
X-Gm-Message-State: AOJu0YzVy4JUBLs2oMx70HYNIZ8EBPBUZt7ne+JajHWD4yRuNY1XK7s4
	bB78f1d19RTcB06ASaK1IMhI3+gYmWT/PwDSZIemV2EsZYquZox8
X-Google-Smtp-Source: AGHT+IGxIy+XoPWxY4/ipzxGIzuoyUFKimANifXZ+IrQzWpLKbsps2b8VE4siVRoEo3QO8uLztxs9Q==
X-Received: by 2002:a17:906:52ce:b0:a52:5613:67f8 with SMTP id w14-20020a17090652ce00b00a52561367f8mr1206770ejn.10.1713526242317;
        Fri, 19 Apr 2024 04:30:42 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id qq22-20020a17090720d600b00a554f6fbb25sm2073529ejb.138.2024.04.19.04.30.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Apr 2024 04:30:41 -0700 (PDT)
Content-Type: multipart/signed;
 boundary=34e3a7076dcafeede771bd0830bc78b0060c8dd6859fa85166058ee68cc4;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Fri, 19 Apr 2024 13:30:41 +0200
Message-Id: <D0O2CVZTE5EX.3QZ30B9A58W32@gmail.com>
Cc: <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>,
 <kernel@pengutronix.de>
Subject: Re: [PATCH] gpu: host1x: mipi: Benefit from devm_clk_get_prepared()
From: "Thierry Reding" <thierry.reding@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 "Mikko Perttunen" <mperttunen@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Daniel Vetter" <daniel@ffwll.ch>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240409165043.105137-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20240409165043.105137-2-u.kleine-koenig@pengutronix.de>

--34e3a7076dcafeede771bd0830bc78b0060c8dd6859fa85166058ee68cc4
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Apr 9, 2024 at 6:50 PM CEST, Uwe Kleine-K=C3=B6nig wrote:
> When using devm_clk_get_prepared() instead of devm_clk_get() the clock
> is already returned prepared. So probe doesn't need to call
> clk_prepare() and at remove time the call to clk_unprepare() can be
> dropped. The latter makes the remove callback empty, so it can be
> dropped, too.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
>
> the motivation for this patch is that the driver uses struct
> platform_driver::remove() which I plan to change the prototype of. Instea=
d
> of converting the driver to the temporal .remove_new() and then back to
> the new .remove(), drop the remove callback completely.
>
> Best regards
> Uwe
>
>  drivers/gpu/host1x/mipi.c | 17 +----------------
>  1 file changed, 1 insertion(+), 16 deletions(-)

Feel free to take this in through whatever tree is most appropriate for
this ongoing work:

Acked-by: Thierry Reding <treding@nvidia.com>

--34e3a7076dcafeede771bd0830bc78b0060c8dd6859fa85166058ee68cc4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmYiVeEACgkQ3SOs138+
s6G++Q/9H5Xt14Nf00X6R+jSrEl3odBJibivkMsacrj2MFV078JaOoHZZE/72UKT
/ZmGGK8O/HkLkQ/RAn3YueH29ZXhYe2c5YwCOGpQVv6F9P77ivdtG+6D7LfI5Lqm
mJ0jel/t4zacqv2TuBmt5zzQPoRUakgGsbdIgItKjtLrDRw3aQBj7Ra+h5/ere5q
i5JfCrWuxfI+qh1aFXIUMho9FM4QRcxcWiIwbWQehgxLHzbwDVhoheM6cIUpiAQ8
eZd99+fTZFGgey9iuMHemmPMkXXDcbBx8dG/wmUWLDoqsIzfb7Ua7qJwkLWJ5TXz
pb4nZ4GWA0JTIIcvHCzxnOreVh8OG/HTes0EB803nyDO8sud+GfY8g1mGFUwYW67
tHzHjrch1dFpp31JdWoGD1PTFEdmSYVdvs2+Gh33Lt1Git2xnpezk5vLjOeKFUG2
FzZoXfEsDK1qOCqPavtmhGUSwy/1k5T4nGO3FxbISMzhvweUIwMrAU4i7+yFGGhr
z1jT3pFAZVQVGOL9DPzmWLn66kf/V+1rXhsa/+i3VBV6x9q8FUff48pI3+OgVaqS
EqNe8whO3QA+DJ6n9uUr5NdHyyjmfsN/SyotAwDS1d2Leetda/+U+KCuIjz/T6lE
i307WM/k0jeDh/V4jkalyuNkFZ1xJKFElsDaQtcL7wENaWTtafo=
=bepR
-----END PGP SIGNATURE-----

--34e3a7076dcafeede771bd0830bc78b0060c8dd6859fa85166058ee68cc4--
