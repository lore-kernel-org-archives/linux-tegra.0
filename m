Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 008263D8068;
	Thu, 22 Jan 2026 16:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769098231; cv=none; b=r0gTbMh902IZoozb3NZmir4tYPfAr1JzKbeArZ2BgoMdqU9A/S04KqtDgwvj//F3T6yrin2xiPYZ98FqQ4RsK6u0pH3fmdrHLSSXQvo6N+9WaznjdUzcPCvGLKxRgjM5UZga2b4l5FfNiuIqhmgOKjaKA8BVPEpRgAofmbybo2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769098231; c=relaxed/simple;
	bh=WChLhg3S6wnoCNHOPQvw2fNaRZvoZP9tFa/SGNbpoRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CAQckW9tWxzw4Vsb6KevnlaSZhgpkMgrE32ONupZvk1IjuMmbqMTPW/Ryqcvn/P2lpwMGJKmmtXEvAcEMf2xgoEMOTvSvl1bLsANaRNSsXSH00/20SYNgzQT8cZzzemy/lUcpAxMPiOmrCr0CCSHzv27ixo+V8UQugkm5ZG4aDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SjA/SXGA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SjA/SXGA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA71CC19423;
	Thu, 22 Jan 2026 16:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769098230;
	bh=WChLhg3S6wnoCNHOPQvw2fNaRZvoZP9tFa/SGNbpoRU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SjA/SXGAoPl/oGxtfFchmt2fyd8hHR2Ve5tsztXw1f70lpakxmLS1JWoTg+9xYI2y
	 ZGoeArynfQRqd2XutZyB4fhfndIIUSodnWkLqnMQ4D6vnfSGaCDcVy+V4dUvfAvpic
	 JySTdHE/lbnS1le+NU3iD0JDbDw9eNw2NGjj44qfwvanwYS8bydFrf25pQkyeI8qTL
	 z+dK2+Fz9+Gn9KUSEnWIa51ZgNXzK7IkP1LQX6op3JMf2Pm1Q0B9WKxN374mjfpYft
	 xwrzTxBJJcOEJ/K+lXNQCzlEikdHYBGXlSpeIkClqpsphJhABttEDvzb1iz4K0Qkbt
	 CzToYUXkHcH0A==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Mike Rapoport <rppt@kernel.org>,
	Sumit Garg <sumit.garg@kernel.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-mm@kvack.org
Subject: [PATCH v2 05/10] dma-buf: heaps: Add debugfs support
Date: Thu, 22 Jan 2026 17:10:04 +0100
Message-ID: <20260122161009.3865888-6-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260122161009.3865888-1-thierry.reding@kernel.org>
References: <20260122161009.3865888-1-thierry.reding@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

Add a callback to struct dma_heap_ops that heap providers can implement
to show information about the state of the heap in debugfs. A top-level
directory named "dma_heap" is created in debugfs and individual files
will be named after the heaps.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/dma-buf/dma-heap.c | 56 ++++++++++++++++++++++++++++++++++++++
 include/linux/dma-heap.h   |  2 ++
 2 files changed, 58 insertions(+)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index d230ddeb24e0..9784fa74ce53 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/cdev.h>
+#include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/dma-buf.h>
 #include <linux/dma-heap.h>
@@ -223,6 +224,46 @@ const char *dma_heap_get_name(struct dma_heap *heap)
 }
 EXPORT_SYMBOL_NS_GPL(dma_heap_get_name, "DMA_BUF_HEAP");
 
+#ifdef CONFIG_DEBUG_FS
+static int dma_heap_debug_show(struct seq_file *s, void *unused)
+{
+	struct dma_heap *heap = s->private;
+	int err = 0;
+
+	if (heap->ops && heap->ops->show)
+		err = heap->ops->show(s, heap);
+
+	return err;
+}
+DEFINE_SHOW_ATTRIBUTE(dma_heap_debug);
+
+static struct dentry *dma_heap_debugfs_dir;
+
+static void dma_heap_init_debugfs(void)
+{
+	struct dentry *dir;
+
+	dir = debugfs_create_dir("dma_heap", NULL);
+	if (IS_ERR(dir))
+		return;
+
+	dma_heap_debugfs_dir = dir;
+}
+
+static void dma_heap_exit_debugfs(void)
+{
+	debugfs_remove_recursive(dma_heap_debugfs_dir);
+}
+#else
+static void dma_heap_init_debugfs(void)
+{
+}
+
+static void dma_heap_exit_debugfs(void)
+{
+}
+#endif
+
 /**
  * dma_heap_add - adds a heap to dmabuf heaps
  * @exp_info: information needed to register this heap
@@ -297,6 +338,13 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 
 	/* Add heap to the list */
 	list_add(&heap->list, &heap_list);
+
+#ifdef CONFIG_DEBUG_FS
+	if (heap->ops && heap->ops->show)
+		debugfs_create_file(heap->name, 0444, dma_heap_debugfs_dir,
+				    heap, &dma_heap_debug_fops);
+#endif
+
 	mutex_unlock(&heap_list_lock);
 
 	return heap;
@@ -333,6 +381,14 @@ static int dma_heap_init(void)
 	}
 	dma_heap_class->devnode = dma_heap_devnode;
 
+	dma_heap_init_debugfs();
+
 	return 0;
 }
 subsys_initcall(dma_heap_init);
+
+static void __exit dma_heap_exit(void)
+{
+	dma_heap_exit_debugfs();
+}
+__exitcall(dma_heap_exit);
diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
index 648328a64b27..1c9bed1f4dde 100644
--- a/include/linux/dma-heap.h
+++ b/include/linux/dma-heap.h
@@ -12,6 +12,7 @@
 #include <linux/types.h>
 
 struct dma_heap;
+struct seq_file;
 
 /**
  * struct dma_heap_ops - ops to operate on a given heap
@@ -24,6 +25,7 @@ struct dma_heap_ops {
 				    unsigned long len,
 				    u32 fd_flags,
 				    u64 heap_flags);
+	int (*show)(struct seq_file *s, struct dma_heap *heap);
 };
 
 /**
-- 
2.52.0

