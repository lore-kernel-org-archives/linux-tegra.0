Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBB346D547;
	Fri, 21 Aug 2026 10:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787306611; cv=none; b=IIS4dI0Bb3trRKNh0YihpQYtAsaoZXunBFcCtlWtC3SOcsb8Gx3iVaM0t1XseHpL+b6jw7L/LEDjdYBVsD07jIkE13rSDGRjT/2fTjfovwwvm3JacEbo+rFARDsAnAURyndmfFFUK9phcBG/7ymiBwGhgCYDSrlziUVQ++7jNXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787306611; c=relaxed/simple;
	bh=aODltv+dZo/KzCD3Woo9MaUfMh74qSOBBBrH3O5MNOU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pYnwi1oJlvj34B514LDURbDYxliAcIB38waeCI8QeZOWmB2J4QYESKTspY3j16tVl2GRxUbH2/t/r9d+4K5q62Eu00V+GkyY5yaDWF3VjNZ7C1tLSbOo+YwTF9k1F4kdjDgx2Etx1nlXHBwrZcQbepuYcF6pI77FJU7EEdt6OmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00A881F00A3A;
	Fri, 21 Aug 2026 10:03:11 +0000 (UTC)
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
Subject: [PATCH 1/2] drm/sun4i: Make sure clk_init_data is fully initialized
Date: Fri, 21 Aug 2026 12:03:02 +0200
Message-ID: <0f37278d04c02461e17f42032a379dccfb773171.1787239944.git.geert+renesas@glider.be>
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
 drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c  | 2 +-
 drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c | 2 +-
 drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c     | 2 +-
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy_clk.c  | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
index b1beadb9bb59f8ff..958099d137f8df9b 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_ddc_clk.c
@@ -109,7 +109,7 @@ static const struct clk_ops sun4i_ddc_ops = {
 
 int sun4i_ddc_create(struct sun4i_hdmi *hdmi, struct clk *parent)
 {
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	struct sun4i_ddc *ddc;
 	const char *parent_name;
 
diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c
index fbf7da9d9592141b..15b09d5479d97aa3 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_tmds_clk.c
@@ -202,7 +202,7 @@ static const struct clk_ops sun4i_tmds_ops = {
 
 int sun4i_tmds_create(struct sun4i_hdmi *hdmi)
 {
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	struct sun4i_tmds *tmds;
 	const char *parents[2];
 
diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c b/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c
index 4afb12bd5281f0d1..bdac1d622cc41351 100644
--- a/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c
+++ b/drivers/gpu/drm/sun4i/sun4i_tcon_dclk.c
@@ -167,7 +167,7 @@ static const struct clk_ops sun4i_dclk_ops = {
 int sun4i_dclk_create(struct device *dev, struct sun4i_tcon *tcon)
 {
 	const char *clk_name, *parent_name;
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	struct sun4i_dclk *dclk;
 	int ret;
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy_clk.c b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy_clk.c
index a4d31fe3abff1ab1..bd0dba95421b3d8e 100644
--- a/drivers/gpu/drm/sun4i/sun8i_hdmi_phy_clk.c
+++ b/drivers/gpu/drm/sun4i/sun8i_hdmi_phy_clk.c
@@ -143,7 +143,7 @@ static const struct clk_ops sun8i_phy_clk_ops = {
 int sun8i_phy_clk_create(struct sun8i_hdmi_phy *phy, struct device *dev,
 			 bool second_parent)
 {
-	struct clk_init_data init;
+	struct clk_init_data init = {};
 	struct sun8i_phy_clk *priv;
 	const char *parents[2];
 
-- 
2.43.0

