Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE2F24291F;
	Fri, 14 Feb 2025 09:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739526247; cv=none; b=FNZEKDXrtJml8xQFLqaYXG193Ravv7S/W94vesIaInGaJwQVMHcZIToif6Rd2EreAt8g/YN0lIYWftE3yeyv5wCz8VU8dHcSbx5MCgfoEghubtBm1pbshUTsDocL5KEGd1mzhd8t07pA9TPM7fTEQpi1kM1H2vfXFgE0Ov/u86U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739526247; c=relaxed/simple;
	bh=euxH5xTB3npndNEOhGf9KR+p/1GlHm5dq8S6R5vtFvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sz/EC3fnPRtTCTZqo5LDh3yqwLqR5b49uxwhG/15Cotg+TrmuQ9yrqu0fraoQZ+6o/1+C1UDLKNDYmtK72L2cMBH55iGzezcLr9AJX9kZYY7OoY9c9qYae9TUZI5S6lP+R7JYqS1zcrkgQmBTfd8ioXota8ARr5M+I8Mtbwg1qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QKgThIZQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QKgThIZQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C057C4CED1;
	Fri, 14 Feb 2025 09:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739526247;
	bh=euxH5xTB3npndNEOhGf9KR+p/1GlHm5dq8S6R5vtFvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QKgThIZQsDXvHi250nXVACftNulY+hDA56lG4gV0mWDqpQmEI/IeByxEkZ30VumCF
	 L+r2W1g/8OTElc/khx4mIaSFrKtauo7k7wzOS5jT9SBbtUlYjgOkI86coP9+s3NYwT
	 y3Pkf0q3FPGmXw9gDN2jBCwdfFjlwHIM6NMKxRNfAHvOj6MfdWa4J64sZrCZ+2mWp8
	 rvLAPOGA4lz6JczHmcz0aTOHczOZk73pBCHAN90DCEiXiuHnMIe8lrWw5JBzcFdPvS
	 NBKHdwztH01NncybK/yA9xE55/oALEeW+VtQObpTVt07tlkncpFvbP/wa1DsJj+6au
	 giWDWVolgoUpA==
Date: Fri, 14 Feb 2025 10:44:04 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Joel Stanley <joel@jms.id.au>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Stefan Agner <stefan@agner.ch>, 
	Alison Wang <alison.wang@nxp.com>, Xinliang Liu <xinliang.liu@linaro.org>, 
	Tian Tao <tiantao6@hisilicon.com>, Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>, 
	John Stultz <jstultz@google.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Marek Vasut <marex@denx.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Raphael Gallais-Pou <rgallaispou@gmail.com>, Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Philippe Cornu <philippe.cornu@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Alexey Brodkin <abrodkin@synopsys.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Jonathan Corbet <corbet@lwn.net>, linux-aspeed@lists.ozlabs.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-tegra@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 11/12] drm/vc4: move to devm_platform_ioremap_resource()
 usage
Message-ID: <20250214-quixotic-fossa-of-art-b8bb9f@houat>
References: <20250205-mem-cocci-newapi-v1-0-aebf2b0e2300@redhat.com>
 <20250205-mem-cocci-newapi-v1-11-aebf2b0e2300@redhat.com>
 <20250206-hallowed-ultra-tiger-cfec8e@houat>
 <CAN9Xe3SpTG7r2UkN7_pH0uMXhU5u+dkWhaM9+w5VyOQZp9byNg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="tmymxs4x7znmvcxa"
Content-Disposition: inline
In-Reply-To: <CAN9Xe3SpTG7r2UkN7_pH0uMXhU5u+dkWhaM9+w5VyOQZp9byNg@mail.gmail.com>


--tmymxs4x7znmvcxa
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 11/12] drm/vc4: move to devm_platform_ioremap_resource()
 usage
MIME-Version: 1.0

