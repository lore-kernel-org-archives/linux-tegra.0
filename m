Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D201117D881
	for <linux-tegra@vger.kernel.org>; Thu, 30 May 2024 15:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717081758; cv=none; b=JCUfLLofko3CXBppOi7TGyUIwhfyq1AgwUQEPsaELO04qVkn4HSkmPVhfYaFGMlWOwRDbQIts9Gb5IM+Ew0uIEz50IkbjQLtcN1LkL+OSe1BqFqwQDovfEdmw90TXCZfNHDu2EWiB6a0lwGa52fSCmUuD+J7zBSgwkKWkK/cvCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717081758; c=relaxed/simple;
	bh=hVxQut6/A+6owEMFeAwVBYjXFUxWPg2fGrJyuI3OD9w=;
	h=Content-Type:Mime-Version:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=er69h/7yKdG3akcxxqmvYQwaGUl38RO0CIj5G9J8o/37qdET1fG8VJn3uR1n8BSgaDALtWeSIMANYxgyr+ZhJzRpG7vSmV67Hg6B3HOftC35RNlOpklP3qnSb6PHJqcVl4liiMg9lFbDPA715CxidnaO42HDzo+lDuA9wBoBIUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NUzyYa7C; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NUzyYa7C"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4211249fdf4so10887625e9.3
        for <linux-tegra@vger.kernel.org>; Thu, 30 May 2024 08:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717081754; x=1717686554; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=af9Av8jLWGpWFgvSSPobt4rUTFuNu/kg5mD6y39r6OI=;
        b=NUzyYa7CDJl6YsMzM+kxOfkOpJ47tS3nCMEcJtVQiJNaLBr9xsXwaIC6t/ZUZLhjq0
         R8662lH+coFt+gRHjSc+4l6SSi0EdMMI39f3XiBjhMgclHGGd1ASQFdit2+LkiW3quWs
         fpuqPqu05d6WmVUPKsgwse13HeE6+AMY5uwl74bIjDVCqhRjnWEI/bbMs9Ul+X11bHRd
         ucTlSSIqQ3r76c8ftqvKNgL9BchnYVsIDgDBGD7roRykIfymtDvSpOBxSAMK/V2u0tj/
         as/mid+Rr+eRiE/1m1ZGII37vDy5sQz8wdI05uNmAaYvcGIO8/OWNaUoQAf4sjLrDtmR
         60VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717081754; x=1717686554;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=af9Av8jLWGpWFgvSSPobt4rUTFuNu/kg5mD6y39r6OI=;
        b=h/j2Jd6CH1aCUYxwxrbekbU4niGXiPBUSprkDU+0yOPfJaMhTuZC/I763fU1N+HEsg
         yKij62sLjwyXOk2m7jAWftYP/9xbiuaQW0UiSzQBn0mLIny8EZFUoMmFsJq6bnQlJ6pT
         m0g6YJohAeyhxe3wiV8QlxaLZ2IHVrkCh8s6dLGyEM9s6F4vAECvXe5ncaXUDj8EMCw/
         vH8yUaLxFbhbtjOPe3pFrsrCepLWM0kXqTcM8HOLjEdLSpW3jWf+dANxPranV8/Gni/H
         s2467M1Jr7r8c40KjxiNbf1eGTDz48qP8n8GBgao5yydGRQDlrDIxdAu1oIi04EqreZS
         +QKA==
X-Gm-Message-State: AOJu0YwYA3wIOdTrqnqCeWhk+MNTgM5u8R7XGklamVPuaekLbjtnQhH+
	TGyf1gY+ne7mZwb9G88Mo15eEuG0IiPwZ4NhHZDEya6GCrx0iyu/6pMaww==
X-Google-Smtp-Source: AGHT+IElmR12MCMgFUZ8NrehuyZ8veF+ENpuEqBQDDHLFwR6qh8S7fDOqHaR0V3Dj0psvUv111wlAw==
X-Received: by 2002:a05:600c:b8a:b0:421:20ac:1251 with SMTP id 5b1f17b1804b1-42127931776mr23352095e9.40.1717081753811;
        Thu, 30 May 2024 08:09:13 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42126feda3esm28248245e9.0.2024.05.30.08.09.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 08:09:12 -0700 (PDT)
Content-Type: multipart/signed;
 boundary=db3bb40bdf187994879074422ba456ae4c2a295b4c12557b6d0e0dc5aff8;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Thu, 30 May 2024 17:09:11 +0200
Message-Id: <D1N2OIXAF6QQ.3TCYLBU42CJ3U@gmail.com>
Cc: <linux-tegra@vger.kernel.org>, <gregkh@linuxfoundation.org>
Subject: Re: [PATCH V2] staging: nvec: make i2c controller register writes
 robust
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Thierry Reding" <thierry.reding@gmail.com>, "Marc Dietrich"
 <marvin24@gmx.de>, <linux-staging@lists.linux.dev>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240526193932.57277-1-marvin24@gmx.de>
 <D1N0BV7W6LDW.19UTZTRSJJD8S@gmail.com>
