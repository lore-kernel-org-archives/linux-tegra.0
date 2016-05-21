From: Andrea Gelmini <andrea.gelmini-PT7Us6ch6G9eoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 0027/1529] Fix typo
Date: Sat, 21 May 2016 13:39:03 +0200
Message-ID: <20160521113903.32705-1-andrea.gelmini@gelma.net>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: andrea.gelmini-PT7Us6ch6G9eoWH0uzbU5w@public.gmane.org
Cc: trivial-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Andrea Gelmini <andrea.gelmini-PT7Us6ch6G9eoWH0uzbU5w@public.gmane.org>
---
 Documentation/devicetree/bindings/phy/nvidia,tegra20-usb-phy.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra20-usb-phy.txt b/Documentation/devicetree/bindings/phy/nvidia,tegra20-usb-phy.txt
index a9aa79f..3298af3 100644
--- a/Documentation/devicetree/bindings/phy/nvidia,tegra20-usb-phy.txt
+++ b/Documentation/devicetree/bindings/phy/nvidia,tegra20-usb-phy.txt
@@ -39,7 +39,7 @@ Required PHY timing params for utmi phy, for all chips:
   - nvidia,elastic-limit : Variable FIFO Depth of elastic input store
   - nvidia,idle-wait-delay : Number of 480 Mhz clock cycles of idle to wait
     before declare IDLE.
-  - nvidia,term-range-adj : Range adjusment on terminations
+  - nvidia,term-range-adj : Range adjustment on terminations
   - Either one of the following for HS driver output control:
     - nvidia,xcvr-setup : integer, uses the provided value.
     - nvidia,xcvr-setup-use-fuses : boolean, indicates that the value is read
-- 
2.8.2.534.g1f66975
