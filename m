From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 28/29] ARM: multi_v7_defconfig: Enable NVIDIA Tegra interconnect providers
Date: Mon, 18 Nov 2019 23:02:46 +0300
Message-ID: <20191118200247.3567-29-digetx@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191118200247.3567-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Tegra now has interconnect providers that are used for memory bandwidth
allocation by display driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/configs/multi_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 293f0cea076c..c131d7969aa3 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1085,6 +1085,8 @@ CONFIG_FSI_MASTER_ASPEED=m
 CONFIG_FSI_SCOM=m
 CONFIG_FSI_SBEFIFO=m
 CONFIG_FSI_OCC=m
+CONFIG_INTERCONNECT=y
+CONFIG_INTERCONNECT_TEGRA=y
 CONFIG_EXT4_FS=y
 CONFIG_AUTOFS4_FS=y
 CONFIG_MSDOS_FS=y
-- 
2.23.0
