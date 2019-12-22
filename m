From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 01/13] dt-bindings: memory: Add Tegra186 memory client IDs
Date: Sun, 22 Dec 2019 15:10:23 +0100
Message-ID: <20191222141035.1649937-2-thierry.reding@gmail.com>
References: <20191222141035.1649937-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191222141035.1649937-1-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Add IDs for the memory clients found on NVIDIA Tegra186 SoCs. This will
be used to describe interconnect paths from devices to system memory.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 include/dt-bindings/memory/tegra186-mc.h | 139 +++++++++++++++++++++++
 1 file changed, 139 insertions(+)

diff --git a/include/dt-bindings/memory/tegra186-mc.h b/include/dt-bindings/memory/tegra186-mc.h
index 64813536aec9..82a1e27f7357 100644
--- a/include/dt-bindings/memory/tegra186-mc.h
+++ b/include/dt-bindings/memory/tegra186-mc.h
@@ -108,4 +108,143 @@
 #define TEGRA186_SID_SE_VM6		0x4e
 #define TEGRA186_SID_SE_VM7		0x4f
 
+/*
+ * memory client IDs
+ */
+
+/* Misses from System Memory Management Unit (SMMU) Page Table Cache (PTC) */
+#define TEGRA186_MEMORY_CLIENT_PTCR 0x00
+/* PCIE reads */
+#define TEGRA186_MEMORY_CLIENT_AFIR 0x0e
+/* High-definition audio (HDA) reads */
+#define TEGRA186_MEMORY_CLIENT_HDAR 0x15
+/* Host channel data reads */
+#define TEGRA186_MEMORY_CLIENT_HOST1XDMAR 0x16
+#define TEGRA186_MEMORY_CLIENT_NVENCSRD 0x1c
+/* SATA reads */
+#define TEGRA186_MEMORY_CLIENT_SATAR 0x1f
+/* Reads from Cortex-A9 4 CPU cores via the L2 cache */
+#define TEGRA186_MEMORY_CLIENT_MPCORER 0x27
+#define TEGRA186_MEMORY_CLIENT_NVENCSWR 0x2b
+/* PCIE writes */
+#define TEGRA186_MEMORY_CLIENT_AFIW 0x31
+/* High-definition audio (HDA) writes */
+#define TEGRA186_MEMORY_CLIENT_HDAW 0x35
+/* Writes from Cortex-A9 4 CPU cores via the L2 cache */
+#define TEGRA186_MEMORY_CLIENT_MPCOREW 0x39
+/* SATA writes */
+#define TEGRA186_MEMORY_CLIENT_SATAW 0x3d
+/* ISP Read client for Crossbar A */
+#define TEGRA186_MEMORY_CLIENT_ISPRA 0x44
+/* ISP Write client for Crossbar A */
+#define TEGRA186_MEMORY_CLIENT_ISPWA 0x46
+/* ISP Write client Crossbar B */
+#define TEGRA186_MEMORY_CLIENT_ISPWB 0x47
+/* XUSB reads */
+#define TEGRA186_MEMORY_CLIENT_XUSB_HOSTR 0x4a
+/* XUSB_HOST writes */
+#define TEGRA186_MEMORY_CLIENT_XUSB_HOSTW 0x4b
+/* XUSB reads */
+#define TEGRA186_MEMORY_CLIENT_XUSB_DEVR 0x4c
+/* XUSB_DEV writes */
+#define TEGRA186_MEMORY_CLIENT_XUSB_DEVW 0x4d
+/* TSEC Memory Return Data Client Description */
+#define TEGRA186_MEMORY_CLIENT_TSECSRD 0x54
+/* TSEC Memory Write Client Description */
+#define TEGRA186_MEMORY_CLIENT_TSECSWR 0x55
+/* 3D, ltcx reads instance 0 */
+#define TEGRA186_MEMORY_CLIENT_GPUSRD 0x58
+/* 3D, ltcx writes instance 0 */
+#define TEGRA186_MEMORY_CLIENT_GPUSWR 0x59
+/* sdmmca memory read client */
+#define TEGRA186_MEMORY_CLIENT_SDMMCRA 0x60
+/* sdmmcbmemory read client */
+#define TEGRA186_MEMORY_CLIENT_SDMMCRAA 0x61
+/* sdmmc memory read client */
+#define TEGRA186_MEMORY_CLIENT_SDMMCR 0x62
+/* sdmmcd memory read client */
+#define TEGRA186_MEMORY_CLIENT_SDMMCRAB 0x63
+/* sdmmca memory write client */
+#define TEGRA186_MEMORY_CLIENT_SDMMCWA 0x64
+/* sdmmcb memory write client */
+#define TEGRA186_MEMORY_CLIENT_SDMMCWAA 0x65
+/* sdmmc memory write client */
+#define TEGRA186_MEMORY_CLIENT_SDMMCW 0x66
+/* sdmmcd memory write client */
+#define TEGRA186_MEMORY_CLIENT_SDMMCWAB 0x67
+#define TEGRA186_MEMORY_CLIENT_VICSRD 0x6c
+#define TEGRA186_MEMORY_CLIENT_VICSWR 0x6d
+/* VI Write client */
+#define TEGRA186_MEMORY_CLIENT_VIW 0x72
+#define TEGRA186_MEMORY_CLIENT_NVDECSRD 0x78
+#define TEGRA186_MEMORY_CLIENT_NVDECSWR 0x79
+/* Audio Processing (APE) engine reads */
+#define TEGRA186_MEMORY_CLIENT_APER 0x7a
+/* Audio Processing (APE) engine writes */
+#define TEGRA186_MEMORY_CLIENT_APEW 0x7b
+#define TEGRA186_MEMORY_CLIENT_NVJPGSRD 0x7e
+#define TEGRA186_MEMORY_CLIENT_NVJPGSWR 0x7f
+/* SE Memory Return Data Client Description */
+#define TEGRA186_MEMORY_CLIENT_SESRD 0x80
+/* SE Memory Write Client Description */
+#define TEGRA186_MEMORY_CLIENT_SESWR 0x81
+/* ETR reads */
+#define TEGRA186_MEMORY_CLIENT_ETRR 0x84
+/* ETR writes */
+#define TEGRA186_MEMORY_CLIENT_ETRW 0x85
+/* TSECB Memory Return Data Client Description */
+#define TEGRA186_MEMORY_CLIENT_TSECSRDB 0x86
+/* TSECB Memory Write Client Description */
+#define TEGRA186_MEMORY_CLIENT_TSECSWRB 0x87
+/* 3D, ltcx reads instance 1 */
+#define TEGRA186_MEMORY_CLIENT_GPUSRD2 0x88
+/* 3D, ltcx writes instance 1 */
+#define TEGRA186_MEMORY_CLIENT_GPUSWR2 0x89
+/* AXI Switch read client */
+#define TEGRA186_MEMORY_CLIENT_AXISR 0x8c
+/* AXI Switch write client */
+#define TEGRA186_MEMORY_CLIENT_AXISW 0x8d
+/* EQOS read client */
+#define TEGRA186_MEMORY_CLIENT_EQOSR 0x8e
+/* EQOS write client */
+#define TEGRA186_MEMORY_CLIENT_EQOSW 0x8f
+/* UFSHC read client */
+#define TEGRA186_MEMORY_CLIENT_UFSHCR 0x90
+/* UFSHC write client */
+#define TEGRA186_MEMORY_CLIENT_UFSHCW 0x91
+/* NVDISPLAY read client */
+#define TEGRA186_MEMORY_CLIENT_NVDISPLAYR 0x92
+/* BPMP read client */
+#define TEGRA186_MEMORY_CLIENT_BPMPR 0x93
+/* BPMP write client */
+#define TEGRA186_MEMORY_CLIENT_BPMPW 0x94
+/* BPMPDMA read client */
+#define TEGRA186_MEMORY_CLIENT_BPMPDMAR 0x95
+/* BPMPDMA write client */
+#define TEGRA186_MEMORY_CLIENT_BPMPDMAW 0x96
+/* AON read client */
+#define TEGRA186_MEMORY_CLIENT_AONR 0x97
+/* AON write client */
+#define TEGRA186_MEMORY_CLIENT_AONW 0x98
+/* AONDMA read client */
+#define TEGRA186_MEMORY_CLIENT_AONDMAR 0x99
+/* AONDMA write client */
+#define TEGRA186_MEMORY_CLIENT_AONDMAW 0x9a
+/* SCE read client */
+#define TEGRA186_MEMORY_CLIENT_SCER 0x9b
+/* SCE write client */
+#define TEGRA186_MEMORY_CLIENT_SCEW 0x9c
+/* SCEDMA read client */
+#define TEGRA186_MEMORY_CLIENT_SCEDMAR 0x9d
+/* SCEDMA write client */
+#define TEGRA186_MEMORY_CLIENT_SCEDMAW 0x9e
+/* APEDMA read client */
+#define TEGRA186_MEMORY_CLIENT_APEDMAR 0x9f
+/* APEDMA write client */
+#define TEGRA186_MEMORY_CLIENT_APEDMAW 0xa0
+/* NVDISPLAY read client instance 2 */
+#define TEGRA186_MEMORY_CLIENT_NVDISPLAYR1 0xa1
+#define TEGRA186_MEMORY_CLIENT_VICSRD1 0xa2
+#define TEGRA186_MEMORY_CLIENT_NVDECSRD1 0xa3
+
 #endif
-- 
2.24.1
