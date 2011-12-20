From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [RFC 5/7] arm: tegra: Provide clock for only one PWM controller.
Date: Tue, 20 Dec 2011 11:32:16 +0100
Message-ID: <1324377138-32129-6-git-send-email-thierry.reding@avionic-design.de>
References: <1324377138-32129-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1324377138-32129-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

A subsequent patch will add a generic PWM API driver for the Tegra2 PWFM
controller, supporting all four PWM devices with a single PWM chip. The
device will be named tegra-pwm and only one clock needs to be provided.

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 arch/arm/mach-tegra/tegra2_clocks.c |    5 +----
 1 files changed, 1 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-tegra/tegra2_clocks.c b/arch/arm/mach-tegra/tegra2_clocks.c
index 21729fa..a5fb09a 100644
--- a/arch/arm/mach-tegra/tegra2_clocks.c
+++ b/arch/arm/mach-tegra/tegra2_clocks.c
@@ -2252,10 +2252,7 @@ static struct clk_duplicate tegra_clk_duplicates[] = {
 	CLK_DUPLICATE("usbd", "tegra-otg", NULL),
 	CLK_DUPLICATE("hdmi", "tegradc.0", "hdmi"),
 	CLK_DUPLICATE("hdmi", "tegradc.1", "hdmi"),
-	CLK_DUPLICATE("pwm", "tegra_pwm.0", NULL),
-	CLK_DUPLICATE("pwm", "tegra_pwm.1", NULL),
-	CLK_DUPLICATE("pwm", "tegra_pwm.2", NULL),
-	CLK_DUPLICATE("pwm", "tegra_pwm.3", NULL),
+	CLK_DUPLICATE("pwm", "tegra-pwm", NULL),
 	CLK_DUPLICATE("host1x", "tegra_grhost", "host1x"),
 	CLK_DUPLICATE("2d", "tegra_grhost", "gr2d"),
 	CLK_DUPLICATE("3d", "tegra_grhost", "gr3d"),
-- 
1.7.8
