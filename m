Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9AA16F27A
	for <linux-tegra@vger.kernel.org>; Fri,  5 Apr 2024 14:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712327908; cv=none; b=qUSeaQWcTImLyPHd8yScG7ssawTwiaNT4F/iKKHnuqk1873sApWpmaoeZPRwxpPux45fjNaBKCUUhYZLGAnHyNk/WviRDmSbCw97qVQpkgb24tgEQHdZH8CM9tMlXqwpfr2+gzKqq04469Z1l1SahU6BLJfwNde9yxhf/65k7bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712327908; c=relaxed/simple;
	bh=DFO4tiAp1khmuhcDadqhJEEcLeXpBAZ5P2o1GFIzHjU=;
	h=Content-Type:Mime-Version:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=WLzDGwwFsv1smKlCmFFHAaYjJLMPy5ki3Ps+vVZFkCK5fHJCwS6eE3We53WfFq97jJO1T1eIynXqgkDGEp6ylYPoZcPNGL1fsl2STWlZihZHbiCHHj4KRJxhZGHXvQ1KnkIHmNntZ981B3nzGntvTue7zS4dUzwCmghOkak4CdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lqsKai/5; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lqsKai/5"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-343b4601415so964359f8f.0
        for <linux-tegra@vger.kernel.org>; Fri, 05 Apr 2024 07:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712327905; x=1712932705; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Rp2Cg3P2yxxzQAU0cIN56qJUA2RFjh+cbaHLS6fcmgE=;
        b=lqsKai/5271BFKbJ1sYBES/kFEpnV09FuYmX6oPUQJvkKTQk9BNPobEplWgZwrBZHK
         V8fA/LJHHPOSJSjpRatiZGwAz1V4Uawt9qI38LBQ3w+0vvUkhITgaBfOLd5DwH01rabG
         ZAnArpvih4/a126IexHMRxseylLPZFKYZbWOgDaZt8fBfwsEFWowQb2uqvHr5kh57W+i
         TiU3zwgC9DYIsFEiouW5xBO7OaMDodwvzWM07x55+bZivIAXArkw76VhP5UbwFkNDOKd
         YKaOX86aXVTEjHoIWnIno/oE1UPrRsMDl/1vV9zJL02Zk4uLTn4WQRWD4I8FMx2a4+xR
         Vwzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712327905; x=1712932705;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rp2Cg3P2yxxzQAU0cIN56qJUA2RFjh+cbaHLS6fcmgE=;
        b=fNlCc845G2CX4YdsC2NIlehUS/Q2KklMVp1zAzEwlGWXJ5jw8FfC/13w4H9ZCpdr5B
         gA5CwwyUncGp0Wd0y2UjQxEeWSwaffABzqLszKoynARFuvDMjYOwFb6N5EWYGkp0x/+v
         O3s+eGhCwQ/FpEasTzXFVel61vIM0Vmr5O0g5dAlZbGxwwiMYFylXPxTFKfXfVfwoR4f
         V+uWsofSVu4yT8wkLYUCZMALUYRQNc9tqBx/FKsrlRp0hYROFOYnNJvIXG8o17zbNSNt
         +poSdZ0wMpTFCL/7Ow4d7LrskZSpJdEYk266XkO7KjVUcki7lKTXBRKLEC3IZ4b0Mvxw
         GWMQ==
X-Gm-Message-State: AOJu0YyWCAtRQQf6WoiqHXEodUU8BYyoNB7ZELwF9+e3J8uwCP33KlKV
	3jdOUOZpp2mBnKUcYfBGaOOGAZBQ6A7AVDhcVbyFzGb+dhwYXwqJ/xjSavH8
X-Google-Smtp-Source: AGHT+IHesAXAlGx9pvVlPpIj36mgOlsTVD1UdKNsjRiNewwpyJDHaRd4WaJ0Mmc7s6WlmIidaUxFeQ==
X-Received: by 2002:adf:ed11:0:b0:341:c739:5ec1 with SMTP id a17-20020adfed11000000b00341c7395ec1mr2111015wro.4.1712327904529;
        Fri, 05 Apr 2024 07:38:24 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id n1-20020adff081000000b00341dc343e21sm2183455wro.65.2024.04.05.07.38.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Apr 2024 07:38:24 -0700 (PDT)
Content-Type: multipart/signed;
 boundary=92bd78ce31f66e05499164207569f014b092cd1f7acc241b3854392322b0;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Fri, 05 Apr 2024 16:38:23 +0200
Message-Id: <D0C9KZB6GHD9.252SEU8KRCIMT@gmail.com>
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Marc Dietrich" <marvin24@gmx.de>, <linux-staging@lists.linux.dev>
Cc: <linux-tegra@vger.kernel.org>, <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/4] staging: nvec: make keyboard init synchronous
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240405140906.77831-1-marvin24@gmx.de>
 <20240405140906.77831-2-marvin24@gmx.de>
