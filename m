Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB4F13D8B0;
	Wed, 25 Sep 2024 13:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727271907; cv=none; b=GVHkfwhyjZtoean1Jm/cV2cf8IVqlHp418Db5LC92K9MydzP9TcINpzdiKVORkpU+fg7kW74NtMEyI7tpllwYK02zBUp0YZkcGe9aGAE/dP/e1YLVEK/aRLY7N6CX1Hw7o1qnz7U2P1/ZdYTvJqRbrEypQRfbcisqNR/TKjP4qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727271907; c=relaxed/simple;
	bh=93Ha0PvjGoWWoBmedhQnd7DgRa4tSTVSE6EheIZzJ0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u0x/wxRnKCu2X5GuZxlgc+7WXjRgBjU9rLuQKVX1bXVmnUMusMS0ntC8m8P/fafscsHRIEm1Xf3Kq0IB+D6PK1ZdAOzf7Dn8AfTgRlXA2rhkK8gKkWCQMdTFcnn7QMw7KcgfqniuZZ4YP0wC6Fq0vwgxbq8Sj0ApgN2nggvtXLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cPxOCxkO; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cPxOCxkO"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5367ae52a01so8354135e87.3;
        Wed, 25 Sep 2024 06:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727271903; x=1727876703; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7nmcWlKoFTNATwfWOn0UALVMJO3SjuirbjxhHbXLIAU=;
        b=cPxOCxkOWvFpV4WXATZsbu/3QMmxcSUfN3+eVZfb6XaM7UqTb+CJw5pqFWal5PRLUF
         EcVbncSufjkVutT8g/Maq5UuqXG7/HLmqx8qhePIlZ0pEanTODJJ8iAOVv3MqVDnechy
         UnjO1Vn8jrpvB7ZbEsp7T/r5ymZmETKrEiUp25+7hUZ/l2trjFcTeah+fs3dr3U2c1p2
         TDJFSPA1FDzxpoKF0ieENx0sU4EWQKW10NiMDlfE7+ToyK5HyY1DH33HQzxIqyO2dINM
         /yN52CZA81beBdtEK13gSjE518VAn7/pJfUSm1lTTiRXlJbjoNa6Spk8hpPPF17JbuYj
         /tvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727271903; x=1727876703;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7nmcWlKoFTNATwfWOn0UALVMJO3SjuirbjxhHbXLIAU=;
        b=HoqGABK6+fiXdMFWj6FShu2wxLZcjYJ9cB5j6AC5cdWDJl9TcGRXhRuFa+EPD7+jjD
         K+FdD825+6HG9atW+YazLZCd5q2f1p8ndSX1zCeN/hIsSvq485o0/VrYjoidwjzpKv2w
         bgFiHI4zzbWvhMQQWnplDATlvQcAKS5hBiBbkAmB67MwRRrZzvtMPppJ90UE3bpduRgy
         ggfO2JdXxRvZzK8b/tezZF68tIID3Dkf4Wv2PvirgmvHowNpY40o3a2DOF4glr802qQ5
         jn5YNr7KHr/BdASkA8mK95CB27sIrklg/x2IXPwp4dXXQD/18J7mEmAniDzMpBaIjd/Y
         8Ogw==
X-Forwarded-Encrypted: i=1; AJvYcCXcx7sU5NlUClf8QJCErgSU+urieoM7x6oh6kOaGWFK5jWvpEazzJBw7rRgytN3SOUTeH52Qfy09MKJMqw=@vger.kernel.org, AJvYcCXrhuEA+kC7QDCXCi0+hPl7EYmb4Xpodu0XFShcNSbYN9QHEPsRBCogM2oyRmCeWyszzh3JoXJCZeLW+rc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmoXwl+897FptqWCbNXuRSBqx1S3zOjFkamSCQ4jK7Tb48q0Xx
	yghV8Q/3pnohFVo9vJWoWcNqqzq89P7ntM+awe+5WE25VEG9LcaXoE04Dw==
X-Google-Smtp-Source: AGHT+IEzMxdjhz1ppV735VD0V6py6Nlw4kQc29/A2thQmfr+trRK/o13J4rcG1IMACMG4yHcu+/a8g==
X-Received: by 2002:a05:6512:e89:b0:535:665f:cfc0 with SMTP id 2adb3069b0e04-53877533876mr1821591e87.32.1727271903253;
        Wed, 25 Sep 2024 06:45:03 -0700 (PDT)
