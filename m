Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81A12261D;
	Fri, 28 Jun 2024 21:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719610064; cv=none; b=N5tGlaa6T7IklBnGDwKTzMskepMKlDCi4lsuPza/NXO/P4Nf6HMXjF6UM2uU0RLp6K74QHp8KZ4Odb7Y4puUkcyBogu1Dl0T27yIbyEIcaNAE76BKeJNCegvh5GUKVbzQOFpgbgileg3Y/Z4VNzs9gZtlU4hGzqxZYsyP8Xy1sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719610064; c=relaxed/simple;
	bh=gLCeMcW/W5xH2loF3OJCF3hppfcfcxUYscsZ4ttuHHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z4lZ6w0pYbFLxJX4QnpFqy9Ux5I7f3TZLkBiGoztg+CcTWBi5+pFMv/6OlA0WouCOsawIbLY9YJua43jEdwLW2+oJXO1b0HP6HMIiCvPfUyw7O/Y8atMWLkUmP5wo+dxWHPany6I5WlY7s3jVolIeaV972DrUYTQy9Ef2+sebXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h8z16KLh; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h8z16KLh"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4256742f67fso7995505e9.3;
        Fri, 28 Jun 2024 14:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719610061; x=1720214861; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zgEdlzw9XjsUTNXXXaGCI8dP7taYT5nGJNjUj9cLM84=;
        b=h8z16KLhjo0rT5Tz9geQl4UaO+kmIPpR+q2jAZFjv/v45HgIuFE++P2E+LU1ohHYxk
         yKwxzhPvZtKTln7ZVlRYfQmiKV8UwDRY+d3tDXXPtCc94iHWj1cCBGrcqi7O5DlwnvEd
         VpepSuGJv2WdncOLlhFNmz4zxMuO1+Eobvaa/xSYPlL7fvYeGyu9p5heyZOR0RRrTp5p
         3WCKq15LV2LTTr6X+VSc+BbtvSPvFtSZw0LYV6BoR/pKDUcWz7t1P5auPqIVU5WYN6YI
         W73p0tf9BVlnf9MIQu0U/wPvUvX9G3bpYWgIQ1WQxvhlau0mxU+968h+bI2uY2PiPSqu
         EF0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719610061; x=1720214861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zgEdlzw9XjsUTNXXXaGCI8dP7taYT5nGJNjUj9cLM84=;
        b=c+d9hVQa2+wXQgh3FC8obgWd9Am48W/AOuwn2hK2eX85NxTy+SObyVvTbbLZ1g5FcK
         5MUJiti2tiyvT2MDrV0Rk29CcTjpufgAusWrPlu1BUn8YxpCAdq9bjv4hkFgMCSGSvBs
         JuOp4ri3pjCC6taUuvF20kTMZyusgnzt7NN5DWEmJ1nm1Yi7b19QrdAuoYEwx66YEKwR
         3hrlTgh5fU0WhTINzxGmflfAM8Ls1Q0RrM+V45ExoK4dqYfKG1Azbcp+Sw43JBhQpwU5
         +SVstOenAmTgR0WjYwplPyEnuWFMG+gDd8yZ9UlAKcrPQsgytjeDsV/sdz0mqKyC1wd9
         olNw==
X-Forwarded-Encrypted: i=1; AJvYcCXjPHOn8fcTNmLkxhiiotGZUPYsnwVvVuibCdXgmVU+VNkpNInh/5H4aInhGLCtEplPazj84EtjXtz69ehO2SBAa02Jl/upSHms9vzGcj0GgdG5tyz3tCHBfIXM/o5efBcAJNYb9ESeGt0=
X-Gm-Message-State: AOJu0Yxcd9JLpD0mZ/RkkdKooHrHUmiCDh4PV3E6x6AY0236zm76cwp7
	mvLbGqz1XSzY4gp+Dj1XyLcc7Ggg+Swnjzm5aWVSzMxpzaS5sH4997KSng==
X-Google-Smtp-Source: AGHT+IGcI4XOLMUI1tuUrwBvOB03t8Ul9sEUloMbNhm+P/g/OvOVuarVraZRCYtkc28ZpeI9v7jy+A==
X-Received: by 2002:a05:600c:68cc:b0:425:5eec:d261 with SMTP id 5b1f17b1804b1-4255eecd2bcmr67846315e9.34.1719610060701;
        Fri, 28 Jun 2024 14:27:40 -0700 (PDT)
