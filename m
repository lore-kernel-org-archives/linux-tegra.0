Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E695E176ADE;
	Thu,  3 Jul 2025 13:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751550048; cv=none; b=lVrmtsV1QXamdRXbkM772y1i3qo5v5O4qCvo+mU4K7EBXyr4W7YA9SwwmMFL1vwwqwX5sePTN8oZrVz+YcQD8xWj0y1JDhK2ot9qPpF5Zl3UE4nQ06RMbwGVo73CwMBMMsX/g2k77uepr1jB8bLSWMEE6r4d9pg6+Yi+l4Lc4+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751550048; c=relaxed/simple;
	bh=G/bpx6ghCB0xfb+ziC4/kFnvpIy+GDlevlFcTs2GOHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KQ19BPq0r+DMYtY9cwAIKX0wG8yRQ7EX2z+63QDGOpWbLGSXk5f7ie1YTjjqYYt1M1xBrjv6Rp8OpE6YOjTaZBOssnn7lumg42TceyRvFyUE8v8iWPEpaPhUi+9JLcxInhqjVHtKB0p45IiuEMN52qYfKJc5CrmwH8EUbxfAI3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CMb81XFk; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CMb81XFk"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-451d6ade159so41005675e9.1;
        Thu, 03 Jul 2025 06:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751550045; x=1752154845; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QytPx17TqZGUg5ObL4HSlhVLXpHq2ikYFOcpglMRt8s=;
        b=CMb81XFkI2I4zsmcE4SmTk42H5qrkHo7m7hG2XxTdSMom55irv/biSuI1q+1w7W9CZ
         HmIKcv7ZQfXTPuekNslEblYiaSG4qKqcAi5VLMM6AprjMoIMBKlqKI3IuX9bucR+TR0t
         xouq7MvgjqRmzdsuqbkTf7WaM98ODGzzpIq2Hbj3bGTKe3RGQK0Z/On9tEclHm/fuJD9
         3l612N+91kASWbW36FFR4GVoYSpBXgA33z9XmH99kigXJiJHeTT7DMdy12DQQCyWG8kC
         RoNXoi/Hp92UPKL1MaCLVAJdYVLxbFZfZUH0qgvcqJ4d7e0bVpCoL7i8FzKK+TmIlMv8
         UgsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751550045; x=1752154845;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QytPx17TqZGUg5ObL4HSlhVLXpHq2ikYFOcpglMRt8s=;
        b=s7hWJtqSRBaEAdKBg5w37iZFEu6Eq8c29qPmFWWuH/13vVJaAyCnsDlG4EyowO4Nje
         3OdEidjbCmuPNwKPqHrRT5idfsNTyKpJyzQyrx6h+nVICdm4bN5Hmvh8C8+dB6kMd/iz
         atXLKrCG5iKGg90p5jfB80iCoVTp5aSd8x4B+nAltoEl6Rt2v+i8TDbsl5zrLrgDfqsG
         x9+ea/UkNet7fXuukhZ2JhcPbjjbDGoTLxT2K6q8aBl3DrPXEfWCWJQgdwpAk/9N/F9p
         X5DMDSLdYvZHl84rSEw2g8IOVWlrwV7us/WULKFVibS2F5XZbTiU7ktG4oEsIrh2Ms/Y
         0MJA==
X-Forwarded-Encrypted: i=1; AJvYcCV7Hsi4xqs0JqGMBzbb7OqBJ3o+tcEoKRpzi82xJl6PI5sSHzfJ4eolQKtf5bD525afPtvdo1VbvZVXhkM=@vger.kernel.org, AJvYcCWkTK7sSZnGIzV9iP+RY0VbcrDgwn2glPkKKgR0pQpNvCZv6FgT8YCSP8POyPYSWUNI9qY0fyCwHmErKUg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvd2Ohxaf55m5AUJP6AZNoSE53/9FMcqhGhaaJ5JJj8z9/FuXS
	qbDFbOneo7AgBKu7yhu2Ulb4HencRb3c5vGT72yFFA2ThRgVwoSRMZN+
