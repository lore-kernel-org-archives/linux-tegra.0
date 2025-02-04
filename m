Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2402F213E8B
	for <linux-tegra@vger.kernel.org>; Tue,  4 Feb 2025 15:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738682719; cv=none; b=N3Z51quzJIQFDnhcXoZVElo6EXbVoiM1INaz7XD8E3oEFqOb7OAk//KvuUo1+PeVKvGKL/PouhOxlfk+ERSZuK+56CDGfMUA2+sgH1MCqqNpLIxnJqZlymjC0FwTcpwssbjgCsZgi7E6SZlcTWGS7l/iRH3R2rQfTOgCOgG811Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738682719; c=relaxed/simple;
	bh=xPXdjHwKIXAADylWlAjPC8gi4P4JqgFJBdt1RJeOlRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YaGYJ2q35ymKlCXAYZ1TpQ/HBeWE9vsEjUImCIQuN8JQP2KFM5NcschWizJMQK2VlVHrj5kQkQ2SBvXe7mjGK2RuANshenRXMC6+yBxjx+RbZkZiGECxYpWIICGkDpokqqTL5tO5gvdGku8ITU+jSrauJTSBdVAnBuy2wJAlRcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=InxyWo8f; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="InxyWo8f"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4362f61757fso58652985e9.2
        for <linux-tegra@vger.kernel.org>; Tue, 04 Feb 2025 07:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738682716; x=1739287516; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N8Jw0XKdoFMM4j+EK9ZMp2LEZiM2wLK9PqI1gGCAqHg=;
        b=InxyWo8fweOBhAU988shr94bXr1sBTQYNjk3Us3g87CmLWh8hwGjw0pEQ/glpw4CZz
         DzHr+jJbPx0wLN9Xq9n0Kdeg1NfnDyCBERyjPRaW8KAuDTq7y+EnW43/45tcV12/v3m5
         SLNm67Hu5mH2r+H87jz6LOb1JbSZ1c7Y4QsZ45R5ibwtiWDfbGltN9ft7SQD3qRoHoNk
         iYGsdM6F5LHEgrezeZy7WBdvxN3JhgnseX4mCiySuebsx91yS5XF86ghLQn2Vmt012XI
         FvAn/Fx+CPeApgJZ5cB3WsaPOJYrWI3ZaEV8gVJvADExgMVzcPbY1MG5QRpDoKP+9oYK
         m1Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738682716; x=1739287516;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N8Jw0XKdoFMM4j+EK9ZMp2LEZiM2wLK9PqI1gGCAqHg=;
        b=g6C+43pOPj10bzDUHCPiJLfJqCSSybZNsLQ9XExR/lVIBnXnBiQHLO9cIa7ihdeIe1
         z4ihsrkmHF+0Y4T2TMr65j2lpdZUYAcfmBH462xZiGsLf4G4XQPIR5QRXFH32uLZXxqn
         nYvSXfvQqGS2EVYGNRL4ifOVdGbEcJVXQBxq942yr4Bks8X/YlQNnRjVMXBmUDczrzig
         VM9Yn7iBO8MCnPghE2fMxxDJc6BShyEv2lyGlrInlNgx1WWaa5/nFwZC7/uXo3NAGUGJ
         8V5BZy5JLiBLSubSZocNZ48RL9CCNe78XFXc5cSJLAHcIcQOVPk9hcrN1KQFmDZ0UDE4
         5xAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBRIMR8wSVeOq9IMeQ2LYcKVhooib2mOfGWtjyCnQ4euGgjaGINnaXxBqkVM77gZ0of1KSZ3YEfML0pg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBj+895pYEWQCluMgajBzlDfLGbv+Fq9vfrOwiXhMPs9Uv2Tc1
	IeCUp2fpAG+5XfxEbJcJ1pgRK2Q5ohd43s9w6XitMjS+cXMjFZlo
X-Gm-Gg: ASbGncvzO3IiXf7g994+WaKRMjtZRDi/iduaEo3xtFJRsdvMfB0ut7A8py/Wma76Wzi
	j1OiUHveu1AfXHXuioSa3kqv8A0DmHaiGylvX8Zh/jFOxnn2txTkpSNEt51x5WnHBlsDm59R6Zs
	suRzbn6q/FswuY8JBE8VKGYHUcjTUPKJ8ldgjstpjh2hCMrI/g5ghkDOLJ5DZVWWvq4vmjsvV4h
	5lIeLmyMQpAneVvbPJTldAlxCsgJbCPEnFUd1eIclQLKoU3euO74OAQv4EH1WOwF2dJssoFYgR6
	tIPaECT7aIPI/JRbLCxDh5LYKzC8yjO+He8fP0HEJWLyj/7uueEyphtj5eOhJQyLTfF+zSGHu6+
	85w==
X-Google-Smtp-Source: AGHT+IGKwGJ3nMNTbHEkAhz/DretuOIWOdyaN4yCsb0gxLe4J1MazpgEMBan8MQ216Fmr0ITEyKGOA==
X-Received: by 2002:a05:600c:1e02:b0:434:ffd7:6fd2 with SMTP id 5b1f17b1804b1-438dc3c22d4mr240554345e9.7.1738682715998;
        Tue, 04 Feb 2025 07:25:15 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38daf27bbf5sm1478204f8f.48.2025.02.04.07.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 07:25:14 -0800 (PST)
