From: Tuomas Tynkkynen <ttynkkynen@nvidia.com>
Subject: [PATCH v4 15/16] ARM: tegra: Add CPU regulator to the Jetson TK1 device tree
Date: Thu, 21 Aug 2014 00:04:43 +0300
Message-ID: <1408568684-11016-16-git-send-email-ttynkkynen@nvidia.com>
References: <1408568684-11016-1-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1408568684-11016-1-git-send-email-ttynkkynen@nvidia.com>
Sender: linux-pm-owner@vger.kernel.org
To: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Cc: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Mike Turquette <mturquette@linaro.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Paul Walmsley <pwalmsley@nvidia.com>, Vince Hsu <vinceh@nvidia.com>, devicetree@vger.kernel.org, Tuomas Tynkkynen <ttynkkynen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add the CPU voltage regulator for the cpufreq driver.

Signed-off-by: Tuomas Tynkkynen <ttynkkynen@nvidia.com>
---
v3: New patch
---
 arch/arm/boot/dts/tegra124-jetson-tk1.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/tegra124-jetson-tk1.dts b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
index 04134da..5250be5 100644
--- a/arch/arm/boot/dts/tegra124-jetson-tk1.dts
+++ b/arch/arm/boot/dts/tegra124-jetson-tk1.dts
@@ -1890,3 +1890,7 @@
 		};
 	};
 };
+
+&cpu0 {
+	vdd-cpu-supply = <&vdd_cpu>;
+};
-- 
1.8.1.5

