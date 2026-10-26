Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792994338;
	b=nD2onWEJ43mridT8P3F0RnF9GjJRVB2DlI7wml9MG8ijUbheQiRtjKVep0PAIDLh87aY
	 AstFzOGDgHNrbMn6iaQoS+ANBDKrf7VVXtzBbdPMeeCQ26AJToN7SPwQ/3I5nCEcNTGmL
	 r4ghDMj4RDD4W9mG9d9QCn5sL8mYKwbNSkKLLh9gVlpWNQkMqTChwxJXDYl2Voayjo8am
	 PF9siuD5WUVkz4d6j79VGF7rONzMUUyOZwjq+EUKsN9d0WMJ8enIacNvfbXK3GPjRx/vI
	 NnUNnbTM/1fWy1MG0979z9zagMIpEHlznA2ubcfakystitTbFQADIfhIr0Xt2xESxAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792994338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3gJomeBmHPSa1nSKsQOjrx0jFw6wNV5cIGdR0fKlHFY=;
	b=HwUxaVofyfoADHBDUufwwTqAuX3V5I38LA3pgprLXfBaBJIfewR3FqQf9H9pn2yM7bcT
	 a6TJxG/mx+9NEE8INgnWnF0pxhr2AytD7m2x11xSpifrqd1CIhCCb7cRkCHDLtTvf7Suh
	 LdJxOTOkga3egQ3nEMxeOPZ2a0wgSMIMdDTb/0XlaiMDzLWH69z/jfU04RSUcujotgh/L
	 TPSnhkszjW+mZpORIIboQz0GosPilrC/Fwy4tTPeQD9xu15B0e5Iu1NClrRwW6l+QPsTt
	 U9LNv+Y4QFR5EqlsVF1NOsVwt1pv52Ri4ClpAqwR8q4+lppc8pNhPBc22Bi7ANyHecw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="I/iLmABM";
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF79606A31B
	for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 05:58:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFF79606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I/iLmABM
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48c4be28b82so2234122f8f.2
        for <linux-tegra@vger.kernel.org>; Sun, 25 Oct 2026 22:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792994336; x=1793599136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3gJomeBmHPSa1nSKsQOjrx0jFw6wNV5cIGdR0fKlHFY=;
        b=I/iLmABMgLUn9YNum9Hg49oTL3h7Cgb6pHXIH8fdZZisy50s+0le+XnLFZRaztOoq8
         kiVk55sAcoIyKG5AMrHzYIOtdmPbyyItM+5VXPxZot99yRKlEnf2HK+u6EJ37PPaKh1T
         A9IGPd689WTuVRYUVu6G9K/HLRcoZXoOTWXLA49rxpkzSzjHsJl/11roSeOpko9CgKIJ
         MmYghK+ZOoM3x/iJnxDmc0DEmaFlD1Uxz3u+ZvhK5cMcGckfnIl5UExSIFZHAExIBD8B
         5VJkAlSjhO8SR+Nav4rDBYxypUA0Rr3JTsjvfwNWTeb6PA5iw+1SU1J/JT2w0Y0P9kmZ
         SWEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792994336; x=1793599136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3gJomeBmHPSa1nSKsQOjrx0jFw6wNV5cIGdR0fKlHFY=;
        b=wuMPdvHhx+aTgMNQb0w5Z9+kXk8yGaW4B8+ZhxJYOrkzArBLJoLnPWdNzMJCjRv/6p
         ebjDVaAclSU+eRNOHG1J0J7aDwcR08o0eyrPrKYOpusAYRcX4ztMIFBPOMdGbwTcXoZF
         P5rFzKiFhDvtKaPeEJ95CEn+a2w6jvwq6AO/msT1mlrg4/nE1nm5Qbdg7lnKfptkRqKb
         CboiBQ+48VkiXFigz5Zl2M9YEGlKVd5zCyAXak+rvjVL4G2w0cFLagDUXZ4oY6sv+sY6
         MFPutcGFagtqVimsADhpXcQB4wVeUnDx/ReqH5uXHQTWVzdjfzGfqG8MVcBMkI27anMx
         oJfA==
X-Forwarded-Encrypted: i=1; AKwUvBzRkh9Ix9WT14NuF2nbj9I91zFn3YIlRzEzIvQ8H+j5d21Ald4BMLU79ORDB9MSxhkytSWX3ldwskjCig==@vger.kernel.org
X-Gm-Message-State: AFq9FYIEBhzOC1h1ydzMR4LVfQndSEFdvuAeRj8khZiS8rFLZV/Ybc/H
	Cgc+ezfM2NQTTwR6qXzSVt3ngtzFtpvF8GCQ1GeauLI+klZiavFavQ1d
