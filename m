Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4953469850
	for <linux-tegra@vger.kernel.org>; Fri,  2 Oct 2026 08:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790930742; cv=none; b=NWbDv7QKCFAuV8zbmZoprzLWmieMwTHJJJMfqhTKTfJ11Fv5enk5eYofEy+Am4/MkXRDwbI9mdstF3+RUh6W4tWv84qX0yQpW8EBU0ChAyambB4ybpgk4VOoZbVu9OzdIQJzIhtnq//fPwRnsRllTKH9yGt1/3EW/gIxGEzyBOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790930742; c=relaxed/simple;
	bh=Q6PnvKn1BRiwuAqzPSQ8eJcrVGsr3TqLvA/X02jBtrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Go+V2fzym88LdBPmfywRnaXe1F8ezu6LFas1NATlLp0SZd/dY9XFcx44fvJeEPwflMqzW2i/+KjaUn0Uu8H+dM0ddxgtKAc50UjolzrR0sO5Q7BbQzZHpDBArZDti38pRUXyN85nEyANNBdoY9ga6vxFwEdD4SLrQiQ+1zeEkYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=czWAfk4d; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="czWAfk4d"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4834977ae75so4597323f8f.3
        for <linux-tegra@vger.kernel.org>; Fri, 02 Oct 2026 01:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790930732; x=1791535532; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RiMp/HQ4MZJXXJm9zw0L5IH3yUyg4yANpEUs/YvjE0Y=;
        b=czWAfk4dxuQAuRSDhwAZ9MhwIIlJGUVyjn5BvzzA4awNNjKn04CgJ9ChYbo0iDpCqp
         W35iOTbUMt5d47t7N3eA2fJMBqQLZdSyL8o4OfYwSqPkl0dFLtaK1e4qg1dKoQz9gs6p
         +uIj7g7gH9HkRtzzUNnYQiR7C/MLrqSJeqmVN3GzVjaqOrTzw2NvsLNuBsqT+7dZ4/72
         XzyuepvtAuEE2UcKVvy0rJOuBGAYrAsxGvfxAN43ahadxwfY4uukXvicV3hJlgWsGAU6
         5lCDO10Q3hwCpbUTz7Pcl9/bUXyw+TsuocI4X8mV4ZNW6taBMpNZnEHAagOVMFLi6ON0
         q1oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790930732; x=1791535532;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RiMp/HQ4MZJXXJm9zw0L5IH3yUyg4yANpEUs/YvjE0Y=;
        b=XpEf4xFvW5Yfi9IJLDAAogLuNH2G34ZqnEdFrP6sIRHpFZydTBhMBdnauLl1w4EwY3
         iYVUcYyg3DMi0KZ0aPGcayDQz4V7toSyi6O+WiqqwOU60Sn+/H+/1hDyS30Et4oCb1Nd
         8361EtSPMW6KpU711ukwtheUPtu4tr6Ho2YcbD48yV0JUWqaHXw48KP+n32ggdHoX+Ky
         dRUfdUpu6sfhAnM9b+QhcHLBGkn6XegBeEygP8HkNKAKknlACvcNHAiy7rVCkTKdw0Dt
         4861piRxoWoyOLY5Xx/TaHLbdUfMepnK9JDmyl+8z24TpeW9yjcKQuiUKBTpeX/TWyYR
         O3FQ==
X-Forwarded-Encrypted: i=1; AKwUvBzU2H/+ZCqJ/p1r0Dh3EU5UAYxx7Ivoa4pRQfSE3EJdjWH70bcJbQ6QGpRzp3pF2UaaOL2jK6vcl65paA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKzFjcsdQXz3OCXg9+WAMmKb0WJ6SygePddQVpQo+l2vcxFnNuX
	jl+qRmMs9P5/Yb91VPEJAYEXuGMhrK1vMKDahPnR17QQ9W3Mz/cWifXWIW7sI7UF5JgSd5x8zcu
	P6mep
