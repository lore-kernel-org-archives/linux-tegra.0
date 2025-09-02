Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23892D2493;
	Tue,  2 Sep 2025 15:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756828006; cv=none; b=B+aA+PDBO1Rak2eBQ7buNv+4Qp1/M4VlMIwV2EHVvx2wfy0uBdzitB0Zb1/D5sTTFOIEHAV610fXcmrAma/qcDkO4e6n9XiH0eKANamNmC7707T+Cm4UnFOTRoGrnhDvd8XZFXG40Wg+NpLRxx2KoRxE5UZsHhzIJMO5MBXVQi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756828006; c=relaxed/simple;
	bh=gX2w2rQsuEPAcrAWEXStqJZReaIvh0jf2KApVEfdGQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q4gS3SkeHxFSOezcMnBm2+A5zCYfzJ8+cIw95spl3u0VSGOyzCaL7dbwwrXsKNXEiOCSchV2C0Jyfw/iXPrK8nFfBHAtX1kuVUMVwi/oFJpG/152zSKFnbjl5MC2fmvQ93hX7o0Ue5kMh1eNTt+0oGMOuCVPSbTNdHuOoh6JsMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q3V5QEQt; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q3V5QEQt"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45b7da4101fso15878345e9.3;
        Tue, 02 Sep 2025 08:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756828003; x=1757432803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9qDZYWOWH5Nm8yxbrqXFYbkGArZ8+SY8u8XQGrfbmV8=;
        b=Q3V5QEQtHrdqHXr2X2QJnFdd/ibpOgw3T/wSlYXkeFD6gQJAvRb+wvIPQeGJg6HqLz
         X1DL1Xof7ylls2iVIRAT2tTce+bjmqH3bA+4ltqJPtozXw2Qpl+aS1lZVnh39xYRb27h
         iQ23USIByLfw0mvb7mNJ2flE+EuhSfCsn7kuIWpv257d2rv1eUrHE3zeuqX8wA0CPzGR
         cKXM7DooyG3s5eH2UJZi/RsKXacnK3K70cRrno8xOeH4lcmOklfH6AgNy+kYczK33jqL
         x0BKJjuguqheZqg6U5ORnzdUXi/TqfaxQiFv5ZkVjWjdf5fysmC5p5rLwCm3aJymT5of
         ibcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756828003; x=1757432803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9qDZYWOWH5Nm8yxbrqXFYbkGArZ8+SY8u8XQGrfbmV8=;
        b=naZy0NILX7i88vszyXbV1DbaMDnwrxin5TqtHovtnUWr/sjcGohNCtT43GXGXNBpt5
         hOXcM+046USK/VT21t7A2UYasTZHsLreNqckKNVwQzH/sCRdiT/nQFg0Y011Je+KgFbi
         g6d31ISR075tE8kN1rMUqNjlox3w+qjX6LMj1yf/y7ME9TeIM6z2bEfew1Ud5CSSQzYx
         HZOK9konId1YUkhz4uDW0BPUBnbUWE1E931pWbLXBhP757QQRFUl8IswOcjesz7gNgab
         uTgyfJCW0lJoPL+8uAi0mPFNfj3B46ct4UR+MHTqFtR2IJZ8WCH71U2cmOLdxXrXgzk0
         qyvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvmkW911NnAVjw16WYr2F6EHYmI7wj/DM0mDs0ZVRtUsVBh1D/mYjA7sod6NUZmKYVkHnRh0RoeFNu@vger.kernel.org, AJvYcCX5A9g5q2sKXjQLf/UXj0uicSBqcYZZzGhTNlrsgsCL+ZPiS8oqA5ost1dTk+JuksDtNqV8V9cXpLeqIJg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9mRLKoKReLr2GeQnn+LxvsHDSuLkvjLAC2n3K2ZKRQswmpQyu
	tiMgojqL39JsgUX20z2I753GGw5QagQo+MYn4DkgHtOBULUO/n8Q/KBz
