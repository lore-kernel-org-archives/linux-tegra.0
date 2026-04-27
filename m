Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70703E3C62
	for <linux-tegra@vger.kernel.org>; Mon, 27 Apr 2026 18:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777315496; cv=none; b=goZUYOvPTlMAAw6EGcpONn5gMUwbK2/vcL8Yy9ExPPaUkf/WyDmOC5MZ/oYFEIpxZX+Efrx4GtGnj0dd5Bkmy2Tz/a/7u0yxwRZCKxT0T+5vpwtcojmZdqnrx+pesu7iXNrg4aNlJFbRBqbj3cRA7U5VPdL0QTarOozNuia3SNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777315496; c=relaxed/simple;
	bh=+kml32Qrnvygpx/Dg9hpVHk1nHnkCyq7pHfFCIhfLvQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nGHhwJ/5QBHd000JhG4rOATA7ZBaj7jJYL8vqhKOuMvGRQBEIFYaIng88D+QSNZ6+nvX0es73W2Bjmmd8w8a9MCzQ+cXVg+UJhQzxVRx3Oo02vux42PnKzM/JF+1/EtVdhvhb3dsXYc5lSQBuj4hcIieFEh7pAPBBzUKgk7JoJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=BFk1GZbQ; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BFk1GZbQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=UqJXfYFr0Sjo7TtDfWrGHXSllvmgK6PN3PMaeVT3y+M=; b=BFk1GZbQ0gZrweHPFd9wd1Qw6d
	PmPEUgLIBYLDGUbBancGIuK2m+Njh1cV6s1yubKsUiOyIPW42NjaSQ2Z3/jmiUZehSngNWhT4/56L
	3MgRj9y4LQ1YifrQ+wVcqObNxrWEC9zapi7DrrGmaW9SqMbsmMtJDMHiEXkhM/xyxh6XNwdG8S4dJ
	dQBS9r8kstxEpC9vmehCy20WJ11AdUt2Q4OWsZnRzpaD3VMxjLGOa5d39Ym4y7hhaCTSqUXPtmfpP
	DgHOkNUyU0mIsXx0vXhtRULQE7mVfP7kxg1ojK9FhNvr8Ea4+UvF2RsNVSxzJhpWMCn5kJIQ/Pt/w
	sPBjesGw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHQww-0000000Haz3-436h;
	Mon, 27 Apr 2026 18:44:55 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-tegra@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v3] drm/tegra: tegra_drm.h: fix all uapi kernel-doc warnings
Date: Mon, 27 Apr 2026 11:44:54 -0700
Message-ID: <20260427184454.693794-1-rdunlap@infradead.org>
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
Acked-by: Mikko Perttunen <mperttunen@nvidia.com>
---
v2: add kernel-doc comments for #define constants (thanks, Mikko)
v3: rebase & resend

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

--- linux-next-20260427.orig/include/uapi/drm/tegra_drm.h
+++ linux-next-20260427/include/uapi/drm/tegra_drm.h
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
