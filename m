From: Mian Yousaf Kaukab <ykaukab@suse.de>
Subject: [PATCH 4/4] arm64: tegra194: add reserved-only flag in sysram node
Date: Tue, 12 May 2020 16:48:03 +0200
Message-ID: <20200512144803.24344-4-ykaukab@suse.de>
References: <20200512144803.24344-1-ykaukab@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200512144803.24344-1-ykaukab@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: swarren@wwwdotorg.org, robh+dt@kernel.org, robin.murphy@arm.com
Cc: devicetree@vger.kernel.org, talho@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, afaerber@suse.de, arnd@arndb.de, gregkh@linuxfoundation.org, Mian Yousaf Kaukab <ykaukab@suse.de>
List-Id: linux-tegra@vger.kernel.org

bpmp driver has reserved regions in sysram. Since sysram is only used
by the bpmp driver, add ‘reserved-only’ flag to the sysram node so
that only regions used by the bpmp driver are remapped. Other regions
of the sysram may not be accessible to the kernel and a speculative
access to them can cause SError.

Signed-off-by: Mian Yousaf Kaukab <ykaukab@suse.de>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index e1ae01c2d039..9a5276d9c2a6 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -1743,6 +1743,7 @@ sysram@40000000 {
 		#address-cells = <1>;
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x40000000 0x50000>;
+		reserved-only;
 
 		cpu_bpmp_tx: shmem@4e000 {
 			compatible = "nvidia,tegra194-bpmp-shmem";
-- 
2.25.0
