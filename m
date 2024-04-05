Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBCBD16EBFB
	for <linux-tegra@vger.kernel.org>; Fri,  5 Apr 2024 14:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712327608; cv=none; b=E5uQxUyC8qvt6ilGZ1ptJjQq+2eeyECholIZVHWZKppcZe6xxi1HtF3oQWr1QcmXTuygd5P2KFVxScIzTzA5V23uPSvTW7jQQz+SDxJwQ9c4BZe7ajY53TO9uhGrLfolUv3DcTtaUIyZA82DTUwNhYDT9esRTbY2bKgxiErMxOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712327608; c=relaxed/simple;
	bh=6r1Be5BUZgS+dg4Z4fV7QG9azS11Gan0eBKQdMdHo5M=;
	h=Content-Type:Mime-Version:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=sm8xkQp9OWxRJy7Z8GZqBx3dl5mPCKjRFRvAo4qumSFPZPOstP8ewlkvlqc7hX97lscgjefRPYvs+InuyPyoHeNdoiSTthSO+aAtTdTT1ihA+YGKQWJFFLwMAnXokuFtppUFzeDctcMOed/9283r7+EtjYkE4BvCGrKnibdDdZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lb1o/9Mg; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lb1o/9Mg"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2d6c9678cbdso26697001fa.2
        for <linux-tegra@vger.kernel.org>; Fri, 05 Apr 2024 07:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712327605; x=1712932405; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qCSF64T6NL0+D/1LnyCR1PpXEFyY/2YwWHEhRTUyLkg=;
        b=lb1o/9MgXhRWgtBq7Uj4ElbFVpnBz42/TFWjovT3NIYUUwNNDbmqEFpHXuh+cir+24
         mhdm3lurU+qGaXOGIOKIiPs6qlaoan9/a2ad+XxVYUGIrI05omBU6PCxq7jXmKY9KHbp
         YNhjyp0L0SdDdBOUxzlJfmcaJ3FPpknhhU8kZl6qZTG0SfGyNUx/cIfOHMkLE0FhYShc
         aOC8MRVej5KE8TLwVb85SV81JSht3KZ86O2cnGqKTXT4mZI90LX2MAC0RyA5amTGf+Lm
         Z+VRJ5g2sd9a5i4rQNMCZQuJYekk+aE55ANCIbKV0wllJp77tXDU8y24/9wOjlUCo6C7
         4/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712327605; x=1712932405;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qCSF64T6NL0+D/1LnyCR1PpXEFyY/2YwWHEhRTUyLkg=;
        b=qv+n2kIxKiRH//0csY1+p0dNRXppBBTeGLnxNA3+5B3b8rsPk4jWVy3DF0ZB7HN4VR
         MAFp1x89+g73sAb9ZzF4o5pIhFybXrk18atGeppbo/IkhGm2z2ItzsO75E7+KbZ8xWZI
         b++7iOabITdt7FvQCjuh+sDquUB0RF1dtkk+YTymOySlGjXUC+kQsyJdBSY7PKx4dfWi
         ykjrrMRUsKbyl+qy4++WnY7Zv22aFRdCcvWechqXAZkcuw4h7Hah5xfwH2IO8NA7C+5k
         2Qa6eikNDgtULoVNdbxSpvt90itNk2UfBGFSz0fn6BfyJkBf9lBG3+Tg4YtXXzui7zze
         OZOw==
X-Gm-Message-State: AOJu0Yyi4aMa9F0BX3bwpSgPDD+Fc7QjwLM4Hqsdt/kZ64JFWINNgI+A
	PPbqZYxAT7cyuGkMEQwRvv6RpLlJj7OpEh9zMlBtjECs3b1OcG9TVX6rtt0B
X-Google-Smtp-Source: AGHT+IEfqhqdAdmQ2WtVi3K6/jC8Wkc+xZa3ytc/CrC+nAsZCbPcQyDaTqYfX62ctVcc30kgFBoU3Q==
X-Received: by 2002:a2e:9593:0:b0:2d8:60e6:f482 with SMTP id w19-20020a2e9593000000b002d860e6f482mr1328825ljh.30.1712327604720;
        Fri, 05 Apr 2024 07:33:24 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id g14-20020a05600c310e00b0041569a819dbsm6681498wmo.1.2024.04.05.07.33.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Apr 2024 07:33:24 -0700 (PDT)
