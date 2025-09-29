Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9852C30C11E
	for <linux-tegra@vger.kernel.org>; Mon, 29 Sep 2025 14:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759155929; cv=none; b=nBlWYyj+IxOgn+wo/Zfqh/AcA+XnrFUoTboIWmdsMwMY9zy0uX5KKDeIJ8WK1zqcE6jPLkSvP9BezHArTKIsrb8LmKQV2siVZgP+8LFwjAPR0hFgo9XzKg0aiIyEc52qbr7yeQGbQ4AXlsmC0+Kqwb6R0AQy+MiwfVxUgTqEEhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759155929; c=relaxed/simple;
	bh=9vZlTXASj0vXVJmJhzIUVkh9Z6pFkT6GG3bTu8l+BvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZdLbbiUxQwbvXel3+hltqUQotCsnQU20mmldK3nNVdT8hzRVVg5ex0ftDaxmCyqDp6+LzZlU0RBXOkvj5m1s1M/+TXc6j+C6R5OZQhT9wKjufi4+5e2qsLD2+DL9eXxYh0w4fNjD9mS7GjgNW/h4SWyzeIoaFoR7gSjrkVeJMmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mG3qBCye; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mG3qBCye"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3717780ea70so33122091fa.1
        for <linux-tegra@vger.kernel.org>; Mon, 29 Sep 2025 07:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759155926; x=1759760726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/sJS/3auvarpuuSF9ICFMHK8CoOId00igm+ctuXL+w4=;
        b=mG3qBCyeS3UHE2OwfEFb/gQeB3YpbZgL2xcV9mz9kako92tjQkuLNulmFPPoS56vqv
         5dnW3OP8hIsMwRBRBxanr7ym/TeXM0IQqB86UgAMV3ZjWf2ll3oBy0zfwwQ2h4FFc/Gz
         a3lsQS0oqLmWK8MNNNorVPK+/Mvjz6seo8jqiAQxxn3+YE8KM6xsjEigxbAIvhpWmqdo
         hbYOfWV1Dfbf4HRz8TQgI9u/WL/fsiMzyPnyN1Ux2W8wMc6SCmcc9SNd2VQOGDG2VSJ+
         a1SDtBw5dT1E89MR+NyG0AS3lgPIHmitesfFUudMCL2sM/ycRa7kVGEeSnhMjaYIGwrG
         BFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759155926; x=1759760726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/sJS/3auvarpuuSF9ICFMHK8CoOId00igm+ctuXL+w4=;
        b=CIVAPDtxqgv2zzc5cpRnzDXAFJn4hyOVymOodD11kXYgIr8hKAv2mdkfpMSltyvbHF
         85uto4a+ai5YLj5fcoByVb48QbRUSJzDalNkzOqooSCXrhME9zJM6wQmfRwM1xvW6JW6
         rWaszEZIT8hl6FgZw6pLqlD3j3jCZj4T36oz7M8ziKb87mq8/BtFi+4Ec5ntto2tX8N1
         LcLLKrDTdUI5uGRTYcBG7jsToCIgJeVcaGhSZjfsQDj8QAtsRPmjEbJsgfRyIvFvGVZV
         uxWGGo7g8bVly7Ux5VQ021DrbbjGu+Uy5S8QX42GPfUTBdzbI7uFQkStSnUXjiln57x3
         YoNw==
X-Forwarded-Encrypted: i=1; AJvYcCU5wJmb//up17BReu/DXwvUKFW5PbKNx3hXIMNAXNU3KPh3LO+jWxLRaDCEIzEnryM+Bthpo1PgNgbz3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHPh4UL+oDk0yX36RBduwL6+qaF4sVCHlNEealEh4NAyFEmiUe
	ZJS5uogwv6aTgz/lHU2m/3KZxLP7lTRW4cQBjv9XnS41vJmEBPfkC1Bu
X-Gm-Gg: ASbGncsNdRwl7iHLD6h5o1j2ykLTjGJ5Z3+d5kiA2TFIX0v6Bftblp1mF0F5lhx8wVe
	ac9REIpxnlPo6pF1vLjizfuo14RoXzPvpzAqQR93izglF2VD40UzPPbUUSCiNd6GbfBTWvBJeRM
	9dalQ7sat3F/n+AZdisgO39PZbYNA6DEi2scNwpYmc+HB2+T27p+2sqkkEUvXqBO44kKHpYsevp
	ct9X9/0bLKsRTEPjifSabA2pSRJnmPyjTx5WlxtP65vtiXBYY81BxLzjWCAFKEgQRi5n6Oit+Dv
	k/m6ZxAlVzmRutyvP3xewD9Y9FLAMOjsvDTkjka9xGuHHKDOqJZcG9nYWO6JV8d6fZUMUR7mfKH
	aLjNPAc0uzelvUjppv7SbUQCJ
X-Google-Smtp-Source: AGHT+IFs82V2KEASR9Gz909OBVFnhk5qy5a5uIoHbA3f3Al4eEo2M3QlGsWCwe13fMV/nwp2V7oEIQ==
X-Received: by 2002:a05:651c:4419:10b0:372:8ada:bf8a with SMTP id 38308e7fff4ca-3728adac271mr18360531fa.35.1759155925644;
        Mon, 29 Sep 2025 07:25:25 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3728c23e6c1sm13201001fa.52.2025.09.29.07.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 07:25:25 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
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
Subject: [PATCH v1 6/8] dt-bindings: display: panel: document Samsung LTL106HL02 MIPI DSI panel
Date: Mon, 29 Sep 2025 17:24:52 +0300
Message-ID: <20250929142455.24883-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250929142455.24883-1-clamor95@gmail.com>
References: <20250929142455.24883-1-clamor95@gmail.com>
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

