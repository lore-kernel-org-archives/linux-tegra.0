Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82ABA18755C
	for <linux-tegra@vger.kernel.org>; Thu, 30 May 2024 15:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717081983; cv=none; b=fylVmkYeIIiYNvsI63FvuVi4K+UFHSVnUzG8MSSbUi7osMfTkbaoVkDfboJAjZLs7A9AyntvYeQ3y8P2rgrDfyP3KLL1u/wsFNZkPpuywntE0krFxZ737RCIuCX51Q/XcUQsBPMyf1hvl5jfojrT4ZYboQwf/nn9cjzJ+bt0EUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717081983; c=relaxed/simple;
	bh=V3ahdf+n1zZZW2IzsyT6UV14FnQwVR4T11DXtk7qxAg=;
	h=Content-Type:Mime-Version:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=CMGHTxMwrpFq+Xo7VOdqYee8z9IDICZgYiCUwa9G2GZk9a2yNaGtHroMDyYVvjpk3AuzcO3kHssiAEMB71ESOhjvRoVmlFWDEzu3FltPgRiR1rxFcd071mXdBTSnMTW0U7jiydhYWwn5MrV5D2zsMbgZQBn0/bgq0YNK6Bdynbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T9mrk5im; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T9mrk5im"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2e6f2534e41so667851fa.0
        for <linux-tegra@vger.kernel.org>; Thu, 30 May 2024 08:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717081980; x=1717686780; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sdavdw5+l/AHZBYtBFKUSS7K+LP0eyfjKFkIWe8Ymi8=;
        b=T9mrk5im76FpCtDcgcYob5YmlTWtkKFNL/Dod4jcROM6jLXqMNXezj3jwJaNhQzVEJ
         tnJn66wC+KT6fD0iIjcOIiQqnxWvfdSRzaysG7DOiom3BXR3FZjmf0EAmss+tXcuTlWT
         u5OcY0oAe94AJH4q2xsETgT998E60MbxG8zL99RLFZaKL6kDktb7qVWjlqL/tkjlAHel
         yMld4+lMKcLz8GkSuvUUX+BT0h2MkYHUDJBv5G1jg495ThU8Gj/nPgnYFFq5B03HwNxv
         3WfDA0shE1t0PE9/rqsrFb7WRSp1xRVs9GYUjrCqo8VI3ckv7QWB4oHfhVE1WmWwwgzh
         ZObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717081980; x=1717686780;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sdavdw5+l/AHZBYtBFKUSS7K+LP0eyfjKFkIWe8Ymi8=;
        b=bsSVwCy5m6y4F/wACkquz9uDP7/KT7QnuwbVXGUUO5/egzWQMzVMWxPYOQg19HlQeA
         fU6dnOl8TwVKdHYw3NOnThuuoLP74JDv9T/KaXn7HOGw/EnhQyXmM5UR7qqd8UVH4nJD
         mUXhG7ZvkvxJSC+G8loY+cVxiWGDMiwoPcgG20ftKtK9mV/TY42q2pawtPuP8aGZ5Hlw
         GJt2p14piWtOlsQMXyCBIT9xpE6AAN83jjBXeAoJOeMbdsMHqib5EcMLl3ZHqSzyqikP
         MyJL0Yt9TUAqGZR4/87Mpax7xapaW3COqE3e63Sm0Uk+QGN2Jjhz/9MNsG9mBxQAGqkq
         B1LQ==
X-Forwarded-Encrypted: i=1; AJvYcCWp0RmvxZ2nfFmhGJR9qJOznIlkzJWqrRRlvrGzfhFq0tj+oTbPmcHyTmI9wSlvUemrlwFp5UTvYg/tpFYxzjZ8qzJvPWUxr4UJ8gI=
X-Gm-Message-State: AOJu0YxW5ZTnjsfiAK/IjbAKLYDPgNb6C6nRUJLhHyyGtOzvl6dgBDnB
	EYm9DTaxYYQc1xrb3UhZ8fLBC0XGSIHK23oqL0Wyj6tZjuJx7GGB
X-Google-Smtp-Source: AGHT+IH7xZsBkbPjq7eBQnxaJVR6RQUmAuxBaU7Ci2dJOv22VX7dqvueTfj/Jh0Juu8+KjZBAShrsw==
X-Received: by 2002:a2e:b0fb:0:b0:2d4:3e82:117e with SMTP id 38308e7fff4ca-2ea84873320mr12877791fa.32.1717081979348;
        Thu, 30 May 2024 08:12:59 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42127079536sm27841245e9.32.2024.05.30.08.12.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 08:12:58 -0700 (PDT)
Content-Type: multipart/signed;
 boundary=a2632c94a24b51b1ce87ba75765e7af51906aa4822f6b0fd9e4b1e0f6638;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Thu, 30 May 2024 17:12:58 +0200
Message-Id: <D1N2RF28D1Q9.9BPMZE1VNFIU@gmail.com>
Subject: Re: [PATCH] staging: nvec: make i2c controller register writes
 robust
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Marc Dietrich" <marvin24@gmx.de>, "Ben Dooks"
 <ben.dooks@codethink.co.uk>