Date: Tue, 4 Feb 2025 16:25:13 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "biju.das.au" <biju.das.au@gmail.com>
Subject: Re: [PATCH] drm/tegra: rgb: Simplify tegra_dc_rgb_probe()
Message-ID: <2spuar4m4kcv62r7d6ovtpttpooodwrvsjk6tyxhlnuynw2aru@aj6s4xcgwfjf>
References: <20250201105658.37043-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdVrry1ZV=C0vuEO+7GcF5Tqwtecxu4UPOnrtzXv6RUm4Q@mail.gmail.com>
 <TY3PR01MB11346E195D7B44DA6EA30E25986F42@TY3PR01MB11346.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hl5zizggcxgo3guk"
Content-Disposition: inline
In-Reply-To: <TY3PR01MB11346E195D7B44DA6EA30E25986F42@TY3PR01MB11346.jpnprd01.prod.outlook.com>


--hl5zizggcxgo3guk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/tegra: rgb: Simplify tegra_dc_rgb_probe()
MIME-Version: 1.0

On Tue, Feb 04, 2025 at 09:07:05AM +0000, Biju Das wrote:
> Hi Geert,
>=20
> Thanks for the feedback.
>=20
> > -----Original Message-----
> > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of =
Geert Uytterhoeven
> > Sent: 03 February 2025 11:06
> > Subject: Re: [PATCH] drm/tegra: rgb: Simplify tegra_dc_rgb_probe()
> >=20
> > Hi Biju,
> >=20
> > Thanks for your patch!
> >=20
> > On Sat, 1 Feb 2025 at 11:57, Biju Das <biju.das.jz@bp.renesas.com> wrot=
e:
> > > Simplify tegra_dc_rgb_probe() by using of_get_available_child_by_name=
().
> >=20
> > That's not the only thing this patch does...
> >=20
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >=20
> > > --- a/drivers/gpu/drm/tegra/rgb.c
> > > +++ b/drivers/gpu/drm/tegra/rgb.c
> > > @@ -202,12 +202,12 @@ static const struct drm_encoder_helper_funcs
> > > tegra_rgb_encoder_helper_funcs =3D {
> > >
> > >  int tegra_dc_rgb_probe(struct tegra_dc *dc)  {
> > > -       struct device_node *np;
> > > +       struct device_node *np _free(device_node) =3D
> >=20
> > Adding the _free()...
>=20
> Yes it fixes a memory leak aswell.
>=20
> >=20
> > > +               of_get_available_child_by_name(dc->dev->of_node,
> > > + "rgb");
> > >         struct tegra_rgb *rgb;
> > >         int err;
> > >
> > > -       np =3D of_get_child_by_name(dc->dev->of_node, "rgb");
> > > -       if (!np || !of_device_is_available(np))
> > > +       if (!np)
> > >                 return -ENODEV;
> >=20
> > ... fixes the reference count in case of an unavailable node...
> >=20
> > >
> > >         rgb =3D devm_kzalloc(dc->dev, sizeof(*rgb), GFP_KERNEL);
> >=20
> > ... but as np is stored below, it must not be freed when it goes out of=
 context?
>=20
> OK, But it is used in tegra_output_probe() and never freed.
> Maybe remove should free it??=20

It's not quite as simple as that. tegra_output_probe() can also store
output->dev->of_node in output->of_node, so we'd also need to track a
flag of some sort to denote that this needs to be freed.

Ultimately I'm not sure if it's really worth it. Do we really expect
these nodes to ever be freed (in which case this might leak memory)?
These are built-in devices and there's no code anywhere to remove any
such nodes.

Thierry

--hl5zizggcxgo3guk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmeiMVUACgkQ3SOs138+
s6Ed5hAAm9Axms1NNOi6HyezxVvsAFWnJdOLIcS7jT2aYdsczNSLoj3bKgTP9rWf
x7rV40RQ0RVTHl6vOL6L3RF9SK5W6Nxe1KlzbGkcJkOxv3///MizAdHoMPv6vkGA
RTAwX/Uq+qGsypq+J3DM4hsc5790rdzF6OqHDEVZMxGTeh9v5AxyxaayNJf4n4zj
iW/+lr6cPRAkBjqLD+Y3LToPiIwrlhoFjqrY89/XCRVxGndgegdQgtZTQH3BLtM3
egbxZ5LHbMF/T4bzu0qYb1KIwDHzG1GAF41y2y1TZMl+yaXaMXYtNR9wUxSTiMzk
/HBcT1RTznlLiUJawKVmf8yl64EwSX+SCGJ4ExmrDp8qDQLg+qI2ONgAg/qhKxKs
n0QzodzFmSr3leng4/bbXMHFfUwDkUO4liml+N9OnE2kG9gTCIhQ5mecoTcjtOOe
/V0h1DIMBirLUJEZpfKTHpHLwEknZRKRDszOG+wBLR09O5f020cIVxZe/ddP0cxe
0W9+dHyQSApe5KzBenayV0KTepGsea6MmDbqrsoC1N6zVR6PcdQFFosxq/rRIRCh
9L4vDXbLY5qYakaCyv0ewpxnHK1OvIKgup5dQULLURLI010OUVPX+GnG/YFYpoG5
WhVK/fYKOWuL6/yX1Ujn1mdzKV3lwQcKUtyMYLMixvEZzLR8RqE=
=noOW
-----END PGP SIGNATURE-----

--hl5zizggcxgo3guk--
