Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E77149C69;
	Wed, 29 Jan 2025 14:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738161702; cv=none; b=T1Q+W4nwQ73jItgQ1RRSBiYRu+zFdLDBt2VC0zfNworQHoBvfZ4G1Mx24k7at2wK0Eqzag21NtA9GIiIB0T9Te/Uf6c8nbcUf4IEmc0CyK6zzfyxghio3UZhL3p2qYQVO3FuOdDo28mfR0I3CACNWf6g0SMCiD78U5KzYePtcf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738161702; c=relaxed/simple;
	bh=zSEV+em0N0SfQE1alVhrq6tX6ofwmLyBx4bRZxI20Mc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lHvQlFduG3qxcj+uzzBhf9vOCEapcWmN3RPFi87/lliyA1v8a/04FIxaX2a4OUHIEGby1r34e5fLYRZXcQ6u3Ry798yri7pd9+qwXD7ZKX/IFZjx5czao/vp9yJ6Cs8f3ekq4mmh2JNPkm7hdmwOjMcSL40W+L4SyCyR7O250Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WfM/6D5/; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WfM/6D5/"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-436341f575fso77479885e9.1;
        Wed, 29 Jan 2025 06:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738161698; x=1738766498; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zSEV+em0N0SfQE1alVhrq6tX6ofwmLyBx4bRZxI20Mc=;
        b=WfM/6D5/x+Obgpqft7G/eKGmTxb1Z/AtzUBUve/LeoID8y3A9HKO3u31Pf4UoEP/wc
         kWsSM/OfqJRZQTbWMgwTPrRYc/2HcuL9P7FjlYOJwvxkr5BGzLF1mPpybGIUT3zB6RHp
         BOHbyfKCAnn5ojqT4xYyaJUYL2YxWP1U/Q/5YHkDi73/tE0+ZtUd4RDQ1iQAq1maAoSd
         oNoZTIM1eqtgjVxLkK/bc//jEnn1SQt4+gi8Ivh/QBSuqBqHpitBxpqfa851y63jpUsd
         GqSC7kFNIxa9TVoF9gxiiHhYWAqlBtPNxobrypV061YvrBF6EeOPdz73UItHPQ/FNKfH
         WXqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738161698; x=1738766498;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zSEV+em0N0SfQE1alVhrq6tX6ofwmLyBx4bRZxI20Mc=;
        b=fuhSgjiwkIUCSn6NaGnTu4UBcNfwtzhsQEN1X0lqIfsY/Tyutpo271bW/+expgaVpj
         2JHYUTcuckvByJVh2rUR5KOpDqtmXQ528Dpohq4ndopy1wMTivltmGgcGVKghnenCtpU
         S2UHemOJAWmqbbvnEPLpJLbyFprHxXs/nV/h1xD98IETs3MeIu4FO+U60z6CiZ0LD5Mb
         uLiKXOtmkHkSiXSfhPZUn4JPhv8tnSPTcwp6qhnlsClYy/21gq3CcWrb1lnlSJlFYdzw
         bI82Edt8KbgBkfkNk20a1Ycl6XcaMm6ny+LuTahK0FxS00+FEuKF0fUKyK89rz1h8SsV
         pBcA==
X-Forwarded-Encrypted: i=1; AJvYcCVBbRbNDHbdeLNh19Eqb71IXCxwk2pWjX9ibbUGrVh++321wD0iZXWmqjUbpAhJ+rnTCcbrja+do4zifNw=@vger.kernel.org, AJvYcCWDxtZayEVPGlqiJmNNDGHmJPZmZOqmGItysqOKSZ6W2+bIo88iOZSh7Z1E88n4rJMaDr0NnBodeZXdsTf3@vger.kernel.org, AJvYcCXksL/AGZga+Vah9iiwaAEvY0tbUtDzyz6iudBEAt+GBpvzDQpPKfMeL6U+mRgQ1gsV0HY9pPNocAw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXWULlCSAMp8jl9C4uwkk8VZTPy5PCu0Y7Y8htXhZAouCjtrVa
	KkhPoAJrZRhuy+5H8nQtTuAfX4IyZTS36KiH9nJ/IB4yrROgf3k5
X-Gm-Gg: ASbGncu+hvMrgM0h/+ADQ4fGvuce4ulyxyWwoDxXB8yjT4g0ldGbS3boQdHB39qpSQp
	NCXdWsAQt7Ruoce6nW5m9Rj7MA8T/BEhHrMtjzp3d1se/eL/D7XwLJGPA6VPdMLWeZiHAWkDTsS
	UqxXA6jy7DWsHAXfVUwrj+m/T1AWjtDPWfU52fWDsak4HaTcpMarT2U4OD/X9ax8LsxYgW2Hk8E
	G3p3rsO81L3L9+UeuKgNmLaOC6/9RQMAo+4Mx+K9puAzWiguFOFgJVrtfN5JRNQdK9mc2Uo+tMx
	sBNMINmVAgM76f45PfIkgqvWq7KIDKbjZByt6ylFDU9u3ZURjRjhOApbGIno86mEnHDi3qAwI8i
	tRg==
