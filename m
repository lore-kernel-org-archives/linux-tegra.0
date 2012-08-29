From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH RESEND] dma: tegra: add const to of_device_id.data's structure
Date: Wed, 29 Aug 2012 10:47:27 +0530
Message-ID: <1346217447-19730-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, djbw-b10kYP2dOMg@public.gmane.org
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The member "data" of structure of_device_id is changed to const
pointer. Hence initializing this with const type data.
This will fix the compilation warning like
drivers/dma/tegra20-apb-dma.c:1217:9: warning: assignment discards 'con=
st' qualifier from
pointer target type [enabled by default]

This warning came after the change
---------
commit 98d7bbb9929bcc14e11ac8a55245a4f2dc174e17
Author: Uwe Kleine-K=C3=B6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
    of: add const to struct *of_device_id.data
---------

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Acked-by: Vinod Koul <vinod.koul-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>

---
Resending patch to Uwe and adding ack from Stephen and Vinod.
=46ix typo in description.

 drivers/dma/tegra20-apb-dma.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dm=
a.c
index 24acd71..09a15ff 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -201,7 +201,7 @@ struct tegra_dma {
 	struct clk			*dma_clk;
 	spinlock_t			global_lock;
 	void __iomem			*base_addr;
-	struct tegra_dma_chip_data	*chip_data;
+	const struct tegra_dma_chip_data	*chip_data;
=20
 	/* Some register need to be cache before suspend */
 	u32				reg_gen;
@@ -1173,14 +1173,14 @@ static void tegra_dma_free_chan_resources(struc=
t dma_chan *dc)
 }
=20
 /* Tegra20 specific DMA controller information */
-static struct tegra_dma_chip_data tegra20_dma_chip_data =3D {
+static const struct tegra_dma_chip_data tegra20_dma_chip_data =3D {
 	.nr_channels		=3D 16,
 	.max_dma_count		=3D 1024UL * 64,
 };
=20
 #if defined(CONFIG_OF)
 /* Tegra30 specific DMA controller information */
-static struct tegra_dma_chip_data tegra30_dma_chip_data =3D {
+static const struct tegra_dma_chip_data tegra30_dma_chip_data =3D {
 	.nr_channels		=3D 32,
 	.max_dma_count		=3D 1024UL * 64,
 };
@@ -1204,7 +1204,7 @@ static int __devinit tegra_dma_probe(struct platf=
orm_device *pdev)
 	struct tegra_dma *tdma;
 	int ret;
 	int i;
-	struct tegra_dma_chip_data *cdata =3D NULL;
+	const struct tegra_dma_chip_data *cdata =3D NULL;
=20
 	if (pdev->dev.of_node) {
 		const struct of_device_id *match;
--=20
1.7.1.1
