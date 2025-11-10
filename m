Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 544EC2FF672
	for <linux-tegra@vger.kernel.org>; Mon, 10 Nov 2025 09:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762766132; cv=none; b=oq2EabXBSdxpLAytZUYF1LfEKAm5Bmryr+At41V8d7/SfUZASa9W0EmlYU2SpyWHta+wABpegKJW/UUvSSRgIMqpp9E5xQy7sW2dxWWVhO8hLk00q1ylIZ3uXSkBCETEaXNWr6R9vIG6efGJtYBRjmC7XdORxc9tIH+ztJVKteI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762766132; c=relaxed/simple;
	bh=Ubq1KrUSxqn44bDKjL0Tglob05w52CADvwCDYj5e0/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JUi/nlrWs9TQI60LYWF9lKpVFJiFUGROtHCQg3Db0MObLGewoXhXj3BaxT5pF6HzHzBEdQp0NJN33EDM6nMpf8MH0fVCpCDCVYw25WiNb1I3ZvTrVS9Cz413CZcw4bECLx+18QBlXEC+lQQky9MTtjKyB4x2dYgNwAMHIyJgalU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=do95ZCBU; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="do95ZCBU"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5943d1d6442so2526379e87.0
        for <linux-tegra@vger.kernel.org>; Mon, 10 Nov 2025 01:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762766128; x=1763370928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0NlbLfnaH1AYI1Kzf2XAYKDUFV4VkFnG/ReSb+d8FKY=;
        b=do95ZCBUgKdfnRF1yICsFR1eSv0ifgcM+yyf47RAnIecEPAB+Xdhvhx5OYpRUTdt3F
         GH7jD03BE6wdIuCrkJFg7SnlVxE2wwiR1KPF5E+lzOLfsgOIuPBNeRPPb0Tiz2EFTEcb
         UYa2vs1Yo11C7gg0/ZWYi+2bj7C1+aQXVHSbdWNra6TjdXh8yazJuwacXqHBtNK77PKF
         GmY54aHLz0Sk23Da4sxF2IEWMmxcWQWfjrbZxEE9giZY0J84TZ6MiuiNO++LlymKS9YH
         zIlzADt1WDZlbDHEu8GbwhkmVmAX9NNFvLbNLjlM4qhkzTCtOly7Yc2JYYMZCenAbG3F
         RmmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762766128; x=1763370928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0NlbLfnaH1AYI1Kzf2XAYKDUFV4VkFnG/ReSb+d8FKY=;
        b=LeylUZLD2wBhFSnUjtjafn0VL8Z95h2wx7aLG9tXjUlIg/m353TShJaiwvmr0VJOmg
         OxEO9LX6Z+Ts/DYWtWPNS1yDxby6/6GbYPyUN2BaaxwDZO6JBUCXyzSqIx+3eEJiz4/k
         jHQs7moPyKNozFdqN+UQAg3KKu39UQ2dETRJ2K5ppwPBTyyL8QWsfCs/Cmz+eSrimunT
         ZB/3Hm/dATYIxAOHu4xw3Td6+rJh7Bt7z9EmKi5KU+7wh1GI+dt4gCVIScgd6xsYvbPX
         D4+1tNdcU5Z21XRlI4eJ9CQDoP0P+I1rzR22uGvJaE9//j3PsbvXuAw2DgsZUdltWDSa
         4XkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUdjYoUSF4nsO2Y71KPoLgxlwnLZmuYYB+/GPE/omotTiSeNXDwMh06ARZ3IdqQaeb9oWgLdJy92OrpA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJifXklG5qWiAlH4jHwkj7UluZvfdIzGM8k53PsZqCzp1Odjui
	Sz/EPdSrqw3RtDgSLustuuOSbi+1OGnFbreAAcOojNGj7J+L5nGBO+JZ
X-Gm-Gg: ASbGncsWbCYlpVoZtNAVA4YeyfjK1yO9IP1u7k6eH1CJIuO99e2LNqzLvsDmvEHJBU5
	CDsCTvkopiUwclHyjW+OD1YD4wYZgB1llRy5OVYUuPU0PUnfxgDGnbFGPJ/fI5RoonyzMTd774J
	jopN+/7WrsXPUzE3SSQymYORbhtkXwFyxe+6QXpCq0NRPimN2xJmm9wjS9DY9id+P3Kg4HzuUFe
	6LfO43IdX1kj9kg0M4QJUmcX5gWeBP3eOkNiRNgWkJQYEz6tOqF6h/Crd5YpZcCrF0Q7O0kUJoX
	h85YgqilH0FogDVVA96yTgjzspspZ2C9+gTF0UpK/PVExYqSKEXtypv4CBX4bcqve60/qQg6cUH
	k7bgELVShxOZ9EeWbPhFopTLFEnEmGT3Wf8RVWAlP1bcL45HRdECW8OKslE/BkAm5SbNN1oC/lL
	U=
X-Google-Smtp-Source: AGHT+IHDS3A8pXlI+xOx72GoRTOq1E/nxmRQrFx2InRcqIyyMLoPJFpVA039XzbqYUYjEi5dGijE8Q==
X-Received: by 2002:a05:6512:3a8f:b0:594:2f1a:6ff0 with SMTP id 2adb3069b0e04-5945f1653c4mr2154809e87.9.1762766128299;
        Mon, 10 Nov 2025 01:15:28 -0800 (PST)
Received: from xeon ([188.163.112.74])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a0b76f4sm3852006e87.73.2025.11.10.01.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 01:15:27 -0800 (PST)
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
Subject: [PATCH v3 4/7 RESEND] dt-bindings: display: panel: document Samsung LTL106AL01 simple panel
Date: Mon, 10 Nov 2025 11:14:34 +0200
Message-ID: <20251110091440.5251-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251110091440.5251-1-clamor95@gmail.com>
References: <20251110091440.5251-1-clamor95@gmail.com>
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

