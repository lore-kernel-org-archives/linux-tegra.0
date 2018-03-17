From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 3/5] media: staging: tegra-vde: Correct minimum size of U/V
 planes
Date: Sat, 17 Mar 2018 18:28:13 +0300
Message-ID: <419bd84d9a3e098d5796a6ce74be25be5381f544.1521300358.git.digetx@gmail.com>
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

Stride of U/V planes must be aligned to 16 bytes (2 macroblocks). This
needs to be taken into account, otherwise it is possible to get a silent
memory corruption if dmabuf size is less than the size of decoded video
frame.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/staging/media/tegra-vde/tegra-vde.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-vde/tegra-vde.c b/drivers/staging/media/tegra-vde/tegra-vde.c
index 14899c887d58..94b4db55cdb5 100644
--- a/drivers/staging/media/tegra-vde/tegra-vde.c
+++ b/drivers/staging/media/tegra-vde/tegra-vde.c
@@ -602,12 +602,12 @@ static int tegra_vde_attach_dmabufs_to_frame(struct device *dev,
 					     struct tegra_vde_h264_frame *src,
 					     enum dma_data_direction dma_dir,
 					     bool baseline_profile,
-					     size_t csize)
+					     size_t lsize, size_t csize)
 {
 	int err;
 
 	err = tegra_vde_attach_dmabuf(dev, src->y_fd,
-				      src->y_offset, csize * 4, SZ_256,
+				      src->y_offset, lsize, SZ_256,
 				      &frame->y_dmabuf_attachment,
 				      &frame->y_addr,
 				      &frame->y_sgt,
@@ -773,9 +773,11 @@ static int tegra_vde_ioctl_decode_h264(struct tegra_vde *vde,
 	enum dma_data_direction dma_dir;
 	dma_addr_t bitstream_data_addr;
 	dma_addr_t bsev_ptr;
+	size_t lsize, csize;
 	size_t bitstream_data_size;
 	unsigned int macroblocks_nb;
 	unsigned int read_bytes;
+	unsigned int cstride;
 	unsigned int i;
 	long timeout;
 	int ret, err;
@@ -814,6 +816,10 @@ static int tegra_vde_ioctl_decode_h264(struct tegra_vde *vde,
 		goto free_dpb_frames;
 	}
 
+	cstride = ALIGN(ctx.pic_width_in_mbs * 8, 16);
+	csize = cstride * ctx.pic_height_in_mbs * 8;
+	lsize = macroblocks_nb * 256;
+
 	for (i = 0; i < ctx.dpb_frames_nb; i++) {
 		ret = tegra_vde_validate_frame(dev, &frames[i]);
 		if (ret)
@@ -827,7 +833,7 @@ static int tegra_vde_ioctl_decode_h264(struct tegra_vde *vde,
 		ret = tegra_vde_attach_dmabufs_to_frame(dev, &dpb_frames[i],
 							&frames[i], dma_dir,
 							ctx.baseline_profile,
-							macroblocks_nb * 64);
+							lsize, csize);
 		if (ret)
 			goto release_dpb_frames;
 	}
-- 
2.16.1
