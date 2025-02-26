Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C350B21CC48;
	Wed, 26 Feb 2025 14:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740581292; cv=none; b=antb6JWnN7I039Da8euPCbPYWN26hoLV5Ged7A7ezVN4cKm0ECDALyNq9Y3IGeRnP25Vg44jm92NfgpOdXpMx9Ufc6wFK1QVtKelyQ7TYrTupY0lWN0bhO3+N3FfiosZb9ERN7hnKAIaYnFW5MFpLueK8zB1DduZLC06qT/1fqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740581292; c=relaxed/simple;
	bh=R2Gx1N8K9KgoekiAVlPfyhUXC/d2nYfvQ5VD+gdozZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pkDWasA1hNKRceQqFz0/rbVbh2zVuMjJ6N8Dan/z9HxUIc5yi1rHwhY6LtByCAJP0uqSD8xq14Utr7uTvMunv0TUbsp1FOPOu7CmJWsDrEzVWs9GsV1zZeHnjzUBQLx1WuX6OxaAq1BCfD85Ty61EgeOb2tdHJb472F3Kcn3Pso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mApHC7rW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mApHC7rW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B021EC4CED6;
	Wed, 26 Feb 2025 14:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740581292;
	bh=R2Gx1N8K9KgoekiAVlPfyhUXC/d2nYfvQ5VD+gdozZ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mApHC7rWxqw1e5UqFq0sDaKSoI4NkQu7LB1ljIILqMN0JjNxHvceSMwUIkXVxxNom
	 1G0Nyk5XM30FeLOiOiBNnBv6x/HUwPXtiakVbjALWlrEXZh5S0WnhuYVQda8xGrfAZ
	 nr3BxFeo4NG4jZs+g8UZ3El7iT9yREbDcaJT5sL9qMF66fqQEuElw3nWKPY8blZKli
	 iGZK3o162kcTBe1ELSFF4rxVAciArDijitJkBGi9k3sTLjgww7QcWMF3zKjBKsttJZ
	 us1mTGNayqOu8jrgRuxyFmH5cn/BI7Gcsuh67owAcwxVbvrSpnSSpWMuEPySYgLQO4
	 TmYabkCkmWmhw==
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
	linux-doc@vger.kernel.org,
	CK Hu <ck.hu@mediatek.com>
Subject: Re: (subset) [PATCH RESEND 04/12] drm/mediatek: move to devm_platform_ioremap_resource() usage
Date: Wed, 26 Feb 2025 15:47:54 +0100
Message-ID: <174058126145.2737122.14070360232416372378.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250225-memory-drm-misc-next-v1-4-9d0e8761107a@redhat.com>
References: <20250225-memory-drm-misc-next-v1-0-9d0e8761107a@redhat.com> <20250225-memory-drm-misc-next-v1-4-9d0e8761107a@redhat.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 25 Feb 2025 17:20:45 -0500, Anusha Srivatsa wrote:
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
