Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB6AFC1D;
	Mon, 20 May 2024 08:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716192687; cv=none; b=GOe0BL8mfTExQbHU6fiPgAMYCogjTur1hqZ4yo6MAGhvCHZue0RQ++WZzN6yTupiCoINImpY+6DrirsNwLkgaJh3IfuUbyxFajMCW+s1/6TQ+OBN7baIgMKfHJciUM6rVh4pFUuKjEZBJfwTjpAR/wnVTRklaHNLdtELUc/aw3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716192687; c=relaxed/simple;
	bh=4lednIxVtYVy8GpGMJIcuPPeV6vQOUz9OhOInB64kV0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Y6IOwA3tNRy11+CvUC31GB59kbmiAeKytaCc+00CyxwRZSlaOCu/UuRI1GZ3d+F20cunBU1la3SECnzK3PJfTmv7yhmF+PRg5AXo666zV8FX2LuTW9IwNiAz8OUQLOMW/wTnTP3CgEPvebv8GQJzzrNUEma2Pl46jhlwp+UGabs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b=TvZ8Nx1r; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.b="TvZ8Nx1r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1716192681; x=1716797481; i=marvin24@gmx.de;
	bh=3NfhAAlGGL5bnfia+lgDMGYdaP1U8gjKIdNADZAsnp4=;
	h=X-UI-Sender-Class:Date:From:To:cc:Subject:In-Reply-To:Message-ID:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=TvZ8Nx1raB223W3VkmSooF7Lj+VMnu57THR8dZUxnLEbgjdYTlZNDNPpH4KcUYy+
	 I1qJScklcAXwZWHL5x9HCmxbcHPmvX4Uvb7EwfOP0YthIRSqoDJ5wJB+tVUK7alYX
	 fZRVTGOEc9luDg9BrdSfQ8Mh3Fwavki1v8E2j2VMyJYlWl5IW+kJ2WU7wVH8J3IhD
	 N/wEsJ40JMjdHdG4GF0Cfj/Py53CKTsKfwspfpbbem0vMy1V9rTLpi35k9sIVA93G
	 AnB2W/DOb4K7h0zPmMtd1OCGMa1sGI0/Rpx/Dv8rPRIl9ofL8Xp3v7Cs63WlidRWu
	 fryw3w567bxi1tyQMg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from n5219w05.fritz.box ([109.250.53.23]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N2mFi-1sYVlt2XlM-0139dW; Mon, 20
 May 2024 10:11:21 +0200
Date: Mon, 20 May 2024 10:11:20 +0200 (CEST)
From: Marc Dietrich <marvin24@gmx.de>
To: gregkh@linuxfoundation.org
cc: linux-staging@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] staging: nvec: make i2c controller register writes
 robust
In-Reply-To: <20240421104642.25417-1-marvin24@gmx.de>
Message-ID: <334d0a42-9dda-a21b-2650-d33187525eb9@gmx.de>
References: <20240421104642.25417-1-marvin24@gmx.de>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Provags-ID: V03:K1:iFcfqAbBPLUMeXedLDJRczc7mjr8fzHnZaR0DJZ4W5nxJyW8hC+
 v/S7MC/XA/ilWcPlUwng63H8ICncdk4wz79nos4aptjiV2R6j+Biv9EqrM1azxd4IPUiqlq
 02c5JU29F5bvqgEUEnO6/gR+ILv02a6AFJ/6ISDCYbSnmFDf8yTsOLpJtUcy899drsJcrc6
 K0AHg/H7VjP4ck9UH3lpw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QQbpeC2A+l8=;oXBLK8/+lZxfZ/N38Ip3EnfEynl
 9yHXJ1fbSpj7iy6VsGXpBOj/NFnZf3KmXllxrs3pXI79rPRA7LxdphpTNNNEcGrjv/aHBzN1M
 assSNfQ8XWfGuMbqvCg2D0vk2LlVXHk3vq+jJtvsNqL2MYRWjNnBpuhzoOWqrvteydpFvXrKP
 0MRHI1t6WIBhz9WXC4DUINchJKILU1jvx1FnAxITX4o+q+m2keizScLDCfYrHlwBS4czcqXDm
 xaapP3a4AZcAhh+O1O42RE0Ffvtt3IIDDNmZZKPkDcaA1sNR5W5XgnRjjKjjARV5wiSWn1GzB
 kw0mpBpleH7UxwjgCTL3ZcNqmI2uUv7l6bQ1x4Iw/ysljJEd0wI7KsR6ZGFFrp7/xcs4cBou1
 wQAkK8CGvVzKWzAKinrnVYXhf0q4ybAzp46OptEVeh0O73xxcIp221Kukm4F8YdcCNwACwqiR
 bvAm3g+LccR+TrzxqQiS8Wjtv/BIUcy99NAq+NOM4Q6Wht/I9ELD6PAd17Iaf4C6HgV6JSkNN
 V1qhqdx4S92B1mSucUJxe5T0yCqGbPBt5APmoTVJ47IzH7dlxfkjr2awHDCd6BEFVgwjgXKY8
 /MumGWdFBsykVUtYGsGZj1WEIPeF/SCxQYPwhy2gLLCE+RR1a5hqMe/itORvwRKi1UC72AeCn
 f6zkD015Cr6AqGs9F4047Ah9j76hI43iQQgf1k+Y6dsI6Ux/Sq0PIyub7udffpo8T38CoRK+q
 c+qfP0nW5e7+wmkiVeQfF2fXTKzCWP4pHuv8VoY+bOO1k6sMUbY/+WjsQtvRjnRQk9Hqma75U
 NV1ix7/jfhdGTFbJKyWR35KkG+c+GO3jCv+IjI+i8a8bI=
