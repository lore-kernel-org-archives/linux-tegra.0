Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EBB72EBBB9
	for <linux-tegra@vger.kernel.org>; Wed,  4 Mar 2026 01:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772588518; cv=none; b=CQXwbqjXy9bMi2ejnvDOmZOqv3/FOeEh+Mfh4PP4FdhNSQtqc4kahXZagx09ygUBrmMRUba4QmXKtUnAORCfw7GLMmK0GJJUnY6l1394AUAsCi5Umo+V+y4MLPFILzWSrdTOx+rDmAoy+bZCGSgsry/A54biSrsIAsGiygKos2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772588518; c=relaxed/simple;
	bh=ZI2EZbHK7isOgH3sFk57UNVNvSQVY7A8cdfKfY6cqrA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rXYOBsB1XXQSb7y4xmHDn4Ajcbs5Gj8OtCTJuj885pLLVzDl1uqhwK/UmooEJGcMKvdgerCaJ2phdj+PtJPYlCIUE6rnBNmojXiAWRJ2lfZBDUP730aT8Ag8JYuJ8oVj2bub07D5Q0KPRuMP4iOggGtZmJ6Cr+u/ngkQuF2TaKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=seR6m76B; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="seR6m76B"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=QVsCBLaV0qyz3g8gi1IcEghRCnDDjNXGbxnYjkJglxg=; b=seR6m76BxGB2jKHnicujLFENGh
	qi6AfvNNAUJnXwDYotmo4MxcsyNeCr+rdkoFqaPb2Bo+k1kg9fBjVZ7tAUHju8EVbiPDBZlTyRpQV
	iOGbPeLx3L6y8EPuMyH82kye1ItJCzlN2f5qUjN9+nr/kMBA6xa7FcYy012l/jipNIOiJdlxykYb3
	10uomg4xUlpUarZRZ6pN90i7clLQEabYMRHW1XUYLhbb4hq0po+j/sICPCUd8OkFuvTp3qIhOnYan
	g59M6AL+VpovcjdZZ13djEpKNmOXMUxSzTkQ4kcrDbOgspgOXC7LLr4cHkKCG943M/HyBbTmCrjkL
	wC3CDUlQ==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxbFK-0000000GGyG-0HE9;
	Wed, 04 Mar 2026 01:41:54 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	linux-tegra@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v2] drm/tegra: tegra_drm.h: fix all uapi kernel-doc warnings
Date: Tue,  3 Mar 2026 17:41:52 -0800
Message-ID: <20260304014152.482104-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add 2 struct member descriptions and convert #define macro constants
comments to kernel-doc comments to eliminate all kernel-doc warnings:

Warning: include/uapi/drm/tegra_drm.h:353 struct member 'cmdbuf' not
 described in 'drm_tegra_reloc'
Warning: include/uapi/drm/tegra_drm.h:353 struct member 'target' not
 described in 'drm_tegra_reloc'

Warning: include/uapi/drm/tegra_drm.h:780 This comment starts with '/**',
 but isn't a kernel-doc comment.
 * Specify that bit 39 of the patched-in address should be set to switch
Warning: include/uapi/drm/tegra_drm.h:832 This comment starts with '/**',
 but isn't a kernel-doc comment.
 * Execute `words` words of Host1x opcodes specified in the
 `gather_data_ptr`
Warning: include/uapi/drm/tegra_drm.h:837 This comment starts with '/**',
 but isn't a kernel-doc comment.
 * Wait for a syncpoint to reach a value before continuing with further
Warning: include/uapi/drm/tegra_drm.h:842 This comment starts with '/**',
 but isn't a kernel-doc comment.
 * Wait for a syncpoint to reach a value before continuing with further

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
v2: add kernel-doc comments for #define constants (thanks, Mikko)

Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>
Cc: linux-tegra@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>

 include/uapi/drm/tegra_drm.h |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)

--- linux-next-20260303.orig/include/uapi/drm/tegra_drm.h
+++ linux-next-20260303/include/uapi/drm/tegra_drm.h
@@ -304,6 +304,7 @@ struct drm_tegra_cmdbuf {
  * struct drm_tegra_reloc - GEM object relocation structure
  */
 struct drm_tegra_reloc {
+	/** @cmdbuf: cmd information */
 	struct {
 		/**
 		 * @cmdbuf.handle:
@@ -321,6 +322,7 @@ struct drm_tegra_reloc {
 		 */
 		__u32 offset;
 	} cmdbuf;
+	/** @target: relocate target information */
 	struct {
 		/**
 		 * @target.handle:
@@ -778,6 +780,9 @@ struct drm_tegra_channel_unmap {
 /* Submission */
 
 /**
+ * define DRM_TEGRA_SUBMIT_RELOC_SECTOR_LAYOUT - \
+ *    Select sector layout swizzling for in-memory buffers.
+ *
  * Specify that bit 39 of the patched-in address should be set to switch
  * swizzling between Tegra and non-Tegra sector layout on systems that store
  * surfaces in system memory in non-Tegra sector layout.
@@ -830,16 +835,27 @@ struct drm_tegra_submit_buf {
 };
 
 /**
+ * define DRM_TEGRA_SUBMIT_CMD_GATHER_UPTR - \
+ *    Execute Host1x opcodes from user pointer.
+ *
  * Execute `words` words of Host1x opcodes specified in the `gather_data_ptr`
  * buffer. Each GATHER_UPTR command uses successive words from the buffer.
  */
 #define DRM_TEGRA_SUBMIT_CMD_GATHER_UPTR		0
+
 /**
+ * define DRM_TEGRA_SUBMIT_CMD_WAIT_SYNCPT - \
+ *    Wait for syncpoint (absolute).
+ *
  * Wait for a syncpoint to reach a value before continuing with further
  * commands.
  */
 #define DRM_TEGRA_SUBMIT_CMD_WAIT_SYNCPT		1
+
 /**
+ * define DRM_TEGRA_SUBMIT_CMD_WAIT_SYNCPT_RELATIVE - \
+ *    Wait for syncpoint (relative).
+ *
  * Wait for a syncpoint to reach a value before continuing with further
  * commands. The threshold is calculated relative to the start of the job.
  */
