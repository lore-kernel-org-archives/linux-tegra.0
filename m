From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH] MAINTAINERS: Remove self from Tegra maintainers
Date: Mon, 6 Mar 2017 15:11:34 +0900
Message-ID: <20170306061134.21105-1-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, gnurou@gmail.com, Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

I have not been doing any Tegra maintainance work for a while, and this
is unlikely to change in the foreseeable future. Better reflect the
actual state of things by removing myself from the list.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index b0b731047263..6894d47de8c8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12313,7 +12313,6 @@ F:	drivers/media/rc/ttusbir.c
 
 TEGRA ARCHITECTURE SUPPORT
 M:	Thierry Reding <thierry.reding@gmail.com>
-M:	Alexandre Courbot <gnurou@gmail.com>
 M:	Jonathan Hunter <jonathanh@nvidia.com>
 L:	linux-tegra@vger.kernel.org
 Q:	http://patchwork.ozlabs.org/project/linux-tegra/list/
-- 
2.12.0