X-Gm-Gg: ASbGncsf4/9IBfP516SGaquKZo1C3UwI4EYlcrU+86T4TOXTHym8WNClcx5uBC1udrP
	JD5i7xHmxBeQCw6dZcpZw7qGjDF1gPquInPnMr2W/hFVqRM0meuzPZs7+Q6dRx4gXkY0n9JSIZe
	sa4iQuJawnWBDQZkKLJk970EBU9VR0X2sPcBl+go516DXklcpSM5fMLLup3ZBCdciVXwLl3Ms59
	vpi5Sae6Xb560SaC2J3WyWEAZcYH4bHKkXn2U0VJSMEXk5Ap2TlHRuQGAckZmFw2iy22sb5zr0L
	chvVkI+TXM10xrtT9FyjqxznrRnJ9GBA+AWYy336nVBxht/pqCaLq7hPYACN9hH3YDTTbRRV20s
	OR023AilOEmhD4wV0qztz5MovryNQVX2PQ55qq7e6R7jziubSkPd1YXwTD60=
X-Google-Smtp-Source: AGHT+IGPTyAqkvgZKJuNY6nurODbDPxQlQQ6GLGpBKm++Xze8nowXhDRfQZarBPqhtGyrxxkxWN9tg==
X-Received: by 2002:a05:600c:6309:b0:445:1984:247d with SMTP id 5b1f17b1804b1-454aa185780mr30235655e9.7.1751550044723;
        Thu, 03 Jul 2025 06:40:44 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e6f74sm18658416f8f.3.2025.07.03.06.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 06:40:43 -0700 (PDT)
Date: Thu, 3 Jul 2025 15:40:41 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Kartik Rajput <kkartik@nvidia.com>, daniel.lezcano@linaro.org, 
	tglx@linutronix.de, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] clocksource: timer-tegra186: Enable WDT at probe
Message-ID: <bd2oz44lcrtdixmzqhcmespqjye5s5gvgzh4j6pqqj3bycktmv@r5gp66jjraxr>
References: <20250630110135.201930-1-kkartik@nvidia.com>
 <458d9b45-2879-4dd5-b164-82d87fdb5ad8@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mzmp7ovd4a3esszh"
Content-Disposition: inline
In-Reply-To: <458d9b45-2879-4dd5-b164-82d87fdb5ad8@nvidia.com>


--mzmp7ovd4a3esszh
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] clocksource: timer-tegra186: Enable WDT at probe
MIME-Version: 1.0

