Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B30D1DDA17;
	Wed, 29 Jan 2025 15:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738165245; cv=none; b=VbVwnv/mEwiORJqSDpxOcmVT9VQYD1HinEVqlyV0w4SrYp7CeYwIUErgP1G+x90Zs7b6FfT5Ru67+nc0/uFT+CXB/36VILuUpJvSL1jfHpWbvXXnkjr9R2nDdETGlDotxSComRO8mrprpuLxqJTvEdZRqQjpV7RCriqLi0xszaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738165245; c=relaxed/simple;
	bh=rtnZjFO/UfiH1j0rluxhcjeVmz12h1zDXZJJ3+0MvRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BRE6DdIcQ8KgrSLPDAKhNe+TQLSXR1f1JaHczisMpbNUGR7aDSIHjgtUmCjPI8lZyDVecReiAtou0s7jyKp0owqEmh3ARTXKFYaUvaZPgy9ZC/gQwvIJ/hzJiLL/Q9sfNQGrhXPA94bF8b5/PJeyj7irKyXGhkmgjNSWXXbElkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZM+cZRti; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZM+cZRti"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 770ABC4CED3;
	Wed, 29 Jan 2025 15:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738165245;
	bh=rtnZjFO/UfiH1j0rluxhcjeVmz12h1zDXZJJ3+0MvRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZM+cZRtiXnmi0hHc4n40eYcHanFML/aIc6MX0XZhPdogHoKUulxVjPXm6RULnPVkC
	 iX8Qospo0x/ND4+0f525c7Zu8xxc7Daz/PjoUL8HDbN4/QMLPeR65aHCueaEp1uWIU
	 DurPDhK4SIaKCpip8GwEy8LkumP3/EdZeVc0QSWZOObMvQAc45nvMv2WpqBGHp6RxU
	 EYpA95fiVbOw32agYO2Sfqvb3U5f/ACokeGKatfzJ+LRaXLQdUYJ/gCmPWhPOAFOAp
	 Zr7OInp3vF/BKz0JLCt0vxcL0M2B+OHTkOofX3sauEdMMjc3170klpqg28aRYRHFvC
	 +wc9LrlSw92yQ==
Date: Wed, 29 Jan 2025 16:40:41 +0100
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
	Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Alexey Brodkin <abrodkin@synopsys.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Jonathan Corbet <corbet@lwn.net>, linux-aspeed@lists.ozlabs.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 05/14] drm/meson: move to
 devm_platform_ioremap_resource() usage
Message-ID: <ieknc4dm5ntnqaqz6zdlinphocm2omsn4ll34vlbrohqcddl43@kg35irldnkuw>
References: <20250128-cocci-memory-api-v1-0-0d1609a29587@redhat.com>
 <20250128-cocci-memory-api-v1-5-0d1609a29587@redhat.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="wmuf2lutfjid5aqu"
Content-Disposition: inline
In-Reply-To: <20250128-cocci-memory-api-v1-5-0d1609a29587@redhat.com>


--wmuf2lutfjid5aqu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 05/14] drm/meson: move to
 devm_platform_ioremap_resource() usage
MIME-Version: 1.0

On Tue, Jan 28, 2025 at 05:29:29PM -0500, Anusha Srivatsa wrote:
> Replace platform_get_resource_byname + devm_ioremap
> with just devm_platform_ioremap_resource()
>=20
> Used Coccinelle to do this change. SmPl patch:
> @rule_3@
> identifier res;
> expression ioremap;
> identifier pdev;
> constant mem;
> expression name;
> @@
> -struct resource *res;
> ...
> -res =3D platform_get_resource_byname(pdev,mem,name);
> <...
> -if (!res) {
> -...
> -}
> ...>
> -ioremap =3D devm_ioremap(...);
> +ioremap =3D devm_platform_ioremap_resource_byname(pdev,name);
>=20
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
>  drivers/gpu/drm/meson/meson_drv.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/me=
son_drv.c
> index 81d2ee37e7732dca89d02347b9c972300b38771a..6c805805b7a7f675f8bb03944=
318972eb4df864e 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -184,7 +184,6 @@ static int meson_drv_bind_master(struct device *dev, =
bool has_components)
>  	const struct meson_drm_match_data *match;
>  	struct meson_drm *priv;
>  	struct drm_device *drm;
> -	struct resource *res;
>  	void __iomem *regs;
>  	int ret, i;
> =20
> @@ -220,14 +219,8 @@ static int meson_drv_bind_master(struct device *dev,=
 bool has_components)
>  	}
> =20
>  	priv->io_base =3D regs;
> -
> -	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "hhi");
> -	if (!res) {
> -		ret =3D -EINVAL;
> -		goto free_drm;
> -	}
>  	/* Simply ioremap since it may be a shared register zone */
> -	regs =3D devm_ioremap(dev, res->start, resource_size(res));
> +	regs =3D devm_platform_ioremap_resource_byname(pdev, "hhi");

Given the comment, this one should probably be skipped.

Maxime

--wmuf2lutfjid5aqu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ5pL+QAKCRAnX84Zoj2+
dpWQAYDuVxaraj2eKojNueyW+NChDy3YtnstWS0E/hE4JNegqss7vQXSWOthuO4R
73qWnq0BfRFtK3i2Os+sXuDOS+LkWHx5AsRtEcQCCeX0wT3sQVfWN3Edu+Ky/NDa
3DmrzReHUw==
=Tstn
-----END PGP SIGNATURE-----

--wmuf2lutfjid5aqu--
