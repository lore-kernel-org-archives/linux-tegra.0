From: Ashish Mhetre <amhetre@nvidia.com>
Subject: [PATCH] kernfs: Add check for NULL pointer before writing to it.
Date: Tue, 20 Nov 2018 14:08:39 +0530
Message-ID: <1542703119-20353-1-git-send-email-amhetre@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: tj@kernel.org, linux-kernel@vger.kernel.org
Cc: linux-tegra@vger.kernel.org, vdumpa@nvidia.com, Snikam@nvidia.com, Bo Yan <byan@nvidia.com>, Ashish Mhetre <amhetre@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Bo Yan <byan@nvidia.com>

The strlcpy function returns the length of source pointer when the
requested size is 0. This behavior is relied upon for sched tracing.
We can't simply return when buf is 0, but we have to protect against the
scenario when buf is 0 and requested size is non-zero, in which case the
strlcpy would lead to illegal memory access.
This issue is reported by coverity as strlcpy might end up using a NULL
buffer and non-zero buf_length value.
To avoid this, add check and return -EINVAL in this case.

Signed-off-by: Bo Yan <byan@nvidia.com>
Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
---
 fs/kernfs/dir.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
index 4ca0b5c..76c85a5 100644
--- a/fs/kernfs/dir.c
+++ b/fs/kernfs/dir.c
@@ -129,6 +129,9 @@ static int kernfs_path_from_node_locked(struct kernfs_node *kn_to,
 	size_t depth_from, depth_to, len = 0;
 	int i, j;
 
+	if (WARN_ON(!buf && buflen > 0))
+		return -EINVAL;
+
 	if (!kn_to)
 		return strlcpy(buf, "(null)", buflen);
 
-- 
2.7.4
