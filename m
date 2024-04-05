Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A294215FA95
	for <linux-tegra@vger.kernel.org>; Fri,  5 Apr 2024 14:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712328033; cv=none; b=MzgYctX6kP7x1W+9wf5pCwAegL9l5sGblWOhcagaIyBoL+k4AZU+SL4q26SqXFj30JhjLrK703ReSK9ee/tnoI3P1+JEPQ3DlE5Gst6pxFQwAQsgnPxoO9IH2MrXBNXgn8i/l5CsZMMXpc9aUjjaNBMueuo4UmJQMGEQVpOMQKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712328033; c=relaxed/simple;
	bh=c4yb4IplAI+0OGktd9tOHSCtcIC7AkdOn5VaQjVfw4g=;
	h=Content-Type:Mime-Version:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=h+dPFDYM8pCAxkd3SaKuYUj4W1RG6y31hzM89UplZktyDvHsp2BdwTSuI61eppbspGwIuDCMUX5oAzyg0Sa6qcxZKX/JMK5RPfjIRaarrVCEnUsRoTOF1/dYGyq0giqW72yidNvqpv9KheaH7STzURn+q5ii9d+Nfug39UkBbas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=erH1Ip21; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="erH1Ip21"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-56e3e03b989so86141a12.0
        for <linux-tegra@vger.kernel.org>; Fri, 05 Apr 2024 07:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712328030; x=1712932830; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E5IZKUnR/lcDGYqJjN9LqFwnS+dvaJ2mez5Z+2uGzXI=;
        b=erH1Ip21cByg1UX700ZeygEZbL3TKM8IsLKBQN1U37+9I7//60nHmqtZ1LH7GRa+lp
         RUkSWlGeKTWQblJPNfQiy5cubTjdX36Rc8kU01SuMVv34ffyUs1ypKS0qOXpxREgj94w
         5yhQN7T/RQDwFlS/FJ+w3wp8l0lY9K8Jc8d8QwA3qzXF9CmA4iUsMZhOVmbwmkAYlADG
         ptsywuLehkOa+Dvntk8zxtC/lm2mztw+juEqNbiAbohkXtDuFfFAdoJeBftvAPvHuk6K
         S8U78gksl+i8au2iTVJpMp4U+yW12SQDObdJGdYN9mayQaY91ZEzqF8AKnlpUal1eVFu
         c1OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712328030; x=1712932830;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E5IZKUnR/lcDGYqJjN9LqFwnS+dvaJ2mez5Z+2uGzXI=;
        b=Fz87CtrcnVRq0nLieQCeSxDE97Wed4wwdUF6cPLZr1uNDsgIf7NLZO1tA/LesypRAg
         LvVPuWCd/HMXEiJ3GyfFaObUxp1wpXn5EJ5iZ+PSwewo0ihmCL2ZYlTuy8jYi4S/CmUW
         ggQT64hb6uM3Zuby5ImzfDc+jBIi2jmscXROeO78aHKwqawNb/rr29Hw8GCVeDqTia24
         m2VnI60Rr6abZI+QEqJ6HFM4gVnjKD8r0I+Sdt/FFerGs/+ZPjo0un6cq67tYilP56vk
         d7N8JDH8ok/RU/yBsfihOGhVryfkmtANrqfbDnwwDkVS+DK7RuQIHOKVU1iPwHniforB
         3V0g==
X-Gm-Message-State: AOJu0YxwuaRu4m9chEAM9STD5lejy7z4rBiX7jkaxNDAqkaN1QzC39f5
	KLonuPvgkSfG7JP1tfeIYx3ZVFPL0cy92IRGwMttHZDY8lki88h3
X-Google-Smtp-Source: AGHT+IEDOGcMGCCauLF2cK8I/z3LNNYxATbAaah5DShvvB8RooJtbCMZdkq8xhinj8oL+ZoBK3239A==
X-Received: by 2002:a17:906:13cf:b0:a51:8fd0:b1db with SMTP id g15-20020a17090613cf00b00a518fd0b1dbmr1787818ejc.20.1712328029834;
        Fri, 05 Apr 2024 07:40:29 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id m8-20020a1709061ec800b00a46d2e9fd73sm898707ejj.222.2024.04.05.07.40.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Apr 2024 07:40:29 -0700 (PDT)
Content-Type: multipart/signed;
 boundary=74c335071945a17e0f4583ec57e7b5eccdc8c901a8b78ef8ae93a0121cbb;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Fri, 05 Apr 2024 16:40:29 +0200
Message-Id: <D0C9MKZ155E9.GRG2F9N6JHBU@gmail.com>
Cc: <linux-tegra@vger.kernel.org>, <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/4] staging: nvec: make touchpad init synchronous
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Marc Dietrich" <marvin24@gmx.de>, <linux-staging@lists.linux.dev>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240405140906.77831-1-marvin24@gmx.de>
 <20240405140906.77831-3-marvin24@gmx.de>
