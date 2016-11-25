From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] arm64: tegra: Add missing Smaug revision
Date: Fri, 25 Nov 2016 08:18:28 +0100
Message-ID: <20161125071828.29106-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The "google,smaug-rev2" string is missing from the compatible list of
Smaug's DT. The differences of rev2 are not relevant at our current
level of support and it boots just fine, so add it.

Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Acked-by: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Hi ARM SoC maintainers,

here's another stray patch that fell through the cracks, can we please get
it applied for v4.10-rc1?

Thanks,
Thierry

 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index c2becb603e11..7703227f5d1a 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -11,7 +11,8 @@
 	compatible = "google,smaug-rev8", "google,smaug-rev7",
 		     "google,smaug-rev6", "google,smaug-rev5",
 		     "google,smaug-rev4", "google,smaug-rev3",
-		     "google,smaug-rev1", "google,smaug", "nvidia,tegra210";
+		     "google,smaug-rev2", "google,smaug-rev1",
+		     "google,smaug", "nvidia,tegra210";
 
 	aliases {
 		serial0 = &uarta;
-- 
2.10.2