Content-Transfer-Encoding: quoted-printable

Hello Greg,

On Sun, 21 Apr 2024, Marc Dietrich wrote:

> The i2c controller needs to read back the data written to its registers.
> This way we can avoid the long delay in the interrupt handler.
>
> Signed-off-by: Marc Dietrich <marvin24@gmx.de>
> ---
> drivers/staging/nvec/nvec.c | 41 ++++++++++++++++++++++---------------
> 1 file changed, 24 insertions(+), 17 deletions(-)

I think I answered all remaining comments. Are there any other
objections?

Best wishes,

Marc


> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index 45df190c2f94..214839f51048 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -570,6 +570,22 @@ static void nvec_tx_set(struct nvec_chip *nvec)
> 		(uint)nvec->tx->size, nvec->tx->data[1]);
> }
>
> +/**
> + * i2c_writel - safely write to an I2C client controller register
> + * @val: value to be written
> + * @reg: register to write to
> + *
> + * A write to an I2C controller register needs to be read back to make =
sure
> + * that the value has arrived.
> + */
> +static void i2c_writel(u32 val, void *reg)
> +{
> +	writel_relaxed(val, reg);
> +
> +	/* read back register to make sure that register writes completed */
> +	readl_relaxed(reg);
> +}
> +
> /**
>  * nvec_interrupt - Interrupt handler
>  * @irq: The IRQ
> @@ -604,7 +620,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev=
)
> 	if ((status & RNW) =3D=3D 0) {
> 		received =3D readl(nvec->base + I2C_SL_RCVD);
> 		if (status & RCVD)
> -			writel(0, nvec->base + I2C_SL_RCVD);
> +			i2c_writel(0, nvec->base + I2C_SL_RCVD);
> 	}
>
> 	if (status =3D=3D (I2C_SL_IRQ | RCVD))
> @@ -696,7 +712,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev=
)
>
> 	/* Send data if requested, but not on end of transmission */
> 	if ((status & (RNW | END_TRANS)) =3D=3D RNW)
> -		writel(to_send, nvec->base + I2C_SL_RCVD);
> +		i2c_writel(to_send, nvec->base + I2C_SL_RCVD);
>
> 	/* If we have send the first byte */
> 	if (status =3D=3D (I2C_SL_IRQ | RNW | RCVD))
> @@ -713,15 +729,6 @@ static irqreturn_t nvec_interrupt(int irq, void *de=
v)
> 		status & RCVD ? " RCVD" : "",
> 		status & RNW ? " RNW" : "");
>
> -	/*
> -	 * TODO: replace the udelay with a read back after each writel above
> -	 * in order to work around a hardware issue, see i2c-tegra.c
> -	 *
> -	 * Unfortunately, this change causes an initialisation issue with the
> -	 * touchpad, which needs to be fixed first.
> -	 */
> -	udelay(100);
> -
> 	return IRQ_HANDLED;
> }
>
> @@ -737,15 +744,15 @@ static void tegra_init_i2c_slave(struct nvec_chip =
*nvec)
>
> 	val =3D I2C_CNFG_NEW_MASTER_SFM | I2C_CNFG_PACKET_MODE_EN |
> 	    (0x2 << I2C_CNFG_DEBOUNCE_CNT_SHIFT);
> -	writel(val, nvec->base + I2C_CNFG);
> +	i2c_writel(val, nvec->base + I2C_CNFG);
>
> 	clk_set_rate(nvec->i2c_clk, 8 * 80000);
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
> 	enable_irq(nvec->irq);
> }
> @@ -754,7 +761,7 @@ static void tegra_init_i2c_slave(struct nvec_chip *n=
vec)
> static void nvec_disable_i2c_slave(struct nvec_chip *nvec)
> {
> 	disable_irq(nvec->irq);
> -	writel(I2C_SL_NEWSL | I2C_SL_NACK, nvec->base + I2C_SL_CNFG);
> +	i2c_writel(I2C_SL_NEWSL | I2C_SL_NACK, nvec->base + I2C_SL_CNFG);
> 	clk_disable_unprepare(nvec->i2c_clk);
> }
> #endif
> --
> 2.43.0
>
>
