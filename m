Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793443495;
	b=GVDk07V0ygtmTJnhC43SzsY7cnVUm60tUhGA2rbz5GQ4HgY7pNz1xZZPCT6aPOkrWge2
	 ERevcUuAdn+mPoeyZm2GXxRCmxZlmRM3UUek9bBKhUAmgc4I9FLY3quq5Fm0XhPhMJJV5
	 odowfHKJm6u/czvQXATpVo95xvDu8rhKrQDx3l6qJEeLQ5+S1xhs80qX3/mBNu4HJSpWv
	 few1OhUyxanvwgDTal3987r4SdRWc1FRhHin3VFWWdbP4Ayg6Tq294wBsQy9T+Tcj5PKD
	 SsSui65V7G8Qiqwhb6OFl7asyc0QnOa5hHWl6AWgoKgu2f8zSgnNOWjBeyXV+EimuXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793443495;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4nZEer0OBORnNh+HtOSAonBsrwjZLbFagqy2gDjha3U=;
	b=WtwdxKSyXuYK3cUn6hsg/ekW6pDPfJe8dsgnkHgSLzw93Ma4oaHdAasj9YutDjD0hmPm
	 k1jMdjtmFk8Yjew/TjfEKW/XjKCyM/r3dst9HSlVn6DQi3+rQEVIcd7pilUg0ftLXQEZc
	 0lQduUa0fQSTbU5F53F20Pk3kNyBUkM7h2MnQgH9HHr0m+CYwhObajAjJHWxyG5enPwTd
	 9RLaFzhlBGwuCqwPnYwNlDGC++OkYG3uVIejFYdxuTbHVsy0z0nZhDQ6avAknisaCQITG
	 UJu1uCE0Bm6awwjnLNs4HN5bSs+Qhq8lvsKGhCknHg3TukI14W4eMud1e307VlwoOJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UcqEXsLF;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D637F606A31C
	for <linux-tegra@vger.kernel.org>; Sat, 31 Oct 2026 10:44:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D637F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UcqEXsLF
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso1044576f8f.0
        for <linux-tegra@vger.kernel.org>; Sat, 31 Oct 2026 03:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793443493; x=1794048293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4nZEer0OBORnNh+HtOSAonBsrwjZLbFagqy2gDjha3U=;
        b=UcqEXsLFGpK8HluJzwZWCLWSIIOtM1AqH30p/xVJh+ZCGnhCRxz2BiAmobnXB5MK1b
         C8NxZii/6Ye9x8YoayP6CtCNMiFirmeJ2uu6lrMtSw/FM1dON+/H+7suN35Hke+NMkx6
         8xP3u+LG/e4fDGo/QRVS9cyPaobpsrM+7CC5buc7VV1JrqWkKH4qelgddG9lRpsdyoFq
         so16ADc2UqjedDxp2XyPoZ8UoTmBY3xnh+VZlgfQiW/cn8eWNOnNTpqrUBkxsRBsS4df
         7Yqm4R9ItofReQI2nzy4+116xn5Vc78Ti66dF3eFr0JCssIbdLWtRluFZdovh/x8BEqL
         2G5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793443493; x=1794048293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4nZEer0OBORnNh+HtOSAonBsrwjZLbFagqy2gDjha3U=;
        b=oGoSvFe9bAdJ+OgdmAEm1ICSa+zqO7oOY9eqTz3/olokAoVAHi7j06Y9mwsVjGA/hg
         vEDZMGa+YbssqZ6CG/ag2AahdNOItJiSdIK4KFCa0McqOz7SQfZoby33fWSZgaf6c09k
         KeYxZBMWE9UX5uVI1yiz215j/+2q5segbxsXyuASZWMLW6al8wXttMnrGvm2rli1uj9R
         7mGn53ebltpJvuaSkw4sRoEqQxrQCS8GbsyTcQbNOC+iflL3/Jz+Tn+kVIWl1A8DGypR
         p/4NR5wYGsm7afBhtC1H2YAGcWaCpmjYMs2l7srGHAYgdXUKaienVqg3Ej5gYSO9+pZr
         Qzdw==
