From: Wei Yongjun <weiyj.lk-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] staging: nvec: fix the '&&' vs '&' typo in nvec_toggle_global_events()
Date: Sat, 16 Mar 2013 22:51:25 +0800
Message-ID: <CAPgLHd8rhMVb_cpVR6tiYsYTrOgk3m1PyR=Eo9L2_8bOGwwbag@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org, marvin24-Mmb7MZpHnFY@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org, ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>

Fix the '&&' vs '&' typo.

Signed-off-by: Wei Yongjun <yongjun_wei-zrsr2BFq86L20UzCJQGyNP8+0UxHXcjY@public.gmane.org>
---
 drivers/staging/nvec/nvec.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index cf15936..a88959f 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -352,10 +352,10 @@ static void nvec_toggle_global_events(struct nvec_chip *nvec, bool state)
  */
 static void nvec_event_mask(char *ev, u32 mask)
 {
-	ev[3] = mask >> 16 && 0xff;
-	ev[4] = mask >> 24 && 0xff;
-	ev[5] = mask >> 0  && 0xff;
-	ev[6] = mask >> 8  && 0xff;
+	ev[3] = mask >> 16 & 0xff;
+	ev[4] = mask >> 24 & 0xff;
+	ev[5] = mask >> 0  & 0xff;
+	ev[6] = mask >> 8  & 0xff;
 }
 
 /**