Content-Type: multipart/signed;
 boundary=11391da1f3d40c8ecc9959a95af4b26ae7a0edbb0e00290ac4bfd81d5f7c;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Fri, 05 Apr 2024 16:33:23 +0200
Message-Id: <D0C9H5M9NHBE.2AB0FZ1PDYZO4@gmail.com>
Cc: <linux-tegra@vger.kernel.org>, <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 3/4] staging: nvec: make i2c controller register writes
 robust
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Marc Dietrich" <marvin24@gmx.de>, <linux-staging@lists.linux.dev>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240405140906.77831-1-marvin24@gmx.de>
 <20240405140906.77831-4-marvin24@gmx.de>
In-Reply-To: <20240405140906.77831-4-marvin24@gmx.de>

--11391da1f3d40c8ecc9959a95af4b26ae7a0edbb0e00290ac4bfd81d5f7c
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Apr 5, 2024 at 4:09 PM CEST, Marc Dietrich wrote:
> The i2c controller needs to read back the data written to its registers.
> This way we can avoid the long delay in the interrupt handler.

s/i2c/I2C/ perhaps? Also, looking at the preceding patches it looks to
me like the reason why we can drop the udelay() call is not just because
we read back, but also because we actually wait for completion. If so,
maybe that should also be mentioned.

>
> Signed-off-by: Marc Dietrich <marvin24@gmx.de>
> ---
>  drivers/staging/nvec/nvec.c | 39 +++++++++++++++++++++----------------
>  1 file changed, 22 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index 282a664c9176..9914c30b6933 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -565,6 +565,20 @@ static void nvec_tx_set(struct nvec_chip *nvec)
>  		(uint)nvec->tx->size, nvec->tx->data[1]);
>  }
>
> +/**
> + * i2c_writel - savely write to an i2c client controller register

"safely", also "I2C"

> + @ val: value to be written
> + @ reg: register to write to

The formatting here looks odd. I think this is supposed to be:

 * @val:
 * @reg:

Thierry

> + */
> +
> +static void i2c_writel(u32 val, void *reg)
> +{
> +	writel_relaxed(val, reg);
> +
> +	/* read back register to make sure that register writes completed */
> +	readl_relaxed(reg);
> +}
> +
>  /**
>   * nvec_interrupt - Interrupt handler
>   * @irq: The IRQ
> @@ -599,7 +613,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
>  	if ((status & RNW) =3D=3D 0) {
>  		received =3D readl(nvec->base + I2C_SL_RCVD);
>  		if (status & RCVD)
> -			writel(0, nvec->base + I2C_SL_RCVD);
> +			i2c_writel(0, nvec->base + I2C_SL_RCVD);
>  	}
>
>  	if (status =3D=3D (I2C_SL_IRQ | RCVD))
> @@ -691,7 +705,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
>
>  	/* Send data if requested, but not on end of transmission */
>  	if ((status & (RNW | END_TRANS)) =3D=3D RNW)
> -		writel(to_send, nvec->base + I2C_SL_RCVD);
> +		i2c_writel(to_send, nvec->base + I2C_SL_RCVD);
>
>  	/* If we have send the first byte */
>  	if (status =3D=3D (I2C_SL_IRQ | RNW | RCVD))
> @@ -708,15 +722,6 @@ static irqreturn_t nvec_interrupt(int irq, void *dev=
)
>  		status & RCVD ? " RCVD" : "",
>  		status & RNW ? " RNW" : "");
>
> -	/*
> -	 * TODO: replace the udelay with a read back after each writel above
> -	 * in order to work around a hardware issue, see i2c-tegra.c
> -	 *
> -	 * Unfortunately, this change causes an intialisation issue with the
> -	 * touchpad, which needs to be fixed first.
> -	 */
> -	udelay(100);
> -
>  	return IRQ_HANDLED;
>  }
>
> @@ -732,15 +737,15 @@ static void tegra_init_i2c_slave(struct nvec_chip *=
nvec)
>
>  	val =3D I2C_CNFG_NEW_MASTER_SFM | I2C_CNFG_PACKET_MODE_EN |
>  	    (0x2 << I2C_CNFG_DEBOUNCE_CNT_SHIFT);
> -	writel(val, nvec->base + I2C_CNFG);
> +	i2c_writel(val, nvec->base + I2C_CNFG);
>
>  	clk_set_rate(nvec->i2c_clk, 8 * 80000);
>
> -	writel(I2C_SL_NEWSL, nvec->base + I2C_SL_CNFG);
> -	writel(0x1E, nvec->base + I2C_SL_DELAY_COUNT);
> +	i2c_writel(I2C_SL_NEWSL, nvec->base + I2C_SL_CNFG);
> +	i2c_writel(0x1E, nvec->base + I2C_SL_DELAY_COUNT);
>
> -	writel(nvec->i2c_addr >> 1, nvec->base + I2C_SL_ADDR1);
> -	writel(0, nvec->base + I2C_SL_ADDR2);
> +	i2c_writel(nvec->i2c_addr >> 1, nvec->base + I2C_SL_ADDR1);
> +	i2c_writel(0, nvec->base + I2C_SL_ADDR2);
>
>  	enable_irq(nvec->irq);
>  }
> @@ -749,7 +754,7 @@ static void tegra_init_i2c_slave(struct nvec_chip *nv=
ec)
>  static void nvec_disable_i2c_slave(struct nvec_chip *nvec)
>  {
>  	disable_irq(nvec->irq);
> -	writel(I2C_SL_NEWSL | I2C_SL_NACK, nvec->base + I2C_SL_CNFG);
> +	i2c_writel(I2C_SL_NEWSL | I2C_SL_NACK, nvec->base + I2C_SL_CNFG);
>  	clk_disable_unprepare(nvec->i2c_clk);
>  }
>  #endif
> --
> 2.43.0


