Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6965613DDDF
	for <linux-tegra@vger.kernel.org>; Wed, 25 Sep 2024 19:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727292460; cv=none; b=FZ2H6oWnyhbkg9scgpvfVZ3365rmy6BOGizrc6CZrsad2ftb+HrmS7CcE40xKTvLA3Li9/vCiwyaG2rK52t3nK/q1m95Da3VQzv7yA8JrPC8zI4dUPbrsdi4bjQzMKspKj0DEnlixV31ybLCjtrdlbtVwvYNp6yfWzpdVTZc5BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727292460; c=relaxed/simple;
	bh=sOThosZSdCqs+xIr0Rmo/FxzqfC8PoC4uva6EaSY1Aw=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rQ0Pj+D8oZxtvGAunpC4iYfvX453Rk0q36VoRjnoj/hRQzrUBa73codsw3C1BZ/rjCbR7jvw9dgPx8smo7W02wa9ZCtKoqtwkWVwOiTWoKGQF43gpp2gbc+1h3cbPLfZ/kPg/U05UGOLGHikToYC53wjfidE6KHJzN4krxgZuWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zgpad3Zi; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zgpad3Zi"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2f75c56f16aso2567751fa.0
        for <linux-tegra@vger.kernel.org>; Wed, 25 Sep 2024 12:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727292456; x=1727897256; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IOk2ilwD8/6jXKUXlPWg7dSTzszA+5KavKN4vZvX19c=;
        b=Zgpad3Zi97Cs2Gvb6xFeP0WXA3NpPPw4QQBNugqPQKXvTIvPCRdTx2eH0C0R81NbJn
         rdTJg8FmTSlonzY/cTuP/gndeFXfkP5Zk+VLNtVwUsdj6c6xE0IYj6pN9ugADbYBxvDM
         njIUQDT0apBMTgrw2gmBCMb6mfDtxF/7mX15EHKEDkP1I0lECfQiOqcwcEDZumADWZik
         0V+sku1Ah8xqMJxLdlanQk//5m4wkBHu2nQwyLyaCw6URMtTC1HNRffuYXHYj1vzmbQV
         b7JOw5P4svXWLyxekTkJNHRz6k4Z1//EuLqvr0OjCBmSZYnev7dh0CzL4QFw0a7KosoA
         4+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727292456; x=1727897256;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IOk2ilwD8/6jXKUXlPWg7dSTzszA+5KavKN4vZvX19c=;
        b=CMTqJO1MspkVhqUo+4/its2JDph8Yn0+lyeQm6qxd5iHp5WGahpNn9INW6nfcstR5z
         Z0C8Xqdx7UltJKUhR5wNEeTk+caNuVY0pgyYGowL08huGfR/YaG6ORD6NVewSb7Ou2Iw
         ncwrNeUzZQBy4vpCamzbh9F3i0PhmTXxagk72WvXSAH8gDBGJFZYhPUwAEkWOiWA7Xxb
         0PY55X5i/HCebY+eh8bYdBaJra93LoIPoZzEvTguHnwMlvbQuMjN4zn/DW/idLP929i2
         12FfitOZuypoltmkPe1FtN44pZWTXgFaMg0O8vbh+21Y52Vvq1ClK/wWXWomd8PHOPOy
         Jj0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVVMq/ePy4YbMKgOiN/OCPQC+NqMqbzgh0z1AiQJjKyLqvlyCUu+6VEMZ7PicmqQDRgRxyw12JlJc+0zQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGkw0cjb4/omlend4JQ7yvX3/YVnNgovvTWwxctJ3jFJ8SQAFL
	wJB/lrOFxEUGir8h1MYXlELHYmalu5BCxOJJ15Pz98Gj3mwSnfKI
X-Google-Smtp-Source: AGHT+IE66I0+nQZftqv9oUzLNYnEcqlO1PGHsm46biJpo+iqRc4tUp2XOBMBWin5tG1frsXuusHxIw==
X-Received: by 2002:a2e:5152:0:b0:2f7:4e8c:9bfa with SMTP id 38308e7fff4ca-2f91ca6eee3mr21232841fa.33.1727292456244;
        Wed, 25 Sep 2024 12:27:36 -0700 (PDT)
Received: from orome (p200300e41f147300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f14:7300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c78ce07056sm644232a12.43.2024.09.25.12.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 12:27:35 -0700 (PDT)
Date: Wed, 25 Sep 2024 21:27:34 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Jon Hunter <jonathanh@nvidia.com>, Christoph Hellwig <hch@lst.de>, 
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] gpu: host1x: Set up device DMA parameters
Message-ID: <vpxqpczluuvlgbt2alzog3jidsfihfewvczhgligvxizncgsc6@iolgydqi6a5d>
References: <20240916133320.368620-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nb5sg25lsdaxq4y3"
Content-Disposition: inline
In-Reply-To: <20240916133320.368620-1-thierry.reding@gmail.com>


--nb5sg25lsdaxq4y3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 16, 2024 at 03:33:20PM GMT, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> In order to store device DMA parameters, the DMA framework depends on
> the device's dma_parms field to point at a valid memory location. Add
> backing storage for this in struct host1x_memory_context and point to
> it.
>=20
> Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/host1x/context.c | 1 +
>  include/linux/host1x.h       | 1 +
>  2 files changed, 2 insertions(+)

Applied.

Thierry

--nb5sg25lsdaxq4y3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmb0ZCYACgkQ3SOs138+
s6EZUxAAg5OiC6juTO52hvoyWiI8zGhZBFgUS/+ks2riD+KRrrei73ixDui/q0vp
hv226dIE+u8qBKcagk8FYFDx8lJvOB3rT+K/cZ6PAqc6AvvwPq9RysWuFvHWNXpe
OEAfQCiDCl6PvYFv+I82SmA6LtmNS9C+NXRanjSqjKrclhVEo6oy0X3r9BdN4YAs
FKuG6o3RvYEKqEtfYGhQDdYW1Ysf+qWy6E/UW5raDFJsrBS0w9p7Fx/KxwSOko1O
fxRkDhzY7YL6JIjpsnPvVildkDZGkL1NHOtuZRIXIAUK9FG1H4vA2JjVPZfk8XeZ
QDaCZZpQ3tNO3AggLgtF1TL96Hkn2Y0qrnWRkkgMEloDG2PUao5QyKOHcnP/ZDTI
EKzA0CADDat6z06XB7nzJ3LMUE1volYINBeF6z9G+Y0/vSWlEMyv5oL946dHlf1Q
bJzMJ65VCy0celWF1NSkLya7Gcd3ldGUSuJLQbzs8tAhy4oZNhCEF3Z//vEkml6Q
h2tyo8ApK1l8ijsqCbB4iLVA7lLCvHWvOCvBXhKYc2uPV8UjCeqnNABwsj444kX9
YEX4ktAAoJXqLqwI8UGrAL1SP7rjxs+NqnstEP9VdOoB2qPxflI2Jg8ZxEVqvP1N
sMuVDP/hZ9MtLAhWbo3x7pItxTpEB03y2vHpfw8/zfsiRE1YgJU=
=Olm0
-----END PGP SIGNATURE-----

--nb5sg25lsdaxq4y3--
