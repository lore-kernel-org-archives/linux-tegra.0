Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDC8346AC3
	for <linux-tegra@vger.kernel.org>; Wed,  8 Apr 2026 21:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775683569; cv=pass; b=IDaFdnh2Co9NMi4nhvhvFcUFTH+e16qp0DraFjlpoRmEbEaY0N/wfNIu1KuHhn6lK3gqgze2dT8t3pk+oxyts0lUZt5izzVrHMpkXhROXBG8IsInQ7VDPGLOwMSmup0TFUGj+YrtXeLw/ouhqC9cW6DsX+JGG4SXKKXEt20b4YE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775683569; c=relaxed/simple;
	bh=IjEhnGk+PnwNFCcn8LSU9mwNYM/h4JiXspnBYoeLYKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M9gvRq1LwPsQHpHkqwaqiipfPJvHnusJQVzqpPDv2gU9Iab5nq35K5LBxO98Pvyv2GipiCb22lBEKJdKBwmROI88wzU40jHQmZHVhxwhpjDE5Jpubn/kfoxYA7VzuaCtHIIaYpLZTS2r1hs0FOqUc8KPzhiK7Na7AKpx7AmJu2w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CTndhkJQ; arc=pass smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTndhkJQ"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38e09b14102so1772751fa.0
        for <linux-tegra@vger.kernel.org>; Wed, 08 Apr 2026 14:26:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775683566; cv=none;
        d=google.com; s=arc-20240605;
        b=fEE0o5vA8gXeQOgu268a21EQTKGD4Gow10GP1YVxu9cGgu9vBLpckfo46C6yKbTK5Q
         8vg+7X6m7RN5PUzT4wMHQRC3ZGRsHvWj2ryI0biWlrxRcagmHOw3Y8nFLc6x2w7CnCG5
         3oXgR2i92V+/azUaexjXQLa450dfjD8MDJHICfuYCawGIIWQZ/tcpzL/J1ANF03OzJIQ
         lVyWPWrTOf3xM1IQ93jjwZyv4k/toCgAWxx2Xcs7Y1PrXRleOlAAhr1XugvIeae+nphY
         50OzQQ8obQ2gmv7RrmwPKke/lM9OeaxLqGPo35VBW1+D6TBzv7iLQaURPY/ybyN5u3NR
         jOcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dwZXnwgA8rxc31lodqUK1A0pWXEiOHI8DyLdgVyJCi8=;
        fh=MoAKbqoBghpw4CqgfheJfVxp2q+DAAC7fhyC09RAnFo=;
        b=c42hdXQlJwxEV2nid3Ub+nGkekN/X1CPUfuJk0Ylgt1+NtcA4/SQUs8UmQw3jSapyL
         R/8LhoODOK1YqlR4dal7ALGebBP7IWcpV9qtfXWMMlAbgzAMcDJCW/FG4nY1bWiPtCaP
         p3LSNBi/x2IaZffMX0iHr/NrWougmFX4aoELskrPOKq/cmII+JFqhbTVeXQkVD6k+l5K
         OrfSrXhbi8DWWdn0wUr0Dsq7iQgsTOCLz77N7Koxw7E1EOYDMbSrIP7P5xAC4tIBQc0V
         PzqHOQ3dIsMVB07AwtEV3e8UvGRHsuOKtRFhFeiWLlgnrOIAqH4kNES6B9RM/cPIJKCI
         S8dw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775683566; x=1776288366; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dwZXnwgA8rxc31lodqUK1A0pWXEiOHI8DyLdgVyJCi8=;
        b=CTndhkJQ/Wq4jJ1qvXKvvzBYIJe+TDLnIZCEXNqKZdSZ+T82THRh4J7BSeg+q/sgxG
         +5MxHTJ6GpWg1ao88BdFJMvFzTmj8TPQLHOPfRSx8yTjYWDH3mkmKVzhMvCQqR7UCcNe
         3NfN0dlYjcLt9ekb6mzQTGNC+hDhV/Z392oWuDX1gHOvU/y4iBZZeHsCQh7niIxWr3az
         oLi7/8YiX7JuEP4ImJFOjWicPC6X8s/MV67m5cE6/XEZbOvRw2Boetnu+V6lrIuk1zpg
         A9xx0lkqyk+WW8mGaG8NOsD87zppXnegvaTgXysEpzebCmpseIioV3Jqd3HyXBbJUYh9
         wKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775683566; x=1776288366;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dwZXnwgA8rxc31lodqUK1A0pWXEiOHI8DyLdgVyJCi8=;
        b=Jgq/RUb+Mei2gX/DvCnh2GPM+Xfg68Da4FjFCe+UXdhFNWGR7zvrApsmVxcNOFJs2O
         NjVoePh6Xl40aO+k0YiYGyJYgerSGIC48Xw6E/Uitjm1I+XN+XQCfYmZ9A9V9wWCu9Q2
         iQbZOm0Qq179KUxW57ejk5KInqRchyb48IgdKr9TjKwXWU3IiKIXvu4xV3PvQIuLOghX
         F8nLCTP07EcGpUZSplo51u/t6dvAz5eW6dhlX3VYfe+ITrtwWGWQ6sORd2eQHM35cNy/
         C33Nwo7SfJTmKQAtdU5Ippy2NHWHy3851a125dym2jwVNPSb/huGxwQx5cKLrY1rb9m2
         Vynw==
