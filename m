Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D822F3624;
	Fri,  4 Jul 2025 09:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751620602; cv=none; b=ffpDrUkCQh2A1OjRZhQm/EvRYR2IbtrdryXBv8irQwwTxviUxhw+jB3SeoKmvw4V1duBKj1UZ40I1VLjiww8h28xtMg3kewEEmrTNtlkL2vTSwMZaYHUstKIbGyvFufOwv73vICiQdl9Mlia7msGbM3sTes57+YeHbX6uFiUkDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751620602; c=relaxed/simple;
	bh=oJ+/1u1U6P/KFUf3Qku17DfC4EhBFRWU71oy+m0Mi20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IXwMvVnPPOgKbD/eTAHTZyvTm7Tzvi1Qo2ErdTHDiNohC+8ZshwPgnjbWmL4DLfeXikuoB+AbtFiMiQoZIE/xgnikHzF/8U1YXOXS8KCEhVlkVJuwX0BKUGKGFifJcxMlnwTHNw/zBzZLoWVozNtsHM3DvG27QuZODNMOMdcq0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ww80NC6e; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ww80NC6e"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-450cf214200so5387545e9.1;
        Fri, 04 Jul 2025 02:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751620598; x=1752225398; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FrASRedBj3qOuU4Lr3oIf/QtQ7Obhd71IuXJYVppfjo=;
        b=Ww80NC6ezPXVC/ckq2+5b5ncV4nI6QdHr14YobZtpzqHdYvItkCkVGWamKTfQkgHj6
         RVgNhXkfERuvANMfMJHx8s8MRaWNI5NdwD6CY8DMp0BbhKUs9s/5n7hAs5Tzv0c0pADz
         a1MKSXvBXxNVIHCFH2ev7jfkVh1fog5OQbwUKD8Y55qSkbR2b+wWBJDQKHUg/ybuLQiN
         sCY0xJ/0zTZ5S1OPuNzm3Ztz1eIp0ya2+dvuTb6CNkkb7/71mQvDSyDDjoQTiEnN5ne0
         HIzadfEyU4PpopgIeLAgsKSGJGxCoPUOvzQcBYoyPNQKBT23mFa29iFGzPHfjZ7Et94O
         6oxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751620598; x=1752225398;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FrASRedBj3qOuU4Lr3oIf/QtQ7Obhd71IuXJYVppfjo=;
        b=uXo2/1hmARokGtsaCkFAe8q9/I+PTn4/8CS8eA2+YyuvKMAKAGf2Vvu2k0kh9uG8cz
         Jrz/y/zpdUJiQTGAMbXVKv8cMglB3P7BBiqK1E7zXDjnSNSgfmzghtTEfJWd3p/kAptk
         tLlnOYszMpxRuYlxMHlYVeNCDnRXVTxK9fvg/eluTdN5/Wdgh5jWPjsqWrvIRB50PfoP
         YrFS4uZAhwwMty5lpxT+Wyniw7wN1LCd3/3EzN8jT9FUXxuuemMPIISak47lBb9LxJV0
         QagULfRjDTeQtN7KoO9i3RXaY6Fp9+g/1n90QBkys9BedU4rNEr87dMbE4lQuvFu/PwZ
         PPJA==
X-Forwarded-Encrypted: i=1; AJvYcCUKAT7h/ZAceBbiHf1woPE1Z+4wODvyVurjAjLB+NbeaeOqr9Vtxczn69/NkbLGMSWO/G1ewyNUb9uIG0s=@vger.kernel.org, AJvYcCVoODygiHVWNXZGjKvnFg11c9G6xqHv6Z/+b2lqgp/jnZzzQcLvTt2n/gxX2OxG7GtO/cFkyQITTh3l6hE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5GpR6LlMSA4sqbtkYmwQPT2rhz1qaAquMPehSe9LGF1jpk+h0
	qwcDFkwVxU/07SWVUPhqd8l3PxkDplaS1lSFYEBcxLjmlYRgWeX0pP6c
