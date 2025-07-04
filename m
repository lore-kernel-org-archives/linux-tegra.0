Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2242F50B3;
	Fri,  4 Jul 2025 09:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751620334; cv=none; b=JYxq4j7MzOdL4tVANcvwEP0V3+Ofb+XDWLJudclzmu27UH1S3FDOTDdkfTUAp409dOa/3RCiBx8LDiHwMljSPI22+PYi7bXAeElyhiO4LgDZKV5mVSWIaF/1SXHvj2VL+AC3FflqPbiozI8HV3x6WlKSZS/jt6a8bBQEp9gVg24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751620334; c=relaxed/simple;
	bh=6cDZJ3qB4J8b5zsWmQr2zNx2Y1qp7sgokKOOCeCt7n8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N6Q8yj8o3cSFLQ5YdVQ2lB1XuHLrHG1Tg3JmJivSxDMT9RU2raNuM/2BkS+IbPdawIE6ZcXsqnp8xtF3YltvIcLnhJ7XE8sU2GgYVL7PsjF2QU7jFv5YmHask30abvBNLJE6gAUa/FOBgv12C7UjwCgoEzQD82pKU2C+I7SULPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZCmr8ifg; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZCmr8ifg"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-60707b740a6so997158a12.0;
        Fri, 04 Jul 2025 02:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751620331; x=1752225131; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KptkojN101D7RtN6vbUFu716Ck19MPKgSUb97X17FaE=;
        b=ZCmr8ifgUnjffLKRfcCe58FjKJYcW2FqAcrPtSt6PlsbpU/45NWjPZXxaY4DnYcvRf
         4pwft5PBwARsJSeQOl4DlMZrHaFwR+Xjks1pEKxy1JMnlQptzrenwb7uaSH7RzM5pX0A
         aWWCucPcAs6g4TB6D4Kih5CkglcivEcJOD8Gd3AUyXbK8hil1ft5JeTowE2jGmdOvvry
         kxn/aONlKkzK9V/0uz5FsLsQlGxclRFbt0pHwTgJjBtgrb2gjzpJ4wHvp5WCN3OCWR48
         FFRAhqFB4b6a15fVo0Gm1YgkjKOIN0ST/3/3SujZKhy0kIlbg9BJxJjL6HIN1dYvO43e
         PVLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751620331; x=1752225131;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KptkojN101D7RtN6vbUFu716Ck19MPKgSUb97X17FaE=;
        b=qww834TkJB4048aeKC6kveuHqvyBLE9SBoZA60Fe7dzVwom2kOxdLD4Yjlea0Yaej6
         61OpeBQj1abn9kgguljurTnvtHO5sjaOhjv8QVYFGeQ6FoNaHblX0eI3E0Kdnj1E4xMS
         EhXrgXpjUttNR1VmSTFNoJKJjFm5fmGqCT7N3MrdhKQnIOuijsITgyI+tcGRMjOKuwz9
         8Mzdm1tKw4JMr5jVrKREH0Y061DZ22UnUpRHbpnEWwsyQLFQxXv7CGSOw7+kObqttyXM
         HgtEdKWq7xnYMxqTrV9kTCCvcH/KP0jqybVy2zbFEZJVp6YGJ7C00D2wq6ZwRubexKVe
         PALg==
X-Forwarded-Encrypted: i=1; AJvYcCUITPjz2UB6QqIRUUX+H+luklSfT8YjxDOErVrT3v7FNZ9QnU2HsPWNQNW06sS3I2BZLXg6hBFJfSJ2Mwk=@vger.kernel.org, AJvYcCUUNevF3oeQ3FnxuwdUS96eWT0wnqFQ8amtzEuVtdAfWlONXxurgb77QdS4LCiTJXRLDITuQjtYdBR9WNiCxh9xW9Q=@vger.kernel.org, AJvYcCXB79NIHPBJUBAqbYcFzXLxj2VrahWdqmsjHgSW0e39z71ArTmZAdWOxg1X/yM1jW/AUgd1rHnCGCsMekw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcoBl24fkyh9QlEHXgWHIOlEA7dCmR0NDqkVGmrL92dBpw+lu+
	QFhxBhid1T4CRyzvZ0UfDDlklGHk7oW0rIF/gpqwi3tzsp4r3YECKRmM
X-Gm-Gg: ASbGncv0ojgsKLDMbjf+IYCGV5vg7ikiNg/QxGclEKe/b0cTQOOWPd2IOKu0xiL4ufz
	cmAq5N7E56e0BuVsZn7lAVbzGb7sLpeoum2PeygdNdnKqJPNpgbK1BDAszMeFmO9Hh4u4XmtOQx
	hC0H7PCpPi36IEE8t1gN0MQC3PC9gLrGUM06llZx227+n2PN8o3LQQCMcYpwAerGcAapsSx4zdH
	1TgLeahqWWGBiH/T6R+08M7/9BPElCRH1w5BD3dXW1lE7Q3o6D6Zu0HMaCz8ZLi6fALET329erY
	8llsmygn4DXmSzB7Z4vbfE8rUQpmJvsNjrG94WqVq/2rE0kaIC3dU6YmvYSsYA09ZtKjJoZjq3n
	4oIYpYC3DzXTUMwsjw+QeS/ajHccLCo9jX0FZqK5JLjC0ORhKofhIfMjjNhA=
