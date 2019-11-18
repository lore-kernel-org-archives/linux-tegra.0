From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 29/29] MAINTAINERS: Add maintainers for NVIDIA Tegra interconnect drivers
Date: Mon, 18 Nov 2019 23:02:47 +0300
Message-ID: <20191118200247.3567-30-digetx@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191118200247.3567-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Dmitry and Thierry will maintain NVIDIA Tegra interconnect drivers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 51bf69f520e8..fd82089edad6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8614,6 +8614,15 @@ F:	include/dt-bindings/interconnect/
 F:	include/linux/interconnect-provider.h
 F:	include/linux/interconnect.h
 
+INTERCONNECT DRIVERS FOR NVIDIA TEGRA
+R:	Dmitry Osipenko <digetx@gmail.com>
+S:	Thierry Reding <thierry.reding@gmail.com>
+L:	linux-pm@vger.kernel.org
+L:	linux-tegra@vger.kernel.org
+S:	Supported
+F:	drivers/interconnect/tegra/
+F:	include/dt-bindings/interconnect/tegra-icc.h
+
 INVENSENSE MPU-3050 GYROSCOPE DRIVER
 M:	Linus Walleij <linus.walleij@linaro.org>
 L:	linux-iio@vger.kernel.org
-- 
2.23.0
