From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2 20/22] gpu: host1x: Remove unused host1x_cdma_stop() definition
Date: Wed, 14 Jun 2017 02:15:59 +0300
Message-ID: <376aaecdbcda29b8a65776f2b1364b8aa40426ab.1497394243.git.digetx@gmail.com>
References: <cover.1497394243.git.digetx@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1497394243.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1497394243.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1497394243.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, DRI Development <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

There is no host1x_cdma_stop() in the code, let's remove its definition
from the header file.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Reviewed-by: Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Reviewed-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/gpu/host1x/cdma.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/host1x/cdma.h b/drivers/gpu/host1x/cdma.h
index ec170a78f4e1..286d49386be9 100644
--- a/drivers/gpu/host1x/cdma.h
+++ b/drivers/gpu/host1x/cdma.h
@@ -88,7 +88,6 @@ struct host1x_cdma {
 
 int host1x_cdma_init(struct host1x_cdma *cdma);
 int host1x_cdma_deinit(struct host1x_cdma *cdma);
-void host1x_cdma_stop(struct host1x_cdma *cdma);
 int host1x_cdma_begin(struct host1x_cdma *cdma, struct host1x_job *job);
 void host1x_cdma_push(struct host1x_cdma *cdma, u32 op1, u32 op2);
 void host1x_cdma_end(struct host1x_cdma *cdma, struct host1x_job *job);
-- 
2.13.0
