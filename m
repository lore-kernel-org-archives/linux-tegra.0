From: Joseph Lo <josephl@nvidia.com>
Subject: [PATCH V2 21/21] arm64: defconfig: Enable MAX8973 regulator
Date: Thu, 13 Dec 2018 17:34:38 +0800
Message-ID: <20181213093438.29621-22-josephl@nvidia.com>
References: <20181213093438.29621-1-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181213093438.29621-1-josephl@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Joseph Lo <josephl@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The Tegra210 Smaug board uses MAX77621 for both CPU & GPU rail. Note
that max8973 and max77621 share the same driver. So enable this driver
for the PMIC.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>
---
*V2:
 - add ack tag
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5c2b1f6842f8..8dab129395a1 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -420,6 +420,7 @@ CONFIG_REGULATOR_GPIO=y
 CONFIG_REGULATOR_HI6421V530=y
 CONFIG_REGULATOR_HI655X=y
 CONFIG_REGULATOR_MAX77620=y
+CONFIG_REGULATOR_MAX8973=y
 CONFIG_REGULATOR_PWM=y
 CONFIG_REGULATOR_QCOM_RPMH=y
 CONFIG_REGULATOR_QCOM_SMD_RPM=y
-- 
2.19.2
