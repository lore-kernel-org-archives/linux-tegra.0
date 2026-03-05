Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC27E3CD8C9
	for <linux-tegra@vger.kernel.org>; Thu,  5 Mar 2026 16:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772727065; cv=none; b=rKEyD3iiC90nEcTsKr0agJ12DArtM8ruf9D1jMwvvq1oyIKBrHA1ceDzHSP8m4FIvQXf6Pxkirv+dndNiYfs7vn54E+OPJ812C1++NFyh915E8F4kx8usTwLfQG3oUWsCre0Bxx1c5xn6k6H8v4kj0nRnBaBgciNJdnk5tBoCMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772727065; c=relaxed/simple;
	bh=RMwhwayoSzcK4Bl6kVqQCuvR2QJJ4r8CrZZvWWNojTs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VqHDkTRv/414MjMpbzZoyfpju8NoHe1F5RQ5C0G0gGr+g+Z5jaXqdTDvTfaa6kPBOC2EKTbOhAIueOY8vMfDwutggx+hYpMxrwHppyYqIT92OzCeriz9LLeTA1vzPCy15QAb7YAaTVzeuNjvWdW3T85zXslFyGrsy7WC2btn3uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W+u5aIke; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W+u5aIke"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-439a89b6fd0so5040637f8f.2
        for <linux-tegra@vger.kernel.org>; Thu, 05 Mar 2026 08:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772727062; x=1773331862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Dy0HnPVie7HgXpLwSqXJDHNxRmTEZFh3hOUd7M+N2Y=;
        b=W+u5aIkeovVWa24RrD5fVhl4XkH5RQKxd2BN0kiIi0AG/vnw2y6SZUWhp8vAsDPm21
         2cRIlc7LgkMvcEHwThjasu6zAN6gqBYTmhON0fhkTrezMJFKPZD+k980rkg/2VfwJElD
         /D6kj3rES/Tra73tMewZv8qpNYXdYO9BJkUBMac30H5E9tcvxDOBHCLPs1BvDqqIVsKt
         SxKrRPUr/tREMXGMVTz7B+MB2qKcfD4KCSJ17pAqYdUQoIQQ6VOLfOe2I/HrPuIz0RvC
         Fl9htQOxGeLJwoIo+FsK/bMaF0bO+1RSHp3JQRRk7M2LIa0q5OAaA9p6okTc/fWi5SkO
         +rpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772727062; x=1773331862;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7Dy0HnPVie7HgXpLwSqXJDHNxRmTEZFh3hOUd7M+N2Y=;
        b=aTCQg4Vmz2V38LL0ywcAD4CPE0lKHmEz2QsZxUFuY1DztJpqmb7iDX0FH61PK031ZM
         AsQRSeIau4O7iZ12LjwY7M3aLlm/ofXWYDE5Kl+pMf9LEvkcLcmFFUtqliYPwfK0/ZTA
         esKAeOftF0yUvDXsdAWqOqaWDfZoqFoz0HaFo4XhZo1onDVOrem6nkX6a8Gh1cKNOzq6
         ebzEcLXGVL+0ipPIYhyApVojbkYnLBxkIzp3UgOR1UffO/V3y5vEXNugdSavR8WRBxcM
         r7gmhKCtA6t+jnFmm6yrMfin3lhrmcTppfQuQE1ZaCWm/wwDED/L/Qtjd5O+VSQ+E4p/
         S5QA==
X-Forwarded-Encrypted: i=1; AJvYcCW0jtNrZwgWMOwV9n/cXxYYsN4/TE9sFFLBHZW/wwEJ+cerawf1nALhTOFfNiCMhWIosFn40w4kPW1YKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzGG1i3oM0pdFNL3CUR0nI13AkGBj1RDa89PRaKLwm0NqmMWptk
	dWYDRsmVSxcugemNB8yClz2w/GALk27N0m32GoTvW4kLaet2vOrzriEiWWchIQ==
X-Gm-Gg: ATEYQzybDIaJcvgk6mQaQFXV0DM4Qi/TefZOF3pR+Pwf+2EYYc0PvfMDlqyKFsTcFs+
	b58Mt4O3bTEHhhy1J3KyYTLp5H7MnXvucNSxD5J40geuDkgKyU2B2HkwazMeukIv3JWNRU1+RGm
	/e9Kcp5Z9r4VpVMk8tl4fyX6O0pNWOSt3uqN2adSLnfuDoi6bMVdndOyfuBT4ztw+3GPRjjpICQ
	12XV4V1ZXdhd4dTs54YN1fDR0lbcP1d/iNjdVMl5McnvGXZFACKXQlyOjNXdg43Pjzwni6C9WMT
	RD5e70s5tZqt5vBN6hmWM0OZ1Y3HdrrrN+cpf98XzHWSEAnk9yRsx6S9Lc+BKud8ZEFM0EIvgiZ
	qQWGoP6usEpWLyG+RalUitKQ/dnezhVWdERGUWcPppS2Anvxop5Ae9W4ksS4L21OC+Ph87AA+ne
	eezRtJhyYrppV7
X-Received: by 2002:a5d:5f50:0:b0:439:c157:2577 with SMTP id ffacd0b85a97d-439d7247e84mr671194f8f.34.1772727062286;
        Thu, 05 Mar 2026 08:11:02 -0800 (PST)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b8807a4esm31426496f8f.4.2026.03.05.08.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 08:11:02 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: display: tegra: document Tegra20 DSI port
Date: Thu,  5 Mar 2026 18:10:34 +0200
Message-ID: <20260305161035.64548-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260305161035.64548-1-clamor95@gmail.com>
References: <20260305161035.64548-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the optional port node, which is required for correctly modeling
a dual-mode panel.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../bindings/display/tegra/nvidia,tegra20-dsi.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml
index 59e1dc0813e7..0f4837648d17 100644
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
2.51.0