X-Gm-Gg: AYBFou2FK98TzFv3kcnjtjV/58uiwaI4b4HSwUM/8B9QFUZ9Y24uP61lzSjGn3D0gSW
	eCS7eAl+b8/jZ90NKQ6+JrLM2p+bIF15hx+RWGJhgZgwrQVhzuIpc2BTG0c+Iyry6qBRbsjJnRr
	guv8V14hpLgLpOzkddDuAY3JZLz9KfPTWKwZcPVfPKtnjnJGr8BFqpQ0FhKNj/vZ/rRWv+RsRaT
	Zf/3bfxv4nRorOlBcXMPBC6hP23Tmd6V0RnP8w/tjy58obv699Lvde8QyVaFICJy3Hw9ic7VPEw
	aknJ6oieXyUIX9G4cz5oUqCTEf+/vDQhFkHzKcg+TzUxPaoK2N34JHQ0xoxH+VTgfAV1c07sDIU
	mg1S3/h1EjvBFXVWS9m1InlhsWWuwKsa6a+ov+HVLj50nWS8IwIHgk1L9UrAFBIoS2o/TKMQYGP
	1UEDJCwfhaFKhGLiQ7nip6z59Rb5gHfoqVr2yP8p+2XGryiVXTMAEEFvXJYwBKonrgyCj7HJA=
X-Received: by 2002:a05:6000:108d:b0:487:27f6:a4d3 with SMTP id ffacd0b85a97d-48b1274ec77mr2519619f8f.35.1790930731992;
        Fri, 02 Oct 2026 01:45:31 -0700 (PDT)
Received: from localhost ([194.213.108.11])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48b380f04e2sm3692890f8f.15.2026.10.02.01.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 01:45:31 -0700 (PDT)
Date: Fri, 2 Oct 2026 10:45:28 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-pwm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] pwm: tegra: Make use of dev_err_probe()
Message-ID: <ar9uJyYyTh5bfM4i@monoceros>
References: <cover.1789741839.git.u.kleine-koenig@baylibre.com>
 <641219a7d76bbcd8fe98b5955f2355ed45f55986.1789741839.git.u.kleine-koenig@baylibre.com>
 <arD6ILv1sd8YBUXj@orome>
 <arEiVZG7UqxpqAPZ@monoceros>
 <arFVjZ7bE2-lgnqm@orome>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="agfmvsvuk6z7tqez"
Content-Disposition: inline
In-Reply-To: <arFVjZ7bE2-lgnqm@orome>


--agfmvsvuk6z7tqez
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/3] pwm: tegra: Make use of dev_err_probe()
MIME-Version: 1.0

Hello Thierry,

On Mon, Sep 21, 2026 at 06:14:31PM +0200, Thierry Reding wrote:
> On Mon, Sep 21, 2026 at 02:46:03PM +0200, Uwe Kleine-K=F6nig wrote:
> > [1] last instance was just today, where on a bananapi USB didn't work
> >     and /sys/kernel/debug/devices_deferred ended up containing:
> >=20
> > 	1c13000.usb     platform: supplier 1c13400.phy not ready
> > 	1c1c000.usb     platform: supplier 1c13400.phy not ready
> > 	1c14400.usb     platform: supplier 1c13400.phy not ready
> > 	1c13400.phy     platform: supplier axp20x-usb-power-supply not ready
> > 	1c14000.usb     platform: supplier 1c13400.phy not ready
> > 	1c1c400.usb     platform: supplier 1c13400.phy not ready
> > 	axp20x-usb-power-supply
> >=20
> >     It would be so easy[2] to add a useful debugging hint here
> >=20
> > [2] https://lore.kernel.org/all/b699f8251afed736af454a981630926e45eb7da=
7.1789983244.git.ukleinek@debian.org/
>=20
> I see. Yeah, I find it increasingly difficult to remember all the
> context of a function call, whether it is that it prints an error
> message or needs some lock to be held, sleeps or not. Sashiko has
> been really good about pointing some of those things out.

I guess a comment in the function docs would also already help me. And
an upside is that (I hope) Sashiko would understand such a comment, too.

Best regards
Uwe

--agfmvsvuk6z7tqez
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmq/byYACgkQj4D7WH0S
/k59hQf+OU1W9ZhedzdfcGj2U3UJ1x+P1RejoQ2RuQVfrUgHvC3MSMFk7JXsrDNc
LTbCJVjT8VU/Nob7KA4r+5v/UF17IVLwokxHP/bn7d8Btes8lHsvoPag6kfkWz8L
I5dGcmyYxf8HrpoB03TIu49HauvAcTcm45e1Y/7+FnUpZIJlfwGUlQWCaO6JAWNn
cH9sdSJQ9T7Sa40ARrWOP8j/O1KkVB7e5oQ+m6A9oCHaENvoHXbJqg1+NekVzb/E
nxHUjAeKvse/DRePf+hAuBmHHO3t+jsZQgfdGSzKfGRdiITlnAU6Plldbt/Ao/MI
aQpnnF06H0F/MWxjqxrMExhYMLOHiA==
=Wsri
-----END PGP SIGNATURE-----

--agfmvsvuk6z7tqez--
