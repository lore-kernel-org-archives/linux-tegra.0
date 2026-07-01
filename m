Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31A43451CF;
	Wed,  1 Jul 2026 16:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782922022; cv=none; b=Kpc036A9x4mhG2wFQ/uAJ7lGhq8WQslT+HH1IWVChFW1EgCspytwwva567dp/271qvhB+yzQ/eU1Yr2d50Aepk04xKczq4Xn9aSnKIz2KC5ovfpFOHPzRUHZlVQRzlhbnrdy1jN84HIipkVg548fy773vsSInb6rbCJ8TMQwibc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782922022; c=relaxed/simple;
	bh=kH2l/2jW5xWqgXqchwZ75S0WY97r4QDMr73qORQsC5c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V8b05AWQljylePNqph7ZhKAu/tCsSY06wIa20u2XaX/AYT54MrguR2ZD+sj8DrYh+SOvR5cj2uMeOfXRYlb182Jp/gv9VYSK/9UX/AUUP7hvgWze+yieIjo7lRxNvYujt0POhZ1CFJjuNkozvbVG3AhAyKYKRngLfu1vQnXCw0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KgdoQFqR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KgdoQFqR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04A771F000E9;
	Wed,  1 Jul 2026 16:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782922021;
	bh=D1y0LMTPeA5TRc6D7Axwz8Y8bFKCoWuA9xLUw7TJmIQ=;
	h=From:To:Cc:Subject:Date;
	b=KgdoQFqRPd5+gM6pbAS2ESdZgm7uZftGAP2bhJTsprpRe4aZCy+e4VGrpHhZYaoUt
	 UqdsFj40vzxtCfte7Rnl5bu77HkAAAgiMTFvABkQuRzHKB34Q19ylgP1BS+7jgEzW4
	 EFN7kE8lyFIEvyPJUm5yZomKOtSySCAfJXmobFwMI2pPMV4RvlgoVGjNEbSDdkEY6L
	 WZZhkvfqk3i3NWdMcINxoTUqLVelzqZte/I59AVF6NwMU42favv884Ous/eCQif5Fx
	 2kN0sOun7Hxxba8tQTO+oCn7A/1ZmqSv4tE0x/w+4oIRSLnapMnSXkphgfF/Swq9yw
	 AsfBbOLPQOTWw==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: gpu: host1x: Fix email address
Date: Wed,  1 Jul 2026 18:06:55 +0200
Message-ID: <20260701160655.725111-1-thierry.reding@kernel.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

These bindings had mixed up local and domain parts, the combination of
which doesn't exist. Fix them up.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml   | 2 +-
 .../devicetree/bindings/gpu/host1x/nvidia,tegra210-nvenc.yaml   | 2 +-
 .../devicetree/bindings/gpu/host1x/nvidia,tegra210-nvjpg.yaml   | 2 +-
 .../devicetree/bindings/gpu/host1x/nvidia,tegra234-nvdec.yaml   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
index ba4c6473ff92..84a84275432a 100644
--- a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
+++ b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvdec.yaml
@@ -12,7 +12,7 @@ description: |
   programmed through Host1x channels.
 
 maintainers:
-  - Thierry Reding <treding@gmail.com>
+  - Thierry Reding <thierry.reding@kernel.org>
   - Mikko Perttunen <mperttunen@nvidia.com>
 
 properties:
diff --git a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvenc.yaml b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvenc.yaml
index c23dae713eb8..8916a868dafb 100644
--- a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvenc.yaml
+++ b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvenc.yaml
@@ -12,7 +12,7 @@ description: |
   programmed through Host1x channels.
 
 maintainers:
-  - Thierry Reding <treding@gmail.com>
+  - Thierry Reding <thierry.reding@kernel.org>
   - Mikko Perttunen <mperttunen@nvidia.com>
 
 properties:
diff --git a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvjpg.yaml b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvjpg.yaml
index 99a33a5eac3f..582eb44eb157 100644
--- a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvjpg.yaml
+++ b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra210-nvjpg.yaml
@@ -12,7 +12,7 @@ description: |
   through Host1x channels.
 
 maintainers:
-  - Thierry Reding <treding@gmail.com>
+  - Thierry Reding <thierry.reding@kernel.org>
   - Mikko Perttunen <mperttunen@nvidia.com>
 
 properties:
diff --git a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra234-nvdec.yaml b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra234-nvdec.yaml
index 0b7561c8b9bb..4eb325cfd296 100644
--- a/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra234-nvdec.yaml
+++ b/Documentation/devicetree/bindings/gpu/host1x/nvidia,tegra234-nvdec.yaml
@@ -12,7 +12,7 @@ description: |
   programmed through Host1x channels.
 
 maintainers:
-  - Thierry Reding <treding@gmail.com>
+  - Thierry Reding <thierry.reding@kernel.org>
   - Mikko Perttunen <mperttunen@nvidia.com>
 
 properties:
-- 
2.54.0

