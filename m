Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBD634DB5E
	for <linux-tegra@vger.kernel.org>; Mon, 12 Jan 2026 10:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768215128; cv=none; b=SY+rTLoHMlzS7/YzS9Cuy8LDgcKUJSGXRawHCNpAADgs725FFn7rvaEqysfQ3Z0d764WmlxXXnNlqfDvWCb8iQjG6fkLe7nQrscrmVJKy+VfGL9Bxwhx5UT9cgA0c8p1TXCRJEaUZ3mE6QXReqW10mXiQmAux3VtzzdcRx9lSpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768215128; c=relaxed/simple;
	bh=REg4TsR0qozJ6BDiD/SY3CuiSIVesFeTnTxbfNd4EwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YKUgKKB4OMAtkEOYU+tbVNgRk4B02cOhi3js40KS+TpQYyhaMK+Jr0Q7dglY+h2vINd81jdmxfmN66Hr9Fkgdytn7iYeOpWFCvX3zYm+1SzgXXaNXfiadmNyknsg2ORJVoh79yuBsKth/VwIFKjOoZS++hW+IZKJBtByTS/v3VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iue8N/As; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iue8N/As"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-432da746749so1398888f8f.0
        for <linux-tegra@vger.kernel.org>; Mon, 12 Jan 2026 02:52:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768215125; x=1768819925; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rc2AUJOuR4kAnQm1S8iRbdMgNJ7LGU+TcAqcrDU/pog=;
        b=Iue8N/Asg+PUyNZoIiocCzKF/vTFYrfCzw9QwdfUsIaSGFuvCK+Z5H8t21NtG9/+Wg
         6KcBPRvSsByQVwRsLdXx2npVh1bgoH/QeqvclMGf8BelPYCJAJWVkPwbsUkH5vFjjGWI
         XE/itEVimD+lpz5CI6eMW74sPM8ZhtOlHZTPRRI1sNXO82CRwubAKaxpa9rBbep5rTIx
         LPxgX/wTU3pM/g4Eio31FpGx5PnZMi8ocgGp3EncVX4juPDioixK3+Q4qSUUN7y+Xzfb
         tdbfoRqvY86jlWXuF2auEq8s2HsVwy2jRXbCTBh0DIk8+hAfOZuO0I9M8jfcewJYIlyS
         5xsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768215125; x=1768819925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rc2AUJOuR4kAnQm1S8iRbdMgNJ7LGU+TcAqcrDU/pog=;
        b=eUxzEBo5lmOUx9YEs7NsJ2oMUkUcWBlIDmpElWY7f8ytQAdbYWnkcVseb3SvKzh1N2
         E7FWwsY2GDxxs7UyCVTjMtCMIQWytb1hv0QlAZHcQhO5R2XLXHBpsSN62vQWZwv85eI0
         xo6aHnXjCQbpDljL4BPa/ZZ1Cqt5KvGDjlIpu4DfcUrQzzOSDnebV0yKrGMz6GdZmlTx
         arWYdhizkNJyFvIDa5INBp5+7dohkLOqXwunIFnnxknCKmQgeRFeoXuxUdJU3jYZd5Fy
         WoZZO2qCSONbdDbas7n9gCvrR1oeA0hQhYvQfrT/v9pw1gt7dbvUqY4lxFCyf4raJdKI
         2QrA==
X-Forwarded-Encrypted: i=1; AJvYcCW30jmytPZUVy4xBRmf+VR0aL5BV492Hv2B3VIu8BpxRWmjOt48FzBbdM1cDETyK9ADkqzZpPT8F7qSaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ6/SQbAo8Jut28ZB3E9xTcvSYW+l8nTn2TjyER9fa/y4N7mHw
	8XTENLq6aC2FhRVXUKgOCU+x2xn2ufFBJS26qD33eTW1Mphg7oi6iEI1