X-Gm-Gg: ASbGncvFpJABqvY0dPkSZyLy9r17l95xcSWxEh5ndlkobN323FesqeRzj5hkFgmiKwI
	u/Xl5juImOUB+mBtTEQAvVQ17lxWxj5EIFGJ1IIU7juU5y/g1QYIkIkrJ6JqE5XMdynBA2QXwSo
	0zaOZ/KTv2Eh40lkdmndzgn80P9kEOQDjnb/rTUj2EWRl7vxSOMOU8SsF8ran2zvF1FCEb85iOv
	DGnCiOx4vZu4H/YImcJQSOapiP/IPmIcluBBodTzykQOpwRHpaaKHzHNyGQWLk/uaKfI866wuZV
	WFoQuf1o4rbYq9ri+uFCS/mbEY7vFOrLaCueD1M0ZwzrJr2fDyxb/CQZn/IOZCUe1OqOfmzY8nN
	h0aTP5MXTbd7o5pDKqeIgoB6d7yQuv+AAZXsz1KZHw4JFkU1P
X-Google-Smtp-Source: AGHT+IExoSHUzRhz86JAP7f5Iv8dXYAnNcjUlnz4mnvSpomXoY2GDkuUNMtNR/YNZ30kfGG/xqsY0Q==
X-Received: by 2002:a05:6000:2dc7:b0:3a5:75a6:73b9 with SMTP id ffacd0b85a97d-3b4964f4d95mr1407226f8f.11.1751620598375;
        Fri, 04 Jul 2025 02:16:38 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47030bd42sm1945202f8f.5.2025.07.04.02.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 02:16:37 -0700 (PDT)
Date: Fri, 4 Jul 2025 11:16:35 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Mikko Perttunen <cyndis@kapsi.fi>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mikko Perttunen <mperttunen@nvidia.com>
Subject: Re: [PATCH] drm/tegra: nvdec: Fix dma_alloc_coherent error check
Message-ID: <xjtnrvbh3dowjhmgrtduo4dqiah35oekbgqc35bdzexug5lmue@kqh6ikyesurj>
References: <20250702-nvdec-dma-error-check-v1-1-c388b402c53a@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5jbhrvx5g2niyo7s"
Content-Disposition: inline
In-Reply-To: <20250702-nvdec-dma-error-check-v1-1-c388b402c53a@nvidia.com>


--5jbhrvx5g2niyo7s
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/tegra: nvdec: Fix dma_alloc_coherent error check
MIME-Version: 1.0

On Wed, Jul 02, 2025 at 11:08:07AM +0900, Mikko Perttunen wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
>=20
> Check for NULL return value with dma_alloc_coherent, in line with
> Robin's fix for vic.c in 'drm/tegra: vic: Fix DMA API misuse'.
>=20
> Fixes: 46f226c93d35 ("drm/tegra: Add NVDEC driver")
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/drm/tegra/nvdec.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)

Applied to drm-misc-fixes.

Thanks,
Thierry

--5jbhrvx5g2niyo7s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhnm/MACgkQ3SOs138+
s6ETEBAAmR4QvTrOlFKPrmVwr3KPiG9rXswxyZZWFh57ku8z0WkowahCyrAe4sTn
7Q6yHWTW2uCmnbrXx+BFXIl9Uas2RjUtAGxRSzLtKyyIuNFi74wWcTV9NwWFib2Y
2ibHxnqBqM6ZxZWqM/0s2Poz3J8Wac8BF+BTCx9xx1pOF3piaweNmxG2HShVajnu
jSr08e7j22E8/zbTtcPHklkEzG8/nDBiPm32vEqrZz8guJ11MW2FNV+wOYxUN611
2/VN6iz8R2L/EYY4g1bn38PpuOtBKWLdI/F2ryjXaWCK4gLMo/1DRf8adFxAY1z9
/rc11VutI8m06p5q75Lwl/0TsJ09Sm1zS/Gj52l9SAcd/QtFSyfL5sbP/HahrjpB
VntCOz7l0wpTxS1koodPxtgvg5ifaQzmjnaVhJgETaYhY4grWG2jBXqiRlZUh2hC
ylhC4aoPs3ypiQB+lPlx+ZFM5To0B3B19WRArnQw8QBYJhSnJafg7EK6ziK5NcBd
RS4sksEEBoIExoZF6WjpwQzDWn7fxcwYsl8EyGWRDarKi3WXslL6u+DvJO/mHYso
t+0Utjz5lf+LmwWD5iECFPqBFMyg02GyGpM+qZ4FWz1NhtsSZOVquD0waNNzOGmB
dCILQdmvlzwm0liPxZ+/47TdjOc/Q+xQCcW6qo/RseIxvfqg0U0=
=a2V8
-----END PGP SIGNATURE-----

--5jbhrvx5g2niyo7s--
