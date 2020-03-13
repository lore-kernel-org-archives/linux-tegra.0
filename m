From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1] memory: tegra: Make debugfs permissions human-readable
Date: Fri, 13 Mar 2020 11:57:39 +0300
Message-ID: <20200313085739.20172-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Replace the symbolic permissions with octals in order to make them
readable.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/memory/tegra/tegra124-emc.c | 6 +++---
 drivers/memory/tegra/tegra20-emc.c  | 6 +++---
 drivers/memory/tegra/tegra30-emc.c  | 6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/memory/tegra/tegra124-emc.c b/drivers/memory/tegra/tegra124-emc.c
index 33b8216bac30..d19fb7ae230d 100644
--- a/drivers/memory/tegra/tegra124-emc.c
+++ b/drivers/memory/tegra/tegra124-emc.c
@@ -1178,11 +1178,11 @@ static void emc_debugfs_init(struct device *dev, struct tegra_emc *emc)
 		return;
 	}
 
-	debugfs_create_file("available_rates", S_IRUGO, emc->debugfs.root, emc,
+	debugfs_create_file("available_rates", 0444, emc->debugfs.root, emc,
 			    &tegra_emc_debug_available_rates_fops);
-	debugfs_create_file("min_rate", S_IRUGO | S_IWUSR, emc->debugfs.root,
+	debugfs_create_file("min_rate", 0644, emc->debugfs.root,
 			    emc, &tegra_emc_debug_min_rate_fops);
-	debugfs_create_file("max_rate", S_IRUGO | S_IWUSR, emc->debugfs.root,
+	debugfs_create_file("max_rate", 0644, emc->debugfs.root,
 			    emc, &tegra_emc_debug_max_rate_fops);
 }
 
diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
index b16715e9515d..f74dd417c874 100644
--- a/drivers/memory/tegra/tegra20-emc.c
+++ b/drivers/memory/tegra/tegra20-emc.c
@@ -647,11 +647,11 @@ static void tegra_emc_debugfs_init(struct tegra_emc *emc)
 		return;
 	}
 
-	debugfs_create_file("available_rates", S_IRUGO, emc->debugfs.root,
+	debugfs_create_file("available_rates", 0444, emc->debugfs.root,
 			    emc, &tegra_emc_debug_available_rates_fops);
-	debugfs_create_file("min_rate", S_IRUGO | S_IWUSR, emc->debugfs.root,
+	debugfs_create_file("min_rate", 0644, emc->debugfs.root,
 			    emc, &tegra_emc_debug_min_rate_fops);
-	debugfs_create_file("max_rate", S_IRUGO | S_IWUSR, emc->debugfs.root,
+	debugfs_create_file("max_rate", 0644, emc->debugfs.root,
 			    emc, &tegra_emc_debug_max_rate_fops);
 }
 
diff --git a/drivers/memory/tegra/tegra30-emc.c b/drivers/memory/tegra/tegra30-emc.c
index b42bdb667e85..727dc7153390 100644
--- a/drivers/memory/tegra/tegra30-emc.c
+++ b/drivers/memory/tegra/tegra30-emc.c
@@ -1275,11 +1275,11 @@ static void tegra_emc_debugfs_init(struct tegra_emc *emc)
 		return;
 	}
 
-	debugfs_create_file("available_rates", S_IRUGO, emc->debugfs.root,
+	debugfs_create_file("available_rates", 0444, emc->debugfs.root,
 			    emc, &tegra_emc_debug_available_rates_fops);
-	debugfs_create_file("min_rate", S_IRUGO | S_IWUSR, emc->debugfs.root,
+	debugfs_create_file("min_rate", 0644, emc->debugfs.root,
 			    emc, &tegra_emc_debug_min_rate_fops);
-	debugfs_create_file("max_rate", S_IRUGO | S_IWUSR, emc->debugfs.root,
+	debugfs_create_file("max_rate", 0644, emc->debugfs.root,
 			    emc, &tegra_emc_debug_max_rate_fops);
 }
 
-- 
2.25.1
