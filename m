Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABD93A7338;
	Thu, 22 Jan 2026 16:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769098217; cv=none; b=fRgO/zXdmzTzWEmvsDavE0lsRfqdqcXhtUW1thCZIbZdZP3K5DeNDKL6fc1LemG/Ns+DHyhSZN5mGB9rarz6syHKCvoHWp/nGwSRVvai9CiKCFM/iZorC9U4xWXIKckeL3PNNPXFhR+I+7VzI0lTh9xKnJoQy/Ty97XXVgFH7iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769098217; c=relaxed/simple;
	bh=ha3JA4N/2sbTZoLLt9Hk+/O5tkj/IAzHDfElKjAoOuU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BSZeZOLnTXvDawUtVj/9KEUm8fIC34sThI+o1N7Faf0+gPH2gYhQOcQIq1W5OZRDMnG9gVQVVzD+yg1qY9a0k8/MMKll4PkZTl2J7x+k8hS4dVwBn9XPqNqm1kpjsm3QkyOD6l3fdpVYAK9J2ZxysTigyPK8/f9qB/I4Rz7w7K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gxw0zSYC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gxw0zSYC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95341C116C6;
	Thu, 22 Jan 2026 16:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769098216;
	bh=ha3JA4N/2sbTZoLLt9Hk+/O5tkj/IAzHDfElKjAoOuU=;
	h=From:To:Cc:Subject:Date:From;
	b=gxw0zSYCXNJ4FcqwQQa7I3h3D2XukR/5aI8fAthL9DSmSmnm5KNPPfNGJ1op1BP4Y
	 MQ8cVwzVPjLYouTp/7uYsWSzL1ur0vhAi8L6FpMUXjN04ub6UPMiSU3ZiH+XtPFwfk
	 VDdZWO7EoWXGrXVNri26ANlTn29LcOna1OgwmoqrgPHF2Z+DlEJR1wAkHWsZ6kesJv
	 qbLK+3OIqfHgL9efAc72qE3r7O1STboGXJlBPqou0qcXN6QKZkFhWF6pvcrQDPFrx/
	 MqiNydzq8TzcExsRUkFNe+MEx6i7Rghos0E8UwfsefR6oollk4PXYz9/GzaS+tOntT
	 OxAMHTZ4pQ6Hg==
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
Subject: [PATCH v2 00/10] dma-bug: heaps: Add Tegra VPR support
Date: Thu, 22 Jan 2026 17:09:59 +0100
Message-ID: <20260122161009.3865888-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

Hi,

This series adds support for the video protection region (VPR) used on
Tegra SoC devices. It's a special region of memory that is protected
from accesses by the CPU and used to store DRM protected content (both
decrypted stream data as well as decoded video frames).

Patches 1 and 2 add DT binding documentation for the VPR and add the VPR
to the list of memory-region items for display and host1x.

Patch 3 adds bitmap_allocate(), which is like bitmap_allocate_region()
but works on sizes that are not a power of two.

Patch 4 introduces new APIs needed by the Tegra VPR implementation that
allow CMA areas to be dynamically created at runtime rather than using
the fixed, system-wide list. This is used in this driver specifically
because it can use an arbitrary number of these areas (though they are
currently limited to 4).

Patch 5 adds some infrastructure for DMA heap implementations to provide
information through debugfs.

The Tegra VPR implementation is added in patch 6. See its commit message
for more details about the specifics of this implementation.

Finally, patches 7-10 add the VPR placeholder node on Tegra234 and hook
it up to the host1x and GPU nodes so that they can make use of this
region.

Changes in v2:
- Tegra VPR implementation is now more optimized to reduce the number of
  (very slow) resize operations, and allows cross-chunk allocations
- dynamic CMA areas are now trackd separately from static ones, but the
  global number of CMA pages accounts for all areas

Thierry

Thierry Reding (10):
  dt-bindings: reserved-memory: Document Tegra VPR
  dt-bindings: display: tegra: Document memory regions
  bitmap: Add bitmap_allocate() function
  mm/cma: Allow dynamically creating CMA areas
  dma-buf: heaps: Add debugfs support
  dma-buf: heaps: Add support for Tegra VPR
  arm64: tegra: Add VPR placeholder node on Tegra234
  arm64: tegra: Add GPU node on Tegra234
  arm64: tegra: Hook up VPR to host1x
  arm64: tegra: Hook up VPR to the GPU

 .../display/tegra/nvidia,tegra186-dc.yaml     |   10 +
 .../display/tegra/nvidia,tegra20-dc.yaml      |   10 +-
 .../display/tegra/nvidia,tegra20-host1x.yaml  |    7 +
 .../nvidia,tegra-video-protection-region.yaml |   55 +
 arch/arm/mm/dma-mapping.c                     |    2 +-
 arch/arm64/boot/dts/nvidia/tegra234.dtsi      |   60 +
 arch/s390/mm/init.c                           |    2 +-
 drivers/dma-buf/dma-heap.c                    |   56 +
 drivers/dma-buf/heaps/Kconfig                 |    7 +
 drivers/dma-buf/heaps/Makefile                |    1 +
 drivers/dma-buf/heaps/cma_heap.c              |    2 +-
 drivers/dma-buf/heaps/tegra-vpr.c             | 1265 +++++++++++++++++
 include/linux/bitmap.h                        |   25 +-
 include/linux/cma.h                           |    7 +-
 include/linux/dma-heap.h                      |    2 +
 include/trace/events/tegra_vpr.h              |   57 +
 mm/cma.c                                      |  187 ++-
 mm/cma.h                                      |    5 +-
 18 files changed, 1713 insertions(+), 47 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/nvidia,tegra-video-protection-region.yaml
 create mode 100644 drivers/dma-buf/heaps/tegra-vpr.c
 create mode 100644 include/trace/events/tegra_vpr.h

-- 
2.52.0

