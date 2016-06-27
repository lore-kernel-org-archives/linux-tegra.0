From: Joseph Lo <josephl@nvidia.com>
Subject: [PATCH 06/10] soc/tegra: Add Tegra186 support
Date: Mon, 27 Jun 2016 17:02:44 +0800
Message-ID: <20160627090248.23621-7-josephl@nvidia.com>
References: <20160627090248.23621-1-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20160627090248.23621-1-josephl@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Jassi Brar <jassisinghbrar@gmail.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org, Matthew Longnecker <MLongnecker@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The Tegra186 has a combination of Denver and Cortex-A57 CPU cores and
GPUs with Pascal architecture on it. It features with ADSP with
Cortex-A9 CPU for audio processing, hardware video encoder/decoder with
multi-format support, ISP for image capture processing and BPMP for the
power managements.

Signed-off-by: Joseph Lo <josephl@nvidia.com>
---
 drivers/soc/tegra/Kconfig | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/soc/tegra/Kconfig b/drivers/soc/tegra/Kconfig
index 03089ad2fc65..88a71dfd466c 100644
--- a/drivers/soc/tegra/Kconfig
+++ b/drivers/soc/tegra/Kconfig
@@ -61,6 +61,20 @@ config ARCH_TEGRA_132_SOC
 	  but contains an NVIDIA Denver CPU complex in place of
 	  Tegra124's "4+1" Cortex-A15 CPU complex.
 
+config ARCH_TEGRA_186_SOC
+	bool "NVIDIA Tegra186 SoC"
+	select MAILBOX
+	select TEGRA_BPMP
+	select TEGRA_HSP_MBOX
+	select TEGRA_IVC
+	help
+	  Enable support for the NVIDIA Tegar186 SoC. The Tegra186 has a
+	  combination of Denver and Cortex-A57 CPU cores and GPUs with Pascal
+	  architecture on it. It features with ADSP with Cortex-A9 CPU for
+	  audio processing, hardware video encoder/decoder with multi-format
+	  support, ISP for image capture processing and BPMP for the power
+	  managements.
+
 config ARCH_TEGRA_210_SOC
 	bool "NVIDIA Tegra210 SoC"
 	select PINCTRL_TEGRA210
-- 
2.9.0
