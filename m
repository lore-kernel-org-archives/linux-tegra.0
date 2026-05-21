Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F851C3BFC
	for <linux-tegra@vger.kernel.org>; Thu, 21 May 2026 07:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779349753; cv=none; b=VoNaLhExmbLduxsxzRRAMKJyPm+F/+0xaN5gNCpnQ3nbuX98Plo/N2YFMM/dJD+bmUk7hafLk0sXj7Qk8D834cl+S8iOSl8+HyfRvGKRCt89xXadPygMtn2/9n8aZSN+DzQ9nDIOZrWuSENTFENqmqtQI1SFaE4OCZPOt0BBTHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779349753; c=relaxed/simple;
	bh=X366XXLSWBNCMQ7N0PGCxpR2YyNrESJLb/8hpXnu9NY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gs6/7ZrSwwKDiM21WVab2dZLFQNJHNOqJismvfKXGOd+DAaVweYHFQFmW+KQbpbM8Mf5NbRabToOa/LZArAemZTNrtVNi0O3H5gwGQ97RcNHal6O96uK2TAR9YmdrbQRo95NnOMKY6eIjIIK/xvUZ+jMmUiAP0DrOutrY5H1aAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZlZ4JpYW; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZlZ4JpYW"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45ea19f412aso424907f8f.3
        for <linux-tegra@vger.kernel.org>; Thu, 21 May 2026 00:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779349750; x=1779954550; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W9uXLdWoyaGYgzYiXOH/k+DdtxYySRzXASnD9TwfwLY=;
        b=ZlZ4JpYWrUNMdgyP+r5YT7A54PqnJpSMPHxPQLsIUJ9xQLg2aQmdPb50I3yV/bJ0PV
         lDLuStBL8I4XY/S7MvG7TQZv0bvEJkmj6cPo8Y7inAlh03+9WuIrjbHe5VEz/OduTTxy
         8ejJ78cXzVzsMGfp95fiEWeCeH+uaE6ywLOa79C5PLK/0fQeiwRC9r3/h93mPxhFX27V
         zQ4AGQ/OgzHkxNZM+cdtsZDjCGnzM2B8HpMDTu7RJP3CTyz3ZCPjvLXtIqMHOpkAKUF/
         fXrMAZrre8gUVw2uzjTaRv99h14R5PRH+ToWwibN430WE0LUv9MbWRyMSqOfkJSrkkWs
         LmkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779349750; x=1779954550;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W9uXLdWoyaGYgzYiXOH/k+DdtxYySRzXASnD9TwfwLY=;
        b=oauZY04Y4jJUtBiB1tvlr4PJra+dCDHhGVAHbCpzQ9oDv8KWLtuWyBnhJNe2FggXar
         mYsnGr/wUV4fXs8aWaBNXq82JsDUqEXAwiM51Oll3F06iq6x2wxw8wDo0ZKTL0QBIMWY
         jq85q2fAtfUBADRgHEBtGDpwmMQk62BDDixDftXnDLLvQZvxzeyYGxC1qOi8wBkW+DQo
         ws6CHXEM4PMinX+V+M0qv/JodZVgra9w4YQy5QZa8VBmcvzJgOC88Et5WMjJ516n4hpl
         iYetuwvhwhFCzPR67LkLYAj6orSc9WEyw+n/bXGxEhLbVsRdk1CrutbeB0teSF8gUYeJ
         PjAQ==
X-Forwarded-Encrypted: i=1; AFNElJ+6aaBIlD/Si7e0NLhkZBEBLJL08MXWdgWkr9WCpfJh7ZlkLMCvCv2XQP5QTVQRuUyKPfaqz66cp6Ybcg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8wEC7MjiifGDPO2YNQU6ZbW250FUt/C+bwtf9+83hv/H0unSB
	WVlExpr+46FMsA/3/26a4O7P6jO7cJDHuCM/x8xlOMMtw3Locc2+058t
X-Gm-Gg: Acq92OGqS+KeAvszVuv+QAfOcWDGZ0TiLunyAvwiJXaKzrHZu0jGe4flIsKUM4oYlfD
	m9WNSpSx0cu/Y8lu4k7V92GPY8/gfjX2y4aUtX8LWScduKMfwjqeqfPkAe8ruddpufNHRHx3W5d
	Iw/SGivmx9QACt+oRPZtGOdeHdPiMp3KKW1obtrJKkLIEcUl8yGqiY66aeVXD9seIG73yFfQj+7
	R3BeiKJcrbJRYQF3dTftFc7zS+tamU15LGK8TOVStTVSvf9UVQ/+GEwz/nDAA+HMYPvCKhxq3Ff
	tCQ1FDe4+GVuUA0X5T/zgqzCxUmNQ2T4Y/k68VfqfVBRIfbEJBEYOlz6Wz2NR1HWiphAcwCxOW6
	LitQqx0L53TWs7ptYNnLY5QRz8kFi/x1Zt6RzA+4menZommZalprgOILvb0ZU1Ph8KIEfLouwCh
	+BzpuGULbKdHpQNFy8a98us98k2WJ9yQhfGa1Qzk3rYNkLGzudB89GYN7MD4+hZ/RmCKif7T49n
	yXvpmOzPY34hQ==
X-Received: by 2002:a05:6000:2085:b0:45e:9115:2982 with SMTP id ffacd0b85a97d-45ea41406c7mr2549681f8f.34.1779349750011;
        Thu, 21 May 2026 00:49:10 -0700 (PDT)
