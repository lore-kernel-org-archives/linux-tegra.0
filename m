Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795335541;
	b=azuJHKXOhNmQXFsiDT2MtG3YiQx1cX10Gexd31ZoEoYpnogHh4hpZKnOYbi2HXJGTnpT
	 gjCBbP9hvCAalYid/flTkBtItwTrJ/eq7AYCzGR6lM009nofnz37Dq4DTFYcumCrXrYnP
	 /FJM2PmbUcY6VM8ggGfBYtPsZEQhEwXTpIx/Pcx0YAsxOIXWFU/dkH7kemwm8TqD28G5T
	 fgu/1RlWu05/3Nka2dUC+ABgfeCiYUxWVkH/xUr4D61vNzB7mc3nwqJq5jw72jZFo4l15
	 T4hHq1cn9oB6udwJQVpWQ6K9NGHk0wClr1QEF8oqDhuahRI2LOz1vkZBzNG7MX6qnZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795335541;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RasVRzt5BSAwU9nANSyfsH3MNXe+l8Z8yVQSBiyQGz8=;
	b=FOpA4s2PARYlPGu7ZXA9shEQV7PugWWwKeHCcWuGQ5/uv/pSfKQo0vybf3mGNNsN3kh+
	 dqtqqFgyCZbhIABrbx3dO5bCzvca2z9uIN344OWXf+7HOdp5FPasRKnUlqb5mZ7HWBmwb
	 AGOJ8mvjO1PTfVD6CZJ5j/lnErh8bWAddrYVXYVcYy40Ctr7xRuuQal4yYL3Oq7EefLhN
	 6FkOsetaKkditHV+M2sZIr6S+at2H+dgj6RNr9/TgkrYXtPTgdP0sFVeyBPQd+Ts3VJO6
	 hTAD6DAHeVwgINF1+RBqycCplxG+38KBaVuTpMDkRcjZY4e5747cWBZxoSnciDu9F8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="L5Q/M8uY";
	arc=none smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D36606A683
	for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 08:19:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61D36606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L5Q/M8uY
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b87a240de3so2716057a12.1
        for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 00:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795335540; x=1795940340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RasVRzt5BSAwU9nANSyfsH3MNXe+l8Z8yVQSBiyQGz8=;
        b=L5Q/M8uYIldfVMCbG9nkGWzhI3yv+hPggYAhcn4NsTzzrXBGzMTp7AuuPmVkTkSGR2
         2mw22jkytpEuAUQsSe+4yA5TJ6cIZKARXPKtVKjrAmjASOcUDWDpDMU9VIxAWB4SStlC
         DndTBSLCid+Y7rvo8KXmt8mJuI9OVteBzMKC8Z2wM6zisQa+v0E4jMmTTcyvYAK8LTC5
         c6T45HGE0k/3jEcXxD77c6yDb11Kx2ZZPLRXxfqDOKFauoeo5reLvdoaWo+G5YOW3Wy8
         RQg7AC6NP4hF/7Pks1DnI8GdBvRgB2mSSfaLuoTGxmlmt+dxYNuZu+JxcdR0ew72DGBl
         mtJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795335540; x=1795940340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RasVRzt5BSAwU9nANSyfsH3MNXe+l8Z8yVQSBiyQGz8=;
        b=WH2NR7cyDkhhPFLlqN7zOAPR7DHpXsEQfmfztJmqXlbfnQMj4mLWOEoGvAPH56YSo5
         N5xlSyWZlguO957stXEqmpRRMpjin8TyulnSn0C/jXmyqCl8ONpsyobLEPhKWwA4jzdZ
         qp9MIoMGRvRcWl5hlHj94rnb93fqclEvx+aNe/dSHqYs7zkYSoN9xGiHVoBdpkPnaCzO
         FDziUo7bfQzv1l95qX4l5+qQeshZSNT105H3VVJ4RoCxzhXhuuzbBHemAl3IhgOlxS7v
         DLcca7sfwhckGbJ1j6e9pQ9Ove3a5Q34RDblvbUkreBZqZ9Q/aJERVoOUWcyvC0gv0D5
         pCjw==
X-Forwarded-Encrypted: i=1; AL+hErF7keIW15VHZrF33SpPUT/AeF4CMxtw9Fe4NTQvVIiqiMScXw+MI35qb6xQDGuOsEvjSWyvixbsZQwcOw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+bFDXbGihLnQycMLRgHpxB2Mm1BLLNGVIv0SXohF/jBVqZDE8E
	O3G351CXiJJL9RefTk7ZC5C2ZgwQ0k1/r+WlAXWI1tLLcbafgU4sC4RE
X-Gm-Gg: AZFdTZcgud0QIuLiP1krNEr0PODD9j6cLiQeXVRgrrHS9NvwvinEIF86YA2o5dulUP0
	KV/zZ/AZ8OptF0pUcpLPUJzQ+YdEICjvneZX/xnWsrTU6Zc84lL95c2uLOhgwV1Y4uTTagXiefz
	t4Mrzj04Fwq7eaxJD0kJUwgP4oK13Bjd2kBbXx3AmLdVgUiKdzZxmqaTCmKJJCmcXZbxGSmdZTa
	90tViDnS7sTPqQGX3IYCyKk1VOlnvWiZYYTIIUrfHcPJcDYzMmRUjwOkzRlFz9nCQ0c7PbwKhuO
	uF6J4l7zTAHf0BlQ38PwYQtpR84CygLjTGwN2fglexUSIs+y9KjZ+wNKCbA5TYbx7StuMpO4Z6V
	gnQt1k+BeuTOuv3pHfZlcvNVe669SNlFg+revlkiBeyzf7/6ghCnBIMH0HtN/w7TWSS6VHuNhjh
	4Aq7L0vLVG090nu/C5eg9KLSrOVMs23Io9qXjWFS96ZEffy1qkgA3hiY/vLh80pTkewIujC2s2n
	XnEB3V5DErUFBdBbkiylZ079yz1T8djseh1S+yXbH/+7H31aA99cebflcBCS83/z8B6eZM7OqRQ
	/IY9PMHNKZTi5bFNE3skctJtJzOnL5RmDazjvGunI23tCahYqjWSrVDrwK8O2NXhZO6dbjtxbub
	IPxHhDtC4BQ==
X-Received: by 2002:a05:6402:210e:b0:6ba:9d0c:cc83 with SMTP id 4fb4d7f45d1cf-6ba9d0ccee5mr480982a12.31.1795335539667;
        Sun, 22 Nov 2026 00:18:59 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e8ad0sm3617167a12.18.2026.11.22.00.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 00:18:57 -0800 (PST)
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
Subject: [PATCH v8 07/12] dt-bindings: display: tegra: Document Tegra20 DSI port
Date: Sun, 22 Nov 2026 10:18:15 +0200
Message-ID: <20261122081820.53199-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122081820.53199-1-clamor95@gmail.com>
References: <20261122081820.53199-1-clamor95@gmail.com>
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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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

