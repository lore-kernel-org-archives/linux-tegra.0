From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v2 1/3] drm/ttm: recognize ARM arch in ioprot handler
Date: Tue, 24 Jun 2014 18:54:25 +0900
Message-ID: <1403603667-11302-2-git-send-email-acourbot@nvidia.com>
References: <1403603667-11302-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1403603667-11302-1-git-send-email-acourbot@nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>, Lucas Stach <dev@lynxeye.de>, Thierry Reding <thierry.reding@gmail.com>
Cc: gnurou@gmail.com, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

From: Lucas Stach <dev@lynxeye.de>

Signed-off-by: Lucas Stach <dev@lynxeye.de>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 1df856f78568..30e5d90cb7bc 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -500,7 +500,7 @@ pgprot_t ttm_io_prot(uint32_t caching_flags, pgprot_t tmp)
 			pgprot_val(tmp) |= _PAGE_GUARDED;
 	}
 #endif
-#if defined(__ia64__)
+#if defined(__ia64__) || defined(__arm__)
 	if (caching_flags & TTM_PL_FLAG_WC)
 		tmp = pgprot_writecombine(tmp);
 	else
-- 
2.0.0
