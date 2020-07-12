From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/5] firmware: tegra: add return code checks and increase debugfs size
Date: Sun, 12 Jul 2020 11:01:14 +0100
Message-ID: <20200712100118.13343-2-jonathanh@nvidia.com>
References: <20200712100118.13343-1-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200712100118.13343-1-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Add checking of the BPMP-FW return code values for MRQ_DEBUGFS calls.

Also, development versions of the firmware may have debugfs with
directory structure larger than 256Kb. Hence increase the size of the
memory buffer to accommodate those firmware revisions.

And finally, ensure that no access outside of allocated memory buffer
happens in case BPMP-FW returns an invalid response size (nbytes) from
mrq_debugfs_dumpdir() call.

Signed-off-by: Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/firmware/tegra/bpmp-debugfs.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp-debugfs.c b/drivers/firmware/tegra/bpmp-debugfs.c
index 3f0a89ce131a..08e0f05f46c6 100644
--- a/drivers/firmware/tegra/bpmp-debugfs.c
+++ b/drivers/firmware/tegra/bpmp-debugfs.c
@@ -127,6 +127,8 @@ static int mrq_debugfs_read(struct tegra_bpmp *bpmp,
 	err = tegra_bpmp_transfer(bpmp, &msg);
 	if (err < 0)
 		return err;
+	else if (msg.rx.ret < 0)
+		return -EINVAL;
 
 	*nbytes = (size_t)resp.fop.nbytes;
 
@@ -184,6 +186,8 @@ static int mrq_debugfs_dumpdir(struct tegra_bpmp *bpmp, dma_addr_t addr,
 	err = tegra_bpmp_transfer(bpmp, &msg);
 	if (err < 0)
 		return err;
+	else if (msg.rx.ret < 0)
+		return -EINVAL;
 
 	*nbytes = (size_t)resp.dumpdir.nbytes;
 
@@ -374,7 +378,7 @@ int tegra_bpmp_init_debugfs(struct tegra_bpmp *bpmp)
 {
 	dma_addr_t phys;
 	void *virt;
-	const size_t sz = SZ_256K;
+	const size_t sz = SZ_512K;
 	size_t nbytes;
 	int ret;
 	struct dentry *root;
@@ -394,8 +398,12 @@ int tegra_bpmp_init_debugfs(struct tegra_bpmp *bpmp)
 	}
 
 	ret = mrq_debugfs_dumpdir(bpmp, phys, sz, &nbytes);
-	if (ret < 0)
+	if (ret < 0) {
+		goto free;
+	} else if (nbytes > sz) {
+		ret = -EINVAL;
 		goto free;
+	}
 
 	ret = create_debugfs_mirror(bpmp, virt, nbytes, root);
 free:
-- 
2.17.1