On Thu, Jul 03, 2025 at 11:36:16AM +0100, Jon Hunter wrote:
>=20
>=20
> On 30/06/2025 12:01, Kartik Rajput wrote:
> > Currently, if the system crashes or hangs during kernel boot before
> > userspace initializes and configures the watchdog timer, then the
> > watchdog won=E2=80=99t be able to recover the system as it=E2=80=99s no=
t running. This
> > becomes crucial during an over-the-air update, where if the newly
> > updated kernel crashes on boot, the watchdog is needed to reset the
> > device and boot into an alternative system partition. If the watchdog
> > is disabled in such scenarios, it can lead to the system getting
> > bricked.
> >=20
> > Enable the WDT during driver probe to allow recovery from any crash/hang
> > seen during early kernel boot. Also, disable interrupts once userspace
> > starts pinging the watchdog.
> >=20
> > Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> > ---
> >   drivers/clocksource/timer-tegra186.c | 42 ++++++++++++++++++++++++++++
> >   1 file changed, 42 insertions(+)
> >=20
> > diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource=
/timer-tegra186.c
> > index e5394f98a02e..59abb5dab8f1 100644
> > --- a/drivers/clocksource/timer-tegra186.c
> > +++ b/drivers/clocksource/timer-tegra186.c
> > @@ -57,6 +57,8 @@
> >   #define WDTUR 0x00c
> >   #define  WDTUR_UNLOCK_PATTERN 0x0000c45a
> > +#define WDT_DEFAULT_TIMEOUT 120
> > +
> >   struct tegra186_timer_soc {
> >   	unsigned int num_timers;
> >   	unsigned int num_wdts;
> > @@ -74,6 +76,7 @@ struct tegra186_wdt {
> >   	void __iomem *regs;
> >   	unsigned int index;
> > +	bool enable_irq;
> >   	bool locked;
> >   	struct tegra186_tmr *tmr;
> > @@ -174,6 +177,12 @@ static void tegra186_wdt_enable(struct tegra186_wd=
t *wdt)
> >   		value &=3D ~WDTCR_PERIOD_MASK;
> >   		value |=3D WDTCR_PERIOD(1);
> > +		/* configure local interrupt for WDT petting */
>=20
> It might be a bit clearer if this comment states ...
>=20
> 'If enable_irq is set then enable the watchdog IRQ for kernel petting,
> otherwise userspace is responsible for petting the watchdog.'
>=20
> > +		if (wdt->enable_irq)
> > +			value |=3D WDTCR_LOCAL_INT_ENABLE;
> > +		else
> > +			value &=3D ~WDTCR_LOCAL_INT_ENABLE;
> > +
> >   		/* enable system POR reset */
> >   		value |=3D WDTCR_SYSTEM_POR_RESET_ENABLE;
> > @@ -205,6 +214,10 @@ static int tegra186_wdt_ping(struct watchdog_devic=
e *wdd)
> >   {
> >   	struct tegra186_wdt *wdt =3D to_tegra186_wdt(wdd);
> > +	/* Disable WDT interrupt once userspace takes over. */
>=20
> Technically userspace is taking over at this point and so we should be mo=
re
> assertive here ...
>=20
> 'Disable the watchdog IRQ now userspace is taking over'
>=20
> > +	if (wdt->enable_irq)
> > +		wdt->enable_irq =3D false;
> > +
> >   	tegra186_wdt_disable(wdt);
> >   	tegra186_wdt_enable(wdt);
> > @@ -315,6 +328,8 @@ static struct tegra186_wdt *tegra186_wdt_create(str=
uct tegra186_timer *tegra,
> >   	if (value & WDTCR_LOCAL_INT_ENABLE)
> >   		wdt->locked =3D true;
> > +	wdt->enable_irq =3D true;
> > +
> >   	source =3D value & WDTCR_TIMER_SOURCE_MASK;
> >   	wdt->tmr =3D tegra186_tmr_create(tegra, source);
> > @@ -339,6 +354,13 @@ static struct tegra186_wdt *tegra186_wdt_create(st=
ruct tegra186_timer *tegra,
> >   		return ERR_PTR(err);
> >   	}
> > +	/*
> > +	 * Start the watchdog to recover the system if it crashes before
> > +	 * userspace initialize the WDT.
> > +	 */
> > +	tegra186_wdt_set_timeout(&wdt->base, WDT_DEFAULT_TIMEOUT);
> > +	tegra186_wdt_start(&wdt->base);

If we need to stick to the single watchdog, then it's probably better to
explicitly enable the local interrupt here and explicitly disable it
when userspace takes over. That would allow us to avoid tracking this in
the enable_irq state variable.

Thierry

--mzmp7ovd4a3esszh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhmiFkACgkQ3SOs138+
s6HsQxAAtd7E8mw/jaar7vourdk4E3fnt/rd9m3diOX5N5tVoKEf4gpzsvk6Nh+l
Do8wcUWgNIuF52KrgFRKGl/SZhAIhTr7Kf3PCrYASDfUZz4S7fcfuaiCYg/t3V/b
DPVUFn5Gsjr+yPzhMuW0QocLvJw1MJZuMEqQg+jwyXWkasSBLa9aAkoV2fpb02Y1
mz5d2LeTbY6AYLh+smjNwcYXPbfzTlVK4cte4IkIZN4FqPJEKCHJAB5+vCnQ9KGs
f40wsNrBXGMQHhH4HFw+b5zSDoLd+FPlmIHhcAysg/Af4s22FSW6i+7uIN1WooN8
YhzsYtuGZ5i/UzMZ6s0EmelhUg4oMlhIz+Q4gFR492l+ri8wSMbMEFnqHkMAHnPd
3k81i2TKdG4+AD+98p2j16udVN09uceSsIh4xKtSJiCL+xB6kfvtwM4vpT+Rw+AF
R07rMrC5oogpZlXqZSR9AYDEfW+LDGfPXqHUVjCpSutKdAlyFZkGk+Pisct1Qroi
RRytY7vVH0Fbqs5TdkGpAroIbQkAtbTHGyc2mnrMzBC+2vKxJW4o4ouybcFo+0S8
cFt+rCKPPMZP8vc7I22YZVrN2fXbIOGxcVp2Js3vw3n2gQGpwYYYf+zoDj/XTgqt
BK9kFpTQhXijEpcUDQDw21ioTULOwHfwYCr1C+3/WbZ+g29Ml1w=
=t64L
-----END PGP SIGNATURE-----

--mzmp7ovd4a3esszh--
