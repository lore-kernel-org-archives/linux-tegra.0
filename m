Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96DD1D516A
	for <linux-tegra@vger.kernel.org>; Tue,  4 Feb 2025 18:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738692136; cv=none; b=E3iRbwonHX1bEscrhhxNQiSVbAP0e3muCJo9t1/a/jvCKL4xNxaFKVVUo8QaeJtRX//maf9WDJ1B0EYchQ32GKRfQTdJ2camlM3mzDZ4vLUAFkxuHjuvG8QTYtDKUdkkM4NEE0sASzwngpOVUDWFJbrjlMrWRNqQa8hq3VfFwvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738692136; c=relaxed/simple;
	bh=r9K0Vwf65AUuHE/bjxxuzEp9L+I0CWIaTET4D2MHAmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LOfaZXWI9ZLQgtOjEjc4afU0BtKlW6hYtCOIBTac+UPJE3nXKv/h5/nFQFnOXBlvkVQBsJ908uOjgYmaXQpla2RsoOyEc/YhRAeoFbB5GycYBAAe/5/qX42YaHl4jcucVpMpnjUfUGJWe47nh8rvtEf2IoJ7ESazAG29gERQ6TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mf6BVEPf; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mf6BVEPf"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so3093412f8f.0
        for <linux-tegra@vger.kernel.org>; Tue, 04 Feb 2025 10:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738692133; x=1739296933; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T4z5wAQZzKrG8mW8jnRw2NXQidvYvNXR1bP88Txg4ik=;
        b=Mf6BVEPf40knHe3DSU56OQ6BqLpscktKF1/KYDBoie0W+GsJtoI8VyH7FeDjx9BVUt
         2JvA+OJtzeeQlHc3BzBGT9U6KhYBodHdOBeo8Acp78AXCkdUd9uVd+Yf+t1UAMs3qWYr
         0lSHOluokPTJH8zYJk0NHW/VThhE7uerf2+GQwQeHpgS4/vaFYWuSZL1pINM1ZcWUH8w
         7N/lrZaGlH1HSBtDBv5bfMBkUTp7NOGD24S4rBxDvZBKdzFg4f9rFoWV6FwdX04FemVq
         zN3EKvNG0kOxMPVRHpgOctXnlfA+/6bxjzuG1lxoUo9nq0K2Zr0Zjduj6TK/nqzi4dtr
         0GNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738692133; x=1739296933;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T4z5wAQZzKrG8mW8jnRw2NXQidvYvNXR1bP88Txg4ik=;
        b=XTbLpoGfAFME0cycEMphO3kqqjJYtVSAp+gJUkEB3Qs6YqCsPMayfzAKGE4f7dw7dA
         YlA416wbwOhCckGKI0J/hO57DbQO4m8dDQsHoEFzTjbpzAvbmjhf2PBix+rotBWYnG4r
         2yYFk+ERrv+nNfZvEAo0jTM+MyIId37LctYa5WCLGKuSvW2Q5iAo7yocHRo2DpFKDd5A
         POER5900/uIt16kfM2aeFz0SzFwNiY6ypwHEzn6aB4recN2yAgjklkkaepUBY4Q4gx95
         2Ogk/TQ79XBQvsFfjTVFFwMIdQVqrNzMgUzuwImpIeIGQ3jSHuw3XqM/QjRGXSnH7tX+
         CxSw==
X-Forwarded-Encrypted: i=1; AJvYcCUSBovd0Gh3ipvn+5HvX5FXjOgUGo3k4F7jFMmEQSknYsONRxWmWMN7lizl+ZKuy7WsWd6mFD9kc3JkOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfMqVjzDUBlQ1HwMH1z+zZMvo+XWBW+ANgiAZD1jxxVK5IWEvM
	GdGWCnqt6Py/MIIfyRGVzROQKt1ZS5+JNP8vmWLtlRuwlO9AyXUb