X-Forwarded-Encrypted: i=1; AKwUvByw4WVr2iOWf4qKP4e07gJPETkUqKMdWbAfxYUcjlO4/tvGfovAQCjcLOkGrzQwCLKvBmpURDBAFJA9Cw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLGDpRonwsm8+0YMUyVcEDL0BSvgODzn0+vvf1inYqXyPU3OT2Z
	KGyznk8xll9njO/qASIad0RzkliQlYtlUS1o77vbdH/gM+4SdsOJyVkb
X-Gm-Gg: AYBFou1dYx+sa91i27Fq1OrCvt6YIwCclgpUVlR0qZP3mPiTDyG0c4SPhPkOt1bex8M
	iuqkYo1V2Lb9vVZc4fVlNta8AdAGVY9Dsx+/LmnC0ZfUIWGa8uaka+Wy5W96sCDsZBWk4BmxvFE
	kt7emrgTRjJ5WywVUkI3pDgX8lqXIYQ7BPW5wOAtbvP3TjtC78fh6yFFKvM960b7ziWL5Js7Cif
	iiXHh/XMdGHlad52h4CMzFrKR/42UyBN5BZbXztJuCIZbr6l2pfB56AC5fVHN3gzfNn2ph4ny20
	srv6Uun7FwUrPUhEPnZGV2lCs0VG79BtacFY7J8ubjXIq6rCP97jG/tZr6n/aojoONtXlKiMtv/
	Hj/291gzEENYhzYyExGMbTlULvjXqgv1dMnqDUEgHYjyvVYQLSA8XfeN7PtHjdnHpFbUcQmwjmT
	ontAwibVeBNls/5T8XW7Wduw9UZ40Xt5cFmBNt/NZLuNmnb3sHCAJzZVF/zIBBqMtXeL98ga9zx
	S4nPBHVW8UCvyOQmWkioaA0o9KqDIJbi7U//MNfnrku1P9/IR5YwEJB3B/k0NguaHpX5vDZoZ08
	rI5QGmrXzM+7K9ljJqyEJ7OIVVH7RqR6A2Psw/7HcVF+l//pszsCsVK49aZdn3/Bu0xVYd2DgCK
	PlmBNgpzNxtCT8fPEUvLNTNMt5V77sqG7UGv6MY1rJOp2r6Kq+ltCPt+2Rkf8tmGOniV5Ewijek
	RVUNm7CU56sZJJuIDpNrvnh3IVwia+sCE=
X-Received: by 2002:a5d:64a7:0:b0:48e:5e1f:9a36 with SMTP id ffacd0b85a97d-48e6e50191cmr8399741f8f.42.1793443493010;
        Sat, 31 Oct 2026 03:44:53 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a81d-e001-9c9b-db33-f166-0fda.310.pool.telefonica.de. [2a02:3100:a81d:e001:9c9b:db33:f166:fda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b728f9sm8093899f8f.10.2026.10.31.03.44.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 31 Oct 2026 03:44:52 -0700 (PDT)
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
Subject: [PATCH v2] drm/tegra: Fix dma-buf reference on import errors
Date: Sat, 31 Oct 2026 11:44:39 +0100
Message-Id: <20261031104439.91346-1-kmehltretter@gmail.com>
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

tegra_bo_import() takes its own dma-buf reference only on success, but if
mapping fails, its detach error path still calls dma_buf_put(). That drops
the reference held by the PRIME caller, which then puts it again, and can
release the dma-buf file while its descriptor is still installed:

  VFS: Close: file count is 0 (f_op=dma_buf_fops)

Remove the unmatched put.

Fixes: f5b8794e17e4 ("drm/tegra: gem: Don't attach dma-bufs when not needed")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
v2: Clean up the commit message (Mikko). No code change.
v1: https://lore.kernel.org/r/20261026055842.96484-1-kmehltretter@gmail.com/

Tested on a Jetson Nano (p3450-0000) with CONFIG_DMABUF_DEBUG=y and a local
change that rejects zero-byte IOMMU mappings to force the error path. Without
this patch the forced failure produced the warning above. With it, 100
consecutive failures returned -EINVAL, kept the original dma-buf fd and left
no dma-buf objects.

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

