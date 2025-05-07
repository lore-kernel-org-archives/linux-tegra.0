Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9F628B505
	for <linux-tegra@vger.kernel.org>; Wed,  7 May 2025 15:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746632548; cv=none; b=QhJL2sGyROwHODWMi3CzSphIBK7JFAvhIxmaZa5FLv2apP8PLN3VDFXjObMMrY1hcHRdMcRWubN9w4KvMsHDVBgKWjlsa/7jxGkrx//tYo0ojtKz3NqVMJ1+yMWrvgfU0D87QgR6eqM2sJOhhPeSSmlHsHfsouWr7vg0X25t6p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746632548; c=relaxed/simple;
	bh=vEf0MzSl8IcAFrLEq9xXANHwiINR5TDoGKxS7LUHfU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KiXauveJo+rOGLpOW74FrYe/sVEJ81FWVHj5h0jaluCCNNHVKJes4C4/m+rXh9dUnF4lT3u6Gm0u1pvWPuGDtxwKtGWzYtTXODy0rvdaTyPb63Rsd2xGtpHA6V2K4pFaoCb2GiwiVT+hFYuOrPvwGB6hKmsd/4g3U95EskEM1O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BEUHk5u/; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BEUHk5u/"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-441d437cfaaso107835e9.1
        for <linux-tegra@vger.kernel.org>; Wed, 07 May 2025 08:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746632543; x=1747237343; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TlQ5hw6LWmdOYpYPvKtDsPG1vnMrD1DZlCe7qiUp07k=;
        b=BEUHk5u/qoSMltYQVI1fjygLf3zSxiu/w5NRy029VpBAazITkmDVqC3Z1DP3qdKSyn
         leiWrg8XY7qzN4jMT0du0FkRCOwyw0FbvUfO40TRj4u7gFsCr7iFH5ZPXwtIIMUFH8O1
         hk7i3cJ5a8mwUsGmY9R+Zc8CWc1VwfOF93rf472Q73lbIe35ge1KnFHHyHFtinYkFXKR
         GKg4iamxv2Jiv/WHhnAVgXJnF4c4E9wPp5FxjSMlTO4cbYmR8w/kVhNAMF2geHT4w2Nd
         43RS8BHLI+1K5iXgO+VQnino3srb5E5yXD4V68WgaYtdS+cF2QvqG2lNwFi/U17DO9G1
         rI0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746632543; x=1747237343;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TlQ5hw6LWmdOYpYPvKtDsPG1vnMrD1DZlCe7qiUp07k=;
        b=fkvMNTa7ZbuqzOGtHHbhYQ7/Qx63GfsdYKhWlQQCtcUOwAAGk2FC6r4BYFjntrjD1P
         JDNuz4lQQmiAtKeYXvSBjIOEEgaWTTQr/iMXfj/48AeahyKolIbNGYTyCP8Cl3yiVyCF
         bLBbN3XBli4Vua+AUiDxBeh+aoQhFc1Gs9mFOigotaeB+4W9s0sSyFdCxpXgH5iaV/Hr
         VECwSpFjKEC0j0YvDBdS+L71yh2n8wF1M9vSRs13es4hIwRWWBPAzZ13L3pPT49jH6GR
         U2B+at/TWtQN8WamsHosXgauaYSqnNckoJ+qYXPDe3UjsgjMltDIEhABA3RSxtChC0bP
         4PsA==
X-Forwarded-Encrypted: i=1; AJvYcCVDomwX8N8aIvhcRyb2XoVF4JYh3FUmAHVbG9DUWttHxIIJGp4WvZLHkWM5jYiX/9oStvedIdC52sZnCw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBblnuGfs2kqOs9RIe5+njl16EYN03p4r4BtIReLnPB9b4MkR5
	gZ8Y/hnWa4+u/5wQl46LBGtC9TGQdPs4OVVad0ypCozylBD8QFMn
X-Gm-Gg: ASbGnct9XDydJH+0bX/TUiL/fsd03lLSdV0tt6RXteDTFVKHGj592uV46T98ZpqvLlf
	eGAFHA6RqmRgATuMeaBoPDFX1+0bEtO8e0piRVyQRwyQvBZe1S2hVa4t5pZHELZQrgetPA7llWg
	VOQS1JuVMB62f2HM9L7t7/AhB5XLPlYov0lOyWJUHXJDxfZvD/W/h52bOIsbqQeAxgCu6HtvjmM
	/PEEcGEwPdsKhqNxMo/QC2Vpa8fX8u2Vz5YF9SgfszmmKN1LLJcMG6+9VCq/+5LTY7ideG8p7vW
	N6DIExJKOLmlJhkRL/l9AhCyAaopfZBOi7Fzjke72cxK3yuCg7FhVOrSrSwGelrAO07Kp2EmFZP
	7x+swswNWJWtmzQEt8NbleliqpUo=
X-Google-Smtp-Source: AGHT+IGjXvu9oFQySoHXW/9xwWknPz1Z0gC3AIJFj0PBkN+vPBbSa6+gpsSaULJ4J4weRDJhyGu+Xg==
X-Received: by 2002:a05:600c:4eca:b0:43c:e2dd:98f3 with SMTP id 5b1f17b1804b1-441d44dd21cmr24445935e9.21.1746632543150;
        Wed, 07 May 2025 08:42:23 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd3b7b83sm4516915e9.33.2025.05.07.08.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 08:42:21 -0700 (PDT)