In-Reply-To: <D1N0BV7W6LDW.19UTZTRSJJD8S@gmail.com>

--db3bb40bdf187994879074422ba456ae4c2a295b4c12557b6d0e0dc5aff8
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu May 30, 2024 at 3:18 PM CEST, Thierry Reding wrote:
> On Sun May 26, 2024 at 9:39 PM CEST, Marc Dietrich wrote:
> > The i2c controller needs to read back the data written to its registers=
.
> > This way we can avoid the long delay in the interrupt handler.
> >
> > Signed-off-by: Marc Dietrich <marvin24@gmx.de>
> > ---
> > V2: rename i2c_writel to tegra_i2c_writel
> >  drivers/staging/nvec/nvec.c | 41 ++++++++++++++++++++++---------------
> >  1 file changed, 24 insertions(+), 17 deletions(-)
>
> Hi Marc,
>
> I've been trying to find out why we need to do these register read backs
> and so far I haven't found anything tangible. The only thing I was able
> to find that sounds like it could be remotely related to this is a
> mention of the interface clock being fixed at 72 MHz. So I'm wondering
> if you could perhaps verify in your setup what the I2C module clock is
> for the NVEC controller (any dump of the clk_summary debugfs file after
> boot would do).
>
> Since I'm not sure we'll get to the bottom of this, this looks clean and
> is certainly an improvement over the udelay(100), so:
>
> Reviewed-by: Thierry Reding <treding@nvidia.com>

So, after digging through some more old archives I think I now have a
better understanding of this. Looking through the Tegra I2C driver git
log I see that the read-back was added in commit ec7aaca2f64f ("i2c:
tegra: make sure register writes completes"), which mentions the
PortalPlayer System Bus (PPSB). That's a custom bus (similar to APB)
that can be found in Tegra devices from Tegra20 to Tegra210. The first
chip where this no longer seems to be present is Tegra186.

Now, as Laxman said in the description of the above commit, this bus
seems to queue writes, and the read-backs are needed to flush the write
queue. Based on that it should be possible to narrow down the scope of
this patch and only do the read-back in a couple of strategic places.

Again, not sure if it's really worth it because it could be quite tricky
to understand where exactly they are needed and people may miss this
when shuffling code around or adding new code, so doing it for all
writes seems like the safer option.

Anyway, scratch that idea about the clock domain. It might be worth
adding some of the above background information to the commit message to
clarify why this is needed.

My earlier Reviewed-by stands regardless.

Thierry

--db3bb40bdf187994879074422ba456ae4c2a295b4c12557b6d0e0dc5aff8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmZYlpgACgkQ3SOs138+
s6H6VA//QWZQnRRBmCvq1HLYApg1V7yPrLH8stvjw7uRw36Q2Wk5IJLbNLg4YfRQ
jPOV5CHuAvBjB8qYnvyMn8SJZ8FiNkbQw3H5LoLePzXDlDMbxSePxg3eOMy+U4Bl
I3gCRxAZcWiOdBqi7sNlfPlLAwixkxAuYmlsASQjapbi74YFQI52sTqmcDkHcW/x
EmsgId8ewt3bsFZodXGm4ALb0RCRhtxDwHr0Hc94sgKuwUh7pPdc/fB5aaiIqNr1
mR1XHqs5whMX7ufiijRaWo99i8VyBWIo1Fuo9xSNfJfJyy1YFxez6HOH0ZJbqXqa
MsMSjj4mC7LRQT0q7/L1+D5sA6ThQEu+2sU0vBQNMYXD/mG81T2K97tYf3N1oOms
mHS10d/3E7MvmijXpquFs7N0E6iFREEJ4X2Rheth+0WF8gZiHcV7rb9F5lmMsoHM
Kvvbt82lvB6p1BOTL2zhtakhcrKM3QH8CBAHU8KF32GI7ejl6loM7sEFIK6UDV2O
Dp5FN07CCjzjihmbgnCLdDmDzzxRuEwAfRswrD+T8D4jHvLiEHItGTiBmqQCJit7
KQQOh8h+/q8ee4k1INcfjIVEvfykIrgZRav/1TICtX9k2qSLtw7isxMSx0GaAIF8
QPwEEczLYHpeozFGXDmKobY4LTghc6yLT/BfOOG6vGFllGiGWJE=
=k1Nm
-----END PGP SIGNATURE-----

--db3bb40bdf187994879074422ba456ae4c2a295b4c12557b6d0e0dc5aff8--
