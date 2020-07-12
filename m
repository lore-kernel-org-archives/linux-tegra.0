From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 3/5] firmware: tegra: Prepare for supporting in-band debugfs
Date: Sun, 12 Jul 2020 11:01:16 +0100
Message-ID: <20200712100118.13343-4-jonathanh@nvidia.com>
References: <20200712100118.13343-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200712100118.13343-1-jonathanh@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Currently, BPMP debug information is accessible via the Linux debugfs
file-system using a shared-memory scheme. More recent BPMP firmware now
supports accessing the debug information by in-band messaging which does
not require shared-memory. To prepare for adding in-band debugfs support
for the BPMP, move the shared-memory specific initialisation from the
tegra_bpmp_init_debugfs() into a sub-function.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/firmware/tegra/bpmp-debugfs.c | 53 ++++++++++++---------------
 1 file changed, 23 insertions(+), 30 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp-debugfs.c b/drivers/firmware/tegra/bpmp-debugfs.c
index f7bf19248d15..a1a1a3b9e667 100644
--- a/drivers/firmware/tegra/bpmp-debugfs.c
+++ b/drivers/firmware/tegra/bpmp-debugfs.c
@@ -354,32 +354,43 @@ static int bpmp_populate_dir(struct tegra_bpmp *bpmp, struct seqbuf *seqbuf,
 	return 0;
 }
 
-static int create_debugfs_mirror(struct tegra_bpmp *bpmp, void *buf,
-				 size_t bufsize, struct dentry *root)
+static int bpmp_populate_debugfs_shmem(struct tegra_bpmp *bpmp,
+				       struct dentry *root)
 {
 	struct seqbuf seqbuf;
+	const size_t sz = SZ_512K;
+	dma_addr_t phys;
+	size_t nbytes;
+	void *virt;
 	int err;
 
 	bpmp->debugfs_mirror = debugfs_create_dir("debug", root);
 	if (!bpmp->debugfs_mirror)
 		return -ENOMEM;
 
-	seqbuf_init(&seqbuf, buf, bufsize);
-	err = bpmp_populate_dir(bpmp, &seqbuf, bpmp->debugfs_mirror, 0);
+	virt = dma_alloc_coherent(bpmp->dev, sz, &phys,
+				  GFP_KERNEL | GFP_DMA32);
+	if (!virt)
+		return -ENOMEM;
+
+	err = mrq_debugfs_dumpdir(bpmp, phys, sz, &nbytes);
 	if (err < 0) {
-		debugfs_remove_recursive(bpmp->debugfs_mirror);
-		bpmp->debugfs_mirror = NULL;
+		goto free;
+	} else if (nbytes > sz) {
+		err = -EINVAL;
+		goto free;
 	}
 
+	seqbuf_init(&seqbuf, virt, nbytes);
+	err = bpmp_populate_dir(bpmp, &seqbuf, bpmp->debugfs_mirror, 0);
+free:
+	dma_free_coherent(bpmp->dev, sz, virt, phys);
+
 	return err;
 }
 
 int tegra_bpmp_init_debugfs(struct tegra_bpmp *bpmp)
 {
-	dma_addr_t phys;
-	void *virt;
-	const size_t sz = SZ_512K;
-	size_t nbytes;
 	struct dentry *root;
 	int err;
 
@@ -390,27 +401,9 @@ int tegra_bpmp_init_debugfs(struct tegra_bpmp *bpmp)
 	if (!root)
 		return -ENOMEM;
 
-	virt = dma_alloc_coherent(bpmp->dev, sz, &phys,
-				  GFP_KERNEL | GFP_DMA32);
-	if (!virt) {
-		err = -ENOMEM;
-		goto out;
-	}
-
-	err = mrq_debugfs_dumpdir(bpmp, phys, sz, &nbytes);
-	if (err < 0) {
-		goto free;
-	} else if (nbytes > sz) {
-		err = -EINVAL;
-		goto free;
-	}
-
-	err = create_debugfs_mirror(bpmp, virt, nbytes, root);
-free:
-	dma_free_coherent(bpmp->dev, sz, virt, phys);
-out:
+	err = bpmp_populate_debugfs_shmem(bpmp, root);
 	if (err < 0)
-		debugfs_remove(root);
+		debugfs_remove_recursive(root);
 
 	return err;
 }
-- 
2.17.1