X-Gm-Gg: AY/fxX4CeqQa4+S6WcdFCDZtRxOLtwq56d9xbnwa9n9XvUJkqjZlFex9It1soMrv3lu
	1iRSmwkVrYBMd0FOpqMiAVSxRDZQ42P8quqiG7ma1NENcqzsaB7cRUwqI69WnbWyWsM7S6/ANGR
	ChratYm7i18oTPZP8A2R+Gqwnxpra6wxITvdO6VET3KznQHoCoTGelrA5jHD4Z9Vl+mBhjGQCpH
	vzR7H11wSf/7XDCheKOMTmWSLSkW3F34wldtqUOCKcQu01sAIHiovZ3sT/0qgo4V1n3/l0o+3lc
	dJF+JRaP4NMEVo8rMAvyLhFHKwdZaXy9uU4PQS0U+uf3n9uNSAaSs7IVGCqMiGpNbgfblcsoXPD
	Zi7SLU8Lu7LFxh7327wQHqKzQEBsb6AH8rB1w549Dzvp1MybIPtCMVVb1q/zrFVyyoGIk1XN2ax
	YSNrgYV+1kXeq2uyOEj/1cta0x2Idbi7ZRCtxl9WMRIFy6VdmPXXa5hcieoUZxpvNBYejzfjLNa
	UnmiLLF7omm
X-Google-Smtp-Source: AGHT+IHi7ac6Mlte3/kS8x1sgI5SJAGZ3/F9o7xlhX5i7K3h9BWWaFiVBta2Fsf2nt9RoeWu4knxDw==
X-Received: by 2002:a05:6000:1843:b0:432:b951:e9ff with SMTP id ffacd0b85a97d-432c376158amr22393501f8f.53.1768215124497;
        Mon, 12 Jan 2026 02:52:04 -0800 (PST)
Received: from orome (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e19bfsm37584947f8f.18.2026.01.12.02.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:52:02 -0800 (PST)
Date: Mon, 12 Jan 2026 11:52:00 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Ketan Patil <ketanp@nvidia.com>
Cc: krzk@kernel.org, jonathanh@nvidia.com, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v5 3/4] memory: tegra: Add support for multiple irqs
Message-ID: <aWTQ3ud9SHrhM6lZ@orome>
References: <20251219114354.2727906-1-ketanp@nvidia.com>
 <20251219114354.2727906-4-ketanp@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zahttmdutgssavx6"
Content-Disposition: inline
In-Reply-To: <20251219114354.2727906-4-ketanp@nvidia.com>


--zahttmdutgssavx6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 3/4] memory: tegra: Add support for multiple irqs
MIME-Version: 1.0

On Fri, Dec 19, 2025 at 11:43:53AM +0000, Ketan Patil wrote:
> Add support to handle multiple MC interrupts lines as Tegra264 supports
> multiple MC interrupt lines. So make the necessary changes to the Tegra
> MC driver to support devices with more than one interrupt line.
> Add field to specify the number of interrupts and iterate over the
> number of interrupts to register handler for each interrupt.
>=20
> Signed-off-by: Ketan Patil <ketanp@nvidia.com>
> ---
>  drivers/memory/tegra/mc.c       | 35 +++++++++++++++++++++------------
>  drivers/memory/tegra/mc.h       |  1 +
>  drivers/memory/tegra/tegra186.c |  3 ++-
>  drivers/memory/tegra/tegra20.c  |  7 ++++++-
>  include/soc/tegra/mc.h          |  4 +++-
>  5 files changed, 34 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
> index 6c1578b25a61..82a81ae3c50d 100644
> --- a/drivers/memory/tegra/mc.c
> +++ b/drivers/memory/tegra/mc.c
> @@ -551,10 +551,15 @@ int tegra30_mc_probe(struct tegra_mc *mc)
> =20
>  const struct tegra_mc_ops tegra30_mc_ops =3D {
>  	.probe =3D tegra30_mc_probe,
> -	.handle_irq =3D tegra30_mc_handle_irq,
> +	.handle_irq =3D tegra30_mc_irq_handlers,
> +	.num_interrupts =3D 1,
>  };
>  #endif
> =20
> +const irq_handler_t tegra30_mc_irq_handlers[] =3D {
> +	tegra30_mc_handle_irq
> +};
> +

