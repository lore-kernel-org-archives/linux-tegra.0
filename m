From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 07/14] staging: media: tegra-vde: Add some clarifying comments
Date: Mon, 13 Aug 2018 16:50:20 +0200
Message-ID: <20180813145027.16346-8-thierry.reding@gmail.com>
References: <20180813145027.16346-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20180813145027.16346-1-thierry.reding@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, linux-media@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add some comments specifying what tables are being set up in VRAM.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/staging/media/tegra-vde/tegra-vde.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/staging/media/tegra-vde/tegra-vde.c b/drivers/staging/media/tegra-vde/tegra-vde.c
index 0adc603fa437..41cf86dc5dbd 100644
--- a/drivers/staging/media/tegra-vde/tegra-vde.c
+++ b/drivers/staging/media/tegra-vde/tegra-vde.c
@@ -271,6 +271,7 @@ static void tegra_vde_setup_iram_tables(struct tegra_vde *vde,
 	unsigned int i, k;
 	size_t size;
 
+	/* clear H256RefPicList */
 	size = num_ref_pics * 4 * 8;
 	memset(vde->iram, 0, size);
 
@@ -453,6 +454,7 @@ static int tegra_vde_setup_hw_context(struct tegra_vde *vde,
 	VDE_WR(0x00000000, vde->bsev + 0x98);
 	VDE_WR(0x00000060, vde->bsev + 0x9C);
 
+	/* clear H264MB2SliceGroupMap, assuming no FMO */
 	memset(vde->iram + 1024, 0, macroblocks_nb / 2);
 
 	tegra_setup_frameidx(vde, dpb_frames, ctx->dpb_frames_nb,
@@ -480,6 +482,8 @@ static int tegra_vde_setup_hw_context(struct tegra_vde *vde,
 	if (err)
 		return err;
 
+	/* upload H264MB2SliceGroupMap */
+	/* XXX don't hardcode map size? */
 	value = (0x20 << 26) | (0 << 25) | ((4096 >> 2) & 0x1fff);
 	err = tegra_vde_push_to_bsev_icmdqueue(vde, value, false);
 	if (err)
@@ -492,6 +496,7 @@ static int tegra_vde_setup_hw_context(struct tegra_vde *vde,
 	if (err)
 		return err;
 
+	/* clear H264MBInfo XXX don't hardcode size */
 	value = (0x21 << 26) | ((240 & 0x1fff) << 12) | (0x54c & 0xfff);
 	err = tegra_vde_push_to_bsev_icmdqueue(vde, 0x840F054C, false);
 	if (err)
@@ -499,6 +504,16 @@ static int tegra_vde_setup_hw_context(struct tegra_vde *vde,
 
 	size = num_ref_pics * 4 * 8;
 
+	/* clear H264RefPicList */
+	/*
+	value = (0x21 << 26) | (((size >> 2) & 0x1fff) << 12) | 0xE34;
+
+	err = tegra_vde_push_to_bsev_icmdqueue(vde, value, false);
+	if (err)
+		return err;
+	*/
+
+	/* upload H264RefPicList */
 	value = (0x20 << 26) | (0x0 << 25) | ((size >> 2) & 0x1fff);
 	err = tegra_vde_push_to_bsev_icmdqueue(vde, value, false);
 	if (err)
@@ -584,7 +599,11 @@ static int tegra_vde_setup_hw_context(struct tegra_vde *vde,
 
 	tegra_vde_mbe_set_0xa_reg(vde, 0, 0x000009FC);
 	tegra_vde_mbe_set_0xa_reg(vde, 2, 0x61DEAD00);
+#if 0
+	tegra_vde_mbe_set_0xa_reg(vde, 4, dpb_frames[0].aux_addr); /* 0x62DEAD00 */
+#else
 	tegra_vde_mbe_set_0xa_reg(vde, 4, 0x62DEAD00);
+#endif
 	tegra_vde_mbe_set_0xa_reg(vde, 6, 0x63DEAD00);
 	tegra_vde_mbe_set_0xa_reg(vde, 8, dpb_frames[0].aux_addr);
 
-- 
2.17.0