X-Forwarded-Encrypted: i=1; AJvYcCX+EojhgrV908Mf5Du1gYQgeMjhiRGvP6y+dv6n5/rxFGEW/vFw9kPXTCRi4zd4XTLysmikXqTBnUFfbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzS6ezTxzDZs0L8sDFTjcMmCVZzqQrZMf4zBAHdR3rJaW1mCuXg
	dWhBgr+SXPshMcsjDFKsJPN46ZFQuA/K6UEYLvTQHyy1UyxgRhhZIV53AdWVMVubK0Aq3mFaEBD
	CiMWSu/3olG7Cmwddjp0yRJl2qRWFugA=
X-Gm-Gg: AeBDieueBoYkK5RwsYI8uGJ7ngnRF8sj3cePJuC4SWpVuXKsyRz2JfzRRap6cbvjGgl
	3PulBoOmozrejDJeYzxdGesLe4K1ddUKz67gfsLPzwfnq32kx6juebueXubRYTznhUNqzHNln4n
	dDAxFOF/7A3tGh8vLoqgeccfYqmL7juIT686tU7WKHs8Xuct4N2AqxY/uqwLUmjtdkB6JCD1sBB
	3gQzEF4czI7QXhGT14Af94zfG+S3obeUNmeZNNdbWETuQQy3Jo1DkykGmjDoEgJmqfm2cl7FWUw
	vGf3N6ZXwigZCvtM80LvKxQEEUOTCToOx2xAvUbQL2zeWr+vdQ==
X-Received: by 2002:a05:6512:124c:b0:5a3:d306:297 with SMTP id
 2adb3069b0e04-5a3e7a236e8mr378775e87.13.1775683565728; Wed, 08 Apr 2026
 14:26:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260407170308.100238-3-piyushpatle228@gmail.com>
 <20260408170818.70322-1-piyushpatle228@gmail.com> <20260408170818.70322-2-piyushpatle228@gmail.com>
 <ae440ab7-e1ba-4f38-8ef9-85371f3236f0@sirena.org.uk>
In-Reply-To: <ae440ab7-e1ba-4f38-8ef9-85371f3236f0@sirena.org.uk>
From: Piyush Patle <piyushpatle228@gmail.com>
Date: Thu, 9 Apr 2026 02:55:25 +0530
X-Gm-Features: AQROBzBu6KzdQPIYr38nwiFPhnZEm0vYHac0EK6sgh9vp6wbo8mZ1lzGfAkVeSI
Message-ID: <CAMB+xkZbxeOvfjH5kWQxZXJ792wZSWJntw+wO90__artt71+=w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ASoC: tegra210_adx: simplify byte map get/put logic
To: Mark Brown <broonie@kernel.org>
Cc: Sheetal <sheetal@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-sound@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > +static int tegra210_adx_write_map_ram(struct tegra210_adx *adx)
> >  {
> > +     const unsigned int bits_per_mask = BITS_PER_TYPE(*adx->map) * BITS_PER_BYTE;
>
> Why are we multiplying by BITS_PER_BYTE here?  We've got a number of
> bits already from BITS_PER_TYPE().

Okay correct, that's a bug BITS_PER_TYPE() already returns bits,
so the extra * BITS_PER_BYTE is a unit error. It also references
the wrong type: the bitmap word is unsigned int (which is what the
original code's hard-coded 32 came from), not the map element type.

For v3 I'll change it to:
    const unsigned int bits_per_mask = BITS_PER_TYPE(*adx->byte_mask);

>
> > +     for (i = 0; i < adx->soc_data->ram_depth; i++) {
> > +             u32 word = 0;
> > +             int b;
> > +
> > +             for (b = 0; b < TEGRA_ADX_SLOTS_PER_WORD; b++) {
> > +                     unsigned int slot = i * TEGRA_ADX_SLOTS_PER_WORD + b;
> > +                     u16 val = adx->map[slot];
> > +
> > +                     if (val >= 256)
> > +                             continue;
> > +
> > +                     word |= (u32)val << (b * BITS_PER_BYTE);
> > +                     byte_mask[slot / bits_per_mask] |= 1U << (slot % bits_per_mask);
>
> How big can bits_per_mask get?

With the fix above, bits_per_mask == BITS_PER_TYPE(unsigned int) ==
32,
matching the original "slot / 32" / "slot % 32" expressions exactly.

>
> > @@ -118,9 +144,7 @@ static int tegra210_adx_runtime_resume(struct device *dev)
> >       regcache_cache_only(adx->regmap, false);
> >       regcache_sync(adx->regmap);
> >
> > -     tegra210_adx_write_map_ram(adx);
> > -
> > -     return 0;
> > +     return tegra210_adx_write_map_ram(adx);
>
> We need to unwind at least the regcache_cache_only() above if resume
> fails.

As per Jon's comment on the same patch, I'm moving the
byte_mask buffer back to a probe-time devm_kcalloc() in v3, so
write_map_ram() no longer has a failure path. runtime_resume() will
go back to returning 0 unconditionally and the regcache_cache_only()
unwind won't be needed. If write_map_ram() ever grows another failure
mode in the future, the unwind would have to be added then.

Thanks
Piyush Patle
