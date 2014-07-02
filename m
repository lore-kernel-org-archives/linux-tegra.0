From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 1/4] drm/dsi: Add flag for continuous clock behavior
Date: Wed,  2 Jul 2014 21:19:17 +0900
Message-ID: <1404303560-32209-2-git-send-email-acourbot@nvidia.com>
References: <1404303560-32209-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <1404303560-32209-1-git-send-email-acourbot@nvidia.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Thierry Reding <thierry.reding@gmail.com>, Terje Bergstrom <tbergstrom@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-tegra@vger.kernel.org

As per section 5.6.1 of the DSI specification, all DSI transmitters must
support continuous clock behavior on the clock lane, while non-continuous
mode support is only optional. Add a flag that allows devices to indicate
that they require continuous clock mode to operate properly.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 include/drm/drm_mipi_dsi.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 944f33f..5913ef4 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -94,6 +94,8 @@ void mipi_dsi_host_unregister(struct mipi_dsi_host *host);
 #define MIPI_DSI_MODE_VSYNC_FLUSH	BIT(8)
 /* disable EoT packets in HS mode */
 #define MIPI_DSI_MODE_EOT_PACKET	BIT(9)
+/* use continuous clock behavior on the clock lane */
+#define MIPI_DSI_MODE_CLOCK_CONTINUOUS	BIT(10)
 
 enum mipi_dsi_pixel_format {
 	MIPI_DSI_FMT_RGB888,
-- 
2.0.0
