Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525D43B1B2
	for <linux-tegra@vger.kernel.org>; Mon, 19 Feb 2024 16:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708359935; cv=none; b=OinKy+6stIlSuJIoKcxIpaPEkFhOAk4LGX0Rn8i3rD4zdDpuu3XTHIrsr+DqAJ88SjgdAKDyWqh9HwN5DejbEbs1yS1hwo8ir6X5XKqluanUCcxfGQofJRBOLgQ0iOwC9OwgU5TRuJ9phK0ml6gdDp2cY5srVxQI1BKm9a8D2jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708359935; c=relaxed/simple;
	bh=XX0K5ow9Xwg80Jgi5HERRkwc4tMAHot+8R2xPIrKfh4=;
	h=Content-Type:Mime-Version:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=RG6OAx84GJAGrYqMYfgDPeSaySS0q3XDr0f0ZlEWqw33V6+0vx6Uk9VexV7UEXPYp5VIYAuybyde3nDjtRu0MhYNmdRtZkbZBwA1CxtbpxTjYkeNU10TMmCSjKVrbQDbiJo+J11k4h6gjdhcjp8nxhF6sYWCheo+6yvSnzCsaPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nKd7CTWj; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nKd7CTWj"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a3e891b5e4eso132887166b.0
        for <linux-tegra@vger.kernel.org>; Mon, 19 Feb 2024 08:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708359931; x=1708964731; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zfJ3w5lno94QDCIEXuft8o82+FFpvWxcBkCnxRsCsG4=;
        b=nKd7CTWjF37wUc7wEBx2VfRqSMgkEXywewPZczQpNgNRg8dimTfwon9cYLFPW3C46M
         x149PHIr4756LWKC8JSgrh0uRNQtxJp/rWKvXbeQ5xy6JBUiWu+AEaM9nY3/MOGQcR7d
         AqMgYvvkIztWfF99zyj4B3pNQJT1LW5qDJAT+w69bUV82rNTemXADPgdRxOmUdO8Oz8I
         B8Zxy7somyBcv9WbJjNW9Hs+snanfJ4KvfeBqTNDdaz3II21YU/GmIUhuiGhHo9fgbke
         eUI0yYh/HhAvHh2IF632TXvOyxOIKpWNJ23FWYAmoR+0UMHo6jz8xXBo+TmrKf2xlaO3
         Is2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708359931; x=1708964731;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zfJ3w5lno94QDCIEXuft8o82+FFpvWxcBkCnxRsCsG4=;
        b=hITNaDwzD9/DpYOtuiPd3nGQlQsHeOxmfQsok/ojqQbY2urAHpduw0StUsQOb9cy5o
         bMbSLOFwHd34MjSuREmuaKpVm9CsStglpAu/eh1THfmURX/OkN8onq7+3lhO1SFvvpRK
         X0ghKmX3LMBJQRoNea64WAg1nLYoT6VddOpqdAsCEq0dXr5CREcsdYReSXBYYfrTkVUJ
         h06yhJ558ysknHs+0m5oGj4+lIJwsCaLnKtZjs4lkaJRwiF1WR70hcxmSQYL37PXVLhC
         dAHE2WA9cKBuPCYTfDZQf0U7z4/C8RrOfIi5JEx64Zzj1XuWdev3lJYZmQWCsDguKBed
         ApCA==
X-Gm-Message-State: AOJu0YwVctRJZyoHeDakuazjYUsl55RQt5q+nnZXiGw1STKsLgd4TVSj
	NPvCX6RhuwMMnQggUqvHvf+S+i1gBHF4OYWAwDJ+q26bcUk3NdcyG8Dx2Gty
X-Google-Smtp-Source: AGHT+IHUUeHCmXfHu/7QL+254eU6QTCfCHolBu+55PVNCdpW4h5PrtPSEEpewwoPbmy2ALKDCkh0Nw==
X-Received: by 2002:a17:906:8807:b0:a3e:6aff:5e74 with SMTP id zh7-20020a170906880700b00a3e6aff5e74mr2335241ejb.22.1708359931409;
        Mon, 19 Feb 2024 08:25:31 -0800 (PST)
