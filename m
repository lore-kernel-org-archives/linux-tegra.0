Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895B72236F7;
	Wed, 26 Feb 2025 14:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740581295; cv=none; b=NoTTGxWsNtWXK9qRQX3docVEbShVHQnQe6ehYctC+VOw0aZgH2OGjaNCZR64b5ATuK3k8Xo16idcjg74RvBBq6uHDSxFD0eQwyEK/DNOU7rnu6az3Sztx48nznuDULdbmAVm9LK9eYuao6ro43glUi9QueFrq9tm1JWFeBCGXtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740581295; c=relaxed/simple;
	bh=Ws36dGt/JliPqG5ximPKtnPPEq5r8WRHzbvDbCpLlbc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PufG770IWY0xMbZXXG3btD7MSteyOOmWDBLRwqHVI6RE8KWYb0bWldOw3uuKHBV4orTe9MawTstgQnaB7aoZC49EvFNxTTikrdEV3OVf3K7eIb4axBVOwlD4ggLmfeBYy/ETDWk80W/o5EPN/fUxkM9dT65smHK2hhqgTFs9E0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mk9/bvPD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mk9/bvPD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86B88C4CEEB;
	Wed, 26 Feb 2025 14:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740581295;
	bh=Ws36dGt/JliPqG5ximPKtnPPEq5r8WRHzbvDbCpLlbc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mk9/bvPDjHU1D3s1KUZnYZStNfxcrvzEuJIYwOq0HYlyBZNPaQP5xi4ZKqtxcE0Lm
	 Mgl98OoBzNRHEXpPf15jmTPb3D9LrTpz9tqGedFCKDrJ6J84aCOw3qcOGgUV8oopbd
	 gHAkBSN77PXUWYeNGi3ikoygSVRFu7HpsmL2pwtI+GIEcl9M7Eq4IWC69aLzXQNM7f
	 9e2mOOPe4puff330hEivHiNeSZGItQ5pzlAydSWMQ9mm739yqwffjas8ZR9VpDwMzo
	 dFeIxBbB9cyKLDDwro1RnSB0VkDbt4yKE7itQZpFPQ6MUdElWBEA6aIj7AfKLKqS3/
	 S7RSxdxS8CY9w==
From: Maxime Ripard <mripard@kernel.org>
To: Joel Stanley <joel@jms.id.au>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Stefan Agner <stefan@agner.ch>,
	Alison Wang <alison.wang@nxp.com>,
	Xinliang Liu <xinliang.liu@linaro.org>,
	Tian Tao <tiantao6@hisilicon.com>,
	Xinwei Kong <kong.kongxinwei@hisilicon.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Yongqin Liu <yongqin.liu@linaro.org>,
	John Stultz <jstultz@google.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Marek Vasut <marex@denx.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Raphael Gallais-Pou <rgallaispou@gmail.com>,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Philippe Cornu <philippe.cornu@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Alexey Brodkin <abrodkin@synopsys.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Anusha Srivatsa <asrivats@redhat.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	linux-aspeed@lists.ozlabs.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	imx@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-tegra@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: (subset) [PATCH RESEND 08/12] drm/stm: move to devm_platform_ioremap_resource() usage
Date: Wed, 26 Feb 2025 15:47:55 +0100
Message-ID: <174058126145.2737122.17548420764585467687.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250225-memory-drm-misc-next-v1-8-9d0e8761107a@redhat.com>
References: <20250225-memory-drm-misc-next-v1-0-9d0e8761107a@redhat.com> <20250225-memory-drm-misc-next-v1-8-9d0e8761107a@redhat.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 25 Feb 2025 17:20:49 -0500, Anusha Srivatsa wrote:
> Replace platform_get_resource + devm_ioremap_resource
> with just devm_platform_ioremap_resource()
> 
> Used Coccinelle to do this change. SmPl patch:
> @rule_1@
> identifier res;
> expression ioremap_res;
> identifier pdev;
> @@
> -struct resource *res;
> ...
> -res = platform_get_resource(pdev,...);
> -ioremap_res = devm_ioremap_resource(...);
> +ioremap_res = devm_platform_ioremap_resource(pdev,0);
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime
