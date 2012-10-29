From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH V2 3/4] ARM: tegra: dts: cardhu: enable SLINK4
Date: Mon, 29 Oct 2012 22:49:39 +0530
Message-ID: <1351531180-1652-4-git-send-email-ldewangan@nvidia.com>
References: <1351531180-1652-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1351531180-1652-1-git-send-email-ldewangan@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: swarren@wwwdotorg.org, linux@arm.linux.org.uk
Cc: linux-tegra@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Enable SLINK4 in Tegra30 based platform Cardhu.
Setting maximum spi frequency to 25MHz.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
Changes from V1:
rename the max freq prop to spi-max-frequency
 arch/arm/boot/dts/tegra30-cardhu.dtsi |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/tegra30-cardhu.dtsi b/arch/arm/boot/dts/tegra30-cardhu.dtsi
index b245e6c..1bd73ea 100644
--- a/arch/arm/boot/dts/tegra30-cardhu.dtsi
+++ b/arch/arm/boot/dts/tegra30-cardhu.dtsi
@@ -275,6 +275,11 @@
 		};
 	};
 
+	slink@7000da00 {
+		status = "okay";
+		spi-max-frequency = <25000000>;
+	};
+
 	ahub {
 		i2s@70080400 {
 			status = "okay";
-- 
1.7.1.1