In-Reply-To: <20240405140906.77831-2-marvin24@gmx.de>

--92bd78ce31f66e05499164207569f014b092cd1f7acc241b3854392322b0
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Apr 5, 2024 at 4:09 PM CEST, Marc Dietrich wrote:
> Improve initialization stability by waiting for command completion before
> sending the next one.
>
> Signed-off-by: Marc Dietrich <marvin24@gmx.de>
> ---
>  drivers/staging/nvec/nvec_kbd.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/staging/nvec/nvec_kbd.c b/drivers/staging/nvec/nvec_=
kbd.c
> index f9a1da952c0a..6b203d28b8a9 100644
> --- a/drivers/staging/nvec/nvec_kbd.c
> +++ b/drivers/staging/nvec/nvec_kbd.c
> @@ -113,6 +113,7 @@ static int nvec_kbd_probe(struct platform_device *pde=
v)
>  		cnfg_wake[] =3D { NVEC_KBD, CNFG_WAKE, true, true },
>  		cnfg_wake_key_reporting[] =3D { NVEC_KBD, CNFG_WAKE_KEY_REPORTING,
>  						true };
> +	struct nvec_msg *msg;
>
>  	j =3D 0;
>
> @@ -148,15 +149,20 @@ static int nvec_kbd_probe(struct platform_device *p=
dev)
>  	nvec_register_notifier(nvec, &keys_dev.notifier, 0);
>
>  	/* Enable keyboard */
> -	nvec_write_async(nvec, enable_kbd, 2);
> +	nvec_write_sync(nvec, enable_kbd, 2, &msg);
> +	nvec_msg_free(nvec, msg);
>
>  	/* configures wake on special keys */
> -	nvec_write_async(nvec, cnfg_wake, 4);
> +	nvec_write_sync(nvec, cnfg_wake, 4, &msg);
> +	nvec_msg_free(nvec, msg);
> +
>  	/* enable wake key reporting */
> -	nvec_write_async(nvec, cnfg_wake_key_reporting, 3);
> +	nvec_write_sync(nvec, cnfg_wake_key_reporting, 3, &msg);
> +	nvec_msg_free(nvec, msg);
>
>  	/* Disable caps lock LED */
> -	nvec_write_async(nvec, clear_leds, sizeof(clear_leds));
> +	nvec_write_sync(nvec, clear_leds, sizeof(clear_leds), &msg);
> +	nvec_msg_free(nvec, msg);

I wonder if perhaps some of this duplication can be folded into
nvec_write_sync(). It seems a bit unnecessary to have to first get hold
of the last message only to immediately free it.

If nvec_write_sync() were allowed to take a NULL as msg parameter, then
we could check if this special case and simply do the nvec_msg_free()
from there directly. Not sure if it's really worth it, though.

Thierry

--92bd78ce31f66e05499164207569f014b092cd1f7acc241b3854392322b0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmYQDOAACgkQ3SOs138+
s6GICBAAwSpvCBu+xNrtngeqlgPq1FyCFK7nvZHsI/PPIFsMy/lSsWUr+cW9TAgo
mslhCLlaDKztyRBcz/Vfxhm48I+agHIzq3TI+1MjBsNbCLpEhSUrT+GzUsvn51QM
fv0i3VAsjW+s1Dy/ZIlEPR+Lfb8SK8OpenMwRbenYcF3FiWiu0Pt1zLycXStA18i
RT/AJ0LGm8mliii23ty3V06Q39mjC00ZD4L+WHGH9b7l0l8XTmBZG8fluFhBhcne
gebh9tPrQz6FzOxsyf3aYd1CTBiVsMsrdwnSVSoibJo6TgtA4qzZRnBzOhNEzJRv
+/VGyG2PlJtm8W87f4FSbZICnU/A20r0omUJeMl8zXzsehqI+Ye1Eprb3J/Y6AEu
ljNMHDeD2DCzsIZ3EDrhFphTuQoXDyT8mMSxJOVegP4zCFc9WlKha+4fp1gStVnF
QdAUuYKy3X+sr/c6szZhcPMozWgsOP8mysVzfmdkZPh2ewdCj73ClSkN3+70EwE9
xQHAT+vOm5c2oDV77DCp1PFS0eccydR6GyyVFs97o9fP4/gT2cFiChX3tirlAu73
UpXs1eUDYHR7ct0hqGom73hB11gpF5mM6XJ+dzssNW/YlCgxJIl4wk+IqXKJhona
H93RSg83dr7qq6ix75Hcw9UuqJ0n2c8/AwX/Kco0cXpO0W1Yaic=
=ajBB
-----END PGP SIGNATURE-----

--92bd78ce31f66e05499164207569f014b092cd1f7acc241b3854392322b0--