X-Gm-Gg: ASbGncsUmwpv0CnIG13hpv0xP++lwZFyCH9Ns9KZIedV+unj2nhepliZRm1eGpR2Wuu
	5pcbtJ9QqqLYgQNQtoFqTwU8JnYF68KS9lILpj+8t7k3zRuOovrMgHOLEteEPk3ufQ0QSxmwUGl
	AcRehTK28kdOoht3mKKlSilR53ERfIAe+kL69hMgqZyTOF7a5j34c9tLvHlB8bBt84DhKKjckpq
	6hE2M5vE+KO2f4RM3SMMRUQQKV2XFFlFwD/39keoNy5edC961mAnchfrbMn61R8jlNNr+uVj+dk
	8lartq/X3+TQgILcSzeAeiip7ldsBYRu4c1uxVh/zQ///mVGesxUsyxFv2MPv6n1bmREl44RzkI
	WAg==
X-Google-Smtp-Source: AGHT+IHi9W+AQaPHkr1CjugG/NXnUKiYfyTQwQx2Wg4bwuqIWZM2eYaLtkut4n/MAS1Igy54G/nAnA==
X-Received: by 2002:a05:6000:4010:b0:385:f398:3e2 with SMTP id ffacd0b85a97d-38c52096217mr23296233f8f.37.1738692132463;
        Tue, 04 Feb 2025 10:02:12 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c11fadbsm16194196f8f.44.2025.02.04.10.02.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 10:02:11 -0800 (PST)
Date: Tue, 4 Feb 2025 19:02:09 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "biju.das.au" <biju.das.au@gmail.com>
Subject: Re: [PATCH] drm/tegra: rgb: Simplify tegra_dc_rgb_probe()
Message-ID: <wdxol4ua2zjzepvbdqrsybizl6ocpppjb2dmql62rbcmjjyqeb@5z4i2g7hf5vn>
References: <20250201105658.37043-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdVrry1ZV=C0vuEO+7GcF5Tqwtecxu4UPOnrtzXv6RUm4Q@mail.gmail.com>
 <TY3PR01MB11346E195D7B44DA6EA30E25986F42@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <2spuar4m4kcv62r7d6ovtpttpooodwrvsjk6tyxhlnuynw2aru@aj6s4xcgwfjf>
 <TY3PR01MB11346FD535BB442955F43050C86F42@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3p7xeptfzcupllfn"
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346FD535BB442955F43050C86F42@TY3PR01MB11346.jpnprd01.prod.outlook.com>


--3p7xeptfzcupllfn
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/tegra: rgb: Simplify tegra_dc_rgb_probe()
MIME-Version: 1.0

