Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF1346EC64;
	Fri, 21 Aug 2026 10:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787306615; cv=none; b=s9M97OYTGXReX+JglHdM6vuhN1ttYeGtdFbHPAmyqxxfyAbefbZ68YXaMsi9PY58a5n1Ocz/n41P+EgqBO73ScDLy673Shhxz/sj5i1BkvqYqg6WHS4fCYuDrl060KKrxguyfPX53q9XRU2bP3MeGFVJ2fwnnf6jW6360Nd048Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787306615; c=relaxed/simple;
	bh=bk5/3KnTW1K4VMMTGCj94ajjE4NZlaE1Y7kf52o0HtA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J70bD30BOdNdVGrkwwGyVnxh2teu/+5f8riAK5phzmgAkCdOaDiXwZU9590rTrYToX6y7znmRxyaPPA289Oji3rfQQjygOBjQlzI6dWKIUjdj7t6PCNkKQ8ghB360gxtqZSISM4Yrlj7+oGhiOKmVrq2XCG6A48ZlhJOMy9ZX1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF2421F00A3E;
	Fri, 21 Aug 2026 10:03:15 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Chen-Yu Tsai <wens@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] drm/tegra: Make sure clk_init_data is fully initialized
Date: Fri, 21 Aug 2026 12:03:03 +0200
Message-ID: <9bc5029f7ad84b0b1e02be231a5abd7e5fa03946.1787239944.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1787239944.git.geert+renesas@glider.be>
References: <cover.1787239944.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clk_init_data structure contains several mutually-exclusive members
for different methods to specify the possible parents of a clock,
prompting drivers to initialize only the members they need.  However,
not initializing all members may cause subtle issues, which are only
exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
enabled.

Make sure all members are fully initialized, to avoid such bugs, and to
prevent future breakage when converting drivers to a different method
for specifying the parents.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Compile-tested only.
---
 drivers/gpu/drm/tegra/sor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index e384cbd0cbf72fb9..46449c69807d369e 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -600,8 +600,8 @@ static const struct clk_ops tegra_clk_sor_pad_ops = {
 static struct clk *tegra_clk_sor_pad_register(struct tegra_sor *sor,
 					      const char *name)
 {
+	struct clk_init_data init = {};
 	struct tegra_clk_sor_pad *pad;
-	struct clk_init_data init;
 	struct clk *clk;
 
 	pad = devm_kzalloc(sor->dev, sizeof(*pad), GFP_KERNEL);
-- 
2.43.0

