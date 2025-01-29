Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E800E1DF746;
	Wed, 29 Jan 2025 16:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738168213; cv=none; b=A3+xybkOQzceSpSWd4KfmFE/rLw+j0XHj44/pa19TvxdDlX4IO1P6oUy1OR6LmJAgrQv9GNMjQRfgN9moVl1yby7LPhajEBBwW2C3TiIZfVxLNKBbMdZLaOdHYItke5ZPiVcjHs2jIrFJ+uR/WQYBJzKFZQjgFKYAus83QWmXvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738168213; c=relaxed/simple;
	bh=kncPR1x+HrgO/UNoa6XCUy62lvyXubVaayCMa0/G3/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rZxZ9t0RDISecuUuNzRgI0tU/dp2ULsGwtn4csynCYCHn/VMQy2Drurh5bHHXWC+5BIRMZlOgP5KuEF59kbLfsNLNbnL4cRx/z5y24KXNHgflcS4Ed3ZuBwZtnT8oh8MDt/BAZoN7GYY2K+iOQhK3gAFVhOhobq8hOmFV9wWB/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cbr1Bwbf; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cbr1Bwbf"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so3890320f8f.0;
        Wed, 29 Jan 2025 08:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738168210; x=1738773010; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kncPR1x+HrgO/UNoa6XCUy62lvyXubVaayCMa0/G3/c=;
        b=cbr1BwbfmTTmz02qPhlFGLngzIbtojfSkJvJnt8FYIkikOJAhAbEWRstCJZ/gzhtrY
         52pYRrYGhiHwI+9dxc0qMA4exda3FdPB9Vrt2tzPAlHovtPftIzswRensQVmqRFVCoeU
         jksiAQ38axmm9IcD/eUpBGKNOp7fgg8ok3P6P03CfcGaFv6DxtRJdXd16RdhaOvWsHqz
         XFLx0rVKXWIL6ks6aw4cZfOcqwp5zC+JBpmAyWzRuwcCr3M5P1cp9Vs7HFKhmZzJQBCz
         LzSb/n2kiXiNxZlnbCbKGrHQS1GcsoQtVDk83FVfLA8O80eB+gbhVP3P3MU019rDVX+o
         0wFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738168210; x=1738773010;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kncPR1x+HrgO/UNoa6XCUy62lvyXubVaayCMa0/G3/c=;
        b=MdCOhSd+Bi9t5FXg7tkNZ+eJ1TNt4SqNgoJQt/4C17QBBOB8HIAA/EgC03THwZM5DL
         zFDCnmZw/uHLc9Ez0cuJQJT7CGkhZ29xeRgS35L41FMgSUfNpjEENkzrY/aIxxgVgo5b
         CgHQTN0kEM6YGVOMfH2xJaTxW+WpqVCTR7pfDonDyKlVLVCI8nZtQDlJ3J89JciyTbea
         JRkHkm+Riw1g0RPr+31EEvb30Sf9xXPRD9gm3RwQXL0KGGhVW8B9iHQXYCzMC3Ls+MPw
         ZEBPlZkoKJd9zaOtpOz0OLuU/3Pa7qd0nnQKGZuLq5aWx/zPkmo5rjWM0fDpab/qfkrj
         ZT9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUUycX9ius6iD0mylBsgdgCo4dvUkbhgufN90dtMBNkS3CEHKi8WROVrV9p8maYedGLWEHpMn1ZcgY=@vger.kernel.org, AJvYcCWW+wsrXdIiv9NTXORkiTI1sXt+DfKWEf+yIpJSZ6D8YvgvEsfzMqTmqw0rZnLm90hL11SbR7DkTINAgBrR@vger.kernel.org, AJvYcCXWtlC9DXduaXOgyGGOmKiRDeoESXBtUAJ9SwUK/tB6mIRrbgmKZf74/wENWzpC1GJ4HdTLX0vmiy6yz1E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVKJBvKY/T7W/HB1ackLGhpq5rSy4w5D8qQlIzAc+jTbn0COAJ
	/roPSsC7ipDBo5o8SdCBYGla09gQfeakGxg/bKJ50Y+MWmtIb9v7
X-Gm-Gg: ASbGncvFHdoLWgztaJtVSzXrHm70lS9WM9bekQFYwJSKJMFuCTKvhtE9Ett/2ziytHU
	tivnuooke/sLXHmTwwEFahoWijrzidku5q7pKmNEEe1rjhHJ7Nm4iBLSy3Wlc4VXLhQR7WDZWWM
	iU3rKm+iGYwJBy4IFRLicBJbQX2E/V9QNzfAuabXQq/TATXPhWvsVQV0HlmYNzf9QASVAZ/QM5t
	34gndC6AterquwOCrrwVE9kx6Fprk4DKA4SmzwfIKwoWCyRCl+uDpWcAd/u+mbsPDn+vPYodEYj
	yioYtKUf3LCgtfHs7s8vL0I2xy/a8jIBFSx26qcBoN693q3zyREebBbiC28P9s7Xr96w/1djCx5
	9Og==
X-Google-Smtp-Source: AGHT+IFm5Jm3zy7mcGZVwWe1YgDmOIk+BMdUjzsviFL4g+X0VoNE5WMhP+abocamyyaYUsUSJGXvKA==
X-Received: by 2002:a05:6000:2ce:b0:38a:8e2e:9fcc with SMTP id ffacd0b85a97d-38c520b7692mr3030462f8f.45.1738168209834;
        Wed, 29 Jan 2025 08:30:09 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1bb0besm17773109f8f.79.2025.01.29.08.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 08:30:08 -0800 (PST)