Received: from orome (p200300e41f147300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f14:7300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c5cf4d79a8sm1853694a12.86.2024.09.25.06.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 06:45:02 -0700 (PDT)
Date: Wed, 25 Sep 2024 15:45:01 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Liao Chen <liaochen4@huawei.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, 
	jonas@kwiboo.se, jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
	linus.walleij@linaro.org, mperttunen@nvidia.com, jonathanh@nvidia.com
Subject: Re: [PATCH -next 2/3] drm/tegra: Enable module autoloading
Message-ID: <n3ydihjvwboq2dlby7sknpccbah6jape4c3y7gvuyt72yb4ame@xvejzzaxtyqe>
References: <20240902113320.903147-1-liaochen4@huawei.com>
 <20240902113320.903147-3-liaochen4@huawei.com>
 <3ttycjomydslmaqtwnhjehrj7pa7m2i2daqd46kwd2tsxynr2t@jo24br66tz7b>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kzp52tnoqabifusm"
Content-Disposition: inline
In-Reply-To: <3ttycjomydslmaqtwnhjehrj7pa7m2i2daqd46kwd2tsxynr2t@jo24br66tz7b>


--kzp52tnoqabifusm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 23, 2024 at 07:21:21AM GMT, Dmitry Baryshkov wrote:
> On Mon, Sep 02, 2024 at 11:33:19AM GMT, Liao Chen wrote:
> > Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded based
> > on the alias from of_device_id table.
> >=20
> > Signed-off-by: Liao Chen <liaochen4@huawei.com>
> > ---
> >  drivers/gpu/drm/tegra/drm.c | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
> > index 03d1c76aec2d..1a12f2eaad86 100644
> > --- a/drivers/gpu/drm/tegra/drm.c
> > +++ b/drivers/gpu/drm/tegra/drm.c
> > @@ -1390,6 +1390,7 @@ static const struct of_device_id host1x_drm_subde=
vs[] =3D {
> >  	{ .compatible =3D "nvidia,tegra234-nvdec", },
> >  	{ /* sentinel */ }
> >  };
> > +MODULE_DEVICE_TABLE(of, host1x_drm_subdevs);
>=20
> I don't think it is correct. See how subdevs are handled in
> host1x_device_parse_dt(). I'll pick up two other patches though.

Agreed. This shouldn't be needed since all of these compatible strings
should show up in the OF device ID table of their corresponding drivers,
which is where the export should happen.

Thierry

--kzp52tnoqabifusm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmb0E90ACgkQ3SOs138+
s6HM6hAAslMbf3A5fl+jfDpdUqk/FK5nGyc1hHza2bcFNWadYg45qtAl5trpka38
4hHeOi/6iOYr+KwPXjfd0o/deduoOaKdmXWiuwScqh5dKqMbCUktMqw+VWYsjZRe
BvqfEnqJQnB6kStu8JswuRCUGqXs06Sm5MRDY/pVL7Uvbbh5m+DdlwTI6IjjY5BX
3TTnrBCEjzwYVeB6WYODbRmsfZ2xemtKqX11Llp8yGkkngSwGGPK+tU8veFMET6Y
Xegc48CFR2U52GqLBhbdFK+nb85SSXeMBMBNSi4KKlTaP+sb9WTcl9G1TpdxrE57
OH++4wBoVnzPakLkmm7dDgIIoCC+SVhGi15y8RBqZ0LvduIyzjaOnkJow1Hc+67Z
87qqUQVdqCck+VNaaD+K339bPNVgA8ioyZ2Uy79vnGemazmSc+DLMUDvnOk8DSzD
JYat/dsCVnU1ZaJRKYQHHNZQGbA32tur3V0Z7WhHuwk+VJ31JcSiMgQnhL+UOTQM
/qRRBa/oXqeezeH+ny45p9RT0q2+S7XSMta4kSENX/EKxd1Taez0Z7WhSpoGU0Y4
l/Xw0wwj/C2LEaVfE6ZyT9aEd5xkWC8TE/0MnznVINJYWgOxftvEuG07QUbj+GxV
0WLBNT0FhMZiknSqoO+UTiEYGluifadLN7Po+vT/71CUNq31cc0=
=cv60
-----END PGP SIGNATURE-----

--kzp52tnoqabifusm--
