Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339DA28B7EF
	for <linux-tegra@vger.kernel.org>; Wed,  7 May 2025 15:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746633029; cv=none; b=LaZfqRwVY+x5nV85pZOiERLcB2niH/fBQ40+2cHHB0yjPDcvZuOtQ1qk3dIB5zgN9xq5qhQkBoEwwK5UCGZwI+MK+naeMxbohq+fuzLnFizOMjnuQqwiqtoWM3aCsvURC1uM+x0NUUpv7h+7dayNJPI4/j8M0/YOji13CFWYYV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746633029; c=relaxed/simple;
	bh=MQeVLsFmufMQs4tSLZQBsBZJicfTNkcmEpq9wvilHq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s+WXL5/4/19uPbiGDrNK+sJO6oVeuEyU4GwdI2/zsODY40mixRfWGAgzvVVcjnmobMGOTOCQ7ksUx5vn1oVahYx8IYZKuCmuFPamVp7IfnUOlzJa/fh4IRIBrL7Ns8yGeBY8Jw/iklE01R1QHG3FOgZAqRvi3rXXpp5kU0hYor8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CnFXn7dO; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CnFXn7dO"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-39c0dfba946so16217f8f.3
        for <linux-tegra@vger.kernel.org>; Wed, 07 May 2025 08:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746633026; x=1747237826; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3XArmO2zHe1NgTSOCugIlMV91OaFSwhzmds/RQoWQO0=;
        b=CnFXn7dO9D6VYLeIUDQUHZzCZD0VsSUqPKvZH+CERRuzR2UvCTHKc9QitmENAPnPB7
         zYLSz/ZPrOEU1tz16UGTAF/D8zpOqc7W5KiqlgyeXFBZYN+prsDRo63IQBKc9vnnlak4
         GQrfcHNkIL3EiXtojCH3DYzpuLwsD+H/Y97gHFCsEN2jOlBx5WpIXQltCpSAPljBWhDn
         Uhs/uHb1GWTtNVsmPsJBsPZSWafJ5oI1IF4ThFM44cxMoKRq9ApOtNwajS+SGiTEtjU8
         rVklu3lZTjys2BQKidZD7afy/6jqDsAtnHRODE8+YQX1Fb4D2rnKPzYs9YsDSA7K9cuE
         dVaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746633026; x=1747237826;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3XArmO2zHe1NgTSOCugIlMV91OaFSwhzmds/RQoWQO0=;
        b=LSOV7Mw7IB8q8NR3aUu33aoy3oFiw/yxo8aFaeevzabiyhdim9+KYuT8XTPDS6kh5Y
         s4ccgNfusL0rHHcJjprTCYfurtZlR+bu+KlvlC7lPCVYyJGDLy/wg6+3FjhfSVWthfHJ
         ytmjdE7pZbrNXBuu4gQNy5GPdOM0IBWdjGFfccIM2lKL0TscIvDYtU8lRyaLL0XuX5Ab
         XT6keKqPL08ZZPHi4ig3FDwaWeH8y6r29m7NaT/YhwAHTLM+a9yKnVWlxHYgTmOdORx3
         TKY20mxTKzm39rRwcZLelCOjfi4fNO45fcv42su0e4ohnPc2uq+39TwHIw5tVhcHURTZ
         Q5sg==
X-Forwarded-Encrypted: i=1; AJvYcCV/9guBxLm8gCffmc2QALkS1GaSP28riCh9dQMBseRHCiX5bU+qOczJQHq6SiTpxhgS0pQ6jP6jwjUpCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYvzwyAc5UX2aRcCHPx9+fePAGbyOUmIfTf5naeuqjQBZIFJYC
	jFZTPTUslucRWK1oo3cZCnCK61ISwYiuEIS4LAEcuq8twqo8K/+C
X-Gm-Gg: ASbGncsEleuSM/YcEmyiEJyLleXKWJt/j/h9BbdHKoAjwneheS1VqIiLs0748ooJvAh
	XHZCicm6Z2WaYgqBRydkI9W1Ee21XAtoj0BuwDllFTdyp0bE25ozRWpo2otVWPKKC5pH7gri6WF
	Rh7TBK4jqsBagwqq1PyIOFyf14rvx/jqfMQkl865FdEC88zGHqBDnQRosSC0/Ct4VhZGWQtLWZc
	HEAhzODExefnIsq3W5wleeEsQTtL2BjnUOVJzsRNJPTSC0Lb+JXof2BqwzFO5sPT/kW9WsDXgpN
	sAos4/rpqC6Y0lpJ9fdZt4zS0kJxnKGRyuEozg99bVI0kPxFu1KiqZszrpqIuhp6nqhP6uIQzxJ
	bAkTw9jrJ0G+j5PPGLZrv9w3r0UroUnNIRvYr7A==