--11391da1f3d40c8ecc9959a95af4b26ae7a0edbb0e00290ac4bfd81d5f7c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmYQC7QACgkQ3SOs138+
s6Gd7hAAp8UnXmtdrl27362rD0kBjrqQ190pVx4iJLowkpwPolfkfAKm2SjxtIxi
FqzbZSpdD5OW8fp/fRxI8erTdYlEOZ0LKNcdBobva35YyiDNwDQ29jZpYJKITDC+
5aq9PA35vkXfqPNgn3EswRwesksqdClKDPaXuimZJjR783MG4t9f3OIcfFe9Gs1H
EOT2ZTl85GbttFWl3lNab8mvVrTH2NhJIyWPEdgv6kxkzaTvK9pmhfyjzYQrDTQZ
LTUzAW9qRfjW7YhwHVWOxFztQJGq57OrUIT4JRjG9fb3/x42SzryqhztUhg2XE5V
Aef5DGGdcllnrEPe+4hthbwzZovTx2LjrPZ8EXyMDYUzguIoTDigg1bGULKJi2xf
z4f+xpF2SMkv2SE0nI+UaFtAeG/W7HfZ/12SZg+X34HD+4IwQZUliZNsCfqyCRpR
G0aRlChrY+x8F3EhPzY3tx+ieCcpgXxhF9SWZSDEoi/VFtU0rQ4peXI+ntPD4AjD
kzA+hp6JEz48cnJri5Omt8G6wFjTd8UTmbqojWo4lQlKvpFpaTuLtn8ty3FgafZb
kKgHtz9YUc5cyR7cHEivEGv6ovncgwKD7xpvHxIyjYFAtqHujX1YOVQaNs0j7Tfe
72IEuWYrhqquc0/c3KZFziH3ucvkeuNibTYVeVWq+tq2NSh65r4=
=oEgp
-----END PGP SIGNATURE-----

--11391da1f3d40c8ecc9959a95af4b26ae7a0edbb0e00290ac4bfd81d5f7c--
