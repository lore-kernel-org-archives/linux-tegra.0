From: Prashant Gaikwad <pgaikwad@nvidia.com>
Subject: [PATCH 05/11] ARM: dt: tegra30: Add device node for APB MISC
Date: Sun, 23 Dec 2012 16:35:45 +0530
Message-ID: <1356260751-3667-6-git-send-email-pgaikwad@nvidia.com>
References: <1356260751-3667-1-git-send-email-pgaikwad@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1356260751-3667-1-git-send-email-pgaikwad@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: swarren@wwwdotorg.org, mturquette@linaro.org
Cc: linux-tegra@vger.kernel.org, Prashant Gaikwad <pgaikwad@nvidia.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

APB misc contains multiple registers required by different modules
such as CAR.

Signed-off-by: Prashant Gaikwad <pgaikwad@nvidia.com>
---
 arch/arm/boot/dts/tegra30.dtsi |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
index 74d607a..356c0bf 100644
--- a/arch/arm/boot/dts/tegra30.dtsi
+++ b/arch/arm/boot/dts/tegra30.dtsi
@@ -77,6 +77,11 @@
 		interrupt-controller;
 	};
 
+	apbmisc: apbmisc {
+		compatible = "nvidia,tegra30-apbmisc";
+		reg = <0x70000000 0x1000>;
+	};
+
 	pinmux: pinmux {
 		compatible = "nvidia,tegra30-pinmux";
 		reg = <0x70000868 0xd4    /* Pad control registers */
-- 
1.7.4.1