Received: from localhost (p200300e41f2d4600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f2d:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id j2-20020a17090643c200b00a3da0717620sm3098433ejn.180.2024.02.19.08.25.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 08:25:31 -0800 (PST)
Content-Type: multipart/signed;
 boundary=bacebf7d168109f5417563fc7b385a5a1a0e0ddba919e7b2d0aa45178fce;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Mon, 19 Feb 2024 17:25:30 +0100
Message-Id: <CZ971XOHA968.3OVG90NP5YYJP@gmail.com>
Cc: <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH 1/2] staging/nvec: update comment regarding udelay in
 the isr
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Marc Dietrich" <marvin24@gmx.de>, <linux-staging@lists.linux.dev>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240218212557.22836-1-marvin24@gmx.de>
In-Reply-To: <20240218212557.22836-1-marvin24@gmx.de>

--bacebf7d168109f5417563fc7b385a5a1a0e0ddba919e7b2d0aa45178fce
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Sun Feb 18, 2024 at 10:25 PM CET, Marc Dietrich wrote:
> Update the comment before the udelay on how to replace it.
>
> Signed-off-by: Marc Dietrich <marvin24@gmx.de>
> ---
>  drivers/staging/nvec/nvec.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index b3f114cb00dc..ec081d81a308 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -709,10 +709,11 @@ static irqreturn_t nvec_interrupt(int irq, void *de=
v)
>  		status & RNW ? " RNW" : "");
>
>  	/*
> -	 * TODO: A correct fix needs to be found for this.
> +	 * TODO: replace the udelay with a read back after each writel above
> +	 * in order to work around a hardware issue, see i2c-tegra.c

i2c-tegra.c is almost 2000 lines, so it'd be good to be a little more
specific. Are you referring to the work-around in i2c_writel()? If so,
perhaps mention that function so that people can find it.

>  	 *
> -	 * We experience less incomplete messages with this delay than without
> -	 * it, but we don't know why. Help is appreciated.
> +	 * Unfortunately, this change causes an intialisation issue with the
> +	 * touchpad, which needs to be fixed first.

Perhaps something like: "... this change would cause an initialisation
issue... " to make it a little more clear what you are referencing. Is
there any information about the touchpad issue? Any idea what's going
wrong during the initialization?

Seems like this issue has been around a very long time already, and the
further we kick this can down the road the less likely it will be that
we'll ever fix it.

Thierry

>  	 */
>  	udelay(100);
>
> --
> 2.40.1


--bacebf7d168109f5417563fc7b385a5a1a0e0ddba919e7b2d0aa45178fce
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmXTgPoACgkQ3SOs138+
s6Eg4xAAq4xaS7v2eK78oOMD/yrIkpFXNY/jCAOvicE0HxDSEtL3lbQK5njbnmxa
APAPLW3Aczh6DDtlaTYSH+4cU0639YF+HtvHFqeUMixojE2gfncVMArNBOBcM6BH
ryDSlsdBDagvC8Qvn2n94Hm02aOqXGyiEUd7AbAGyQ/p8KiWLSvDPbXAJfxOsaIA
YKyQYjyJK6ig3PE3wgtqbOC+HpBc+BxiqF5vTJiqROIrYU/4hEvOO57gHMqIS5Nz
GQIXb4EGgFVAUAe8IaKtxYpzVO1B76iB4u06Ucv0Y35HW7s3VBq4sv2BTzqsztw4
2v5tlp4QgR3ycEBFXWDAOH5ayHge0hp8o96r0ojDzTn2bllLGu9XYexLQ2xanh17
7GPRxHXTfFDcDCF8hI5vOV+WEjL96KkjbAdNujC6ATZIXNgS2qv8GFpcYUrjWXlO
MIfNKt5JWqEf9bd2lwr2eXT4WOzOODrWO++TAlkoGWOkpWTEIgjaSfZA4CXBA2ZX
VI8QfXDUcj0isNjqHKTC62ucQW21W89xWiOyaY2JBOzX66ll2iY+FiHuTEID7URx
wRpnpt9A26xJ314KDEVpZ+i/QYaK14Ite4B3At1pXdOLypUk7suy1KIgDZujJEc0
NnsqWDjbvtUQHp6xj6v3lrcCTlZYpBHnK1RJHEOBagp+tzhQ+gc=
=9Od0
-----END PGP SIGNATURE-----

--bacebf7d168109f5417563fc7b385a5a1a0e0ddba919e7b2d0aa45178fce--