Received: from orome (p200300e41f291e00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:1e00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa7da46esm807878f8f.14.2026.05.21.00.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 00:49:08 -0700 (PDT)
Date: Thu, 21 May 2026 09:49:06 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: tegra: Add iommu and dma properties for
 Tegra194 QSPI
Message-ID: <ag64LbbFmu1c0U7W@orome>
References: <20260515-tegra194-qspi-iommu-v1-0-57dfb63cd3d6@gmail.com>
 <20260515-tegra194-qspi-iommu-v1-3-57dfb63cd3d6@gmail.com>
 <ag2fjPWwKJmrdYMl@orome>
 <CALHNRZ9+X-QMmse-+KOAgt4psobecQvizqXMPufx-BnEd2wujA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hpwpf7a3d2mkznnc"
Content-Disposition: inline
In-Reply-To: <CALHNRZ9+X-QMmse-+KOAgt4psobecQvizqXMPufx-BnEd2wujA@mail.gmail.com>


--hpwpf7a3d2mkznnc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/3] arm64: tegra: Add iommu and dma properties for
 Tegra194 QSPI
MIME-Version: 1.0

On Wed, May 20, 2026 at 12:29:49PM -0500, Aaron Kling wrote:
> On Wed, May 20, 2026 at 6:49=E2=80=AFAM Thierry Reding <thierry.reding@gm=
ail.com> wrote:
> >
> > On Fri, May 15, 2026 at 03:35:29PM -0500, Aaron Kling via B4 Relay wrot=
e:
> > > From: Aaron Kling <webgeek1234@gmail.com>
> > >
> > > Without iommu and dma enabled, flash storage such as the spi-nor on t=
he
> > > p3668 module times out and cannot complete any transfers.
> > >
> > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > ---
> > >  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/bo=
ot/dts/nvidia/tegra194.dtsi
> > > index 1d659454a6f9fe..0e0a20befe9e68 100644
> > > --- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> > > +++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
> > > @@ -923,6 +923,10 @@ spi@3270000 {
> > >                                <&bpmp TEGRA194_CLK_QSPI0_PM>;
> > >                       clock-names =3D "qspi", "qspi_out";
> > >                       resets =3D <&bpmp TEGRA194_RESET_QSPI0>;
> > > +                     iommus =3D <&smmu TEGRA194_SID_GPCDMA_0>;
> > > +                     dma-coherent;
> > > +                     dmas =3D <&gpcdma 5>, <&gpcdma 5>;
> > > +                     dma-names =3D "rx", "tx";
> >
> > dmas and dma-names are the only properties that you should need here.
>=20
> This is where I started and it didn't work. Without the iommu
> properties, I get endless mmu faults upon accessing the qspi flash
> device:
>=20
> [   62.313833] tegra-mc 2c00000.memory-controller: axisw: secure write
> @0x00000003ffffff00: VPR violation ((null))
> [   62.324542] arm-smmu 12000000.iommu: Unhandled context fault:
> fsr=3D0x402, iova=3D0xcd21d000, fsynr=3D0x80012, cbfrsynra=3D0x820, cb=3D1
>=20
> I know downstream kernels aren't always (normally...) the arbiter of
> sanity, but I did pull these from the Nvidia downstream 5.10 kernel,
> which is where Nvidia was starting to try to align with mainline
> paradigms. All of these properties are set there.
>=20
> If the qspi node isn't supposed to set iommu directly, then there's a
> larger problem here that I don't even know where to begin to look
> into. All I can say is that dma fails with faults if they are not set
> and works when they are.

I think this is a problem similar to what we experienced with I2C a
little while ago, which we fixed like so:

    cdbf26251d3b ("i2c: tegra: Allocate DMA memory for DMA engine")

There's another patch currently under review that tries to simplify this
further using new support from the dmaengine subsystem:

    https://patchwork.ozlabs.org/project/linux-tegra/patch/20260518114013.6=
2065-2-akhilrajeev@nvidia.com/

Doing something analogous for QSPI should fix this.

Thierry

--hpwpf7a3d2mkznnc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoOuPIACgkQ3SOs138+
s6Hk8BAAuxQoe+nC4y0mYp+OxZnjaWf78WRDmzX++ilZVX4FHr7XgI9z1apYhuEy
L33p3HhtXw3TVOhDVpivGhvS0n1Rgw+/Bb6KRWVoUOuDRhNEotm0G8B2LUmc15L+
JGdmbp7KEIKZ20PN0OGMFJWKwrvN14qKiuamzJJ4RvzvkXT+im631X2YSyagebGL
MUkvXhMNJQdYcZQzOoV7hSlXitkXPuAt9sW4KvKsGKlTo1ekoahT3mNeLLCdY8Yg
w65LMT/YX46R2klrNG4DsqDIkw8AuJ6lNuqq5Cmp8WNqFgR2kFacZORKkDeMtDFu
2YtoUe9TJhGv8tElo+zdsXqGWxKsdMIiKdJ2WuAwb/aXNSddy4s3u+ugyHo1uDHE
eu+a+6i6qTSzD+6mOQLjwNJ9GNNbBIaUK7/HCqSfUdC7Dkb+rhBsD1DfCgyyA7qB
Ow+RH3hT5/gBQmBhv+8hcScxeIBg6F2SurI4SToItgAz/Ged4d5QmlAaCwmQ66aZ
sgJu+fjO/RfoJZT0Ev71wnJJbKJba9s/eaXWrUj3CFRUTzLqLyLSuxnvOEHsxLit
5E/WMhfyLq2MOw4bRHagjS1hEbPo833Fxjt064334UGezEC+O9obqCxSAtVxPNz+
UesIJ+D9nKRIV7LSi16ouESnYT8yMwQKtPZcN/48KaH/1sqDLDQ=
=qPAR
-----END PGP SIGNATURE-----

--hpwpf7a3d2mkznnc--