Received: from orome (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0e169dsm3326199f8f.65.2024.06.28.14.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 14:27:40 -0700 (PDT)
Date: Fri, 28 Jun 2024 23:27:38 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: sikes@qlogo.org
Cc: jonathanh@nvidia.com, kkartik@nvidia.com, rdunlap@infradead.org, 
	frank.li@vivo.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Fix warning in tegra_fuse_add_lookups
Message-ID: <2etkg2arvsxtjgoxuaks34th5llpe5kn3bakelz7naeghexval@s5up5vt4a5gk>
References: <20240616073721.5696-1-sikes@qlogo.org>
 <171958790864.2433364.265100419611870394.b4-ty@nvidia.com>
 <xyxjlp6hb7jcwlhbm4tpmt5npx74qpuzybzakdkev6ta2nl6go@txh4ue7faenk>
 <8963AF0A-16DA-46FE-BAA9-602752410E8E@qlogo.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ftlj6pznsxb4jvop"
Content-Disposition: inline
In-Reply-To: <8963AF0A-16DA-46FE-BAA9-602752410E8E@qlogo.org>


--ftlj6pznsxb4jvop
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 28, 2024 at 10:17:13AM GMT, sikes@qlogo.org wrote:
>=20
>=20
> > On Jun 28, 2024, at 8:29=E2=80=AFAM, Thierry Reding <thierry.reding@gma=
il.com> wrote:
> >=20
> > On Fri, Jun 28, 2024 at 05:18:48PM GMT, Thierry Reding wrote:
> >> From: Thierry Reding <treding@nvidia.com>
> >>=20
> >>=20
> >> On Sun, 16 Jun 2024 00:36:57 -0700, Jason Sikes wrote:
> >>> gcc 14.1.1 warns [-Wcalloc-transposed-args] when sizeof() is
> >>> used in the first, but not the second, of two size_t arguments.
> >>>=20
> >>>=20
> >>=20
> >> Applied, thanks!
> >>=20
> >> [1/1] Fix warning in tegra_fuse_add_lookups
> >>      commit: f56da7f4048ff41cb029a715935394f5958a825f
> >>=20
> >> Best regards,
> >=20
> > Scratch that. Looks like gcc isn't warning correctly here.
> > kmemdup_array() does have "size_t element_size, size_t count", so the
> > existing code is correct.
> >=20
> > Thierry
>=20
>=20
> The order changed in kernel mainline recently (very recently).
>=20
> Commit: 0ee14725471cea66e03e3cd4f4c582d759de502c
> Subject: mm/util: Swap kmemdup_array() arguments
>=20
> Apologies if you received this as a duplicate message. The previous was s=
ent with HTML, and Vger rightfully rejected it.

That commit seems to take care of the change in fuse-tegra.c already, so
this patch is no longer needed, right?

Thierry

--ftlj6pznsxb4jvop
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmZ/KsoACgkQ3SOs138+
s6HsrhAAlfElg5d6FHc+qYUMpOZvIZhdsstYPGkcviH0IcNXE3biMjnOuu149hBx
oV2UL9sQ17AOVJQvMvKQTKQ0tSvokAjrJ9lKEv/1zH04P1cWKezO60LbyYKN81Lc
/d6SRS0GTenO9NKolUEN/rHjMTP0zSLywW73YrdnoGO+LuAZZ+L6ultZ4NQbzesb
/Xa5m/0Rw1lTptPYCiS5Jpy+AnNDoYpncs/R4JUcuAc7E1POFzQ+Er7KhceZnurA
idXksG1btbMJ8gDlik48eMtfXk0AhJznFX/XXfUSODBBiYZldQBWRXKQWxKs2WOW
XNmEi7IVziy85L4KVAxgALZsuunI0ao2Uvkbx3z5vSqMefg0zYQ9B7xCObQxX/1l
bXwazMxcVBLz0DC4Tm94/Yxjh7qc0PRtU3w2fCCP4iLKDB9Qt81GsA+C8qPe7VUS
Si2DY+Gc3UNBCj8URQfTZVODqHWX7UX+JYsLOkm4b+6S8EHU6rMG8ps/3u3jtgeS
3mHeTNs6sUGb0pnc2KiFmJrpcqC4Ibyb6rSe7f2CmY2zbgAMjwxUPi9So8r7c6g7
Q1rvjxrtJlLQd+mn381q+LT4t0OBXSe3PfAYJhhmnmnKelwU5ER33Hunmnlnrvkp
ZAb08C42+7TqFYospO6O8kG0wxKN3sXDXWAD1w2sl355nbryr5I=
=OehG
-----END PGP SIGNATURE-----

--ftlj6pznsxb4jvop--