On Tue, Feb 04, 2025 at 03:33:53PM +0000, Biju Das wrote:
> Hi Thierry Reding,
>=20
> > -----Original Message-----
> > From: Thierry Reding <thierry.reding@gmail.com>
> > Sent: 04 February 2025 15:25
> > Subject: Re: [PATCH] drm/tegra: rgb: Simplify tegra_dc_rgb_probe()
> >=20
> > On Tue, Feb 04, 2025 at 09:07:05AM +0000, Biju Das wrote:
> > > Hi Geert,
> > >
> > > Thanks for the feedback.
> > >
> > > > -----Original Message-----
> > > > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf
> > > > Of Geert Uytterhoeven
> > > > Sent: 03 February 2025 11:06
> > > > Subject: Re: [PATCH] drm/tegra: rgb: Simplify tegra_dc_rgb_probe()
> > > >
> > > > Hi Biju,
> > > >
> > > > Thanks for your patch!
> > > >
> > > > On Sat, 1 Feb 2025 at 11:57, Biju Das <biju.das.jz@bp.renesas.com> =
wrote:
> > > > > Simplify tegra_dc_rgb_probe() by using of_get_available_child_by_=
name().
> > > >
> > > > That's not the only thing this patch does...
> > > >
> > > > >
> > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > >
> > > > > --- a/drivers/gpu/drm/tegra/rgb.c
> > > > > +++ b/drivers/gpu/drm/tegra/rgb.c
> > > > > @@ -202,12 +202,12 @@ static const struct drm_encoder_helper_funcs
> > > > > tegra_rgb_encoder_helper_funcs =3D {
> > > > >
> > > > >  int tegra_dc_rgb_probe(struct tegra_dc *dc)  {
> > > > > -       struct device_node *np;
> > > > > +       struct device_node *np _free(device_node) =3D
> > > >
> > > > Adding the _free()...
> > >
> > > Yes it fixes a memory leak aswell.
> > >
> > > >
> > > > > +               of_get_available_child_by_name(dc->dev->of_node,
> > > > > + "rgb");
> > > > >         struct tegra_rgb *rgb;
> > > > >         int err;
> > > > >
> > > > > -       np =3D of_get_child_by_name(dc->dev->of_node, "rgb");
> > > > > -       if (!np || !of_device_is_available(np))
> > > > > +       if (!np)
> > > > >                 return -ENODEV;
> > > >
> > > > ... fixes the reference count in case of an unavailable node...
> > > >
> > > > >
> > > > >         rgb =3D devm_kzalloc(dc->dev, sizeof(*rgb), GFP_KERNEL);
> > > >
> > > > ... but as np is stored below, it must not be freed when it goes ou=
t of context?
> > >
> > > OK, But it is used in tegra_output_probe() and never freed.
> > > Maybe remove should free it??
> >=20
> > It's not quite as simple as that. tegra_output_probe() can also store
> > output->dev->of_node in output->of_node, so we'd also need to track a
> > flag of some sort to denote that this needs to be freed.
>=20
> OK.
>=20
> >=20
> > Ultimately I'm not sure if it's really worth it. Do we really expect th=
ese nodes to ever be freed (in
> > which case this might leak memory)?
> > These are built-in devices and there's no code anywhere to remove any s=
uch nodes.
>=20
> If there is no use case for bind/rebind for the built-in device then no i=
ssue.
> Or in .remove() free the node or use dev_action_reset()??

Bind/rebind is possible, but that's not even a problem. Worst case the
reference count on the device node will keep increasing, so we'll just
keep leaking the same node over and over again. I guess potentially
there's a problem when we rebind for the 2^32-th time, but I'm not sure
that's something we need to consider.

That said, devm_add_action_or_reset() sounds like a good solution if we
really want to make sure that this doesn't leak, so yeah, I'm in favour
of that.

Thierry

--3p7xeptfzcupllfn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmeiViEACgkQ3SOs138+
s6Gomg//axDIv8lDZQI+Tb6vo+p5J65aHkZXr5gCcDDWdWuJHHm6RFxVv640fN73
P+7oaTvquB52OBtcaJT4hGppK4Ai2meTIL0Dhe0EPT0Yz7WaD1GHR4IDa8ptNbDQ
81kjhAwVpRPjdP3QdnFPD0hjCBjuyFYBjlGqqI+sXP3RCDtXx3oe7F1+Qzg/8X91
PZ3jC2CeITJgnN/HTJG5qRMGBvvyjl4zr0+k2bS5dGPofpwE2Bx0dmbuv38vJQeo
QTHCFMA61P9o63hVm/QS3542WWFAIU8SyJmfniA1QiPdzeHZzOz39N9YIRl0qIS8
PEeonLhXLx+zgd3WHb4HzZJvFvvUIXxIaI0uwHFIpmbfOpf0DPGRV3nnKemgBPeK
u7p1jIdgzdeR+JjmFqTS3fEgDxsGzhuJLA2e1Sufyj8ofmrwiBj/T8ePvel+R6kb
tk5hN0Bdko08ahXeZRp9lLbaK/7ToRabZTuTEMosDc75fe/fQZG2V7SQ9zDbaCIQ
l/JnRrntXMtYrgA8ClidDTIEHOknCYRjtRhAnwO19za5QbLrQyG8o2X41ReW2sZS
xQMkZS2aABVkgnl/X/6fNqrW20YKHzur/GhHc78QsUBdUDJS7EvF9DdSB9yMPVon
/1Z7AZRCjCT+Bl7h12KdogdHEowyVcIgGTJiXExeRDDV9+n1GdI=
=CA70
-----END PGP SIGNATURE-----

--3p7xeptfzcupllfn--