X-Gm-Gg: AYBFou1QZk1X0wl/tBk/QYvZt95zTL0t1z/1P/+gZ8s+2H6j7tmdKXJ+eprGo8JSy69
	ah51l7+SXMFBTUi2qshu9cZWf+X5g4dz/tetHOTw3a+cnxM66h9HsY/nf35gmLDPWu3ROVHANuR
	HE1zumYeDBo+2I3rms0BvhSIgLT9VumZHhkb+2i4RJ5LKbKw86V4o4LqrgShkwsAA4BMflLpIOc
	Cj9FvAGh5MXZbKPUaxXigfpmQxfg1oU+M//TbLpEsqvDdSoEalFC6qVi0MxZLKRWRzRuoJHituy
	1e7Bh9zOpXKZPpKrqVPjzuDdX/MmdJMiuMziVibyORU3qna6CTnCfBOdU37mFQ5rwxEtW03D4EJ
	uA4QjdGjktYbtuc/r/AHw5YugIzqtj5fByG238d4hCGQcZXrmxVuQtq6PE+mXG1REKisa1YVHRP
	wV1opFVUbOlXSsco/S9/0m2qSKd+L86wsySU56ps+jwsBvHOTrHByEwAOoW+mc9vLHWREncmOHQ
	i6xqn8JQeo28VadpNn8YbhpjIC5SNh9QI8n4A+XWaDEZAZ3UpSuTXQbg/OkwqOJgU6lGQG0MN19
	EJ23H/QYfoZLADzYaEmqNEWFPyDNFhtHDNrNvOKcuPZYD77bZdZv437clGRs80O1mncm/5gpyv9
	xI9K2d1yAqaeCAQR/5LSW6HcyLgNIkuxvPZPmg4oyQ/thug0nctUW2os07+o5nELN
X-Received: by 2002:a05:6000:4386:b0:48d:ba3b:af36 with SMTP id ffacd0b85a97d-48e3eba7fdemr8948523f8f.37.1792994335994;
        Sun, 25 Oct 2026 22:58:55 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b1a4-1201-5c78-89f4-99d8-70d7.310.pool.telefonica.de. [2a02:3100:b1a4:1201:5c78:89f4:99d8:70d7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f25fsm13901379f8f.2.2026.10.25.22.58.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Oct 2026 22:58:55 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/tegra: Fix dma-buf reference on import errors
Date: Mon, 26 Oct 2026 06:58:42 +0100
Message-Id: <20261026055842.96484-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra_bo_import() acquires the reference retained by a successfully
imported object only after all attachment and mapping operations have
completed. Its detach error path nevertheless calls dma_buf_put().

drm_gem_prime_fd_to_handle() holds a temporary reference while invoking
the import callback and drops it after the callback returns. Consequently,
when mapping fails after a successful attachment, tegra_bo_import() drops
that borrowed reference and the caller drops it again.

With only the installed file descriptor and the temporary import
reference present, these two puts reduce the file reference count to zero.
This queues the dma-buf file for release while its descriptor remains
installed, leaving the descriptor without a live reference for later use
or close. On a Jetson Nano, forcing the mapping to fail after attachment
produced:

  VFS: Close: file count is 0 (f_op=dma_buf_fops)
  imbalanced put on file reference count

Remove the unmatched dma_buf_put(). Successful imports continue to take
their own reference before storing bo->dma_buf, and tegra_bo_free_object()
drops that reference when the imported object is destroyed.

Fixes: f5b8794e17e4 ("drm/tegra: gem: Don't attach dma-bufs when not needed")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Found while auditing Tegra PRIME-import error handling for
CONFIG_DMABUF_DEBUG testing.

Tested on a Jetson Nano (p3450-0000) with CONFIG_DMABUF_DEBUG=y and a
separate change that rejects zero-byte IOMMU mappings to exercise the
post-attachment error path. Without this patch, the forced failure
produced the diagnostics quoted above. With this patch, 100 consecutive
failures returned -EINVAL, preserved the original dma-buf FD and left zero
dma-buf objects. No file-reference warnings or DMA-API errors occurred.

Additional regression coverage passed 33 dma-buf heap selftests, with
three vgem-only tests skipped, and all seven udmabuf selftests using a
volatile 2 GiB HugeTLB pool.

 drivers/gpu/drm/tegra/gem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index f76af73..ed35a34 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -502,7 +502,6 @@ detach:
 		dma_buf_unmap_attachment_unlocked(attach, bo->sgt, DMA_TO_DEVICE);
 
 	dma_buf_detach(buf, attach);
-	dma_buf_put(buf);
 free:
 	drm_gem_object_release(&bo->gem);
 	kfree(bo);

base-commit: 21a7f44fd0765fcc5194130b28767786eba1d1e7
-- 
2.39.5 (Apple Git-154)

