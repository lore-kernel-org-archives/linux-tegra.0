Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C50E52F8B
	for <linux-tegra@vger.kernel.org>; Fri, 19 Jan 2024 15:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705678676; cv=none; b=JqUkLJnhFyMq9VKu5h5oZWKwdbqFpiQzMmJRtQcJ2kKL6zvJituZ7Ddz0wmPmb2053k0j7bYMmMwuO5jKSh6vI/tx/YCht2gIt6EOD7ewtcgiedYknjAAIFR3o9udQqZ8ZuaTCeqjzjNpNlU/3R+jHSm6z4GLEtluFj7cPtS6k8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705678676; c=relaxed/simple;
	bh=JjR0AYz7MzjTmToDQPkG5shmXXsBv2j0kXL7I446AbU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To; b=FSz1eckCMkZeMnP8CLtZxLeTs4aRYL9V4mZGcRcY7z7dsYPgHdQBPzGxeSqNusLJ7igxcE7g+iFQuIe9omODIpW0HPndQk5DBQ6Wcmn5qBq1VtQy6s1CVwDEv1sEEfmD42otIqHVOjcnuxY1kpK2tT60gw8UuMMRqjPEnYRtwUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sr7uYiAt; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sr7uYiAt"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-336c8ab0b20so815434f8f.1
        for <linux-tegra@vger.kernel.org>; Fri, 19 Jan 2024 07:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705678673; x=1706283473; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r7aUUKpGi5v+0/dHHEI5adIhSZcHy5gbHjGJGB37a4I=;
        b=Sr7uYiAtmeLOztePn3cE5FdRCGngEB/F1QfNrT28KfonY70e7IzFkdJJB/6YNex1DI
         JGDkd4yoRYHs8B0BBPqUDJR6IpPLIMaePLlTtoFq8zFEayQdNCNLYvD8WORL9xijt4PX
         M5xSZk4LKkBodBmvo+Jg2+mcSah0WjyuEl/st7da7Alt1eh1FQ8ZbkK/o0tjLHAIEyAH
         9V9LvfD8+bGXaAH9FJeYxFDMVKf/Pp/UKQ2loHyGg9T1eqEuoE2vipqjMla7g5qGpTRO
         LVPJVC626O9IlVS6hHGmHk8+OrAoBmASg5D0XYKGjzi0iokvQWnwkNrBWRmtlUn16J9c
         h9BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705678673; x=1706283473;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r7aUUKpGi5v+0/dHHEI5adIhSZcHy5gbHjGJGB37a4I=;
        b=oUf0eT8JiWGny9ev4ShXXmghbDo4dFIZDnV1/1gm94RzRO2bD2oZUqr6zvhd3QVdDt
         o6znqv2z3Xe+vmhmm6Gq+IIJCRAFKp/gBlmjdPBBRhwV8g80wh+sjPWFfFrXJbNh7SmQ
         Bb3Rfc+2o1+pfEBNC5BwaH+0GBj0t31DF4sE8hq59TPqkN+dBcNpfLKj9kqnttl5rT5e
         7gsXfLwJNvGIlO8GB4eEG2SHm2DpwznzAL/ED960ZWFAYJDcbt09rLemNBmkWQOGT3b9
         ws+oxXpqVzsB7Wv2kQ4OEPClnhnbL+f2zYTY7cke8YRa+yZvCnte9Mf/1Cn+EuuR9Qq4
         7IqQ==
X-Gm-Message-State: AOJu0YyadErPi08WcwZMET/CbD92df+T7VY2ecX9xvAGTK0GkzwQo7nQ
	u8wSKeiDqPRvGmYMKIHPC2sCvV+01MEIVo1ehjhlaIOi6kSfEK4zNlA/rMi7
X-Google-Smtp-Source: AGHT+IF1Vk97Tu48BFOPrFck5gxLES+RTnzR2qTkj04ANQao/NCymiwLEb9ZTMvuxKbc/BUAif381g==
X-Received: by 2002:a05:600c:5106:b0:40e:9699:141e with SMTP id o6-20020a05600c510600b0040e9699141emr1188780wms.54.1705678672400;
        Fri, 19 Jan 2024 07:37:52 -0800 (PST)
