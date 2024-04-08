Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1B813F428
	for <linux-tegra@vger.kernel.org>; Mon,  8 Apr 2024 15:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712588503; cv=none; b=lyOH338ncqI1dWGZ5rl5crm325SuLuXqtoeUO0A+B+vajJKie5cVSPxke7Bri0e8T0PC3nSOU5/5WRVg9qDC5g5IX9p2GAkjTqQ0V2DwORr8i/Au7XOoBDkuM1AboE62+SCfkpVzaioizlVjrdsuUlli4ooMfl0EGGFtZWMX+Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712588503; c=relaxed/simple;
	bh=PRN1sELqu0ogiTDUrC+ULOZosF4sbROYULaypNrLxRE=;
	h=Content-Type:Mime-Version:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=pQGXT+Q5jsQyOU5MN0I3BwqvMPfMDW0Crx0KzHCnfyjiek5V85QeDD8ql3r1MWjmqg+hOeuzbjlsRivMl8xOMIkgPpotXXrf2l3MrNhiNZs3kDUR+sJE1V1ZO+Iqe2Ku1hb7pQNCO80bElDT+JyYuV9d+KSzWU+F/dP+/IwQTLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k5Ffjnnb; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k5Ffjnnb"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-56e6acb39d4so771746a12.1
        for <linux-tegra@vger.kernel.org>; Mon, 08 Apr 2024 08:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712588499; x=1713193299; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PRN1sELqu0ogiTDUrC+ULOZosF4sbROYULaypNrLxRE=;
        b=k5FfjnnbXhcD1od/7e3PbFkGTajAZwpFQP3bExqfyso51RWZ8mh2oCO428hJfa+ePV
         RVSUkOw+p0DRsnQmcIvcnhYqz9NRP3zOVticzkBPuJfrxB3UjiTn0VGI3AeJs3sZlbxE
         07E1WXXN/Aol/mKKmZt2Z5m+MlGVObs7frU3MR5g34UIbBizu9aJhOX3MK6K9cJod51Z
         Aj3gT2DII4tOykOWPnAsrSbha/zKcf11IwhkzQC/hOllZ+++LFCK1VtkORtIIGDC5A2g
         Pbq1qmcbjbuM8R+/SkTPEojI3Ifyybobzhe2xZ9YdPgH+/O/fAqGxlT5/IXdTOlfDW5D
         750Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712588499; x=1713193299;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PRN1sELqu0ogiTDUrC+ULOZosF4sbROYULaypNrLxRE=;
        b=nwZVZiwS46fCNMnKsXfBIxv82+s9QNIILxmoJa3GmxAYPrk+YN9UPC/gfU0z2x0qVu
         iuQVrs/N3Sz8FokPazBE5HyhWSk/bg8/ibwYgNuS3K5SKNRhD8XpE+S7+lk6bwOllcRN
         iM0QY63BwPBrPC4xn+LI3lRDVeVIWj0PZbusZa4m0RuYpaWryqoU822vnb86odvyl3Zf
         psv97vhp0iViNALD7OUf1rlK+h5qj7PFSWnwHHf3l/30txp8fcZ12d0r6ttG+VW/inwm
         kdUZN5KBCOAIR//XaUWmdtSWXj7HS1NO6Ys0OdGTGY3kd0mmKZLxF8Dm27nlBHSyWpGt
         VzOA==
X-Forwarded-Encrypted: i=1; AJvYcCWt+CPTGPK1lP+oRu5hXAUq4BGKhu3zZ22G45r+yAhc2ZVSjo07PguKZT0F1hJKnveJKE88HIFcBVotEVUxxf3D+5GpTMp5vnMko8A=
X-Gm-Message-State: AOJu0YzUU7RpIwwSEPA0z3tlKjc2LQ93rdHzYLKvlkgcgfkU/ZX7A3gc
	HNIOw1XEKZJ/2DeXFDQuoobfXLa2xl4n59WIlVRqsU2oFQpxozve
X-Google-Smtp-Source: AGHT+IFwYnWXgAf/PUSsxKAWo8N9fb0i5uBvSP+a6/cyOg6oSHtufOrwyScmxnUsaq5JkB2TN3vnaQ==
X-Received: by 2002:a17:906:4550:b0:a51:c52d:e530 with SMTP id s16-20020a170906455000b00a51c52de530mr3121905ejq.34.1712588481286;
        Mon, 08 Apr 2024 08:01:21 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id dr20-20020a170907721400b00a518c69c4e3sm4513886ejc.23.2024.04.08.08.01.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 08:01:20 -0700 (PDT)
Content-Type: multipart/signed;
 boundary=294776b9314327320f85989c6005bd27d0d25a1d1c78b1c49faf1f06c12f;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Mon, 08 Apr 2024 17:01:20 +0200
Message-Id: <D0ETY6KYVYO6.1L2QGS0QIE77O@gmail.com>
Subject: Re: [PATCH] gpu: host1x: Do not setup DMA for virtual devices
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Jon Hunter" <jonathanh@nvidia.com>
Cc: "Jason Gunthorpe" <jgg@nvidia.com>, <dri-devel@lists.freedesktop.org>,
 <linux-tegra@vger.kernel.org>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240314154943.2487549-1-thierry.reding@gmail.com>
 <4ffa428a-e6cf-4716-ad7b-02c126d66772@nvidia.com>
 <73a71381-7c8c-4d0f-9fa4-3d9511c9bfbe@nvidia.com>
In-Reply-To: <73a71381-7c8c-4d0f-9fa4-3d9511c9bfbe@nvidia.com>

