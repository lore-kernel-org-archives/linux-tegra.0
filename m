Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841848;
	b=ZgD4nibY+/8L7qix4zGrLrNeJHF/JiwZPam2EZ1rAqFj5Y8XPLONeIoYFgRujBg/XKTl
	 GCmqinWA2nMm6McPkksZ675fb7YCxroqrYwtr6jX5PART6cEiH+DL1zf2qaTIyl2NRSHd
	 kNA1kKeRSocLqY5bT1XioQlcy7qhLozE8D3nUGe2BlCJLRSfrvI39A7kWDjePFOOV/9r/
	 F1x4Ny3EDqxEL5bMsqmqpCGhppIO6agR7YVDenJsdD5K8vtWx5BgrMQFAZ3l5i0H8ZlDm
	 5Tv5KHa3YmF6E2zmOaKZIGH82yG1kk6qQU9Zd6mQ1dK6dmvacWVtNMB7BfHaVu37olw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RasVRzt5BSAwU9nANSyfsH3MNXe+l8Z8yVQSBiyQGz8=;
	b=JObBarGN+MBKVetW+CHn6EJ6AkydI4SZHQ8sQ6U5SOd9vLrUakRh+HwtopbFqijW3nBo
	 FduD22nso0CPTHc0pqi5PcYjy2IZfe1iE6YR0IIgTB8z/3nNutZ6aveXX1P6yFy9gg8LF
	 8D2MnkeIznddeRbwf/F8K0U1p38/vIkeSqf82srMHeKA1QAST51VCsPcl7QkbUaIzz7FI
	 TOE3txRF+tAOiljkEJ4RInSO4iv+YOCYE7v9/j31PzNSUGlKmuamnEPbwCueTisOYjgke
	 hPfBEVm/NfPESTNB78rTnPYBUbx1cCudA/GzsG0tkkE0HRa+C4LSrtfikhB3zr2lBxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="aU/zSNlB";
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED06C606A886
	for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2026 15:10:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED06C606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aU/zSNlB
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c50604721c8so578647166b.3
        for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2026 07:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794841846; x=1795446646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RasVRzt5BSAwU9nANSyfsH3MNXe+l8Z8yVQSBiyQGz8=;
        b=aU/zSNlBarxiJG3HFoMuahCuEfQ+zzg5jL3uVMD/T7px1Q9qIaMuWpd6H76V0CFIqC
         Zqhx2k41sN4GbI1BtizlBJ9Ut+4vB5IEi/nulPCa7aMupowAUeiucrdtvEiF/frfK5K+
         0L3x7Ddvb0/tHTGQi7E657iBmpa+OV5Fb4/MxxTHuCxJCdNtrW1jF5oxohTGAk3hhfQK
         nz7ODdVhI/ybez8geGlgOmZeX4BFWPUPjgXhrfcPgB1GlMJ7WCJQ+TWUI1wKkfeo5/Ab
         oi4k+mrNUnyx2MI8cNA3tM5VwrWnE3RxayFaSR8L4rbDMDw2/nbH9k76Nc1wQRA1a9GZ
         poSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841846; x=1795446646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RasVRzt5BSAwU9nANSyfsH3MNXe+l8Z8yVQSBiyQGz8=;
        b=FupWyIUF2yHwgKlzJo/UJiVwIbBVwxkp8WeBxdMrzdJHi4JHGBp6NV1XY4ULfKwkLy
         W6TWINxEJMVNIo1hDh4beKGqqEgwXBgUy/X4EqndS2UfAu338F8HqDZYOy3HlQnoWyMT
         zDnvdvM91t3bUcLTJKRwjDnEZSIUs+xKKXZ7Xr25JfK2b48CvxC7qaMXpngyoZEbR5wz
         OUqDWy+8dCNGLf6vQWtJGLDigYaR+6EIhonP4VNqbJW0Tf5ZBe9HGSw823C4ohJim+Gu
         TfNck5mgYKK7Ui6sfhum5t8WZCvul8xD2JPH1/2oGbPAuhSoydrihFoN0yAWq0w6LgLI
         WpYw==
X-Forwarded-Encrypted: i=1; AL+hErHr2j4Ajx/UJIE0O5SCKZVyngsv5g7ag2UqZj6EdA9Rtr5pO/5vuj/I9oU+W8d+bN5hM8uwQp8006pDag==@vger.kernel.org
X-Gm-Message-State: APuU4Z/COJbVUcQW3O7ZmzZfVoWmGgD1kfJLErZGNDPY4t5LC6r98Naa
	NJefQZ9/+NKJucq8PbDrGd6weJkZJ4PT1qpSLHL70tj7oCaAdJ9McNkC
X-Gm-Gg: AYBFou2wGus8efKyEk8HTvBvLB7rbdYwxh1lt7VHLpbxyuG9LlCHfnvVR3njQ/IDDqj
	6xkHOXCqf+DWCi3Jr3eK8UTG+DsCKTM02m/fXIW9SCF0cimmdz0GyV6s2cDD6smdmIXXaIlA0no
	vOyEzTlQABda0aMFJidCbI7VBjsYlir31xPQ6QmB2dlTGrJY0xcWQpXqQjo7tA5pkzwx+6TRanx
	08axUVRSoxrMLUp3nCLLskHn7iQmagbxs5yiG6dM8V+rUW/bqYLqq5vGqokzuJcZAJVGWXU1WkB
	uBxttEzo7fGfwjA4t992JYWxJBMYP8BRUCfKqV9aOXOixYXYhweCpGTMy/u1C3+NAJAC8czx0cz
	4TSb6FT5X1c4aD+J9rFvDrAy9wrds877ij/KBHZamWKxgZ8ZEf/1G+qvipPCaFHK3AQgq0iqLet
	xZOYNG/AocWwIYY6sI8Ree++iFjUtqpjcM63bSlIuwNZ3gObVELWC3YVV60qe2xRDXzDr+5jBHW
	e3gH7BDFlQ3nmdLLYHGfCpUPwEIFkw4PVQMhnbCz/T16Q3uhhfDwLfSeqBXv3hVIEKWw2kQdpr+
	9uY+/GlKv0mVXHiGY0EGo2r/LQPJOo7Lxqe81u44Xq1ZKGf2pUfNfzcQuCDYCDL62skkZWmt9Ih
	3RbdUt2Bx0A==
X-Received: by 2002:a17:906:7955:b0:c37:8c7c:a840 with SMTP id a640c23a62f3a-c50963aeccamr886718566b.18.1794841846300;
        Mon, 16 Nov 2026 07:10:46 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b93a85sm420868466b.84.2026.11.16.07.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:10:45 -0800 (PST)
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
Subject: [PATCH v7 07/12] dt-bindings: display: tegra: Document Tegra20 DSI port
Date: Mon, 16 Nov 2026 17:10:12 +0200
Message-ID: <20261116151017.274764-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116151017.274764-1-clamor95@gmail.com>
References: <20261116151017.274764-1-clamor95@gmail.com>
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