Technically not necessary since we have the forward-declaration in the
header, but I think it'd make sense to move the tegra30_mc_irq_handlers
definition above tegra30_mc_ops so we keep the natural ordering of
things.

>  static int mc_global_intstatus_to_channel(const struct tegra_mc *mc, u32=
 status,
>  					  unsigned int *mc_channel)
>  {
> @@ -953,25 +958,29 @@ static int tegra_mc_probe(struct platform_device *p=
dev)
>  	tegra_mc_num_channel_enabled(mc);
> =20
>  	if (mc->soc->ops && mc->soc->ops->handle_irq) {
> -		mc->irq =3D platform_get_irq(pdev, 0);
> -		if (mc->irq < 0)
> -			return mc->irq;
> -
>  		WARN(!mc->soc->client_id_mask, "missing client ID mask for this SoC\n"=
);
> =20
> +		for (int i =3D 0; i < mc->soc->ops->num_interrupts; i++) {

It's more idiomatic to declare these variables outside of the loop. Also
make it unsigned to match the type of num_interrupts.

> +			int irq;
> +
> +			irq =3D platform_get_irq(pdev, i);
> +			if (irq < 0)
> +				return irq;
> +
> +			err =3D devm_request_irq(&pdev->dev, irq, mc->soc->ops->handle_irq[i]=
, 0,
> +					       dev_name(&pdev->dev), mc);
> +			if (err < 0) {
> +				dev_err(&pdev->dev, "failed to request IRQ#%u: %d\n", irq,
> +					err);
> +				return err;
> +			}
> +		}
> +
>  		if (mc->soc->num_channels)
>  			mc_ch_writel(mc, MC_BROADCAST_CHANNEL, mc->soc->intmask,
>  				     MC_INTMASK);
>  		else
>  			mc_writel(mc, mc->soc->intmask, MC_INTMASK);
> -
> -		err =3D devm_request_irq(&pdev->dev, mc->irq, mc->soc->ops->handle_irq=
, 0,
> -				       dev_name(&pdev->dev), mc);
> -		if (err < 0) {
> -			dev_err(&pdev->dev, "failed to request IRQ#%u: %d\n", mc->irq,
> -				err);
> -			return err;
> -		}
>  	}
> =20
>  	if (mc->soc->reset_ops) {
> diff --git a/drivers/memory/tegra/mc.h b/drivers/memory/tegra/mc.h
> index 482f836f7816..06ae3dd37a47 100644
> --- a/drivers/memory/tegra/mc.h
> +++ b/drivers/memory/tegra/mc.h
> @@ -194,6 +194,7 @@ extern const struct tegra_mc_ops tegra186_mc_ops;
>  #endif
> =20
>  irqreturn_t tegra30_mc_handle_irq(int irq, void *data);
> +extern const irq_handler_t tegra30_mc_irq_handlers[];
>  extern const char * const tegra_mc_status_names[32];
>  extern const char * const tegra_mc_error_names[8];
> =20
> diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra=
186.c
> index a30158d92412..a3727fc383ac 100644
> --- a/drivers/memory/tegra/tegra186.c
> +++ b/drivers/memory/tegra/tegra186.c
> @@ -174,7 +174,8 @@ const struct tegra_mc_ops tegra186_mc_ops =3D {
>  	.remove =3D tegra186_mc_remove,
>  	.resume =3D tegra186_mc_resume,
>  	.probe_device =3D tegra186_mc_probe_device,
> -	.handle_irq =3D tegra30_mc_handle_irq,
> +	.handle_irq =3D tegra30_mc_irq_handlers,
> +	.num_interrupts =3D 1,
>  };
> =20
>  #if defined(CONFIG_ARCH_TEGRA_186_SOC)
> diff --git a/drivers/memory/tegra/tegra20.c b/drivers/memory/tegra/tegra2=
0.c
> index 46e97bb10163..75eeb49054cc 100644
> --- a/drivers/memory/tegra/tegra20.c
> +++ b/drivers/memory/tegra/tegra20.c
> @@ -761,9 +761,14 @@ static irqreturn_t tegra20_mc_handle_irq(int irq, vo=
id *data)
>  	return IRQ_HANDLED;
>  }
> =20
> +static const irq_handler_t tegra20_mc_irq_handlers[] =3D {
> +	tegra20_mc_handle_irq
> +};
> +
>  static const struct tegra_mc_ops tegra20_mc_ops =3D {
>  	.probe =3D tegra20_mc_probe,
> -	.handle_irq =3D tegra20_mc_handle_irq,
> +	.handle_irq =3D tegra20_mc_irq_handlers,
> +	.num_interrupts =3D 1,

Probably not worth it since this will likely never change, but you could
use ARRAY_SIZE here.

>  };
> =20
>  const struct tegra_mc_soc tegra20_mc_soc =3D {
> diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
> index d11dfefbe551..4a2cadbc0084 100644
> --- a/include/soc/tegra/mc.h
> +++ b/include/soc/tegra/mc.h
> @@ -14,6 +14,7 @@
>  #include <linux/reset-controller.h>
>  #include <linux/types.h>
>  #include <linux/tegra-icc.h>
> +#include <linux/interrupt.h>

These should be sorted alphabetically. I realize that tegra-icc.h is not
in the right order, so we might want to fix that eventually (though it's
Tegra-specific and therefore could be kept separate, too).

>  struct clk;
>  struct device;
> @@ -164,8 +165,9 @@ struct tegra_mc_ops {
>  	int (*probe)(struct tegra_mc *mc);
>  	void (*remove)(struct tegra_mc *mc);
>  	int (*resume)(struct tegra_mc *mc);
> -	irqreturn_t (*handle_irq)(int irq, void *data);
> +	const irq_handler_t *handle_irq;
>  	int (*probe_device)(struct tegra_mc *mc, struct device *dev);
> +	unsigned int num_interrupts;

It's a good idea to keep the array and the variable that counts elements
in it close together.

Thierry

--zahttmdutgssavx6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmlk0k0ACgkQ3SOs138+
s6Fh8hAAn/Mq89FrZpmYPOaL1Iv3sqtAGFFrWjJjy+AjGw/vnKAHkYMuGv/lAutV
0gSGGYBULXxiCFJRgdREN7zCGsESJ7PzbezD897yvDfje2ih+0iIeqH8DcUclyDN
Y8BVy3lV2Jh3m5HaZz8Wj+HDbMpq9yVCCYG00s5ksJLmofdkEDKcNTbTnI2wQdVH
v7OQ5PhwJov75HAwptc9ZUBhGbB5CdtzIQj1gWz3SsgTGKQc1yT0segn7eGDNCiI
wrC/tIaD2TWBaOG1GFmqjwkXBVvl9GqvlLCRFuxlMGSyGfuYXhIBmx5tcOjTYUag
23bPexjS3F5ZdXF2zVVVR2atdDEyHp9+IZqtpz3ytJMiHzH6U/WNZiWN0steqsKj
7y1GEPxpgplJyKsA7WVkCRhKU1sVyQloHRzoHrGV+IG4uHT+BwWf0nR78J3u4AJc
LVtCtbeU2PlmZeKA6me2awKl7QrYZoDpFwWStuSNTxL4ble6BIeEC+bdJTdSV4wD
hmuAdT64/1cUbYEjnds0ef66hVu+lWD+HiRbavexqIFMf9UUc1F7HCWJexTgwaBB
nxjjYuoHKIjdY4hYy9er21iX17GeXiDcppg7QqVr48ENWxxdyypO9sL9SzZg5HNI
CBFcdtnt8f7MLnQF5W2uTUxQ9aLdkBVsZLluV2+rJFm3gvbR3eY=
=ldKU
-----END PGP SIGNATURE-----

--zahttmdutgssavx6--
