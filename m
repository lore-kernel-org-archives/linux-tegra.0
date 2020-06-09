From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v4 24/37] dt-bindings: memory: tegra30: Add memory client IDs
Date: Tue,  9 Jun 2020 16:13:51 +0300
Message-ID: <20200609131404.17523-25-digetx@gmail.com>
References: <20200609131404.17523-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200609131404.17523-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>
Cc: =?UTF-8?q?Artur=20=C5=9Awigo=C5=84?= <a.swigon@samsung.com>, linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Each memory client have a unique hardware ID, this patch adds these IDs.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 include/dt-bindings/memory/tegra30-mc.h | 67 +++++++++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/include/dt-bindings/memory/tegra30-mc.h b/include/dt-bindings/memory/tegra30-mc.h
index 169f005fbc78..930f708aca17 100644
--- a/include/dt-bindings/memory/tegra30-mc.h
+++ b/include/dt-bindings/memory/tegra30-mc.h
@@ -41,4 +41,71 @@
 #define TEGRA30_MC_RESET_VDE		16
 #define TEGRA30_MC_RESET_VI		17
 
+#define TEGRA30_MC_PTCR			0
+#define TEGRA30_MC_DISPLAY0A		1
+#define TEGRA30_MC_DISPLAY0AB		2
+#define TEGRA30_MC_DISPLAY0B		3
+#define TEGRA30_MC_DISPLAY0BB		4
+#define TEGRA30_MC_DISPLAY0C		5
+#define TEGRA30_MC_DISPLAY0CB		6
+#define TEGRA30_MC_DISPLAY1B		7
+#define TEGRA30_MC_DISPLAY1BB		8
+#define TEGRA30_MC_EPPUP		9
+#define TEGRA30_MC_G2PR			10
+#define TEGRA30_MC_G2SR			11
+#define TEGRA30_MC_MPEUNIFBR		12
+#define TEGRA30_MC_VIRUV		13
+#define TEGRA30_MC_AFIR			14
+#define TEGRA30_MC_AVPCARM7R		15
+#define TEGRA30_MC_DISPLAYHC		16
+#define TEGRA30_MC_DISPLAYHCB		17
+#define TEGRA30_MC_FDCDRD		18
+#define TEGRA30_MC_FDCDRD2		19
+#define TEGRA30_MC_G2DR			20
+#define TEGRA30_MC_HDAR			21
+#define TEGRA30_MC_HOST1XDMAR		22
+#define TEGRA30_MC_HOST1XR		23
+#define TEGRA30_MC_IDXSRD		24
+#define TEGRA30_MC_IDXSRD2		25
+#define TEGRA30_MC_MPE_IPRED		26
+#define TEGRA30_MC_MPEAMEMRD		27
+#define TEGRA30_MC_MPECSRD		28
+#define TEGRA30_MC_PPCSAHBDMAR		29
+#define TEGRA30_MC_PPCSAHBSLVR		30
+#define TEGRA30_MC_SATAR		31
+#define TEGRA30_MC_TEXSRD		32
+#define TEGRA30_MC_TEXSRD2		33
+#define TEGRA30_MC_VDEBSEVR		34
+#define TEGRA30_MC_VDEMBER		35
+#define TEGRA30_MC_VDEMCER		36
+#define TEGRA30_MC_VDETPER		37
+#define TEGRA30_MC_MPCORELPR		38
+#define TEGRA30_MC_MPCORER		39
+#define TEGRA30_MC_EPPU			40
+#define TEGRA30_MC_EPPV			41
+#define TEGRA30_MC_EPPY			42
+#define TEGRA30_MC_MPEUNIFBW		43
+#define TEGRA30_MC_VIWSB		44
+#define TEGRA30_MC_VIWU			45
+#define TEGRA30_MC_VIWV			46
+#define TEGRA30_MC_VIWY			47
+#define TEGRA30_MC_G2DW			48
+#define TEGRA30_MC_AFIW			49
+#define TEGRA30_MC_AVPCARM7W		50
+#define TEGRA30_MC_FDCDWR		51
+#define TEGRA30_MC_FDCDWR2		52
+#define TEGRA30_MC_HDAW			53
+#define TEGRA30_MC_HOST1XW		54
+#define TEGRA30_MC_ISPW			55
+#define TEGRA30_MC_MPCORELPW		56
+#define TEGRA30_MC_MPCOREW		57
+#define TEGRA30_MC_MPECSWR		58
+#define TEGRA30_MC_PPCSAHBDMAW		59
+#define TEGRA30_MC_PPCSAHBSLVW		60
+#define TEGRA30_MC_SATAW		61
+#define TEGRA30_MC_VDEBSEVW		62
+#define TEGRA30_MC_VDEDBGW		63
+#define TEGRA30_MC_VDEMBEW		64
+#define TEGRA30_MC_VDETPMW		65
+
 #endif
-- 
2.26.0