--294776b9314327320f85989c6005bd27d0d25a1d1c78b1c49faf1f06c12f
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Apr 3, 2024 at 12:07 PM CEST, Jon Hunter wrote:
> Hi Thierry,
>
> On 15/03/2024 11:25, Jon Hunter wrote:
> >=20
> > On 14/03/2024 15:49, Thierry Reding wrote:
> >> From: Thierry Reding <treding@nvidia.com>
> >>
> >> The host1x devices are virtual compound devices and do not perform DMA
> >> accesses themselves, so they do not need to be set up for DMA.
> >>
> >> Ideally we would also not need to set up DMA masks for the virtual
> >> devices, but we currently still need those for legacy support on old
> >> hardware.
> >>
> >> Signed-off-by: Thierry Reding <treding@nvidia.com>
> >> ---
> >> =C2=A0 drivers/gpu/host1x/bus.c | 8 --------
> >> =C2=A0 1 file changed, 8 deletions(-)
> >>
> >> diff --git a/drivers/gpu/host1x/bus.c b/drivers/gpu/host1x/bus.c
> >> index 783975d1384f..7c52757a89db 100644
> >> --- a/drivers/gpu/host1x/bus.c
> >> +++ b/drivers/gpu/host1x/bus.c
> >> @@ -351,11 +351,6 @@ static int host1x_device_uevent(const struct=20
> >> device *dev,
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> >> =C2=A0 }
> >> -static int host1x_dma_configure(struct device *dev)
> >> -{
> >> -=C2=A0=C2=A0=C2=A0 return of_dma_configure(dev, dev->of_node, true);
> >> -}
> >> -
> >> =C2=A0 static const struct dev_pm_ops host1x_device_pm_ops =3D {
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .suspend =3D pm_generic_suspend,
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .resume =3D pm_generic_resume,
> >> @@ -369,7 +364,6 @@ const struct bus_type host1x_bus_type =3D {
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .name =3D "host1x",
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .match =3D host1x_device_match,
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .uevent =3D host1x_device_uevent,
> >> -=C2=A0=C2=A0=C2=A0 .dma_configure =3D host1x_dma_configure,
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .pm =3D &host1x_device_pm_ops,
> >> =C2=A0 };
> >> @@ -458,8 +452,6 @@ static int host1x_device_add(struct host1x *host1x=
,
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device->dev.bus =3D &host1x_bus_type;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device->dev.parent =3D host1x->dev;
> >> -=C2=A0=C2=A0=C2=A0 of_dma_configure(&device->dev, host1x->dev->of_nod=
e, true);
> >> -
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 device->dev.dma_parms =3D &device->dma_=
parms;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dma_set_max_seg_size(&device->dev, UINT=
_MAX);
> >=20
> >=20
> > Tested-by: Jon Hunter <jonathanh@nvidia.com>
> > Acked-by: Jon Hunter <jonathanh@nvidia.com>
>
>
> I don't see this in -next yet?
>
> Ideally, if we don't see any issues with this we should pull this into=20
> v6.8.y stable branch because I am now seeing the warning there. Should=20
> we apply a fixes tag to this?

I was finally able to run some finally tests on this and pushed it to
drm-misc-fixes, so it should go into linux-next and then Linus' tree
sometime soon.

I decided against adding a Fixes tag because it's difficult to backport
this all the way to the release which contains the commit that added
the issue. Adding a Fixes tag to the commit that ended up exposing the
issue didn't seem right either, so let's get this into mainline first
and then manually ask stable maintainers to pick this up.

Thierry

--294776b9314327320f85989c6005bd27d0d25a1d1c78b1c49faf1f06c12f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmYUBsAACgkQ3SOs138+
s6EmGQ//bjoMCxMd0pYChsgWJe8dvuK0jJFOJPxd7omZmt+XvFXkgFUgylUy9ZF7
S9kIppfWCKHNeKSS915ZRHYwiQh6H+8DuG7ow9DDfBa2Zrkx3AQxTPz4Q5qOaaw0
htNwKzKRWlEb2hvRhRDg2mbQVkKT/mTys64pGNieTXSsiGmN2SB9JpwAFDlKvc3i
38GShsmFLC1whXD40bOb5GAILWh9ZoJyUqDPOFwJ4vQHY4AhFkHJF9PijMNHbxIX
SExSbiuVIzvdLrIjIm3QDTn1bz+wMScGxBbYrTdEqelu3SwYJsxO3ZrxU1SkXWwD
7gg8UWuzWhn8bFyaP6WwpIkSmX/0EmWPyGspAzGZej2eJn+ifgaNKS4ENxH/Hb6l
Ta5X6KSiGjBeEzpsgAvKELat2NVrz00srK2WCGlVa86SWh4pUUVGSpjQMugDWfLT
UXwxxCySDHex8CQR3gjgAEN1CPnJyrT5UpSqIt3nTWQzLJNcPvzHdrAqxB2iZR1M
1K1DA6/FTr9L9yNTIW35L5jS9DKv0/WIZKpoONjHmWwsYxcFuADF2JxK2FpbKBKs
NLVFPn1KbppY4DNYDai/OCuJyOGb2tLvYDds2OdrkJiOGI4UddCkvZ4Hgg4xr7yk
XNrgILTMkyYT4NiSs8tKPp524RssiCLqzZb7acaO8a5FNk6qixk=
=Msdd
-----END PGP SIGNATURE-----

--294776b9314327320f85989c6005bd27d0d25a1d1c78b1c49faf1f06c12f--