Date: Wed, 7 May 2025 17:42:20 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] drm/fbdev-client: Ignore EOPNOTSUPP errors
Message-ID: <7auvkja5skuew55xrpb5vbat3qgopg2mynm2rxxxa4re3ar3ql@jue4ofk5ohl5>
References: <20250412070047.6725-1-thierry.reding@gmail.com>
 <tqvzgt3cyf453x6eovhe2ox5n7w4wacmdjzxpclxsubq3ub7ld@a6fzvt2is2sa>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tcjqysmwuu4pfr7d"
Content-Disposition: inline
In-Reply-To: <tqvzgt3cyf453x6eovhe2ox5n7w4wacmdjzxpclxsubq3ub7ld@a6fzvt2is2sa>


--tcjqysmwuu4pfr7d
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/fbdev-client: Ignore EOPNOTSUPP errors
MIME-Version: 1.0

On Sat, Apr 26, 2025 at 08:52:40AM +0300, Dmitry Baryshkov wrote:
> On Sat, Apr 12, 2025 at 09:00:47AM +0200, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Recent generations of Tegra have moved the display components outside of
> > host1x, leading to a device that has no CRTCs attached and hence doesn't
> > support any of the modesetting functionality. When this is detected, the
> > driver clears the DRIVER_MODESET and DRIVER_ATOMIC flags for the device.
> >=20
> > Unfortunately, this causes the following errors during boot:
> >=20
> >     [      15.418958] ERR KERN drm drm: [drm] *ERROR* Failed to registe=
r client: -95
> >     [      15.425311] WARNING KERN drm drm: [drm] Failed to set up DRM =
client; error -95
> >=20
> > These originate from the fbdev client checking for the presence of the
> > DRIVER_MODESET flag and returning -EOPNOTSUPP. However, if a driver does
> > not support DRIVER_MODESET this is entirely expected and the error isn't
> > helpful.
> >=20
> > One solution would have been to conditionally call drm_client_setup()
> > only if modesetting is supported. This seems a bit redundant, however,
> > and could further complicate things if ever any DRM clients are added
> > that do not rely on modesetting.
> >=20
> > Instead, simply add an extra check to ignore this expected error and
> > skip the fbdev client registration.
> >=20
> > Reported-by: Jonathan Hunter <jonathanh@nvidia.com>
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/gpu/drm/clients/drm_fbdev_client.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/clients/drm_fbdev_client.c b/drivers/gpu/d=
rm/clients/drm_fbdev_client.c
> > index f894ba52bdb5..8c8552ed912e 100644
> > --- a/drivers/gpu/drm/clients/drm_fbdev_client.c
> > +++ b/drivers/gpu/drm/clients/drm_fbdev_client.c
> > @@ -152,7 +152,11 @@ int drm_fbdev_client_setup(struct drm_device *dev,=
 const struct drm_format_info
> > =20
> >  	ret =3D drm_client_init(dev, &fb_helper->client, "fbdev", &drm_fbdev_=
client_funcs);
> >  	if (ret) {
> > -		drm_err(dev, "Failed to register client: %d\n", ret);
> > +		if (ret !=3D -EOPNOTSUPP)
> > +			drm_err(dev, "Failed to register client: %d\n", ret);
> > +		else
> > +			ret =3D 0;
> > +
>=20
> Wouldn't it be better to explicitly return 0 in the beginning of the
> function if !drm_core_check_feature(dev, DRIVER_MODESET) ?

It'd return a bit earlier in that case, so there's that. On the other
hand I think it becomes a little less clear what's going on. In the
above, we already have the appropriate check in a central location and
we reuse that here.

I don't feel very strongly either way, though.

Thierry

>=20
> >  		goto err_drm_client_init;
> >  	}
> > =20
> > --=20
> > 2.49.0
> >=20
>=20
> --=20
> With best wishes
> Dmitry

--tcjqysmwuu4pfr7d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgbf1wACgkQ3SOs138+
s6Fygw/+Mkw6+cuUsTfKqPTm0TmTd8ImHwyo54jIptx737/JkRutAG94/l7qi1P7
NVkueLtx2NF3cAnZeA8nYs5mAQqo71YqjQ4uJqGm5Uc7jrZEiMIz74msZXLChMKY
lW1ELYDC0xRJDDMTQkVO4rZum0E7IavUlLtC1D1taQmfY4nvXJYJJ+d8J0GrqK7S
5eQ02ESYqaCJND+M6Naa5PfP3ab2mKKOzRmU69q6U45s7mWz/2iIZtgs/cJCJU9w
4K+jIMbzAchf1eHdPMWTDDprgpApL0luHB3Wc7t/n60puLawWgsMec+TdMB2hXHy
a9Re1flEbsmbbuHtGtk/jIbuG+9SObcWvHpOQaFHgZO0Lg8kE6XpC2vw2GJ8DkDG
6MJy9+7BpSPqzeF17RQOKM3ILacy85fCeyQFlcD7GZaIUkxII3QledgwqGF4fBs+
n1POebwZEyxAqp6fuAfRIkNo8L7WsJULPIGiRtB6tqv0Z9N+NuCGQoVC7iHhnPbW
dbjj3Kk8dJ9XFNvvN5cXZRdvuftc+m4eCHOTjOJsb4jgY3d+jWN+zwa+yMRnRBlK
5/7oA7wMmIBoor5GFMyitDm0Mk1aEdnxYtTru6T7KqUbbWsqdzV6lnTmYaesSp/k
wclXSwn/h93MdG4QSsbrh7AynYapuR+v49uYv85hPf6RthVKtS8=
=1JI4
-----END PGP SIGNATURE-----

--tcjqysmwuu4pfr7d--