In-Reply-To: <20240405140906.77831-3-marvin24@gmx.de>

--74c335071945a17e0f4583ec57e7b5eccdc8c901a8b78ef8ae93a0121cbb
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Apr 5, 2024 at 4:09 PM CEST, Marc Dietrich wrote:
> Improve initialization stability by waiting for command completion before
> sending the next one.
>
> Signed-off-by: Marc Dietrich <marvin24@gmx.de>
> ---
>  drivers/staging/nvec/nvec_ps2.c | 31 +++++++++++++++++++++----------
>  1 file changed, 21 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/staging/nvec/nvec_ps2.c b/drivers/staging/nvec/nvec_=
ps2.c
> index cb6d71b8dc83..f34016c4a26b 100644
> --- a/drivers/staging/nvec/nvec_ps2.c
> +++ b/drivers/staging/nvec/nvec_ps2.c
> @@ -60,16 +60,6 @@ static void ps2_stopstreaming(struct serio *ser_dev)
>  	nvec_write_async(ps2_dev.nvec, buf, sizeof(buf));
>  }
>
> -static int ps2_sendcommand(struct serio *ser_dev, unsigned char cmd)
> -{
> -	unsigned char buf[] =3D { NVEC_PS2, SEND_COMMAND, ENABLE_MOUSE, 1 };
> -
> -	buf[2] =3D cmd & 0xff;
> -
> -	dev_dbg(&ser_dev->dev, "Sending ps2 cmd %02x\n", cmd);
> -	return nvec_write_async(ps2_dev.nvec, buf, sizeof(buf));
> -}
> -
>  static int nvec_ps2_notifier(struct notifier_block *nb,
>  			     unsigned long event_type, void *data)
>  {
> @@ -98,6 +88,27 @@ static int nvec_ps2_notifier(struct notifier_block *nb=
,
>  	return NOTIFY_DONE;
>  }
>
> +static int ps2_sendcommand(struct serio *ser_dev, unsigned char cmd)
> +{
> +	unsigned char buf[] =3D { NVEC_PS2, SEND_COMMAND, ENABLE_MOUSE, 1 };
> +	struct nvec_msg *msg;
> +	int ret;
> +
> +	buf[2] =3D cmd & 0xff;
> +
> +	dev_dbg(&ser_dev->dev, "Sending ps2 cmd %02x\n", cmd);
> +
> +	ret =3D nvec_write_sync(ps2_dev.nvec, buf, sizeof(buf), &msg);
> +	if (ret < 0)
> +		return ret;
> +
> +	nvec_ps2_notifier(NULL, NVEC_PS2, msg->data);
> +
> +	nvec_msg_free(ps2_dev.nvec, msg);
> +
> +	return 0;
> +}
> +

Is there a particular reason why you've moved the function around? It'd
probably make the patch a tiny bit smaller if you kept it in the right
spot.

Thierry

--74c335071945a17e0f4583ec57e7b5eccdc8c901a8b78ef8ae93a0121cbb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmYQDV0ACgkQ3SOs138+
s6HsCBAAkMotTVdMPL95hG7YPTXve1UyctiIW3bxkdfstNi3fr33ODyFgCmtPllY
KKLsiWqvWbl4AL0FGnJpqyUr6cLRM6BjLyv8B+GX42EDev0sCzEG3VKBc70VUe9M
AXMXj4zd+0dlfh5h2g+1S/ykVGvHXlw1UvtKP97clMuz6zdOhLvo/FJCcKrEeNGM
8pfW2hxKN5Z2X8RrI+xJjBHok0TVJpKkp3BzzC82kwXPnF8e7dNd1BxUh29Z3N6u
iC8jKNfoTIikeDqkV0TEX7KAIvM7fHDxyM4k6KlCnt790fuHV1/M6qoeu1Mg+B+z
i4KIdhrnUlnx/f/u2Bcdzx56roL/0yHYqsm1LPE3UkIdrRutt+Flk9FxdoSAJScI
hH4hsnML2Sdg3gX7u+tchB0/zAT+CDpHJTkoF/58FoRMcQBvVdVEbNFoktaVhODX
e3O5IYi5BTLPQB9DVZICHXZJdgzLeaMZ8swoy0pnfxNY80zqsMd2WxirIrqPQdjO
SmAj2NoS1wbQ632xAsO+bG8Llqjkmyx3LJtY2DAccbJ4tj3dxMM8bB6Ap9eSWrO2
IJ9vubUjRifCrbi8zAhUxb9twvwflMvKUOrwvY4quhayY6j9wUUHYmFOiuETxxue
efWg6PUbhe+N4mtIsoT4ncKs8RAio3cpJyg01TIgCNCEXHRcoyA=
=f4fx
-----END PGP SIGNATURE-----

--74c335071945a17e0f4583ec57e7b5eccdc8c901a8b78ef8ae93a0121cbb--