Date: Wed, 29 Jan 2025 17:30:05 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, 
	Anusha Srivatsa <asrivats@redhat.com>, Joel Stanley <joel@jms.id.au>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
	Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>, 
	Xinwei Kong <kong.kongxinwei@hisilicon.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Marek Vasut <marex@denx.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Raphael Gallais-Pou <rgallaispou@gmail.com>, Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Philippe Cornu <philippe.cornu@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Alexey Brodkin <abrodkin@synopsys.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Jonathan Corbet <corbet@lwn.net>, linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 14/14] Documentation: Update the todo
Message-ID: <54mqpk7elbn3y4o4w5skiwbx6kpkpbsg45l7tfzuphf6rzziej@laywqtj7tfpw>
References: <20250128-cocci-memory-api-v1-0-0d1609a29587@redhat.com>
 <20250128-cocci-memory-api-v1-14-0d1609a29587@redhat.com>
 <a389f799-442e-45f3-8609-2eb2f0b7a825@suse.de>
 <li2awsqmdoye3u7n3gi2mrhbfxs77e3edjmsg5zclnyjinsnul@2bjkc5agyu5u>
 <2y3lwycrggmktamu3j3gj65uco7quvtu7tlc3724e4mpokhjz2@icedc3kervme>
 <4jn3dfea3eb5yuqobjwvbzfxhwatpvvhtpxbmt6npyrypkyruw@mgtmxignyvt5>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vlfdakvgoj7a5bm2"
Content-Disposition: inline
In-Reply-To: <4jn3dfea3eb5yuqobjwvbzfxhwatpvvhtpxbmt6npyrypkyruw@mgtmxignyvt5>


--vlfdakvgoj7a5bm2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 14/14] Documentation: Update the todo
MIME-Version: 1.0

On Wed, Jan 29, 2025 at 04:28:49PM +0100, Maxime Ripard wrote:
> On Wed, Jan 29, 2025 at 03:41:32PM +0100, Thierry Reding wrote:
> > On Wed, Jan 29, 2025 at 03:31:50PM +0100, Maxime Ripard wrote:
> > > Hi Thomas,
> > >=20
> > > On Wed, Jan 29, 2025 at 02:06:15PM +0100, Thomas Zimmermann wrote:
> > > > Am 28.01.25 um 23:29 schrieb Anusha Srivatsa:
> > > > > Remove the TODO now that this series addresses
> > > > > the changes needed.
> > > >=20
> > > > While your series is fine, this TODO item is unrelated. It's about =
various
> > > > ancient fbdev drivers that do not reserve their memory regions corr=
ectly. So
> > > > please drop patch 14 form the series.
> > >=20
> > > Is it? Could we rephrase the entry then? I'm the one that suggested
> > > Anusha to work on this, and it's still not clear to me what it means
> > > exactly if it's not what she worked on :)
> >=20
> > The text in the TODO sounds pretty clear to me.
>=20
> The title is "Request memory regions in all drivers", and the first
> sentence is "Go through all drivers and add code to request the memory
> regions that the driver uses". It's definitely ambiguous if only fbdev
> drivers should be considered, even more so in the DRM documentation.
>=20
> > It says that not all drivers request the memory that they are going to
> > use, and suggests to add those missing calls.
>=20
> Right.
>=20
> > But all of the drivers in this series already do that
>=20
> Nope.
>=20
> > and the only change here is to convert them to use some of the newer
> > helpers.
>=20
> For some, yes. For others, it actually adds request_mem_region.

Ah... indeed. Well, on the face of it this looks like just another mass-
conversion to the devm_platform_ioremap_resource() helper, so that's
also confusing.

Maybe the right way to do this would be to split this into two series,
one that actually does what the TODO suggests (and maybe updates the
TODO to make it more obvious that after this only fbdev drivers are
left) and another series that does the helper conversion.

Thierry

--vlfdakvgoj7a5bm2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmeaV4kACgkQ3SOs138+
s6Fc5g//QZiZGAOOwS/HvsPWCl3EAnXTtEOaH4XXTZswARVZDGZdl3jYwiZim7x3
Odn69X6NAQl5pFytjbexpzii+zH/UQZVz5kndydjXtK/JWz5VeXlKUrxYKMU+GEM
+9dEecjXOqKAtLPF/QyA387/Xp6qIIsQDHM5/akoAifYOd3TbuCl4AqBU/LYuGt6
F86Eaa7n8kChb6BpZ3Km6NfzkhJhTIw9/VZXxp21Y9izQUZuHAVvyt3e2hLr9L9W
S0XFv1mPAYUcBAao+vvEF3kJvrnVXjXDZnjVPpiKuJe4e0l2aDMNW9TEr7are4m5
8JlrAMkbGTKEKzTQlHIgKuFJYcmTyvqs4KBrxmX1bEqm2gsRqnNXl/7yvbY+s/s5
QSM9otV5y60e0IZkmuJjoEklKJ8SmyPgbrnb04ua2KQXrRvnDO+BQSWerziVyz84
6RNfGTuacRhr5C2KlI7MdELGzweRPD6TA8Qa3k71gpCXKg9063+1aRanPLWbpwue
vIBmrFZZcJRMxftEjPMRJj7IcBvIZY12Zij2eu7fWDaeXujcre4Apg3rClGnYxOq
RT0DHxbnFi9msAWdCAFZTUiyzyFZ0Vq/op7JUugsAq/nYKK9lXSyOdVvLd1Ojgm5
CBtQAEdJXMKCwmB5yb7bRv2ag/y/oiQtUsnkgViwm1FTPUFD+gY=
=XiY9
-----END PGP SIGNATURE-----

--vlfdakvgoj7a5bm2--
