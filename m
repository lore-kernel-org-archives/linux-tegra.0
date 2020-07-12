From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/2] cpufreq: tegra186: Simplify probe return path
Date: Sun, 12 Jul 2020 11:06:45 +0100
Message-ID: <20200712100645.13927-2-jonathanh@nvidia.com>
References: <20200712100645.13927-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200712100645.13927-1-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "Rafael J . Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

We always put the reference to BPMP device on exit of the Tegra186
CPUFREQ driver and so there is no need to have separate exit paths
for success and failure. Therefore, simplify the probe return path
in the Tegra186 CPUFREQ driver by combining the success and failure
paths.

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/cpufreq/tegra186-cpufreq.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/cpufreq/tegra186-cpufreq.c b/drivers/cpufreq/tegra186-cpufreq.c
index c44190ce3f03..bf8cab357277 100644
--- a/drivers/cpufreq/tegra186-cpufreq.c
+++ b/drivers/cpufreq/tegra186-cpufreq.c
@@ -231,15 +231,9 @@ static int tegra186_cpufreq_probe(struct platform_device *pdev)
 		}
 	}
 
-	tegra_bpmp_put(bpmp);
-
 	tegra186_cpufreq_driver.driver_data = data;
 
 	err = cpufreq_register_driver(&tegra186_cpufreq_driver);
-	if (err)
-		return err;
-
-	return 0;
 
 put_bpmp:
 	tegra_bpmp_put(bpmp);
-- 
2.17.1
