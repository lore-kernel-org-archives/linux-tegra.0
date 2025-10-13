Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A423A2E22BF
	for <linux-tegra@vger.kernel.org>; Mon, 13 Oct 2025 05:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760334983; cv=none; b=pSecBf+8w5hOPecyTWmxeyfIsndrHU9AwExvpFT+4g/kdt/HC7RoHBu6n7g6cPhr/KEdZqfUBR3gON6Rdhjj+3+YzfptqU1fOP/qtZuWsSfAGYl3Ghhxge+YU1lL/KQeMELiNmmq6ndrljw4f/y0MSh6SEGtvd4wqhTbV7SpLPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760334983; c=relaxed/simple;
	bh=459dlBPh3LInR8NOH/R4UDIusnkt1kveYPqleYn7ivo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DKWI3nJJOAma530g7NIg6BQcbw8iAd8xYDIiKpURFLLg2D7uT8EOARr6BjmlmWfBTlxEDWj6JPlesQoPdFx+AXaDncryvFmBFmhwsNff2viAP9ma7JUZzxz+wMO4Ggth3OV5EmNP8Hvbh1tsCuNnqMQf34WU+Vo++seB2S7V36A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nFuqtsX2; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nFuqtsX2"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b3d196b7eeeso603403766b.0
        for <linux-tegra@vger.kernel.org>; Sun, 12 Oct 2025 22:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760334980; x=1760939780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+a5/f/Fx6IMBMc0auLZUB4h0ES81R10KOuZfrxfUU8=;
        b=nFuqtsX2FK9RdhfHxvZeJckTFGPMhY0C8dOTFEeb4dGktj1/qP8LFTX/C7+Piv2g8s
         3NF3intM7xplnOrLrEOpvlcg/5H7CzYymMgpoDIT9JPp94DkFL9gTCR2PTmYqTrocZGZ
         Mj/X8lxmmwNGZtbd2199qEtdGvqvjYPQYfr628f/UIwuZW29WqA7qAu6JTMlyegQMBX0
         WGMbtjUnSYw0d/ivKb8UXhmHmwtDEA42bTGzAxxnaTWPBML5mqnY7TX6H2eNb9HpTrsH
         4tbN/F0n46JrYTAddICVoM0VrflI9uAl+aqh5yBRyM1jYJuYLGrbBSxbIOWNPTdpDsAE
         B2tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760334980; x=1760939780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0+a5/f/Fx6IMBMc0auLZUB4h0ES81R10KOuZfrxfUU8=;
        b=R47UsHsZSzFE7hMYKPHTTtA4lfvXrTmBtNb0TUL2DiEUdhlutHT1+R6owLuiiFlP9f
         bz+PQmv162KNwwYHyFEzj8Tz/9QJWHPXZV0zBrXgqcjFqkNMsZDG1MKf9uJ1Hd3o9ZJP
         6OFmdmbA02LuKTr1zY9cmn485HNXhfB6dLQiUkM23zd2/uxtv4nERrUYNAX7c1rPWvZB
         nNSDO+evvNSAxNlG4BkC21/5Bavksa9BuCCOnCD7HmBMRMacjkew75AlrXMDcI0rn8oS
         K0rvgA79VgwxXK1SJsxcYQ8Byq/86XbClIhJcvmxlOsh1JcXVO0Koe+gTydSL5bCW3Le
         CJ/Q==
X-Forwarded-Encrypted: i=1; AJvYcCW1VN7I8K2vKgcw3wH8qwV9UJ4sm9kVsa98/91MAjNdsZSWh4WW548d620vhjkDJj7yzpqW8EUuts4cfg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+rHKaIi7ReF3LGJS4ekL0uHpjGqKwrF9bZxXWM5oZuVHcLCX5
	EdA4TvIQxkXeI7jrF1wjhJXJOmnSyckhO0DCPdONxUs6NKNgKFhiOcuZ
X-Gm-Gg: ASbGncsKbP+pRBewJa4jH1N2AfF6675DHIhLv+K8fYg1c8SxjwljpLJZuxdH6oszGV9
	T0msccwdxFNmcwcHHYEVUeBb63jN1Bziv8px2rAwWQQ6OzLC+FbKqQpmW32c7zOieL9KG+Hm6A1
	Enh90+PXotYse8Nh5u+9N6YLq3D7QA71x9zmVKy2pvLcOm6G9U2ARpb+bg5bD1/PPCZn3CJLluB
	iJCJYYQTa0XrWkVTUgP//8ClxJqsnB5SPsYqeKFngjydLGtTHh/Vw51OjQ4hz+eFYGEjZQ1rXS2
	Z8e9txh3oLjq2lqaBzoWR5UsiX3a16dyDA3FUQpBlxHcxUUNgaroEF5CtrUf0A+9Ma3TqRucOvo
	9JS/DX/8xz0VDGE0CrqpgTAYJuBnn7gFQSskudxOlE8Q=
X-Google-Smtp-Source: AGHT+IHn6OVFq3+AsRTRv8Xh/omMJt1RsmRRGjDow+0vFNYsqUIkRvU051xfXIY6tzcAIT30syi1jA==
X-Received: by 2002:a17:906:c113:b0:b29:e717:f0b0 with SMTP id a640c23a62f3a-b50ac4d3497mr2144906166b.59.1760334979537;
        Sun, 12 Oct 2025 22:56:19 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d63c9a3csm860912566b.23.2025.10.12.22.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 22:56:19 -0700 (PDT)
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
Subject: [PATCH v3 6/7] dt-bindings: display: panel: document Samsung LTL106HL02 MIPI DSI panel
Date: Mon, 13 Oct 2025 08:55:41 +0300
Message-ID: <20251013055543.43185-7-clamor95@gmail.com>
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

Samsung LTL106HL02 is a simple DSI which requires only a power supply and
an optional reset gpio.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/display/panel/panel-simple-dsi.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index f9f1e76a810c..01ac0af0e299 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -52,6 +52,8 @@ properties:
       - panasonic,vvx10f004b00
         # Panasonic 10" WUXGA TFT LCD panel
       - panasonic,vvx10f034n00
+        # Samsung ltl106hl02 10.6" Full HD TFT LCD panel
+      - samsung,ltl106hl02-001
         # Samsung s6e3fa7 1080x2220 based AMS559NK06 AMOLED panel
       - samsung,s6e3fa7-ams559nk06
         # Samsung s6e3fc2x01 1080x2340 AMOLED panel
-- 
2.48.1

