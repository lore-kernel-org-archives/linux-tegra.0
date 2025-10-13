Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5F82E06E6
	for <linux-tegra@vger.kernel.org>; Mon, 13 Oct 2025 05:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760334981; cv=none; b=p5h8aiBX4Sk9qCO2AnegsAA2fi6UCFFEZhM2OFSRCYTlbfJ1ApRHUMCPB7DXL8+yXZn46v0sK3b9hDT0soeWvscbqRETwQeA6F2lk8Uzx7n3Q2Dxit0xU8VlNvzKWw2LOYDJDT/zrbQNMS9YU1kCdGNpyTe9A0SpP4uEakqsKto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760334981; c=relaxed/simple;
	bh=Ubq1KrUSxqn44bDKjL0Tglob05w52CADvwCDYj5e0/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qEsrgfZW4XjlDIgBW/HHzXFk5I9uTTkNMzuO8LRjRzf2348vEw6gDqZf1oSObCu6yNdK3niVQuXh9P496y0q2V33euzImM/+MTEqrGRpSBjizdN76F8ajFcI54pfzwVIxb4eQTesiRkFcqrSQaWWXkLwDmOIc/z6zj8Nyngs9eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k1rBkwCX; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1rBkwCX"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-afcb7ae31caso797799466b.3
        for <linux-tegra@vger.kernel.org>; Sun, 12 Oct 2025 22:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760334977; x=1760939777; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0NlbLfnaH1AYI1Kzf2XAYKDUFV4VkFnG/ReSb+d8FKY=;
        b=k1rBkwCXeLXShaqNl2H07favUJB0Bs9fucWoCkMS33As1pi6vmwWoYfQbHDAkqKANC
         nFF6cm9LlXHiNp5w285FUleo7hIsgE5E1znq8ufhzLmdHAZfSVQALm2HsfTt0GK2GkcP
         vDnrfWscc0BugoOPmEdsJAY9ZUK6Kk+pNlsQom5Q9mE7DrBLip0O4h4SauLFfOdDl6hy
         R5MKqyA56BfSukOz9vZ231YqHiJKjFmbPqpl//1HSxOmoCTPkx6hPIGxij3dRMpQ08iW
         SILM/ptCjp42NIpIXPTFCTiEOGKHJTAoaErh2W3BBz+QTebXkGFFTV9V5aLfwDCkKveH
         ZahA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760334977; x=1760939777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0NlbLfnaH1AYI1Kzf2XAYKDUFV4VkFnG/ReSb+d8FKY=;
        b=WTDPGphzcAUVTnB/pO22fCIJfMUZQ+BENrpCkaMhOUw1JrpYG5KzIDVlukcmVE2f7g
         15rOcUosg3d+OM4txVRePDVmk8n/fOwDPGgLMSmp9xzT8zmr6uYqDi+toPKMrLJE9sLj
         DCMWHFpObnsVDbkv6TRr/kI9g3XkK2gPCAuR2ZvHEVWUFQBa4WLgfMQV5Lb6f9SzYBwp
         NtU52cwAy7tdXpebmagNaC9quKPEtGltixMf7CZeIl2unxtpTWuSU19+roA3eRPvrhZS
         foM5kYM9NFhD5LnMRbqQo7dBsgrE2AFunAV3BOfcJY1xawXEkWlGdF9QSdbeYg3ZZ2tQ
         M9Jw==
X-Forwarded-Encrypted: i=1; AJvYcCXlm8oCyabzswqQp4geKQYSi+Oe3cv0ti92WNqLpcC+JRytZgkFu7+ow/Z4NihnD+R7/06Er7YY1sghcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYe513ps+9YR6aFZt24UqHVGlikj+sLuF6XSDFetpI4EybXzga
	19jhwbo2NyNvDXbuqA2hYpyYXacWIhcxGD9tmagJqosVX6twusvAVGZM
X-Gm-Gg: ASbGncsG+C2HKslh8T6Jc89pEcQVwdfM35lgNQWnPZjjRKyujUyIKu1ZBc2iSyeyHrm
	+P+bfRCNIqT1XjId9zfS5fE6XiuH4BTq4GmjPiTmJLRDAyfhLnGXTcH3Ym2YHeAELLS6A3yu2XO
	fiFLZeJjR6iJ7rx9hJ11lMgVsSQqq+LvgnE7ClUItyVvGElgwMYSn8eHz+Z4PiU48yELGjUvi63
	4ZIvRDZrCqV4tQVLOSmtzPkE0x9c+iT4f6r52PlyiTzBCbOp/9TJ/pTcQL3iSWzm8EQsUAA1n+l
	R+DZMqL15c6VqXOk+yesTZyFJK4p0OaTmMgdG8ECz5F97n/Mq07tMbnBDULbSmNoiJ1OoM1nHyl
	68w2kqOn/N7muRYmTCBLKY3GqCtfruYDRcx7bykuq7AhKZUM6nIT4pw==
X-Google-Smtp-Source: AGHT+IEgUNiVYk1c/l0uwnmFrssSP9QtQ4ZPHREFA23q3yikEOY1+LgSDt2qIqexeuWomC/l9La4Fg==
X-Received: by 2002:a17:907:94c3:b0:b40:664c:3317 with SMTP id a640c23a62f3a-b50ac4d69f9mr2061549266b.43.1760334977303;
        Sun, 12 Oct 2025 22:56:17 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d63c9a3csm860912566b.23.2025.10.12.22.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 22:56:17 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Douglas Anderson <dianders@chromium.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v3 4/7] dt-bindings: display: panel: document Samsung LTL106AL01 simple panel
Date: Mon, 13 Oct 2025 08:55:39 +0300
Message-ID: <20251013055543.43185-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251013055543.43185-1-clamor95@gmail.com>
References: <20251013055543.43185-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document Samsung LTL106AL01 simple LVDS panel.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 4a5ca013d0db..adb244460a09 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -274,6 +274,8 @@ properties:
       - rocktech,rk043fn48h
         # Samsung Electronics 10.1" WXGA (1280x800) TFT LCD panel
       - samsung,ltl101al01
+        # Samsung Electronics 10.6" FWXGA (1366x768) TFT LCD panel
+      - samsung,ltl106al01
         # Samsung Electronics 10.1" WSVGA TFT LCD panel
       - samsung,ltn101nt05
         # Satoz SAT050AT40H12R2 5.0" WVGA TFT LCD panel
-- 
2.48.1