Cc: <linux-staging@lists.linux.dev>, <linux-tegra@vger.kernel.org>,
 <gregkh@linuxfoundation.org>, "Thierry Reding" <treding@nvidia.com>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240421104642.25417-1-marvin24@gmx.de>
 <2338e58b-1ec2-4500-9675-2d8a3aaa107f@codethink.co.uk>
 <79c10e8e-bf3e-7eca-a0cd-e177a270a517@gmx.de>
In-Reply-To: <79c10e8e-bf3e-7eca-a0cd-e177a270a517@gmx.de>

--a2632c94a24b51b1ce87ba75765e7af51906aa4822f6b0fd9e4b1e0f6638
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed May 1, 2024 at 9:03 PM CEST, Marc Dietrich wrote:
> Hi Ben,
>
> On Mon, 22 Apr 2024, Ben Dooks wrote:
>
> > On 21/04/2024 11:46, Marc Dietrich wrote:
> >> The i2c controller needs to read back the data written to its register=
s.
> >> This way we can avoid the long delay in the interrupt handler.
> >>
> >> Signed-off-by: Marc Dietrich <marvin24@gmx.de>
> >> ---
> >>   drivers/staging/nvec/nvec.c | 41 ++++++++++++++++++++++-------------=
--
> >>   1 file changed, 24 insertions(+), 17 deletions(-)
> >>
> >> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> >> index 45df190c2f94..214839f51048 100644
> >> --- a/drivers/staging/nvec/nvec.c
> >> +++ b/drivers/staging/nvec/nvec.c
> >> @@ -570,6 +570,22 @@ static void nvec_tx_set(struct nvec_chip *nvec)
> >>   		(uint)nvec->tx->size, nvec->tx->data[1]);
> >>   }
> >>
> >> +/**
> >> + * i2c_writel - safely write to an I2C client controller register
> >> + * @val: value to be written
> >> + * @reg: register to write to
> >> + *
> >> + * A write to an I2C controller register needs to be read back to mak=
e
> >> sure
> >> + * that the value has arrived.
> >> + */
> >> +static void i2c_writel(u32 val, void *reg)
> >> +{
> >> +	writel_relaxed(val, reg);
> >> +
> >> +	/* read back register to make sure that register writes completed */
> >> +	readl_relaxed(reg);
> >> +}
> >
> > I thought the default behaviour of writel() should be to force writes
> > out of any CPU buffers. Are there any bus isuses here causing the code
> > to be necessary (and if so, why is there another buffer breaking the
> > writel behaviour?)
>
> if fear that's a question only NVIDIA can answer.

Ben,

in case you didn't see the discussion on v2 of this patch, it's here:

	https://lore.kernel.org/all/D1N2OIXAF6QQ.3TCYLBU42CJ3U@gmail.com/

in a nutshell: there's indeed another buffer here that causes these
writes to be queued and the read-back flushes that queue.

Thierry

--a2632c94a24b51b1ce87ba75765e7af51906aa4822f6b0fd9e4b1e0f6638
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmZYl3oACgkQ3SOs138+
s6FcyQ//fknH+u7CruPy+YJ6jrIDz0nmA5iKp99JinZH6eM8KfjCUbxC/k+cFmem
GQTgKNC1ToG5kmM9KZWAttnFtTbFtBGynkrpBq0xBpZboE1C9s4rkVKgtkUoX5E4
OLzqh3vti8nCnK2CvcieJAwXxWcODpNEkbYY7EtKW3xHXBCb1J37f/5BX528cJ9z
91J2asopgRbFzY8yN5grM9+DHynYFiBQCz8qzxoxEmpynT5UWCk1I0thy9+vOGU1
63oEWzzGI+eTR7TzAyyQ3hxJeo+EPmgCDeSuDMpb0wu3keFr0kc6pm2CeXdGvnRR
EZIo63esjl+80glBU9hFYoFqmJ+0mdSnlCqQqs8rf94AYSnitCOACkAyOHlqhd5B
ggU56KqCvGrlhE7pt4O6h+vZ+f/lJKMFO/GKZp4yk+vXUm6xp9YWVcRgtRHpZOut
rRf2mcAEKFkysdewM1ZRF4qH7bglkov7NwJk0gOf33vroj8DZHSszCuDxM3Cntko
NHhdmYFhBJ/C7y/nw2IdJJBvvGrj3ljb4YYwscyge/3OqDzYcPIUTqY4LbIh39uK
c9w0Wf1UlzV3JvDf3lx8gg64yyhQEAm2fkhXNcMGALjD5vdHhUha3GXpPju9fuHR
0iP0Ikg1IumAo/lEy/g9OwMYSIvYb/5raYwHmXQaRCNbXOqyKIA=
=6Cr/
-----END PGP SIGNATURE-----

--a2632c94a24b51b1ce87ba75765e7af51906aa4822f6b0fd9e4b1e0f6638--
