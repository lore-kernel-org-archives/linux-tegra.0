From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 2/5] media: staging: tegra-vde: Silence some of checkpatch
 warnings
Date: Sat, 17 Mar 2018 18:28:12 +0300
Message-ID: <9ec5460f88ac716d84cc626aa9e8d0a3c2e6acf3.1521300358.git.digetx@gmail.com>
References: <cover.1521300358.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <cover.1521300358.git.digetx@gmail.com>
In-Reply-To: <cover.1521300358.git.digetx@gmail.com>
References: <cover.1521300358.git.digetx@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Make all strings single line to make them grep'able and add a comment
to the memory barrier.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/staging/media/tegra-vde/tegra-vde.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/tegra-vde/tegra-vde.c b/drivers/staging/media/tegra-vde/tegra-vde.c
index c2ff2071b23c..14899c887d58 100644
--- a/drivers/staging/media/tegra-vde/tegra-vde.c
+++ b/drivers/staging/media/tegra-vde/tegra-vde.c
@@ -368,6 +368,11 @@ static int tegra_vde_setup_hw_context(struct tegra_vde *vde,
 	tegra_vde_setup_iram_tables(vde, dpb_frames,
 				    ctx->dpb_frames_nb - 1,
 				    ctx->dpb_ref_frames_with_earlier_poc_nb);
+
+	/*
+	 * The IRAM mapping is write-combine, ensure that CPU buffers have
+	 * been flushed at this point.
+	 */
 	wmb();
 
 	VDE_WR(0x00000000, vde->bsev + 0x8C);
@@ -542,15 +547,13 @@ static int tegra_vde_attach_dmabuf(struct device *dev,
 	}
 
 	if (dmabuf->size & (align_size - 1)) {
-		dev_err(dev, "Unaligned dmabuf 0x%zX, "
-			     "should be aligned to 0x%zX\n",
+		dev_err(dev, "Unaligned dmabuf 0x%zX, should be aligned to 0x%zX\n",
 			dmabuf->size, align_size);
 		return -EINVAL;
 	}
 
 	if ((u64)offset + min_size > dmabuf->size) {
-		dev_err(dev, "Too small dmabuf size %zu @0x%lX, "
-			     "should be at least %zu\n",
+		dev_err(dev, "Too small dmabuf size %zu @0x%lX, should be at least %zu\n",
 			dmabuf->size, offset, min_size);
 		return -EINVAL;
 	}
@@ -863,8 +866,7 @@ static int tegra_vde_ioctl_decode_h264(struct tegra_vde *vde,
 		macroblocks_nb = readl_relaxed(vde->sxe + 0xC8) & 0x1FFF;
 		read_bytes = bsev_ptr ? bsev_ptr - bitstream_data_addr : 0;
 
-		dev_err(dev, "Decoding failed: "
-				"read 0x%X bytes, %u macroblocks parsed\n",
+		dev_err(dev, "Decoding failed: read 0x%X bytes, %u macroblocks parsed\n",
 			read_bytes, macroblocks_nb);
 
 		ret = -EIO;
-- 
2.16.1
