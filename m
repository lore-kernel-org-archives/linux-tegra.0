Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EC4386C25
	for <linux-tegra@vger.kernel.org>; Mon, 18 May 2026 05:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779080912; cv=none; b=VuTbZw17XhkYcUZWc/7fva+F1Vc9Er8qLc6KxopOorXThCmeWtB5V0R4dhl8YyMDz89PWf1w2SChyn3haiI5qvG+irvFUen2bQOzQg4QJkdrq2bMOmZ2QqbeBOFujdOIG1oyG150cBV74pHTdAdQDR6IeB3FfWYL1NPZtF+HjvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779080912; c=relaxed/simple;
	bh=+36rpvZixCz3dcHBWPHznA1fUug/+AJB870vCAqLJa0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r6VFOHJkHCm0llz0dNSzXw5wmF3zSvi1/g4RBvwKpPaRCn8PdGNtZTmMx8lmkZN5rqQvdWI8to9BHQXFmDEvxTTxFJiuXW7wN9AeIOlWtYuICtz9fWP4CEJQ4OLe4r1kDI4I8z3mtBrjW5YV7+TYQSulXw3qzJC8hokEf5BsKPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c/KWwwZm; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c/KWwwZm"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45562c41ec7so895893f8f.1
        for <linux-tegra@vger.kernel.org>; Sun, 17 May 2026 22:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779080909; x=1779685709; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DuHdrpK6dCZDNp5i65/Z1rewEsn0x2ZcutMsNSGxc+Y=;
        b=c/KWwwZmU+E5MN5PxmRYydErplOrvs+t0Kc7xkHoPNqLoZRKxZ75eUsfOwgYmFr/GW
         yeJtYXeTxQK1BPrIlRhPjNjPaIvphTz1TOAryMtSaApbb4tU3xtSmGX6QxlEdP4dQCSv
         YUAH+l2yhDc0p10dhs0grqr9RI4w+sDkGH82XTTONyZypVJWrt0GwQfdXK/bmqRE2h+3
         g4mWrS4T1s/eMBHoN53Umwe7Ggb1Tsl+DbD08UFYURiRlUt7XFBp8lyENGlnnDNdTD5v
         DPR65p12x4DFdWSWhxBwdTpdpebfHBkHSFS8O280IxvWZ0f6eox6YDsnNm6JQmNe0z+/
         VYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779080909; x=1779685709;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DuHdrpK6dCZDNp5i65/Z1rewEsn0x2ZcutMsNSGxc+Y=;
        b=DeW1omHXZXOKoaVIMyhFgjDB/Vh6Egyp5gF7yWgNUlEN7+ZJcSohvnjzPbijbWZApT
         xgrp3Lvz6jprmvHGl575RM0Xysz2hVZsaZBv6BY8GmxjZA4kEurNfSfcFRPgBN9uNzKL
         pep3IYWsprce3pYyDz5qlflH9OlGL/l+OPuDIXyjOsdq7fWbLpWkY0UoSQq3PnhR2Nc0
         BmEo2d0kDeS6Km3kjUluGxLU6UrxBbmsTFPKlNYi8IOh7WnfHaIzmHQjevIHSWXUa/sg
         BMf2sxgiO+qMH2Y+SUn3bq0724QwFnk9g+XRafGse3d8Ps2mX1wKwr+bPxgy+2PV/O4I
         778Q==
X-Forwarded-Encrypted: i=1; AFNElJ/qzcrv+Chx/3cjFT8y3Btynay06VV/GT8strcrXzvXegjCkTvRUyFjZng+dg2VbovuRNtTK81+8UvYLA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeEUtScfiAbp1cVeMzs2GaElYzlORjo3TDWezy2Jb403w9CzJT
	ZiAUDpVcRRRdsru+3sPzGXIfPqI7seDABoUa+VyqDQMuHj2mdZSzEObp
X-Gm-Gg: Acq92OFHsMMC8iN7UlCzkYsfTOxQCBFADHyp8l5MtzGjljlUyAF46FujWwmt9ONxJwl
	2W9VSzHzd6DxBqh2eeOi9X6h2bamUvGL7qGwq7hrEs2HB87392PSdCqRns+Ni7XAM+nN58DD5s1
	Pbp3CAZLmYb7dxWgWiBfxVRP8fno6SLoCl669UaoOREyNf5t581iqG70Ib8+kLnTgzaJACcePKJ
	knwIcGn+BmognU1vk7EpYjxDwMRAHS+QJrXFmHsbnowcvJa3LWTSIx/8p79fl/Rvuhjrz/RTG1U
	ZZspBYaugVrfcbbyc40PWkDy1OXLkZdGKh2cCN5auhiKUxeIwgR3WBmohkanJWSXpOgrhNCpXuN
	Ud5qdUnkhlW+Ycc0bwP5fBxigFL4yQZ/SY2bgrK9MGOAAKDXQZdS9IoBGy4jJ7R//NbqGba2HY+
	kG7uNPwYFMMhRMLxnbQNFfTfsbN2T7YA==
X-Received: by 2002:a05:6000:25c1:b0:43c:fb48:6856 with SMTP id ffacd0b85a97d-45e5c5af3c9mr24564453f8f.13.1779080909605;
        Sun, 17 May 2026 22:08:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a19a0csm32564625f8f.20.2026.05.17.22.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 22:08:29 -0700 (PDT)
Date: Mon, 18 May 2026 08:08:26 +0300
From: Dan Carpenter <error27@gmail.com>
To: Diego Fernando Mancera =?iso-8859-1?Q?G=F3mez?= <diegomancera.dev@gmail.com>
Cc: thierry.reding@kernel.org, jonathanh@nvidia.com, skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com, gregkh@linuxfoundation.org,
	mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: media: tegra-video: prefer using the BIT macro
Message-ID: <agqeyhCD9g7IjqjS@stanley.mountain>
References: <20260517060511.231437-1-diegomancera.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260517060511.231437-1-diegomancera.dev@gmail.com>

On Sun, May 17, 2026 at 12:05:11AM -0600, Diego Fernando Mancera Gómez wrote:
> Replace open-coded bit shifts (1 << 28) with the standard kernel BIT
> macro. This improves code uniformity, matches style guidelines, and
> prevents accidental signed overflow issues.

It doesn't prevent any "accidental signed overflow issues".

> 
> Signed-off-by: Diego Fernando Mancera Gómez <diegomancera.dev@gmail.com>
> ---
>  drivers/staging/media/tegra-video/tegra20.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
> index e513e6ccb..08fa234af 100644
> --- a/drivers/staging/media/tegra-video/tegra20.c
> +++ b/drivers/staging/media/tegra-video/tegra20.c
> @@ -177,7 +177,7 @@ enum tegra_vi_out {
>  #define       CSI_SKIP_PACKET_THRESHOLD(n)		(((n) & 0xff) << 16)
>  #define TEGRA_CSI_PIXEL_STREAM_CONTROL0(n)		(0x0018 + (n) * 0x2c)
>  #define       CSI_PP_PAD_FRAME_PAD0S			(0 << 28)
> -#define       CSI_PP_PAD_FRAME_PAD1S			(1 << 28)
> +#define       CSI_PP_PAD_FRAME_PAD1S			BIT(28)
>  #define       CSI_PP_PAD_FRAME_NOPAD			(2 << 28)

This change makes the code  less readable.  There are two bits, 28 and
29 and they mean something.  0 meand pad0, 1 means pad1, and 2 means
no pad.  The patch jumbles the pattern.

regards,
dan carpenter

