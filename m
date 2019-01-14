From: Mark Zhang <markz@nvidia.com>
Subject: [PATCH] regmap-irq: do not write mask register if mask_base is zero
Date: Mon, 14 Jan 2019 17:32:58 +0800
Message-ID: <20190114093258.28431-1-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, gregkh@linuxfoundation.org, rafael@kernel.org, linux-kernel@vger.kernel.org
Cc: linux-tegra@vger.kernel.org, Mark Zhang <markz@nvidia.com>, Laxman Dewangan <ldewangan@nvidia.com>, Jinyoung Park <jinyoungp@nvidia.com>, Venkat Reddy Talla <vreddytalla@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

If client have not provided the mask base register then do not
write into the mask register.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
Signed-off-by: Jinyoung Park <jinyoungp@nvidia.com>
Signed-off-by: Venkat Reddy Talla <vreddytalla@nvidia.com>
Signed-off-by: Mark Zhang <markz@nvidia.com>
---
 drivers/base/regmap/regmap-irq.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-=
irq.c
index d2d0014b0d23..330c1f7e9665 100644
--- a/drivers/base/regmap/regmap-irq.c
+++ b/drivers/base/regmap/regmap-irq.c
@@ -108,6 +108,9 @@ static void regmap_irq_sync_unlock(struct irq_data *dat=
a)
 	 * suppress pointless writes.
 	 */
 	for (i =3D 0; i < d->chip->num_regs; i++) {
+		if (!d->chip->mask_base)
+			continue;
+
 		reg =3D d->chip->mask_base +
 			(i * map->reg_stride * d->irq_reg_stride);
 		if (d->chip->mask_invert) {
@@ -588,6 +591,9 @@ int regmap_add_irq_chip(struct regmap *map, int irq, in=
t irq_flags,
 	/* Mask all the interrupts by default */
 	for (i =3D 0; i < chip->num_regs; i++) {
 		d->mask_buf[i] =3D d->mask_buf_def[i];
+		if (!chip->mask_base)
+			continue;
+
 		reg =3D chip->mask_base +
 			(i * map->reg_stride * d->irq_reg_stride);
 		if (chip->mask_invert)
--=20
2.19.2