On Tue, Feb 11, 2025 at 12:08:57PM -0500, Anusha Srivatsa wrote:
> On Thu, Feb 6, 2025 at 11:13=E2=80=AFAM Maxime Ripard <mripard@kernel.org=
> wrote:
>=20
> > On Wed, Feb 05, 2025 at 03:08:07PM -0500, Anusha Srivatsa wrote:
> > > Replace platform_get_resource_byname + devm_ioremap_resource
> > > with just devm_platform_ioremap_resource()
> > >
> > > Used Coccinelle to do this change. SmPl patch:
> > > //rule s/(devm_)platform_get_resource_byname +
> > > //(devm_)ioremap/devm_platform_ioremap_resource.
> > > @rule_3@
> > > identifier res;
> > > expression ioremap;
> > > identifier pdev;
> > > constant mem;
> > > expression name;
> > > @@
> > > -struct resource *res;
> > > <+...
> > > -res =3D platform_get_resource_byname(pdev,mem,name);
> > > <...
> > > -if (!res) {
> > > -...
> > > -}
> > > ...>
> > > -ioremap =3D devm_ioremap(...);
> > > +ioremap =3D devm_platform_ioremap_resource_byname(pdev,name);
> > > ...+>
> > >
> > > v2: Change the SmPl patch to work on multiple occurences of
> > > the pattern. This also fixes the compilation error.
> > >
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > Cc: Ma=C3=ADra Canal <mcanal@igalia.com>
> > > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> > > ---
> > >  drivers/gpu/drm/vc4/vc4_hdmi.c | 55
> > +++++++++++-------------------------------
> > >  1 file changed, 14 insertions(+), 41 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > index
> > 47d9ada98430634cfd8c1e21c2a4d00d501bab7e..066f1246dab420ee889845b0c573d=
80ce7c88595
> > 100644
> > > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > @@ -2951,71 +2951,44 @@ static int vc5_hdmi_init_resources(struct
> > drm_device *drm,
> > >  {
> > >       struct platform_device *pdev =3D vc4_hdmi->pdev;
> > >       struct device *dev =3D &pdev->dev;
> > > -     struct resource *res;
> > >       int ret;
> > >
> > > -     res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "hdm=
i");
> > > -     if (!res)
> > > -             return -ENODEV;
> > > -
> > > -     vc4_hdmi->hdmicore_regs =3D devm_ioremap(dev, res->start,
> > > -                                            resource_size(res));
> > > +     vc4_hdmi->hdmicore_regs =3D
> > devm_platform_ioremap_resource_byname(pdev,
> > > +
> >  "hdmi");
> > >       if (!vc4_hdmi->hdmicore_regs)
> > >               return -ENOMEM;
> > >
> > > -     res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "hd"=
);
> > > -     if (!res)
> > > -             return -ENODEV;
> > > -
> > > -     vc4_hdmi->hd_regs =3D devm_ioremap(dev, res->start,
> > resource_size(res));
> > > +     vc4_hdmi->hd_regs =3D devm_platform_ioremap_resource_byname(pde=
v,
> > "hd");
> > >       if (!vc4_hdmi->hd_regs)
> > >               return -ENOMEM;
> >
> > I *think* that one is shared between both HDMI controllers on the
> > RaspberryPi4, so we can't claim them from both instances. We should add
> > a comment there to document that it's on purpose.
>
> How about vc4_hdmi->hdmicore_regs? It also has another instance
> vc4_hdmi_init_resources(). Looks like that also doesnt need any converting
> and shold be left as is.

No, each controller will have its own set of registers there, so it can
be converted.

Maxime

--tmymxs4x7znmvcxa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ68QXwAKCRAnX84Zoj2+
dnJFAX44qxSqH4/9r1lPWe6YsBKR9clH1sZQRZaWBdRICp0iE+/MJiNA/tJghQgy
Xb2262kBgMGvJFpuBmHvz9HJegWf00i39I2+ctkME/qrOcHQhoIwF07ezVrQyZOZ
z9Q+kadHOg==
=d/Gf
-----END PGP SIGNATURE-----

--tmymxs4x7znmvcxa--