X-Google-Smtp-Source: AGHT+IFdp3dnaPNX2K9juktcKvt9T7MKTZPR3ZqZ1DcevNm+PpERG7zIx/J5e+1Xs4SiNQ/M23vBdQ==
X-Received: by 2002:a05:6402:50ce:b0:607:f431:33f8 with SMTP id 4fb4d7f45d1cf-60fd6d90e62mr978981a12.24.1751620331153;
        Fri, 04 Jul 2025 02:12:11 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60fcb8c80c4sm1016517a12.75.2025.07.04.02.12.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 02:12:09 -0700 (PDT)
Date: Fri, 4 Jul 2025 11:12:07 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Douglas Anderson <dianders@chromium.org>, Lucas Stach <l.stach@pengutronix.de>, 
	Russell King <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner <christian.gmeiner@gmail.com>, 
	Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Qiang Yu <yuq825@gmail.com>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Boris Brezillon <boris.brezillon@collabora.com>, 
	Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Jyri Sarha <jyri.sarha@iki.fi>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Damon Ding <damon.ding@rock-chips.com>, Ayushi Makhija <quic_amakhija@quicinc.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Chen-Yu Tsai <wenst@chromium.org>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	etnaviv@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org, imx@lists.linux.dev, 
	lima@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 20/80] drivers: drm: Remove redundant
 pm_runtime_mark_last_busy() calls
Message-ID: <gh6mdzdl4gzs22zxfigdpbep3xcaf37fhjis5bvuvrjbxyxhkt@53hdnb53m32p>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
 <20250704075413.3218307-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="73fi2dtgof2ecl74"
Content-Disposition: inline
In-Reply-To: <20250704075413.3218307-1-sakari.ailus@linux.intel.com>


--73fi2dtgof2ecl74
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 20/80] drivers: drm: Remove redundant
 pm_runtime_mark_last_busy() calls
MIME-Version: 1.0

On Fri, Jul 04, 2025 at 10:54:13AM +0300, Sakari Ailus wrote:
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
[...]
> diff --git a/drivers/gpu/drm/tegra/submit.c b/drivers/gpu/drm/tegra/submi=
t.c
> index 2430fcc97448..5e0e76ebc5be 100644
> --- a/drivers/gpu/drm/tegra/submit.c
> +++ b/drivers/gpu/drm/tegra/submit.c
> @@ -502,7 +502,6 @@ static void release_job(struct host1x_job *job)
>  	kfree(job_data->used_mappings);
>  	kfree(job_data);
> =20
> -	pm_runtime_mark_last_busy(client->base.dev);
>  	pm_runtime_put_autosuspend(client->base.dev);
>  }
> =20

Acked-by: Thierry Reding <treding@nvidia.com>

--73fi2dtgof2ecl74
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhnmucACgkQ3SOs138+
s6EwIA/+Lm7/OgfvX+wbCwmhCbQp5/BVsRO878lwGCmlqPoYL2WYHH/eSzmXSvUK
xb7ZYOHW0fzKZGrQhw4CoKbIEoD5so8k56hh1QQ0y0nlSTnW1QGrQjINcBXXen12
xKQLm3Iim4xi+haF9Bo2v0tpjEQynVvV2rsLqtanwUoo2ZUioMdNfDGVRtm+xShI
HAqxFVcL+aJEkbX1Z/3H4Nb1UKYe8tqXo8KurA3XuWDPGpCBPfUhgm61rWnq7DGu
OqKFeqdRAhEL1SMd5Ptl4qNV5vQHpjdhgpnUWL24Sj+DCSh9SrRAeZA5svDx/pVW
gFYa7SGUyHxt8GXmUM7RAJwTD2+DK1NaUWD5LtvjYFZ703AavEfPJcUULNZj25Lk
zCUs5TJkF9xOaJeosrm97c0515FHwcX/bRD90PTuzcvtXTpSPIR6NcGTvIzEV2gU
McLf0pU3g7TSh4VRi14oBS8mjPeEgFpnWbYc9VT2JwkE4WTzx3FBtC1k3auDQel4
s00mGYbkG+5LLz0SBCWnDdRB4tPYzytyAfnhv0MOBHhAO4EQ1GN6WeNlnqQJed5m
f5j4zUjT5xCp7d/ADR6ZqKH0OrxA1zTlZliRsxW44FPl5QHhozZKNP0Wqa7F1HQ+
mAr8c/EP9BLSaE2mF6jelG8TDZfTyTraHew1D/JwRkgK53rNmHY=
=z+c+
-----END PGP SIGNATURE-----

--73fi2dtgof2ecl74--
