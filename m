Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF793324B13;
	Tue,  2 Sep 2025 15:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756828019; cv=none; b=fdX00M6VlW6CIxLYq0hisfvasd9VLBQ7YFAo30u2LrhoVGq01e9ut1lIo6U32Q39tY741CA9I/E2sRheMYYRhFpRNKieKUAP3Ee5yFNi9CqP1LAb6WByvnKXwpkdsU/LMyNyJoONPnIPrMD9tidiZIvofZYxYHHh5oXoRnA0VZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756828019; c=relaxed/simple;
	bh=FzPkttKqvWixDOQRKBDrWe+bhNLvIh8xmm40vEpHPk0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k4fqvtyaHCFbuTZuIdrzJDPB3PSvCOTHXP5gOCY/BL7X7I3v1Dcp89RrHQrkHYS5kKdddxqVlyXI0gtmT9UT4Q6QWlXAedQFHvFfMXgJbTtQu1I6Fd/HymmZryTDFBVlxh+U/PKwl+jDlgMUuSbP/dW+B2kc6+qfvd5NBDWMEG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xkn/KcRz; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xkn/KcRz"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3d965477dc0so951954f8f.2;
        Tue, 02 Sep 2025 08:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756828016; x=1757432816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=90kZ9DvIdtL4dz9/qc/WVjEQ+mFVkPoHnP8T9TIhe7A=;
        b=Xkn/KcRzKf6aEMIspPB0OD2Qdc0XYWEDZqjd8uB6RQcvKJZbeYculsPaXi/thYW7D4
         43nozaTsp+j2LLlhxfJzUqeOsksHu+uLvvZnQltCaUqcMMYkFOqt0RULeRbVMZ/8A0S+
         pyK7qPxIS2qR3SjJ1iBaXR5PdeOAuGkX2sLS3fvEveO/hrFoLqbcYz6v4+hBXUHQupNb
         0b/Gpy30V0RIzHt3u+yuDyi4yVPfl++cNQQUnxkB6iTw/1W7I/T5E/Al6/hinQHbajAR
         VF/f9dG2o30Nd6/qmmIsir/Pxc5zrdSc4TfiMDHyWSULS17IzVrCSQhh6QrQTrgicnIe
         IR8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756828016; x=1757432816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=90kZ9DvIdtL4dz9/qc/WVjEQ+mFVkPoHnP8T9TIhe7A=;
        b=pApqqOJYI0Ed/Oh3m/Onr11Rn7yMrDMr2L1iKZR6Xbtz9q+uqd1nzqFKubcPcZIZgz
         tsf9LhoykEqsDi6IQ0cP8RzaMWR7fuRkL+FxwZEy3AwoJVdJK1gdCLWu8v1DhGmXvhL6
         jqfJwS7QH/E3abQmZ4b9biEny+/ZFRicQIFrmJqt8Esq1gyPWOBGHNEGPUhC1rXTj/jJ
         Esb4oBdkeoqYb8zOUWYnZsWWODmXNxDS32Y4ZDXKeXYC+pO5ohmmr96sxD7CHl4xBrMp
         Y+Tn/+ipRwb5yrLqiPMzjNxT8rhUSCzsqw3wZyPkfH7bJT8/yu7wtyp8oSRoAr46oMnf
         q1tg==
X-Forwarded-Encrypted: i=1; AJvYcCUOLxdTsuiCPDPV+rwGZfD55mQSYfQXp9mhbupOrTfjDrgqg4lFcH1R6/s3PPCbjbgF+IS/FPTX5mMW@vger.kernel.org, AJvYcCUrXjjM38rKVRImtcSYL5nvc/THtjXhZz99UhLWkd/rzTzoinR/1ttVHIb3edsmnS/xkFBxOdtwSFqQcAU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFadzbqCIEIK2dejt/y4dhhVZMNay9XfPMv7/YBuc1OVc/2ube
	xTZpi70xT7PRS7gx72YjzCZsLxrCAvS+lxkElXcs6vWGgPjqYYNVH6bt
X-Gm-Gg: ASbGncsHIZ77NA33lluuj0SS8R2FDZsJIY1wpwqOy3Oifr/hW4ZrlvpQtX5aUAm2QHL
	vURtXOAqRcpXgjTJa4SHWW2VXMBQq0m3FM3DXV9d5+Aai+SNzKdQ9VYNooTAdHjoGnTiJtFDnZ/
	02x6dQOqGt1z7TjlAQ/SYN52b4M7hRyd8aFFHy0mYJtuQa8czHhZMvAwmw9fESUU4lXkE1eC0s5
	U1Ix/X+ORfA6gTuqNmm+hNxRmVEp6FThpPnY/4h6DIDipo+Eyybf/+iUTxlLnYhy79iukrBNBUn
	tgLDMTf4zGKweUxnjKVm1H6PFV9m0gyZ5BNulccaGfe8sVrDF0t0MIiMVfFeDFawcI0NDqzH/mn
	tU2WkYOJz4m5opPqlM4i2CXQfuJmx6azdDb8bAFigGTJAe/SecfAxefNgZNvGUCLRYqol9x3NdQ
	IsP43NOQAWPqzyqJ1pXkdlelDI
X-Google-Smtp-Source: AGHT+IGEFJ9YebDpQzKgxpYDB/nK1gBHr48wi1ywTJ9aVMyk17MTQGdJjc1ZEGueQXcFUAhwJrBA9A==
X-Received: by 2002:a05:6000:2f86:b0:3d0:64c1:1a39 with SMTP id ffacd0b85a97d-3d1dea894eamr9700405f8f.35.1756828016192;
        Tue, 02 Sep 2025 08:46:56 -0700 (PDT)
Received: from localhost (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3d95df59e50sm4845738f8f.23.2025.09.02.08.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 08:46:53 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Mike Rapoport <rppt@kernel.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-mm@kvack.org
Subject: [PATCH 4/9] dma-buf: heaps: Add debugfs support
Date: Tue,  2 Sep 2025 17:46:24 +0200
Message-ID: <20250902154630.4032984-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250902154630.4032984-1-thierry.reding@gmail.com>
References: <20250902154630.4032984-1-thierry.reding@gmail.com>
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
index cdddf0e24dce..f062f88365a5 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/cdev.h>
+#include <linux/debugfs.h>
 #include <linux/device.h>
 #include <linux/dma-buf.h>
 #include <linux/dma-heap.h>
@@ -217,6 +218,46 @@ const char *dma_heap_get_name(struct dma_heap *heap)
 }
 EXPORT_SYMBOL(dma_heap_get_name);
 
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
@@ -291,6 +332,13 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 
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
@@ -327,6 +375,14 @@ static int dma_heap_init(void)
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
index 27d15f60950a..065f537177af 100644
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
2.50.0

