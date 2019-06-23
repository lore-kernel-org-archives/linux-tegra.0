From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 11/11] PM / devfreq: tegra30: Add Dmitry as maintainer
Date: Mon, 24 Jun 2019 00:46:58 +0300
Message-ID: <20190623214658.11680-12-digetx@gmail.com>
References: <20190623214658.11680-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190623214658.11680-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

I was contributing to the NVIDIA Tegra30+ devfreq driver recently and want
to help keep it working and evolving in the future.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6c203278700f..ac347278f1fc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10214,6 +10214,14 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mzx/devfreq.git
 S:	Maintained
 F:	drivers/devfreq/tegra20-devfreq.c
 
+MEMORY FREQUENCY SCALING DRIVER FOR NVIDIA TEGRA30-TEGRA210
+M:	Dmitry Osipenko <digetx@gmail.com>
+L:	linux-pm@vger.kernel.org
+L:	linux-tegra@vger.kernel.org
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mzx/devfreq.git
+S:	Maintained
+F:	drivers/devfreq/tegra30-devfreq.c
+
 MEMORY MANAGEMENT
 L:	linux-mm@kvack.org
 W:	http://www.linux-mm.org
-- 
2.22.0
