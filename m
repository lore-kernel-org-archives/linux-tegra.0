Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793287788;
	b=0/SqCShbc/5NtU0IFDZlvwHCKVFEMeomgWFVGmAKPbCITJW7oo4bAQ1M0svCda25iXuF
	 /Z2LWtBnF4A0vnVszbH4owKdm+kvElph9X/GVj5Rj+4hEO4YpHHkeeNET2Kc40cruR6MS
	 gpxKY0Fmt+BCzga9xgci+KwmNaA8JME7imbI2VYmHWk2mFx45I+cxNzLGOtUgeaDy0ieY
	 tTaodpFqmAf/QIrPOhUOdUUq/2ryDv/7zs/0NasDypwJdUhsC4qer/wDgFSYu2/f0D8K8
	 DiX6PCHwvnsnWj31zXe1a0c2wW7LT9sj54hfznzUf32m40/9R1DmxoBIVoa+96vos8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793287788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=C46XMF9ntFd1cNzpW0ccZaBdDtR6GkHK7zbgrzppajQ=;
	b=gsnDj6MOMCpqDHpAlOjwcoKTzzfY9veOAglzRT3MJ7txI87e2UDZZZYUbEgskluE++4O
	 DujForqG8p7b/Y+EM4jT+caIRkEyF+t9qRcuQ+WfOFDIVEX7QN6aRNqa078G2atwsndCh
	 dcaTtiiYKlA9rUemauY2RrViLah+nZTiAr7oAdyAMAEX7H5VXgaf5KZxNotIXewtaUpFO
	 UVuWFDtFDMrednOz8KrMlOh2xKtIQEeLidy13C2lwtZvH2ILy31X9dtu/jZyGaYhTQsZK
	 aHeZo0h+qSl6P53UxKm+Wp5rGLb4Rx7Ff3c3lb+XEErpW0k/brGsp02YebjJD2LKO1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X762ACNe;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32487606A32D
	for <linux-tegra@vger.kernel.org>; Thu, 29 Oct 2026 15:29:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32487606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X762ACNe
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4322d310e7so334210466b.0
        for <linux-tegra@vger.kernel.org>; Thu, 29 Oct 2026 08:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793287782; x=1793892582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C46XMF9ntFd1cNzpW0ccZaBdDtR6GkHK7zbgrzppajQ=;
        b=X762ACNeqXO2h9IzkxzXoaGb3K8Kfshd40xetGeLUvdcIddcE5GnQSegoqa40UVxWi
         umnYwbH5fJT9GFMwRqEaB2c6dStBzqYLsiJwkQHWz7XpDUm6BCgAfQzcrHWjHq30dusB
         tbnm19P7qJ1Nh81kQyVH5C8BYbD7/XaN2UWkDkDufz6CHtFMdwL0iDB3kFlAAqvUFm4L
         511aBAH/a5j+OYWzO7E5n3+jm+fgoajMr/FvbgHk7kGLpJfhU+qzbZrxT2DXKyjWnWaz
         mnjczFLujENsgwnM65cFHWy8MpP9ghfB7MOqktm5/OGXZOqxUN2OJrFtAfe8uPXoC079
         ng1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793287782; x=1793892582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C46XMF9ntFd1cNzpW0ccZaBdDtR6GkHK7zbgrzppajQ=;
        b=aAy7lCuGbM7d0dAO7l7wZq51uPGoij4DGJAU/W24Iro5v6pq3TyFx/f+DJHvdsdTDM
         TyBaEmIoXptWF1ZZGm4HTWVEoAWpS5z7cRW3pXYQUfAjYauAHY1G5DuSHR1ZiWsaAz0X
         KfR9mo+rKxM11GEJjWd6Sr8sTLrtwnJDdJBFHIWmDoEKYQWYv2o0QQhp6IMqB2KOxgOU
         qr23hV5e6zZIJTdPBGYefhPEHyIDe+/hxZDHf+yriyKBhwbT3RVsxLtRz8fRVi7Xr8T4
         nkTR1ViAWgeTjw59nRcpI+VSsLhqI/PByDnqLuHjiZ3jh12j5AUZ5JYD+RNQ/h1QaNd6
         ztaQ==
X-Forwarded-Encrypted: i=1; AKwUvBwEqAQ+vqXhzFiX2VQuVQpr/fkGARtndxc3Uv+hlBM3w+j0xKhrQ2y01ECipp9EJKv48DeCq+xbA0ylVg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJFcs3ERAAS1ayxm51Y4WsIE1m2X5p69z09QGKwWafILv90Lavo
	i1GgF9b4CY7tpqdtxYqoG+G/P/7MYdbnhHdqyTbImwrRxTnAvkuN9hSl
X-Gm-Gg: AYBFou1XHMd73dIbiDXqxYVoXRk349MRJmKe1ofyWxkPxrtecBc/87Dv3Ei01ItanCq
	VaPNfberz/Mrz8362vl/socKnckH5iqeki+Q0nKNwW2L/a4fMsRXqGefqaXBzR19Nqw7Oib1Lav
	W2S9IlnjRlLayYGr5l5wXjYfjhxT4PHsULxgfTxOCohFLNjqlGatDdH8GcXi4wg+uFR9dztE1p7
	OEox9Wq0h1TG34zCx5lGzK+JxPZwxL5IUt8KlK60qTWNRONEOOLQ+s65E+3bPk8Y3oGtdvDiYQw
	F+uHIOB6bdEpO0u+ebnh3yciCj1CHHl4dcxonAReyYG+kovr8UIggBG6EmWwkA8iw9xoo4Jm+mI
	qX/Fwnb2gOT4BuZKNshlBhz48HdkXEU9lJqXJukRhogxWdXpKUph/dXTy9dmM+5U/Te3V+Idsi0
	sn280jpXzm2Fm6AhIOJmY/4YFtrV0cZuoHZXeJu7vnPYNLXKHIzSmv6NzcFbWIvQObkUqJjseE4
	BjETYS/at1obR57gtku3diQ8E0wL951VRgUWivMnVFY3Ic5EIqlWnxk3N4SSiS5jHVurEVlSCfK
	G1Bh86OT+RBBqTaSl9b0kk4a50qu++xN0awq58wKz+YVDk8bkw==
X-Received: by 2002:a17:907:6e8f:b0:c46:ba33:1f0a with SMTP id a640c23a62f3a-c49bdf380b7mr518463366b.31.1793287781542;
        Thu, 29 Oct 2026 08:29:41 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4ca27984f8sm1252166b.80.2026.10.29.08.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 08:29:40 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v5 06/11] dt-bindings: display: tegra: Document Tegra20 DSI port
Date: Thu, 29 Oct 2026 17:29:04 +0200
Message-ID: <20261029152909.234584-7-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029152909.234584-1-clamor95@gmail.com>
References: <20261029152909.234584-1-clamor95@gmail.com>
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

