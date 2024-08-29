Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2BE18DF6B
	for <linux-tegra@vger.kernel.org>; Thu, 29 Aug 2024 08:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724921748; cv=none; b=p0U5e9jVTtpR5LEN71CtiO7i9gQ2ALgZFiUegiVV2COM+XpF73f48qW5riuUHfCS6c8tdckul/w5sWaUAKIlLgq04i14VTShk6zi5QLcEcQYhRXdt2Y6Br8zzNh5bGlNnvN6AHDrqT9M/CPdDpefA9Py2sNDglJ8uO3ITrPYzNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724921748; c=relaxed/simple;
	bh=OObxD47GGDFI7RW/F79zV0nRI1V6bpVdlmiJvCgpEaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AulC8lqqzH1WdT90JL18fXCFtn63vM/8E1aU70op+9JCQkTfO9xu8Bxp7GJjwbYl28FDoIGHqiTa2OPWC3zpGEzYhjb1EiSm5zGaUeA5jFGbKjFkOoo1cVsAhMrIKuqv53OSYqjrkUaU5ItXUV+Me3WsYNJC5+yoEDg03dVUJsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HIjApwfj; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HIjApwfj"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3719896b7c8so220692f8f.3
        for <linux-tegra@vger.kernel.org>; Thu, 29 Aug 2024 01:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724921745; x=1725526545; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rL7eUiNCa7z8MXaxi2E5ZWkv5vKZI2iuxFJhMM35xqI=;
        b=HIjApwfj6tiX6UjpkXVNBn4VT7KQ67fLv04P6bP79mtND0uoGoPsOmSdFrXK2VrLKO
         IS2wWlrxsfZqP2dqdLZ5Wg8NMy+Xxk5Tl8t3TFGpVbnOFvnjdGCugdDhQF5c/3PyfqKM
         DRzqWx2dbjsrz9lfpe+X32Jyp7+J1JDvNvns6IXDa04Leoa5Eh71IbAHAbSfYypHd2fB
         gQsxvb36q9GvxBCzfFMPWs4OIvhcX9EgrOuv3kDg6hoFiMiVk7qs0Z0DPfV1ZU7Axe0I
         AMlUqI8hsME+f0sMYF+gkTkLVB4ahG5JdSJpxsoe8Oll22ap7KmzugBCMqVhg07cppac
         TY6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724921745; x=1725526545;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rL7eUiNCa7z8MXaxi2E5ZWkv5vKZI2iuxFJhMM35xqI=;
        b=QNtBjLavSZPpRWDFhx1acev8pmOFDgXigpzmuJeL6DZ2U2kvFCjtshQKTD+8XIn0rZ
         WotoLf2DTk/QZlZHf5pVXHzzmIyWEny6i6MADO/B3VK1d/yjnrjbQUhwSBVFigKEIVNa
         pVEN1gtVpKwWRX2kb4U19eDg4GOzxulmGjh597r25Vk+hKtXGsdHrcUyrecnsR9thLcP
         qVjFVesCVwv0Iv+9WThmH/3XFhPmMDLCiR/MCXm1fyyXUY9zXuAp/WWA4vOjiPeitpuU
         lqJNDYsakfc6Alg9XNYJnd+GQscb545G85RNIxCR58D15yLa/M6oNTYjgJXP5qodi2xl
         UgWA==
X-Forwarded-Encrypted: i=1; AJvYcCV3dP/zfVrsWdfYvEckYBjfq5u4Zyo9/5vnkd9oRBqIPAu7KD3c/MHwlH6sfXkM40ug20VVKMU/56EVOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp+3hec7kzSpCo7phJLBvGPQRy+JcV6zZmz/t2hquIseISolvx
	EOL6tT1An4yDMnG9uQ+8hqnxI/3XGRMmBN2G8Qn9CIQ2qQOSRCa8
