From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/5] regulator: core: Clear the supply pointer if enabling fails
Date: Thu, 21 Apr 2016 17:11:58 +0100
Message-ID: <1461255121-5245-3-git-send-email-jonathanh@nvidia.com>
References: <1461255121-5245-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461255121-5245-1-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

During the resolution of a regulator's supply, we may attempt to enable
the supply if the regulator itself is already enabled. If enabling the
supply fails, then we will call _regulator_put() for the supply.
However, the pointer to the supply has not been cleared for the
regulator and this will cause a crash if we then unregister the
regulator and attempt to call regulator_put() a second time for the
supply. Fix this by clearing the supply pointer if enabling the supply
after fails when resolving the supply for a regulator.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/regulator/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index a0b52ef11c30..39d05fcc07e9 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -1545,6 +1545,7 @@ static int regulator_resolve_supply(struct regulator_dev *rdev)
 		ret = regulator_enable(rdev->supply);
 		if (ret < 0) {
 			_regulator_put(rdev->supply);
+			rdev->supply = NULL;
 			return ret;
 		}
 	}
-- 
2.1.4
