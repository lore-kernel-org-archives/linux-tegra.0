Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CD53D7275;
	Thu, 22 Jan 2026 16:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769098225; cv=none; b=D/VHPHcOAV0mf3hLebb7IEaCyrVN+dab7r/k6A4K4sZbQY2TJuFcljDIRRXz7KHEjTWo82fn2elOt+tjtOGLmrrGaRFUsRQ8Msp1oOMB0c+UWd/Og55l81R1CrvSfggmerzsxnVB+t0J90T08cvoQRoMW7bWkYr+Ba//fBF8dPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769098225; c=relaxed/simple;
	bh=LmgB3NAOjY2EXb6KKktntFdTHuCI5bomDczMPMk21vQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MHMlpSRS7F6FWfbKAL4l0Fk0rcH8AQJmPZOBecfc/mfEMwrXwkpMO8QLCxjvp50CGA84wWcKKnBYT9EP2bAxxRwdy2yJZhE8SwHQPBE3H9HZK8c2T81Zs+1OhMc1JBLYc0Fox7HYK/Slhlso98ILbFMZjcuyJJvW1uMtO30jcoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qSJMMtX1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qSJMMtX1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33E87C116C6;
	Thu, 22 Jan 2026 16:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769098224;
	bh=LmgB3NAOjY2EXb6KKktntFdTHuCI5bomDczMPMk21vQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qSJMMtX17uMId5qnzEFbziYqxYETI2pr51ysG1ENZJyeMwGCFR6aWtyor35a6hgWc
	 mVoKE1PLfg1iqNj5RMwTd2bFk36grxBnFL3n/UH3W3mLyujydUCnh1AipUXW9koOvJ
	 +W2jPRJwvcJ3ttoxIM0ifDKSIp1SMD7ZIDgE+yeiE/2YwprYArt5wBaBa/3ych9p9K
	 YnFlVvo8EJ+W6DWZLfi96vHNYPxnU7SruN3LkQD3J4D+1DKGrN2LHi+PbqyYRQfA7D
	 OEVibrds0rDZaojZuwjLuz5pzbuIGbX/duIVsWXVMWd+HycimpAa4sJmvlp2gUHOnC
	 GxoWgTKQQFPuQ==
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
Subject: [PATCH v2 03/10] bitmap: Add bitmap_allocate() function
Date: Thu, 22 Jan 2026 17:10:02 +0100
Message-ID: <20260122161009.3865888-4-thierry.reding@kernel.org>
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

This is similar to bitmap_allocate_region() but allows allocation of
non-power of two pages/bits.

While at it, reimplement bitmap_allocate_region() in terms of this new
helper to remove a sliver of code duplication.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 include/linux/bitmap.h | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/include/linux/bitmap.h b/include/linux/bitmap.h
index b0395e4ccf90..0fc259908262 100644
--- a/include/linux/bitmap.h
+++ b/include/linux/bitmap.h
@@ -673,10 +673,10 @@ void bitmap_release_region(unsigned long *bitmap, unsigned int pos, int order)
 }
 
 /**
- * bitmap_allocate_region - allocate bitmap region
+ * bitmap_allocate - allocate bitmap region
  *	@bitmap: array of unsigned longs corresponding to the bitmap
  *	@pos: beginning of bit region to allocate
- *	@order: region size (log base 2 of number of bits) to allocate
+ *	@len: number of bits to allocate
  *
  * Allocate (set bits in) a specified region of a bitmap.
  *
@@ -684,16 +684,31 @@ void bitmap_release_region(unsigned long *bitmap, unsigned int pos, int order)
  * free (not all bits were zero).
  */
 static __always_inline
-int bitmap_allocate_region(unsigned long *bitmap, unsigned int pos, int order)
+int bitmap_allocate(unsigned long *bitmap, unsigned int pos, unsigned int len)
 {
-	unsigned int len = BIT(order);
-
 	if (find_next_bit(bitmap, pos + len, pos) < pos + len)
 		return -EBUSY;
 	bitmap_set(bitmap, pos, len);
 	return 0;
 }
 
+/**
+ * bitmap_allocate_region - allocate bitmap region
+ *	@bitmap: array of unsigned longs corresponding to the bitmap
+ *	@pos: beginning of bit region to allocate
+ *	@order: region size (log base 2 of number of bits) to allocate
+ *
+ * Allocate (set bits in) a specified region of a bitmap.
+ *
+ * Returns: 0 on success, or %-EBUSY if specified region wasn't
+ * free (not all bits were zero).
+ */
+static __always_inline
+int bitmap_allocate_region(unsigned long *bitmap, unsigned int pos, int order)
+{
+	return bitmap_allocate(bitmap, pos, BIT(order));
+}
+
 /**
  * bitmap_find_free_region - find a contiguous aligned mem region
  *	@bitmap: array of unsigned longs corresponding to the bitmap
-- 
2.52.0