X-Google-Smtp-Source: AGHT+IEUj0r5+bPExNa7QXy7YMEx/UNNIRMfaOUw1AfiD8WFXvb1kGRAnzb6MbYOoXr4iSguE5CLXA==
X-Received: by 2002:a05:6000:22c2:b0:3a0:b930:b370 with SMTP id ffacd0b85a97d-3a0b930b52amr464513f8f.28.1746633026347;
        Wed, 07 May 2025 08:50:26 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0b44ad93asm3375394f8f.91.2025.05.07.08.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 08:50:25 -0700 (PDT)
Date: Wed, 7 May 2025 17:50:23 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] gpu: host1x: Remove mid-job CDMA flushes
Message-ID: <z2ddfg5pjlehoo5r7vjlhm7t4jusjsblujcn7qy2tnc6ioesxt@w5ybhrazrkx5>
References: <20250204024546.1168126-1-mperttunen@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qfmapx2y3upagwor"
Content-Disposition: inline
In-Reply-To: <20250204024546.1168126-1-mperttunen@nvidia.com>


--qfmapx2y3upagwor
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] gpu: host1x: Remove mid-job CDMA flushes
MIME-Version: 1.0

On Tue, Feb 04, 2025 at 02:45:46AM +0000, Mikko Perttunen wrote:
> The current code can issue CDMA flushes (DMAPUT bumps) in the middle
> of a job, before all opcodes have been written into the pushbuffer.
> This can happen when pushbuffer fills up. Presumably this made sense
> at some point in the past, but it doesn't anymore, as it cannot lead
> to more space appearing in the pushbuffer as it is only cleaned full
> jobs at a time.
>=20
> Mid-job flushes can also cause problems, as in an extreme situation
> (seen in practice), the hardware can run through the entire pushbuffer
> including the prefix of a partially written job without the driver
> being able to process any CDMA updates. This can cause the engine
> MLOCK to be taken and held for extended periods as the tail of the
> job is not yet available to hardware.
>=20
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/host1x/cdma.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)

Applied, thanks.

Thierry

--qfmapx2y3upagwor
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgbgT8ACgkQ3SOs138+
s6Gdag//SKI4A3pKqM1VtANevINYZp81X2chnY4ArN4+TPPfkrCZ+1d5+8ThbF85
fYAdxCf0sI2+j9vKxGQOm0St0W8B/4STb21kmR0l9SKh2uElMNgglbR9AMoBPABD
dxWAxnbre5QTOQcD+08bLj8zD7QDmozPSI8XahgGyq3nwgjBROHPdvyEeOet1bW2
JGxt/5mwHIwwf52merw8MKMyfGp4FeWamt0SmKtmnlt5h5mgJec4A3KU+Z1/tBxN
zKcj1RpItGxXFenlOdvq0tr69SRlPYHjlr4MlMV6FGqLK42e+U6aTDL287QyDidM
yp27f4mundMwmctybbs/oZGTKPuBv75RBq0KiNlt2y3TLlVREQgwYJtVdb53yHOB
xQ8NTBf1Gcw77G0ZiNxImVIUicLrstlqGh9PiaP5UWABlXYkt9gM7hDsdackWJeK
w/EC6p0JOlr64jXtu7+9fE80E7AxjpjeLerNoRTTo4acvWu6ykj9iZ3aho1Hdnv6
HTFP1KDeUY73MmWzRm2psjR4X5QVjIvkNL5TuwJOBGHvmyOZLFSvyrUwP6//4KnP
vV5T6Txy9J9bTSuZiSChQk/B+HWphSWkgiDBhE18SuF6cunVpy7e4EAP8aTbF27w
TXrcs+Tw6f4oJfPcjUnnnutTu5iXE1Im3OZLgoPlXwmPX+i0DL4=
=4eM0
-----END PGP SIGNATURE-----

--qfmapx2y3upagwor--