X-Gm-Gg: ASbGnctV6jQztwz0guPdmm8A2d0YVPQ+scdSIc+6n2RV2NHdsi757Vt/1luKFrL5B8s
	ommNXpNlGUAnpC+LlqtOAqQKpm66kuY7Nh8zH2P2piEGQitcVqDU8IRYzkNNnJz7i73QdCzLJDa
	XcN2ijkcBLCphy/1SNapTBMAPZCeWOI+1y5vdizO3OScT2t+HiGqws+hp+NsFacrVSYncs8tbPF
	kgGlYpyUdsmWdnauRdDiGw4AOqBVWajgvR2Bm5aNLtwnuv3PscD0x4u9KVw20D7eptionrfPRS/
	qo37RP1nLk6297WDL/5gyHmtRxXPIfKrDwUJhfwygWS3GluseZN19zVp1pq4qdbVBT8WZyzGQtu
	Tqt8DGwASar6ZoJd9CIN+IPjkSJf+MSkgarzuCtWoDckIJK+x6aFqYIy0L6clYdWaP901vdGA3o
	RkoFSMLj9QI/M4iQ==
X-Google-Smtp-Source: AGHT+IFcgEUq9qD0GZO46TpNwavpzh+hTQklCsGnRUm93f3x88gh4dc9vHpbCmQtmoM4+DhaY2NGrQ==
X-Received: by 2002:a05:6000:290b:b0:3c7:df1d:3d9 with SMTP id ffacd0b85a97d-3d1dfa19a4dmr10655884f8f.39.1756828002702;
        Tue, 02 Sep 2025 08:46:42 -0700 (PDT)
Received: from localhost (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3d85f80d8casm6829077f8f.54.2025.09.02.08.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 08:46:38 -0700 (PDT)
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
Subject: [PATCH 1/9] dt-bindings: reserved-memory: Document Tegra VPR
Date: Tue,  2 Sep 2025 17:46:21 +0200
Message-ID: <20250902154630.4032984-2-thierry.reding@gmail.com>
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

The Video Protection Region (VPR) found on NVIDIA Tegra chips is a
region of memory that is protected from CPU accesses. It is used to
decode and play back DRM protected content.

It is a standard reserved memory region that can exist in two forms:
static VPR where the base address and size are fixed (uses the "reg"
property to describe the memory) and a resizable VPR where only the
size is known upfront and the OS can allocate it wherever it can be
accomodated.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 .../nvidia,tegra-video-protection-region.yaml | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/nvidia,tegra-video-protection-region.yaml

diff --git a/Documentation/devicetree/bindings/reserved-memory/nvidia,tegra-video-protection-region.yaml b/Documentation/devicetree/bindings/reserved-memory/nvidia,tegra-video-protection-region.yaml
new file mode 100644
index 000000000000..c13292a791bb
--- /dev/null
+++ b/Documentation/devicetree/bindings/reserved-memory/nvidia,tegra-video-protection-region.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reserved-memory/nvidia,tegra-video-protection-region.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NVIDIA Tegra Video Protection Region (VPR)
+
+maintainers:
+  - Thierry Reding <thierry.reding@gmail.com>
+  - Jon Hunter <jonathanh@nvidia.com>
+
+description: |
+  NVIDIA Tegra chips have long supported a mechanism to protect a single,
+  contiguous memory region from non-secure memory accesses. Typically this
+  region is used for decoding and playback of DRM protected content. Various
+  devices, such as the display controller and multimedia engines (video
+  decoder) can access this region in a secure way. Access from the CPU is
+  generally forbidden.
+
+  Two variants exist for VPR: one is fixed in both the base address and size,
+  while the other is resizable. Fixed VPR can be described by just a "reg"
+  property specifying the base address and size, whereas the resizable VPR
+  is defined by a size/alignment pair of properties. For resizable VPR the
+  memory is reusable by the rest of the system when it's unused for VPR and
+  therefore the "reusable" property must be specified along with it. For a
+  fixed VPR, the memory is permanently protected, and therefore it's not
+  reusable and must also be marked as "no-map" to prevent any (including
+  speculative) accesses to it.
+
+allOf:
+  - $ref: reserved-memory.yaml
+
+properties:
+  compatible:
+    const: nvidia,tegra-video-protection-region
+
+dependencies:
+  size: [alignment, reusable]
+  alignment: [size, reusable]
+  reusable: [alignment, size]
+
+  reg: [no-map]
+  no-map: [reg]
+
+unevaluatedProperties: false
+
+oneOf:
+  - required:
+      - compatible
+      - reg
+
+  - required:
+      - compatible
+      - size
-- 
2.50.0

