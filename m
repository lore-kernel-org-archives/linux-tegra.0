Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1DD3A7335;
	Thu, 22 Jan 2026 16:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769098222; cv=none; b=h4o/zqD9FQJbRVjTSY/cXg10L+1gS8d0cJvKO5m2ShIELRfJGAxiI7JUb9LJgtXl7ehUMaJVkNs4rLuyu1M/GsCG61419h5JOngLzWJxrJED+0l+p0SHVfgvUFyCeOLKkCcNwvd+QzDbHMj71LJ5mPmDsHr0J0o4dS3V451PetY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769098222; c=relaxed/simple;
	bh=2ICIoqHo9Cyhdy3+VtN+IUzW5+JGRQYoDcB2EFnohLY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZsdhvMnpxot3tR4cvvcQNlGBWnQeZiSoRIIlXNN40cUQ56DbC5wyXLIi3jKJ7LrwyOY4h6kDYl46sbsK2HAgCfZEzUHxaeqW9Y4gt/FTjojXpamM1y+mjEPDel4+EMmkN+tDt8jHqBedjB3ywLUS6wqYlx5lEG/mE/eB02UCb7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P643mR3S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P643mR3S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B004C19422;
	Thu, 22 Jan 2026 16:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769098221;
	bh=2ICIoqHo9Cyhdy3+VtN+IUzW5+JGRQYoDcB2EFnohLY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P643mR3S+IDJaAPZiWwUtAcaWx//W+DWn1viojKNZ1sAIk/4Gyaq3Esjn9VI+dNkq
	 aV34yMJuRdLhfDZBO4jW3OtAeULLLLKNvWDbFEcE/PuxaCU0U0ubuXbPZHVyizqdiB
	 SHo1uN2IPS/hDePMAk4HmZ3HRYzPbFUk2NlP3nHnrg7K7h1hyDChhNtPsaeadLRucn
	 SXDX1HxtDKyL4zKZOsfkHGkhx7Hir01tr6GE9ICYcRZ3DTSgVVrEUeLxP2YWBkIYe8
	 Ul/dOCC0pRWf590X3fPIE3awh+sXtefl6YU48cXLlMKOw4+pDnAiM7U/BV6tafZ34l
	 PWGKJHo2bEDHA==
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
Subject: [PATCH v2 02/10] dt-bindings: display: tegra: Document memory regions
Date: Thu, 22 Jan 2026 17:10:01 +0100
Message-ID: <20260122161009.3865888-3-thierry.reding@kernel.org>
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

Add the memory-region and memory-region-names properties to the bindings
for the display controllers and the host1x engine found on various Tegra
generations. These memory regions are used to access firmware-provided
framebuffer memory as well as the video protection region.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../bindings/display/tegra/nvidia,tegra186-dc.yaml     | 10 ++++++++++
 .../bindings/display/tegra/nvidia,tegra20-dc.yaml      | 10 +++++++++-
 .../bindings/display/tegra/nvidia,tegra20-host1x.yaml  |  7 +++++++
 3 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-dc.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-dc.yaml
index ce4589466a18..881bfbf4764d 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-dc.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra186-dc.yaml
@@ -57,6 +57,16 @@ properties:
       - const: dma-mem # read-0
       - const: read-1
 
+  memory-region:
+    minItems: 1
+    maxItems: 2
+
+  memory-region-names:
+    items:
+      enum: [ framebuffer, protected ]
+    minItems: 1
+    maxItems: 2
+
   nvidia,outputs:
     description: A list of phandles of outputs that this display
       controller can drive.
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
index 69be95afd562..a012644eeb7d 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml
@@ -65,7 +65,15 @@ properties:
     items:
       - description: phandle to the core power domain
 
-  memory-region: true
+  memory-region:
+    minItems: 1
+    maxItems: 2
+
+  memory-region-names:
+    items:
+      enum: [ framebuffer, protected ]
+    minItems: 1
+    maxitems: 2
 
   nvidia,head:
     $ref: /schemas/types.yaml#/definitions/uint32
diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
index 3563378a01af..f45be30835a8 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
@@ -96,6 +96,13 @@ properties:
     items:
       - description: phandle to the HEG or core power domain
 
+  memory-region:
+    maxItems: 1
+
+  memory-region-names:
+    items:
+      - const: protected
+
 required:
   - compatible
   - interrupts
-- 
2.52.0

