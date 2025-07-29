Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3502A1CF;
	Tue, 29 Jul 2025 12:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753791874; cv=none; b=GeoDRaObTzbQ5KbZoVhN6IT5mKHxWmMOxIEHIBwmY1a2qJObzKyscOxtvwBMQw8MPKzxex84M+NGb7pNMOTJfQIpPeXba1GaS4ZIlFK2sx8CdVghbCrWbE1SCMvHWOjnL8m/a/73OghA7F7GawmAutt3yFUyJa6fW/0pwXnD8rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753791874; c=relaxed/simple;
	bh=nASNEneDc2vUmkSpKiTTFWlA4LwOZopVuKeuvQmuZrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SCYFocTIMpBeBjm9XysKWqWiSd7Y/3FJfd/RN/wLbXChiFYm54fj2HsYUZNzLDLsK8SfO4wICz7Wke33FK94rGbDq3h+Vb3QewcL5xhg8NgnZdxuF0gEBIl5SzuAZMv9YzRWqrBY2FDCpmp6woit4c32+X/EsoQh0wf7IopS2SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oy9VzxSF; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oy9VzxSF"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3b790dbb112so393718f8f.3;
        Tue, 29 Jul 2025 05:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753791871; x=1754396671; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5oCMcTRmSVA0zf+uyjFHlTMcPakXnRfN5JlQ9Uq8wo0=;
        b=Oy9VzxSFofmPd80gV0W9F9MaG1cpWLmZ6hg7qxZrbH2lNI1zVdQNq9YV2fdpQ1wp/K
         piziN5DMEeEein8XfW8apn23HP4g8gMeGyD8g6mFbDG2vZQk59NF+uBSG9QXFhcOzM0A
         bIT5yMkjbxnOsCLe4h3Pzd6FI6yA1gwuIFhjPoiS9HmbwgY0pqFBgrUQI46clO1nBnCz
         55XoyIHyEa8LkyWCpRS8s2enSPdipxoxJS+/5U+88oNAXe9NJpB3uRp6L3+pQ7gqGlDr
         ODqpySBf7mV0F6rOY6M1n953elOXFrqZaJ9Um+YXQp7J2QDBJ4Uo7/51zgiRpoi6QUuD
         BWUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753791871; x=1754396671;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5oCMcTRmSVA0zf+uyjFHlTMcPakXnRfN5JlQ9Uq8wo0=;
        b=D9X8VGI6Tvzdie+df46nqSdyX148FmUM4adzg5FIY94VY1Mb0kclDoxthXS+neFokP
         IGV1LFJirx6lHv0Pid8uc/j0R9AdQdF34ayOEMlw7pXz/+0aDpJ4ZeiJB+0XCwfrHRAG
         wCBjmfZyoyIyOX+2pRMgFkhd7ToasT/2DJp3DYLhFBZqTuE7ZDuvdlXI/BQYPXwCaxcp
         TTtsRWY15zIrf+g8YnXVHHyUbpZe8AVBXfJMu27RMvkss5dDAgbyACCvA3YW3xtr/9Aq
         ugFFFEG+gGHBM9OYRvfVFl+ZSwbzl3Z0aKt0O+Gg3z2Y8r15BDFSa08wTT8gSUKUxK1U
         xrWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUK4kRztmPbTgCB1vUpGV9WpvbQAOMag478SVP/QbGeAaeK/L/8DovUgtq7FlboClkReXPnbjYWau5JN4o=@vger.kernel.org, AJvYcCV/xMz/A89vKtoAmuDKSbswCoJ0SNIVB5ObmfNfizM32rAWMkL8QLmaQaKt3JVfZBDTZYY2U3r9SBlxhHE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVEjVR/sSn5gA67jlTGvpMQRFmGfaN6WUxb1/JiD2Ynvp1c7eH
	h4GbYwWetmts0dBdZW1xw2nKBgEfsqDHysrxvm65V3Kd50stjuy7rkFv
X-Gm-Gg: ASbGncuX/hIuN1UNrPL8TjkOcw52bUceAzSs8P2SoxeETPofTQmp3JAUniDO6yhh10R
	ky8wX5nn9ILhOSUhnbq0h9w9aXlhoEGHUGXVeaWn5WL0M2rNh62iyj35+JitYgFZQIhz2J0Z0x1
	dOsHdHOU5gxETihpFPCD8SzFV4yResdHoJXPC27SrUZH182kpD2+WJGuDF+z7eT7g+keZKCEoX8
	/8lzufEtA0PVGgeoLAfECjJqZld0Vo+mplt+c29CmSsUalvKqzANLO50mBMDJGYZKP6e6WTc0OV
	XE6ec2o1z9FNZCgtWMIYMhYaNvI9av/xViYrAY7o+KT3FN/rYQK/WF+XCzY7MYcnjLwxbsr4swQ
	lWHe6OAc08+LzQkg8gYAaSozDQ0mRZOI5uE8oCDgQcQ0qDO+XAxKY3ClDDdqSL2/V4xE+P1C0rY
	AtAvSTD8nI
X-Google-Smtp-Source: AGHT+IHR50aIpq5zzNNibOCb1m449Ln3Ht/rLZE8jAjfCT7HhLynq8ThYUyqNNscWPQitSOsXie/hQ==
X-Received: by 2002:a05:6000:2c04:b0:3a6:d7ec:c701 with SMTP id ffacd0b85a97d-3b77664199emr10509916f8f.30.1753791870783;
        Tue, 29 Jul 2025 05:24:30 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b778eb27f8sm12254125f8f.16.2025.07.29.05.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 05:24:28 -0700 (PDT)