Received: from localhost (p200300e41f147f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f14:7f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id pw27-20020a17090720bb00b00a2714f1ba8asm10346088ejb.160.2024.01.19.07.37.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jan 2024 07:37:52 -0800 (PST)
Content-Type: multipart/signed;
 boundary=e6354818a726b702253a84ecc3adfb3720b1e41010125ecac4d74d3409df;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Date: Fri, 19 Jan 2024 16:37:51 +0100
Message-Id: <CYISMKA6PGPD.1PS4SOG93N9H3@gmail.com>
Cc: "Jon Hunter" <jonathanh@nvidia.com>, "Thierry Reding"
 <treding@nvidia.com>, "Sameer Pujar" <spujar@nvidia.com>, "Laxman Dewangan"
 <ldewangan@nvidia.com>
Subject: Re: [PATCH v2 2/2] dmaengine: tegra210-adma: Update dependency to
 ARCH_TEGRA
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Peter Robinson" <pbrobinson@gmail.com>, <linux-tegra@vger.kernel.org>
X-Mailer: aerc 0.15.2
References: <20240112093310.329642-1-pbrobinson@gmail.com>
 <20240112093310.329642-2-pbrobinson@gmail.com>
In-Reply-To: <20240112093310.329642-2-pbrobinson@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>

--e6354818a726b702253a84ecc3adfb3720b1e41010125ecac4d74d3409df
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Jan 12, 2024 at 10:32 AM CET, Peter Robinson wrote:
> Update the architecture dependency to be the generic Tegra
> because the driver works on the four latest Tegra generations
> not just T210, if you build a kernel with a specific
> ARCH_TEGRA_xxx_SOC option that excludes 210 you don't get
> this driver.
>
> Fixes: 433de642a76c9 ("dmaengine: tegra210-adma: add support for Tegra186=
/Tegra194")
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> Cc: Jon Hunter <jonathanh@nvidia.com>
> Cc: Thierry Reding <treding@nvidia.com>
> Cc: Sameer Pujar <spujar@nvidia.com>
> Cc: Laxman Dewangan <ldewangan@nvidia.com>
> ---
>
> v2: fix spelling of option
>
>  drivers/dma/Kconfig | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Same comments as for the ACONNECT patch.

Thierry

--e6354818a726b702253a84ecc3adfb3720b1e41010125ecac4d74d3409df
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmWql1AACgkQ3SOs138+
s6Fctg//TOyCjJ4OD++E9t0Ix/pi6ykffcB/aJ4X1v0jo35Gg+Km1bKl2bxUF33T
+Hh/kk4CozZs/zGkfGOkSCuDhg1f8ZWsLygZ6f1uRKiG03MvN9S4JUIYStBsa2t+
YufVVW3yKdRm0fzhGTruyJSPBMpgxQvS8c0tTfFtHceZAralthWp/kcHwSJrGVnj
uFmMuAJhJMKdBEqFoKmJusdl8bOSevQOS5Tdn7LqmTD5DcLdSLcdhjfPsAUDoBPG
gTAgcxn7QLGHC2dFs/uQKKlPTnsarnuQJCxGLW9am3oWdgPnHTDCecE614MZLL+W
mAKCvljbAU2mHdeq52j3PO6OOr/ENx7oqYieUGl/BkUWDn0/AqBPTVpdh9PWaFvx
sQL0tSXLoJn1n7zlJ+aK9HmmKNsMTZDg7KG2TEZB6x79y2Z7Ne6GYI7ZO9FfOX/W
zok1Pmob1mdXJ8ImPPpUl7YwmSSGWa+qdMmeB9wskGywcTEnU8QD7uWevoscPWl1
QdLBIcHStMNQvCOibpT9BH3RHdXOPAyoBCRzP8k/M9J0H+hmZ0W420vhsP2m3T0d
eLOFUCHIauR4VD8iiPfnT4816hx+6O7S3ueh6uQQa106LnuGpVvfrgoyYkD8JsPR
8qHtZFv6wXv6caSNrvF6KTlSkKwfuSuVVMpWyuzfp7zGANoFh/c=
=eovf
-----END PGP SIGNATURE-----

--e6354818a726b702253a84ecc3adfb3720b1e41010125ecac4d74d3409df--
