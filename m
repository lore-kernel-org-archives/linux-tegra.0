Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D11AA4F5E0;
	Thu,  6 Feb 2025 14:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738851381; cv=none; b=K0tWqug2Cojw/7ybo4n1B9A51mKw7JOnGLKeGylff3YLFI8AuXRCBrivtWf/AFB2PgKfGo4OBbsYLZTpYvfMxw028vSawPkRqr4djDUUIIpwz3BGOI3O1lLkd2IYStWR+wfRfWI8xoqEx6Wz+4QB9lJnC4ZjAIqEk/KG3ARtWuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738851381; c=relaxed/simple;
	bh=TVrqcXFgqBq6YFt7saP+I5ihtXmckW23rwRocf2v0ks=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=WYZCnHjN35Vq1FgUuHZjSy09c8bmKqTueQ9zgS5nvKjwWny/mXJwKbX8yksPwDnGROr3xzbl/iLpqGItjUQ9R+EBBPnLOf9PyivuhmdQgJNshI1VexMefVUX+Pp26hHZpdrbqhR5oxNDzbz05vgd4PyyHIH9uMKbzgmZxN313yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oUgdH98X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oUgdH98X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3A9DC4CEDD;
	Thu,  6 Feb 2025 14:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738851381;
	bh=TVrqcXFgqBq6YFt7saP+I5ihtXmckW23rwRocf2v0ks=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=oUgdH98XCy7hXa1ByUogw4wZqfQiUMbkICr6OB2xFmDDElLbT5m+D0XzwWV8BzN4F
	 aU9wIobTYhSktwzOBbHotD7pjFpro/6rKfp44cW1VTaAe/r3Tu9Dm3YATGZaMn2wgX
	 XVkzNpxRcchr65QYCKk9NSQ7aYVv5llZoLqveCPFe/hwdm/NdwmCWys1PY11NtWe5i
	 FNVVTG6tm05bKn3f29wvDj4nqSWIk0efSNkn3CEI6D9AALmnMa4ilpyTl2kDXAIIs0
	 Y2z6DwgguFYCR90SoCdiXek/5rFwYlX6uaKOVNi1aLNRYHKaG1yyJtQlIFNK0BPpYM
	 nRSntspicf8+g==
Message-ID: <ca7086893b5b7bf0e119144efc00733e@kernel.org>
Date: Thu, 06 Feb 2025 14:16:18 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Anusha Srivatsa" <asrivats@redhat.com>
Subject: Re: [PATCH 07/12] drm/sti: move to devm_platform_ioremap_resource()
 usage
In-Reply-To: <20250205-mem-cocci-newapi-v1-7-aebf2b0e2300@redhat.com>
References: <20250205-mem-cocci-newapi-v1-7-aebf2b0e2300@redhat.com>
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

On Wed, 5 Feb 2025 15:08:03 -0500, Anusha Srivatsa wrote:
> Replace platform_get_resource/_byname + devm_ioremap
> with just devm_platform_ioremap_resource()
> 
> Used Coccinelle to do this change. SmPl patch:
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
