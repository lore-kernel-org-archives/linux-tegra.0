Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6F26125;
	Thu,  6 Feb 2025 14:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738851331; cv=none; b=s8dcTNBMZx4MwRc/YRaQVr+yHpoYAoVBx2dIvIAq2uG8yO4CQEKaLbbeHYC9B+NarUkzLymhw0EPV2OPkYh8nquyPSnNPB2XB/5IADuS53Jj0r9L2MghFOe95h5VwzGZBfOwbubQkRLvnXfcip7gFDkLGuJZ6wp+dSOIWQ1Z9cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738851331; c=relaxed/simple;
	bh=NnqBms1V+4E9EfQaAWHmp1xTPNsYHk4NHNYKw/gc4LE=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=s/IdIbvGnlJj+ow1mGp54hRz52rEGBhUWkpzl+duo8+XgovRU2mCgJUJecBn+5MFwMn2XzzOuKiOTfvD6dwuilGTVbxifx62ZM52UH5+Si3YFEZwfky5NCABGoDZNM9lKYd4hVbXWlKsSgrdpQePFP24takmW9+XHJk0ujMmILs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QFN15TOt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QFN15TOt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB7EFC4CEDD;
	Thu,  6 Feb 2025 14:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738851330;
	bh=NnqBms1V+4E9EfQaAWHmp1xTPNsYHk4NHNYKw/gc4LE=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=QFN15TOtrwkcAyA/lsiNaWymj//OCxIz5HucWhWHhCATirYavxVO59r4NPBM1VITc
	 e+0xwpj/6cllUySpG2J01BM9d912Jm9lleZqs3pU1O3HdQFqJuEnxhX7s3ayQaEn+J
	 uPpfKRER4ScCQc1p6C4esmKdk5fGJxU5pFXYI+hvewBb2q1GnMjw+Xc3wld5LiVHqL
	 IYNH2q5SCXspU0KCnOPUdyq4IYIMyYl8fk3Zlt4hpVsFdD3w+JsD/hYrMTc0fCojHr
	 fsXb+MFRghIZqpKoSuwq88hRtoc3i7eJ2eeyZkraYPppScjf4IDEprsKrWZYlzxnvI
	 kZYRg3Qh41w1w==
Message-ID: <a66f048616d94bd68f56fb73abb5fd60@kernel.org>
Date: Thu, 06 Feb 2025 14:15:27 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Anusha Srivatsa" <asrivats@redhat.com>
Subject: Re: [PATCH 04/12] drm/mediatek: move to
 devm_platform_ioremap_resource() usage
In-Reply-To: <20250205-mem-cocci-newapi-v1-4-aebf2b0e2300@redhat.com>
References: <20250205-mem-cocci-newapi-v1-4-aebf2b0e2300@redhat.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, "Alain
 Volmat" <alain.volmat@foss.st.com>, "Alexandre Torgue" <alexandre.torgue@foss.st.com>, "Alexey
 Brodkin" <abrodkin@synopsys.com>, "Alison Wang" <alison.wang@nxp.com>, "Andrew
 Jeffery" <andrew@codeconstruct.com.au>, "Andy Yan" <andy.yan@rock-chips.com>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, "Baolin Wang" <baolin.wang@linux.alibaba.com>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>, "Chunyan Zhang" <zhang.lyra@gmail.com>, "Dave
 Stevenson" <dave.stevenson@raspberrypi.com>, "David Airlie" <airlied@gmail.com>, "Fabio
 Estevam" <festevam@gmail.com>, =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "Joel
 Stanley" <joel@jms.id.au>, "John Stultz" <jstultz@google.com>, "Jonathan
 Corbet" <corbet@lwn.net>, "Jonathan Hunter" <jonathanh@nvidia.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marek Vasut" <marex@denx.de>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, "Maxime
 Ripard" <mripard@kernel.org>, =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Mikko
 Perttunen" <mperttunen@nvidia.com>, "Orson Zhai" <orsonzhai@gmail.com>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Philipp Zabel" <p.zabel@pengutronix.de>, "Philippe
 Cornu" <philippe.cornu@foss.st.com>, "Raphael Gallais-Pou" <raphael.gallais-pou@foss.st.com>, "Raphael
 Gallais-Pou" <rgallaispou@gmail.com>, "Raspberry Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Sandy
 Huang" <hjc@rock-chips.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn
 Guo" <shawnguo@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Stefan
 Agner" <stefan@agner.ch>, "Sumit Semwal" <sumit.semwal@linaro.org>, "Thierry
 Reding" <thierry.reding@gmail.com>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Tian
 Tao" <tiantao6@hisilicon.com>, "Xinliang Liu" <xinliang.liu@linaro.org>, "Xinwei
 Kong" <kong.kongxinwei@hisilicon.com>, "Yannick Fertre" <yannick.fertre@foss.st.com>, "Yongqin
 Liu" <yongqin.liu@linaro.org>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>

On Wed, 5 Feb 2025 15:08:00 -0500, Anusha Srivatsa wrote:
> Replace platform_get_resource + devm_ioremap_resource
> with just devm_platform_ioremap_resource()
> 
> Used Coccinelle to do this change. SmPl patch:
> @rule_1@
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
