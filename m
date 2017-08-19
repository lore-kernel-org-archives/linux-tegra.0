From: Bhumika Goyal <bhumirks-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 01/15] EDAC: make device_type const
Date: Sat, 19 Aug 2017 13:52:12 +0530
Message-ID: <1503130946-2854-2-git-send-email-bhumirks__47358.4723579281$1503131011$gmane$org@gmail.com>
References: <1503130946-2854-1-git-send-email-bhumirks@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1503130946-2854-1-git-send-email-bhumirks-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: julia.lawall-L2FTfq7BK8M@public.gmane.org, bp-Gina5bIWoIWzQB+pC5nmwQ@public.gmane.org, mchehab-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, daniel.vetter-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, seanpaul-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, g.liakhovetski-Mmb7MZpHnFY@public.gmane.org, tomas.winkler-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, richard-/L3Ra7n9ekc@public.gmane.org, cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org, peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, ohad-Ix1uc/W3ht7QT0dZR+AlfA@public.gmane.org, bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, freude-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org, schwidefsky-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org, heiko.carstens-tA70FqPdS9bQT0dZR+AlfA@public.gmane.org, jth-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jejb-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org, martin.petersen-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org, lduncan-IBi9RG/b67k@public.gmane.org, cleech-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, elder-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.orgheik
Cc: Bhumika Goyal <bhumirks-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Make these const as they are only stored in the type field of a device
structure, which is const.
Done using Coccinelle.

Signed-off-by: Bhumika Goyal <bhumirks-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/edac/edac_mc_sysfs.c | 8 ++++----
 drivers/edac/i7core_edac.c   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/edac/edac_mc_sysfs.c b/drivers/edac/edac_mc_sysfs.c
index dbc6446..e4fcfa8 100644
--- a/drivers/edac/edac_mc_sysfs.c
+++ b/drivers/edac/edac_mc_sysfs.c
@@ -304,7 +304,7 @@ static void csrow_attr_release(struct device *dev)
 	kfree(csrow);
 }
 
-static struct device_type csrow_attr_type = {
+static const struct device_type csrow_attr_type = {
 	.groups		= csrow_attr_groups,
 	.release	= csrow_attr_release,
 };
@@ -644,7 +644,7 @@ static void dimm_attr_release(struct device *dev)
 	kfree(dimm);
 }
 
-static struct device_type dimm_attr_type = {
+static const struct device_type dimm_attr_type = {
 	.groups		= dimm_attr_groups,
 	.release	= dimm_attr_release,
 };
@@ -920,7 +920,7 @@ static void mci_attr_release(struct device *dev)
 	kfree(mci);
 }
 
-static struct device_type mci_attr_type = {
+static const struct device_type mci_attr_type = {
 	.groups		= mci_attr_groups,
 	.release	= mci_attr_release,
 };
@@ -1074,7 +1074,7 @@ static void mc_attr_release(struct device *dev)
 	kfree(dev);
 }
 
-static struct device_type mc_attr_type = {
+static const struct device_type mc_attr_type = {
 	.release	= mc_attr_release,
 };
 /*
diff --git a/drivers/edac/i7core_edac.c b/drivers/edac/i7core_edac.c
index d36cc84..c16c3b9 100644
--- a/drivers/edac/i7core_edac.c
+++ b/drivers/edac/i7core_edac.c
@@ -1094,7 +1094,7 @@ static void addrmatch_release(struct device *device)
 	kfree(device);
 }
 
-static struct device_type addrmatch_type = {
+static const struct device_type addrmatch_type = {
 	.groups		= addrmatch_groups,
 	.release	= addrmatch_release,
 };
@@ -1125,7 +1125,7 @@ static void all_channel_counts_release(struct device *device)
 	kfree(device);
 }
 
-static struct device_type all_channel_counts_type = {
+static const struct device_type all_channel_counts_type = {
 	.groups		= all_channel_counts_groups,
 	.release	= all_channel_counts_release,
 };
-- 
1.9.1
