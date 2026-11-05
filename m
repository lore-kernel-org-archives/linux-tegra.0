Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887563;
	b=mb8aaRskwvZ/YhwfgoCcSdLg0fWID2jsg7GxBWyXffUh7TLU4ZxyHBJ+659/ViaAB/Jc
	 N7rIBrYxWYo4RXerpUZpvdCutuaOqGnWSEHO4ovUL037cN59Pz7excnGr1RDAEYRvqp+a
	 tjLdLHe9atb2ZVlYbjUlH1Ko4G7wlSM6BNAW0g5Za4bwEBoSCXTqq/lXoYiKBe1V0H5Xs
	 xOpG+Tbp2eURvPDSCLDn69drpe5HPL6+J92rPbB3CtmMeeSubMGT2Wv661d1ynXT27LrX
	 a/fj13rXGA9NdPucYQFALDK0Fg5GO0NNHn7rzAnlyeOBMBHRtYg44aBH/B9wzzrqgwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887563;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=C46XMF9ntFd1cNzpW0ccZaBdDtR6GkHK7zbgrzppajQ=;
	b=4yBIG319WTko6yCjuqnZMYT+5q1hXQ4NFM9QXvHF+FzIXn4oX+9tizJDrRpOxrfxM8VW
	 B6+Eb+nMPRHnL3lQaAwwLz/SeuPVcs0ZyCzvuiH5x59sOLVptSOnwOkG28ACZijNI8mF5
	 VeIs1g3pPddJezgJRlQdxggIv6vmeW9w/zrJTJWQ+LPsneo+0mtlFipNxQdRs1jLXdEdb
	 Nan39uduJ/9YUJYVe0GEHTh9IQxXHpeCzqZftQFfH2omHjC0fg3ttlwHIsoc5zoz2YwDC
	 pC0V/Uq8txJ6RSjYioTT8t3oLGKJtyJ1QV7IGWlO3BIJZq/Lw8D0HHU4tOiKKan7Wgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HdmYwzJE;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3F8606D811
	for <linux-tegra@vger.kernel.org>; Thu,  5 Nov 2026 14:06:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E3F8606D811
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HdmYwzJE
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-490d59c3edaso507741f8f.1
        for <linux-tegra@vger.kernel.org>; Thu, 05 Nov 2026 06:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793887561; x=1794492361; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C46XMF9ntFd1cNzpW0ccZaBdDtR6GkHK7zbgrzppajQ=;
        b=HdmYwzJEZlhLuP8KzIubtCCI+KKp1Ul7qZkS1Ew10px1p64T2MjShRp2ubhsZ4vM84
         4/QGyq/LcQpeRjpjUkDiMXG0+gs/AIA4TcXoYR+yL9vxPACuMcyPgD7TZNs+zgHoMQTA
         1AHUfyvf2gOLAUh0Txcp+YsQVYGEpDTCWRvW0Uk7CxHzi4aKFrhKNhVhlBXdBTny/+rb
         lizMIpTer7pC3rPiozNGWaH42w6Onk/ukS9g40+5CCTo50X3Q20d36/YF/j5J+NcBnPy
         RmqsciNJvdFM66cAFBuTUGXXMauRQ7IZ5+0sNuavmPpvS6LT4Fo8XFXi1p5oDOwqQMPh
         D+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887561; x=1794492361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C46XMF9ntFd1cNzpW0ccZaBdDtR6GkHK7zbgrzppajQ=;
        b=JQeiKGS2165dhsz5EGiMDS8pjgAgUYHgdzdTutGmZfglAojnR5cfHqVYNZY+2zwe5h
         aTiEesFLOE3WD7WMtpTc7eEITYxKu1S30VXQP8SGkZoqpMnPi1B1YS3Mt+NWDEd6KTaD
         epW2OHNvm9U3MgIzs2hxh8d/bOE62dflpA4fZSnReB0Ag/TmJkrXLd6ezRdbqtrk03Iy
         hBN8uH/4TJhJkKtZf5RbCxUJBHGe2E0+IvxECN04tU9Uxq0jU1Cuba5MDqQ7Jpp57G0R
         IIXla//NX1NJU6bozBfvexClK8IC7JBBwqVoEYgbQOgsPWdpFNA2t0yu7kkZpAaqaPsx
         cfXA==
X-Forwarded-Encrypted: i=1; AKwUvBz8mjBJdf2OTL78Xl1/e5IxKFVT5in3blwufhvY0sykoQD2IVOoKHrek9k7JEoOY4dHCJHoZJDw/SEHDw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8OQsxFPfCgD8k0ormBW/lSxm1wXH5b//nzMIXpkmolz711gKPx
	4iCsJvQuP0YHg8pJNh7+Kfn9A95r2kj3b6I1lTmd3fF+xOkw3rGfKfK0
X-Gm-Gg: AYBFou0Joun/dU1guY99VKrCfplPIDsQ6u3yjqpb+iWZQkW6xeHHatoHJrrfOjz/HAt
	6mP75KTAdShtY+EWlD583RBq1mG582fn/cafRW2vt5nE1NDkWp/iMkrc+rMCd99YjAuPSeAc48S
	I4BYKmhU1pSo5YS9QRDmjRNU5kj1Xtyms/83r9ktBtIJ/m+gGpk59EmS9um2/d36S2JvW/H9RiU
	UobbTo6aleYI267hnk7cUK3D4EL2lIAWA9btcxMe2HMHolKSKLGeDmG/+mRIY8ky1RBH1G/zvY4
	OWXoZYU7bmllkjhiQ27bhjPV8eysCixQKw5jivKKnkGnbvH+JHdfKpqGnSfaLJQ+m+REssLhqUl
	tsAztxi+0vVxEgMynqimXYiBvetrTEkTtGYdr/ctPqZ3kPtACuXehogcQKJXdIObRXghTleIcEi
	/mEmk+R0/k5Rng1AS99St8Efn2isPxadLmFsm7sd9TK6xEuVOWOJpOE6HBB732Efz2ax0HczM3Y
	mwYi9tLxRs7lHtYP+YqvnPKX125Pwb9Ym1H4auNvlmdo2mu/9tSaz1D7pllRbMWNv6K5ByKGsRi
	j8+9FnhkSI21BLOvckfFZlEnW0I/KScPqc4PD1Cz584OK+V2Eg==
X-Received: by 2002:a05:6000:46cc:b0:491:1468:a504 with SMTP id ffacd0b85a97d-49117491f15mr3215686f8f.21.1793887561432;
        Thu, 05 Nov 2026 06:06:01 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fed92a753sm11454111f8f.45.2026.11.05.06.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:05:59 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 05/10] dt-bindings: display: tegra: Document Tegra20 DSI port
Date: Thu,  5 Nov 2026 16:05:05 +0200
Message-ID: <20261105140510.165165-6-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261105140510.165165-1-clamor95@gmail.com>
References: <20261105140510.165165-1-clamor95@gmail.com>
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

Document the optional port node, which is required for correctly modeling
a dual-mode panel.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/display/tegra/nvidia,tegra20-dsi.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml
index 59e1dc0813e73..0f4837648d179 100644
--- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml
@@ -83,6 +83,12 @@ properties:
       gang up with in order to support up to 8 data lanes
     $ref: /schemas/types.yaml#/definitions/phandle
 
+  port:
+    description: specifies the connection port for the dual-mode panel
+      and is required only when the panel is operating in dual-mode
+      configuration.
+    $ref: /schemas/graph.yaml#/properties/port
+
 allOf:
   - $ref: ../dsi-controller.yaml#
   - if:
-- 
2.53.0