X-Google-Smtp-Source: AGHT+IGdWBqWeiv+jbIoBfzm7k0/2DrarU7EXB90OvgtRbMeVkAoe8ODcFAhL4eNP6mW3P0r12bwJA==
X-Received: by 2002:a05:600c:4e07:b0:436:e86e:e4ab with SMTP id 5b1f17b1804b1-438dc4353e7mr35398335e9.30.1738161698102;
        Wed, 29 Jan 2025 06:41:38 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc2b1d9sm24718285e9.21.2025.01.29.06.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 06:41:36 -0800 (PST)
Date: Wed, 29 Jan 2025 15:41:32 +0100
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
Message-ID: <2y3lwycrggmktamu3j3gj65uco7quvtu7tlc3724e4mpokhjz2@icedc3kervme>
References: <20250128-cocci-memory-api-v1-0-0d1609a29587@redhat.com>
 <20250128-cocci-memory-api-v1-14-0d1609a29587@redhat.com>
 <a389f799-442e-45f3-8609-2eb2f0b7a825@suse.de>
 <li2awsqmdoye3u7n3gi2mrhbfxs77e3edjmsg5zclnyjinsnul@2bjkc5agyu5u>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cigenp6alv7pkbet"
Content-Disposition: inline
In-Reply-To: <li2awsqmdoye3u7n3gi2mrhbfxs77e3edjmsg5zclnyjinsnul@2bjkc5agyu5u>


--cigenp6alv7pkbet
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 14/14] Documentation: Update the todo
MIME-Version: 1.0

On Wed, Jan 29, 2025 at 03:31:50PM +0100, Maxime Ripard wrote:
> Hi Thomas,
>=20
> On Wed, Jan 29, 2025 at 02:06:15PM +0100, Thomas Zimmermann wrote:
> > Am 28.01.25 um 23:29 schrieb Anusha Srivatsa:
> > > Remove the TODO now that this series addresses
> > > the changes needed.
> >=20
> > While your series is fine, this TODO item is unrelated. It's about vari=
ous
> > ancient fbdev drivers that do not reserve their memory regions correctl=
y. So
> > please drop patch 14 form the series.
>=20
> Is it? Could we rephrase the entry then? I'm the one that suggested
> Anusha to work on this, and it's still not clear to me what it means
> exactly if it's not what she worked on :)

The text in the TODO sounds pretty clear to me. It says that not all
drivers request the memory that they are going to use, and suggests to
add those missing calls. But all of the drivers in this series already
do that and the only change here is to convert them to use some of the
newer helpers.

Thierry

--cigenp6alv7pkbet
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmeaPhkACgkQ3SOs138+
s6H45hAAkHi6OubObNKNwO2CYc2mT8gjjY3iZP3UvxqouoU05ylZ0uUIxHOz8K8T
vXb+tkMFtsqIZZTJZGti+67m/YYOCtZsvXO79IMZy7WUab/bKWX7x2vy3WjN5lyG
yqlo8kp85y69za3sJHjRrUvr4acQSDyDejrwBdWN2xMCnDgzG5lzXkXhibhyOaMd
p0wyLE4EkS0pdxCg2FGGjiFOAnWmHd3+DPW3wRSMVsiXpVgWxEAQ6aGmNMtl0Y7F
KM7UDu0umziZxMyR2/4SFn7Q772BDa1dwInJhSBF3ugkGdQ3mSPpBeDPjf+cI2Mj
69Z5AA1KQOhvGcKM9WOW/kXV9/CeXD1dv6Z5c4ho4gnOWA9Sjj0PUVRIJy7oDtm5
4SdccVE1EPL/+IzByDQFxbG6/UFTJroG0+N9mpx9p2tZ0fJDGiQepxQ6XqLKlbZg
olV21Xytohgotp2SlQ8tk2PIln70QKzEanmMVBl2WEkxAByKbu/XK+4A9+3/Hy9l
+RdZ/r1pHfzlW7nzFGKpNeNaH3uMkupcb4PsceavHYDmabcKJtyK4J2/xp218nwA
EopzxkwqOiYMAHl1/tBeNlt4bEIhph/3ldgBr6fgUWSbddKQxr6YjU/Lyvp5KOFH
qkb1aCLDg6nKqceZe1QQeEDsVyZJA2a3ACyQ5rpyrniazDRDlU8=
=VcN2
-----END PGP SIGNATURE-----

--cigenp6alv7pkbet--