Date: Tue, 29 Jul 2025 14:24:27 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: tegra: bpmp: Use
 of_reserved_mem_region_to_resource() for "memory-region"
Message-ID: <yxxk4cffjm7rx2pbndibrp7a6txmi4urnrt5bipr24z7dlstk7@sybqp3gp6gqi>
References: <20250703183434.2073375-1-robh@kernel.org>
 <550bcad5-4de6-46fe-9f2d-f77ccbd582c6@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qxhhnnhnzy5x3ccd"
Content-Disposition: inline
In-Reply-To: <550bcad5-4de6-46fe-9f2d-f77ccbd582c6@nvidia.com>


--qxhhnnhnzy5x3ccd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] firmware: tegra: bpmp: Use
 of_reserved_mem_region_to_resource() for "memory-region"
MIME-Version: 1.0

On Mon, Jul 28, 2025 at 03:17:11PM +0100, Jon Hunter wrote:
> Hi Rob, Thierry,
>=20
> On 03/07/2025 19:34, Rob Herring (Arm) wrote:
> > Use the newly added of_reserved_mem_region_to_resource() function to
> > handle "memory-region" properties.
> >=20
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> >   drivers/firmware/tegra/bpmp-tegra186.c | 9 ++-------
> >   1 file changed, 2 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/firmware/tegra/bpmp-tegra186.c b/drivers/firmware/=
tegra/bpmp-tegra186.c
> > index 6f0d0511b486..7cfc5fdfa49d 100644
> > --- a/drivers/firmware/tegra/bpmp-tegra186.c
> > +++ b/drivers/firmware/tegra/bpmp-tegra186.c
> > @@ -6,7 +6,7 @@
> >   #include <linux/genalloc.h>
> >   #include <linux/io.h>
> >   #include <linux/mailbox_client.h>
> > -#include <linux/of_address.h>
> > +#include <linux/of_reserved_mem.h>
> >   #include <linux/platform_device.h>
> >   #include <soc/tegra/bpmp.h>
> > @@ -192,16 +192,11 @@ static void tegra186_bpmp_teardown_channels(struc=
t tegra_bpmp *bpmp)
> >   static int tegra186_bpmp_dram_init(struct tegra_bpmp *bpmp)
> >   {
> >   	struct tegra186_bpmp *priv =3D bpmp->priv;
> > -	struct device_node *np;
> >   	struct resource res;
> >   	size_t size;
> >   	int err;
> > -	np =3D of_parse_phandle(bpmp->dev->of_node, "memory-region", 0);
> > -	if (!np)
> > -		return -ENODEV;
> > -
> > -	err =3D of_address_to_resource(np, 0, &res);
> > +	err =3D of_reserved_mem_region_to_resource(bpmp->dev->of_node, 0, &re=
s);
> >   	if (err < 0) {
> >   		dev_warn(bpmp->dev, "failed to parse memory region: %d\n", err);
> >   		return err;
>=20
>=20
> This change is now causing the following warning to be observed on Tegra1=
94
> Jetson AGX Xavier platform ...
>=20
>  WARNING KERN tegra-bpmp bpmp: failed to parse memory region: -19
>=20
> Looking at the binding only one of 'memory-region' or 'shmem' is required
> and for Tegra194 we are using shmem. So I am not sure if it is worth maki=
ng
> this change for this driver.

I guess the change still makes sense for merging both calls into one but
we now need to check for -ENODEV and not warn about it for this to
remain really equivalent.

I can patch it up.

Thierry

--qxhhnnhnzy5x3ccd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmiIvXcACgkQ3SOs138+
s6HOjg//cTf5d2FIw8Xf/Z7sBWgu91puvfblYo2HDMeYcmy/CuO6qCDxOSTB4cSz
mHFAY6DBtfooqyOhcaD4fyHfeiLXoV9dSV1BT8GcmjNiozzNHy/suy2Y1rzeETs0
3F3M5ULkOpqvFISQ36rATTDPaTdTo/d/3yiCkLTkF4+9/PoFuko42assXPs68tvA
RXWaoqEIY88tXIJf1ts8eh4Bwq+Pbm+1kVhajyF92WkYnifzNFrrV+abLCITSvTU
RyW670mKbNUVlvolm8Uz3lEv/x4YM3jVds/HEHb5GfdDK/TcQrq2yOKahNJf9TWH
1F9qz1ybKxHAMgLqF45q/FvNXRyHvvtBx0strug76yB/qBd4p02VVA7VMAmwt1u8
+Z6lH0gMmMPBST5fPR3YRZBT+8Jg8j3mDbcnRn0hvxb8KOHlKGjtSH1+MS0viGnM
i58UJIAofuhYpM7h8lRL0mP0S6viwMBpJ6Re+5Lt0zGA5ziNyup9waX5gkty2neO
/Hvh9DcTZg9c9vKn54FXM0hnZjBFiGyQLHTNKaECYS15xDIYJgqdg/O7TEKuQcR1
6lc8Vsu/DufQYlBB3THiCVit/J4P/GnyeEjesEJc/pToAFDOIhwhy4jJ4obMSEA6
PpkXmX4J++enQiGvIkBQosBnT5AWOsE+DcsT4wwUNpviCNAdWv0=
=y6sp
-----END PGP SIGNATURE-----

--qxhhnnhnzy5x3ccd--
