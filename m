Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2621030100D
	for <linux-tegra@vger.kernel.org>; Sat, 20 Dec 2025 10:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766225368; cv=none; b=EqrXdDmWvNg/GQHKmlG8/T8qTX6Kpmx9847WVV7MlL0Smm839bT2sbZUyiQ7a0uGoPjBa7IgpOGdZC4qKVIHv/tGAzLRIMoYm6UXMLdDroA3QF1g5F8XIibVX4kDwKThfYcjfJszLruleP0vhGYKR61Kc9i8gPDaDRmTh4NP6A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766225368; c=relaxed/simple;
	bh=T286e3Yg0Q0S75/6v0G/eny0pp2qOlq56+De2M6BuMo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OGy4fUldCoRA1g0agIRSn9QakCADVEYx9bSXMhmO6DwDH4CgRKMAVDdUVVrqMA44wYlFvSPMfHfornhAGa2ihyLaQgXeBtiLMFv0LvCW+hfDiSEgoVIHHPe5sPXavX/upEai6tlSqfQH54erDGVt9ZX7gR6ImGeq+tJrQa1bw0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XJX2zX4f; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJX2zX4f"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42fed090e5fso1260268f8f.1
        for <linux-tegra@vger.kernel.org>; Sat, 20 Dec 2025 02:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766225365; x=1766830165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YltJZVr5NuyQpfEZwyZbwRl9KappV6MIekKgUZHqamY=;
        b=XJX2zX4fYdPNyfKBIoOBvFW7369gvcKzBVaLpKWROIFBLLlfr5HStNIW58IUJZRXqJ
         D9TDtT4sYYmVICg+2vDLUaKKCnA2zW2rUk3UgG8TOpOO66ef47GGbs7yTKc1nJa+qC6i
         0IpcO9Asz3yS3H8OelXoUC0tSJN0mvHX7a/FFopHA39cAgv3uxV0HRSo2ss9VrbfZaKq
         eeU4oZ9GLLBq26on/SgXOuujLWaq/i8EU1wIUrIAVYKcU3fnWv9KyUn9RovgA8wxtAkF
         DTKbpkJvDDESa8d08tx02q1u4dnRM+pW5px0EkaCc4nr6S0YC/nWHpmuh/S+o/lDXXA3
         jDEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766225365; x=1766830165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YltJZVr5NuyQpfEZwyZbwRl9KappV6MIekKgUZHqamY=;
        b=aq+VlNUOrOpbYr0ZRSrB/l01m5iaQpLRRzmPlRGG9/0VAmrFZ9IJsgGPdF4T8AtqBU
         +F8BgCTIYDd45SQ5gm1XAE095QwGz5RNHGqMEtocMrTE4k1TIEIwX3aUmF9iwg3QZQWO
         4o9W8RsO3vsEkhty8MkD5DNL2xtvOvuZ5k9mAMi/m99odu8ZnKQAgTcd96cH2orndLyJ
         mCbO4b+FqKpKQVHZAiF/De6M3bKtfx/D9iPfihKfez5MQcxSe3Wth+Kr7y5G+gMtA/9B
         mhYJyiEIUpqmEdPkBPF2/wtoEkTVMWVZ6+zd7dm/63zTBPSXiCVBpmpxl9SqmCqTYsp7
         9Qjg==
X-Forwarded-Encrypted: i=1; AJvYcCWSAqDxkZwj09kXVlW2Z0CgOPhwxL3U1HgzR92K8ZJtSHb5ub2UyBXmo1FNitK4aIxdBqcdRhlGjrN2Sw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxViyyn2rq1/HZxLC1qK3VoY+EKWbLynsktKYnyg+FJ233OkuFf
	DkYmq2QYItS5ySisPFqwNOeSl+7phavxBrYcwYxwyLOqZ7o2qjfOYKRP
X-Gm-Gg: AY/fxX6i7LBqk6aijYvOieqRF4aCe1YWavk34wgIFJFeb1cMNlZ/c7nv9FZ55GOWiBy
	x+Ywe72yfWmKUTpXCUUnMd8x+qI9mOTKGIuj9WnGFMBs4I2yCo63hC9tYBipzM/kRJkJE2iefvc
	RToYrsOAK1AudB0g2S6TwPvztZgME/TgaD50j3ybSwQ3ZA9raUyMD2HfDHYw2hJHZP26QAnSkH9
	O+KZwEhldFCqYJJhdAM2Y7Pi8QDbXl0AzaZ93s9NajUmiB3qQ0Hnj4QXFiGU93t67rhBwkNurJr
	my71e1mIu+41A5T3cLgNV09n1hL9Ge77Fbr6oieZmjhgdCYeLX1CEOi0c45OINq1Vmb1wQ8NZWG
	IfFYa7LcGI8Fb1JAyu4q/4dRDjn4TOY8v9iZ1uEe/wa26NoVXop9k6lzag+RTycgC2dX2ZhtwEu
	dy3RKpqisfsYEwrb8uChk4vZBNlJ94K6JJfwwh+g+kzjtPcBNEonE4
X-Google-Smtp-Source: AGHT+IEVS0YXlTRBLtbgj2BbSWCnRw75i1fGTOjJqia9uMJ4AbbjmPLtb4whaBSPbMoQAZnfFVwMxg==
X-Received: by 2002:a05:6000:400f:b0:431:5ca:c1a9 with SMTP id ffacd0b85a97d-4324e4c9e82mr6668504f8f.23.1766225365164;
        Sat, 20 Dec 2025 02:09:25 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea22674sm10222429f8f.10.2025.12.20.02.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 02:09:24 -0800 (PST)
Date: Sat, 20 Dec 2025 10:09:23 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Preyas <preyas17@zohomail.in>
Cc: marvin24@gmx.de, gregkh@linuxfoundation.org, ac100@lists.launchpad.net,
 linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: nvec: replace short udelay with usleep_range
Message-ID: <20251220100923.2a3de6db@pumpkin>
In-Reply-To: <20251220092229.16606-1-preyas17@zohomail.in>
References: <20251220092229.16606-1-preyas17@zohomail.in>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 20 Dec 2025 09:22:29 +0000
Preyas <preyas17@zohomail.in> wrote:

> From: Preyas Sharma <preyas17@zohomail.in>
> 
> Signed-off-by: Preyas Sharma <preyas17@zohomail.in>
> ---
>  drivers/staging/nvec/nvec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index 263774e6a78c..6ffe5e8656d1 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -648,7 +648,7 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
>  		break;
>  	case 2:		/* first byte after command */
>  		if (status == (I2C_SL_IRQ | RNW | RCVD)) {
> -			udelay(33);
> +			usleep_range(33, 66);

Given its name the function looks like an ISR - where you can't sleep.
Spinning isn't a good idea either....

	David

>  			if (nvec->rx->data[0] != 0x01) {
>  				dev_err(nvec->dev,
>  					"Read without prior read command\n");