X-Google-Smtp-Source: AGHT+IFTA5y6CfgOeEJGB4wOYr0CbGN4fvA7Y3QtW7T8qovMYdaXNKLfd4sZdRm2dEyC2hK5IpG8NQ==
X-Received: by 2002:adf:e882:0:b0:374:8f90:b78b with SMTP id ffacd0b85a97d-3749b5816f1mr1575181f8f.44.1724921744113;
        Thu, 29 Aug 2024 01:55:44 -0700 (PDT)
Received: from orome (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ef812b2sm849361f8f.75.2024.08.29.01.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 01:55:43 -0700 (PDT)
Date: Thu, 29 Aug 2024 10:55:42 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 4/6] drm/tegra: convert to struct drm_edid
Message-ID: <qdzaanzxm3yfkyokc5pacfuuyic5zbfmp2teaxfcf2knimvleb@gdd6g4htpfv5>
References: <cover.1724348429.git.jani.nikula@intel.com>
 <e764b50f4ad2de95e449ccb37f49c3f37b3333fc.1724348429.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gfx7cbgrsffo6veg"
Content-Disposition: inline
In-Reply-To: <e764b50f4ad2de95e449ccb37f49c3f37b3333fc.1724348429.git.jani.nikula@intel.com>


--gfx7cbgrsffo6veg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2024 at 08:42:50PM GMT, Jani Nikula wrote:
> Prefer the struct drm_edid based functions for reading the EDID and
> updating the connector.
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>=20
> ---
>=20
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Mikko Perttunen <mperttunen@nvidia.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: linux-tegra@vger.kernel.org
> ---
>  drivers/gpu/drm/tegra/drm.h    |  2 +-
>  drivers/gpu/drm/tegra/output.c | 29 +++++++++++++++++------------
>  2 files changed, 18 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
> index 682011166a8f..2f3781e04b0a 100644
> --- a/drivers/gpu/drm/tegra/drm.h
> +++ b/drivers/gpu/drm/tegra/drm.h
> @@ -133,7 +133,7 @@ struct tegra_output {
>  	struct drm_bridge *bridge;
>  	struct drm_panel *panel;
>  	struct i2c_adapter *ddc;
> -	const struct edid *edid;
> +	const struct drm_edid *drm_edid;

It perhaps might've been less confusing if this wasn't gratuitously
renamed, but either way (and assuming you want to take this through
drm-misc):

Acked-by: Thierry Reding <treding@nvidia.com>

--gfx7cbgrsffo6veg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmbQN4oACgkQ3SOs138+
s6FeDxAAkH31xWOme5EUhsUwG4ZFu3t5BXXTVUqw0UtdLknE726QTF6BDiZRYTLS
/1Q4mL51TA+l90EU/R6BzXGaL51cZw8HxHvBBrw/cYGsXV4w90FsrL/JESRbZ5TQ
Yc5VSBm89E4NrSIsse3wvHkt/7VXpBmWwCHSLWNH4tmVeDYoCUuT/fnT6ijYp89b
JoePNhiWr/2V9UnPJBuhzp9EBqUSKs1j1Qc7TNhQ6PiMeUq3SjdiIRIZDu/2WQP9
JTVLVDAFLbkOVv7xbgiTx3rT3mDYUWgRlyv+vxcOj6dAFltxIjL2ANHDFrs65kcK
SRd7m96VkG5XwcEgpPNAuiKU59AhBg6BDV/El/KN44nj5LFv3M5NmsIj++Cls2Wg
92LClw1PC7N98OhwwsBlBIZjUx5//2UUw1jz/flMQeFKjt/eeeIuOdZuhKF4CpNM
qEHkHkkiJkqw3dwfn8DIHE6xZThaV2EHvTBV/dx9itFsutzx6P5OCqfmFktrw+P7
KY+61JNrB8Fjx+uO9FkSCEgiT7tRwqqNsLEpzYk0mzX167xqANjY0ygO6S5103ur
cg0qyj02Q9f0Tjm3ioWnLDLNKx7lzgDgjUfb1IULIL+iDUTXIj9kDRjDRHPuECEY
zzz803190eoFwwYHNhSovNBw6vTWfUimqnac4K9voQm0iTITFcg=
=Kwt0
-----END PGP SIGNATURE-----

--gfx7cbgrsffo6veg--
