Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EB65672;
	Tue, 28 Jan 2025 23:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738108529; cv=none; b=KkRkO2vZPbzwAe3hAtJB63h4w8mDOZ89LdUzgn37DoJYsGbnziGmB/9EJXWsuRh3Ec38becScLbCCcQtiYU10gXbKKExuPsuxzIS5POzL4PTe7byB/hOP3YisKy+3+mRawySg0Uo9N4GxkLVle63LFUaWNnObuWk/RfqrFxlEgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738108529; c=relaxed/simple;
	bh=roLSlasG/q41dscrlB7eO6FGDf3F4zgrpr5LEf+aI/Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kj+RnVTb+Lq4RllsXIVPAimoGiWJBjy3Jfepg8E/40fQ0CJUHATFKXnpi9GdXIAcXShJz8knryd7rZNu1xjWx5sjM3CXUxGKN69Ou2N8xZ1m4VF7N13vwxP/ZWSUIzuuXij9tTtGwhVFasGe5Czb7O+wEH/ONTAqFIDLzLo1vU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=d27kyn86; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="d27kyn86"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1738108152;
	bh=roLSlasG/q41dscrlB7eO6FGDf3F4zgrpr5LEf+aI/Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=d27kyn86OW9fKb37uxAAjYTxIMGhniYZF6utj0d0lxP83K5OlLXIQGc3mwfwR+qjt
	 lXqOymLQrDX/9BLUoaBptalqeGGhBCGvev5Y5KFsn9hbt7sc2Gsqe2gvTK1BqX2av7
	 mqh0HN0lBLqtvidZC5BXZC/UwBxCS6aqMrwbm+Ewg1AG/SQ+VUj6WK9TlhnIibrnsd
	 ZLstgk7mr4Fnq/pX2qwnssCN+qKFpGOKxHSVnRAc10ZBaRYk0ioU9v63xfJvpzJcbR
	 BpaqVLh43vIi78A+Gztr8p/PRCBc/TQqZrVOgFBSlCW0+ERJYYiTavaKlbeJHiHqKG
	 ZvfGucQWj7yAQ==
Received: from [192.168.68.112] (58-7-145-34.dyn.iinet.net.au [58.7.145.34])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id B175F700F5;
	Wed, 29 Jan 2025 07:48:56 +0800 (AWST)
Message-ID: <0589b4c2a6cf4e946e927081c4ed5a4b488010aa.camel@codeconstruct.com.au>
Subject: Re: [PATCH 01/14] drm/aspeed: move to
 devm_platform_ioremap_resource() usage
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Anusha Srivatsa <asrivats@redhat.com>, Joel Stanley <joel@jms.id.au>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Stefan Agner
 <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, Xinliang Liu
 <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>, Xinwei Kong
 <kong.kongxinwei@hisilicon.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Marek Vasut <marex@denx.de>, Shawn
 Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, Sandy Huang <hjc@rock-chips.com>,  Heiko
 =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Andy Yan
 <andy.yan@rock-chips.com>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Alain Volmat <alain.volmat@foss.st.com>, Raphael Gallais-Pou
 <rgallaispou@gmail.com>, Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,  Thierry Reding
 <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Alexey Brodkin
 <abrodkin@synopsys.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel
 Maintenance <kernel-list@raspberrypi.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, 
	linux-doc@vger.kernel.org
Date: Wed, 29 Jan 2025 10:18:56 +1030
In-Reply-To: <20250128-cocci-memory-api-v1-1-0d1609a29587@redhat.com>
References: <20250128-cocci-memory-api-v1-0-0d1609a29587@redhat.com>
	 <20250128-cocci-memory-api-v1-1-0d1609a29587@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-01-28 at 17:29 -0500, Anusha Srivatsa wrote:
> Replace platform_get_resource + devm_ioremap_resource
> with just devm_platform_ioremap_resource()
>=20
> Used Coccinelle to do this change. SmPl patch:
> @rule_1@
> identifier res;
> expression ioremap_res;
> identifier pdev;
> @@
> -struct resource *res;
> ...
> -res =3D platform_get_resource(pdev,...);
> -ioremap_res =3D devm_ioremap_resource(...);
> +ioremap_res =3D devm_platform_ioremap_resource(pdev,0);
>=20
> Cc: Joel Stanley <joel@jms.id.au>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

Acked-by: Andrew Jeffery <andrew@codeconstruct.com.au>
