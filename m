Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1A218FDBC
	for <linux-tegra@vger.kernel.org>; Tue, 29 Oct 2024 09:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730193817; cv=none; b=i/C4N9jo2TStiJg8x7iUgRrraIRouZZ5LCyKZ3o2Xx8sLn4MTNet9InPF7lN8fK62qeLQeIBJ9fKdfrs+y7Fel9Nt9u9FEcqXU7J77+rhZg+cHNyAivS7zgiV6VX0u7oDYvTGij0q3aqV9VOAN6CLiVIouKOA9nU4l/dxXZdo+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730193817; c=relaxed/simple;
	bh=CQnjdf1BvZTH4XhAxhOmXjNSVP+htdTUSRHZ+NtHwTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=naJXTh4+M9aMDM2buRmFaMYfxKssrIIHeVOWPWZ0zi9YhIo7yLJ7chrnzi3Kd0xWyL2xNWWo0k2O7EWjVTHBuqIfl00f66JrOsCptaWMsciUsjZiTurdvAY524+w22I7EN4UyOImiq1XQ9N26/FOQI057YJ/ELoxx7dFlZyNeAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=XF+poxnT; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="XF+poxnT"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37d70df0b1aso4164331f8f.3
        for <linux-tegra@vger.kernel.org>; Tue, 29 Oct 2024 02:23:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730193813; x=1730798613; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CQnjdf1BvZTH4XhAxhOmXjNSVP+htdTUSRHZ+NtHwTM=;
        b=XF+poxnTTz1vGFpBgPTmr9VvrkdSdCRImtWmvhGwVKVKlAFX1q8jeTWojm8No7xFr1
         +hIesp/w/cUFvSrGLu7gB9iu/Gfj57hE0SPoMei8L34xTaTkHSNjZuS8Eld4O55dPMV2
         n0uszf7ZbHqnRJZIWBFxAAb7vJ8BOXc76HJj1amAgooPMnD6C9EB7V9vRaPaB1PVSA+A
         bw47U72GQuq4MmrrtROEtxhhQ+J/O7a5jcvnjZlopP8WBfpKT8s+dcfIl4sjqP/giA26
         CKhPEhfMsBjPJzRg746fCUw17Cy3ZgTJyf3BzN8UI7bcFzg57Iuvg8zxUteEtuBjEhXs
         eeCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730193813; x=1730798613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CQnjdf1BvZTH4XhAxhOmXjNSVP+htdTUSRHZ+NtHwTM=;
        b=w9DGCmTFCaLkV61OH+tARI6tYQWgOtZo2eeQwawgXZ4avvR7rko3iODtuX/nur/7ef
         m76aovrWgUBgXZwPOmkgkGSJYXgL51AfBPKcP3YOcl6p0hhAdrsR7aHHUVPGBxG9JwzV
         1Bl1Ip57QQdRNzJcheRx0tbG99W5kRm2s7Zu97twjgyG1AdwEHvsLj8PJejG/XoNcL50
         Re+5XJyqfJscWRfrYufzFjfysBAk7TwIUkakidEw0ukhAfH3F14enaghjk9t9H/dRUQ6
         InGvW9amsYg7IpzrQW68vQUyQTRwQxk2NEmHkDTI6dHDDImYvQrZ9xVwDJ3QcvIIjKnx
         FvAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRCocPfGJl8+NAauX0iuGknMFI5LjoBJ5wTJgwBQv7Lr1fMgViy9gfg7RItMEznFBdmsJ22eCYoMVlkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTlyVU/Ycxt8gNGo3aeaa97rnG++M6IugAShDJN93sGiOpCyqu
	HWR64ilYL4/ho9E2RwXI9yFzdS3F+mfGRgwhjOf+cqdVbQ5IHElCSD3Lt5YLKRY=
X-Google-Smtp-Source: AGHT+IH1aaCnWxJ+190B4X3rRtI27v+kXSCMfEXtrprcgTAAwyxSHjsuSln+B4lGQpKN2Z0UMJ9hgw==
X-Received: by 2002:a05:6000:104a:b0:37e:f4ae:987d with SMTP id ffacd0b85a97d-38061159141mr7795045f8f.29.1730193813087;
        Tue, 29 Oct 2024 02:23:33 -0700 (PDT)
Received: from localhost (p50915d2d.dip0.t-ipconnect.de. [80.145.93.45])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b71479sm11836108f8f.69.2024.10.29.02.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 02:23:32 -0700 (PDT)
Date: Tue, 29 Oct 2024 10:23:31 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Ivan Orlov <ivan.orlov0322@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] sound: Switch back to struct platform_driver::remove()
Message-ID: <mr7tjtqtmblum57yirmvfhzqg5rhyqdotlzn6kvjk4nlixyqrn@uyne6x2vefp6>
References: <20241029073748.508077-2-u.kleine-koenig@baylibre.com>
 <8734kf2sa6.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e4aa3yd6q5uca44q"
Content-Disposition: inline
In-Reply-To: <8734kf2sa6.wl-tiwai@suse.de>


--e4aa3yd6q5uca44q
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] sound: Switch back to struct platform_driver::remove()
MIME-Version: 1.0

Hello Takashi,

On Tue, Oct 29, 2024 at 10:05:21AM +0100, Takashi Iwai wrote:
> On Tue, 29 Oct 2024 08:37:47 +0100,
> Uwe Kleine-K=F6nig wrote:
> >=20
> > After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> > return void") .remove() is (again) the right callback to implement for
> > platform drivers.
> >=20
> > Convert all platform drivers below sound to use .remove(), with
> > the eventual goal to drop struct platform_driver::remove_new(). As
> > .remove() and .remove_new() have the same prototypes, conversion is done
> > by just changing the structure member name in the driver initializer.
> >=20
> > On the way do a few whitespace changes to make indention consistent.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> > ---
> > Hello,
> >=20
> > I did a single patch for all of sound. sound/soc was already converted
> > separately, so isn't mixed in here. While I usually prefer to do one
> > logical change per patch, this seems to be overengineering here as the
> > individual changes are really trivial and shouldn't be much in the way
> > for stable backports. But I'll happily split the patch if you prefer it
> > split.
>=20
> It's fine to do this in a single shot.
>=20
> I suppose this can be applied for 6.13, not necessarily to be merged
> for 6.12-rc?

Right, this is not critical and I consider this merge window material.
6.13-rc1 is fine.

Thanks
Uwe

--e4aa3yd6q5uca44q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcgqZEACgkQj4D7WH0S
/k7PTwf/RuQE2So+Bj2/unZ19jDNVY04i3Yaa0IrSvWShbO7Nv/nsVzANSVA6jUU
RRVMKI8AUoBJfFn4R+ZodJnwtjckrihdYHVIBnfB4krigFCmPCydnq1ANy0qMX+E
EbsWx9Q49q5Q7IQayl1BQA/PzL0GzKAase8VT+A9VlrJ5EHgz06aeEJtZTwutQKK
Q11L0Y0rkv/9abSCq1eyEDYvISb38m8iGr9J2iY7gAWVVuUmEkMqR816qixk7n2m
kPdT7cDib074IgZeN0ir30E+t4pT+IsIEDaelPwGia+A3iatvvG/D65jcThdIC9D
7GxxrOXjxiYz1IZcAJwESz+aYyScmA==
=w7Ha
-----END PGP SIGNATURE-----

--e4aa3yd6q5uca44q--
