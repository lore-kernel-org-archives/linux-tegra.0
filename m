From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 08/29] dt-bindings: interconnect: tegra: Add initial IDs
Date: Mon, 18 Nov 2019 23:02:26 +0300
Message-ID: <20191118200247.3567-9-digetx@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191118200247.3567-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Define interconnect IDs for memory controller (MC), external memory
controller (EMC), external memory (EMEM) and memory clients of display
controllers (DC).

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 include/dt-bindings/interconnect/tegra-icc.h | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 include/dt-bindings/interconnect/tegra-icc.h

diff --git a/include/dt-bindings/interconnect/tegra-icc.h b/include/dt-bindings/interconnect/tegra-icc.h
new file mode 100644
index 000000000000..e6b6a819434a
--- /dev/null
+++ b/include/dt-bindings/interconnect/tegra-icc.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef DT_BINDINGS_ICC_TEGRA_H
+#define DT_BINDINGS_ICC_TEGRA_H
+
+#define TEGRA_ICC_EMC			0
+#define TEGRA_ICC_EMEM			1
+#define TEGRA_ICC_MC			2
+#define TEGRA_ICC_MC_DC			3
+#define TEGRA_ICC_MC_DCB		4
+
+#endif
-- 
2.23.0
