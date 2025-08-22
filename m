Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A69A3126A2
	for <linux-tegra@vger.kernel.org>; Fri, 22 Aug 2025 13:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755869645; cv=none; b=Qgz0eUte8iKDE4XBPF+IbttiDvz2GZVTDU23dDZX4lj+Xail0PKvOiJ6BEG6wmJXm7WpMTFC3/4rdfqQrDtuZUSEP06VCsgEagPa1n5IKQN3hTKGX4oPGzi7VwALtVtpUcLj2LOFkYvoBG8h1ZOrrg9ms5CtKzlbQEondXoHTl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755869645; c=relaxed/simple;
	bh=ns8imbJBx4C3VrvaBGidv4ZtmC/h7m9iRb2qgAqrZBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kY3qiTihOXb1rRkJbbx5tMCMvSj5aC/2cSAiiYPdiduVh8B2xR/XrNj6m1S3IIU6yZYrZynwpHvFhEWK9/5yC+xbXklg6Mj9E/R55iR0HkTdDWVfZsPU++su4DLOSnvvVpp4dxpHYpPczXRqdLqzo3RGSFfSsI6Oom2rJl7ZLY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q6KlWkiK; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q6KlWkiK"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-afdf4bb0e5cso31587866b.2
        for <linux-tegra@vger.kernel.org>; Fri, 22 Aug 2025 06:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755869642; x=1756474442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ne28tbpC8VIGZbl82F5AMsqB6uZwJ1NTU53GkFSodNM=;
        b=q6KlWkiKxh46AWy9ol745eVAfnyw7S5qmF3qxbi9fRPZIEcH+EDj0SjwXGGSlbUX5T
         vhFGU2GhEjalP3qXw5ekN4vUNSZdveQmfyTDVkVVF5WBxXiUxp2yktlLebJPJLGxkU7g
         N8+whff8FKWgroFxHU0kLYQATbXZVsdcEsolYMy2DRsJZhXUSIJY21p0gSxG6GT42ltm
         yFiFtaBxzoBNJE0vwtVSpgGm83PUaSdpnngQsCbbC56Rnz3Kd6lrOLqw3gSeLtpblJup
         EgouHzoGyEQy489Prtw+81BJhJ12J+35Jm5pCbg7vj7+mAYofXPqYFEaQO6Uibs9r8n4
         MDGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755869642; x=1756474442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ne28tbpC8VIGZbl82F5AMsqB6uZwJ1NTU53GkFSodNM=;
        b=pVyxU3CjADUXrslO8EXAxk+HedxC6rDN3K/gbYtgHihQW/pIeCu5zw+8bZji2djxhW
         DYKc81rQcxJD16ru9RPaRAXoJMasMNk+V834IT5EjcYRvQFLp8gv2qm0IgWgDnun1Vm9
         TREh0l0rNVHat6qB5LVYsvjWUKbZb8ijK82UaFBrGX3SVuh0RQXa2Y74MYl+bbwSEr9w
         bjIgPKr/D4rvJ0NOpwcs/XZ2ruJaoZj0Kmh65g0orMcsiQM1o1IdfkWhj4DBNAHlmc/H
         iNIQphPnTGkzVz6VMbyCDkwCd5Yav6zPfAsWQiPuxvUi6npegC5yd/JYxaOVn9wJBYf0
         O77Q==
X-Forwarded-Encrypted: i=1; AJvYcCXqZYvKS2xM3A/ORkXqzOr488mXOG4fm7iF4NqBSVrV4ywIw9UDQIYIB4rHmOZThnqbxiONFVOZVtkCJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXMeZvmRKrdrupjMMo0qRYyci3nKyBgOJnVCTSwg33WYKJ4aBg
	WnxSgRy9jJ2g1sUojht+txVLCPmsSdg2DY7NjggqDChh6+k2+mhFsrax8t9+cSIg5c0=
X-Gm-Gg: ASbGncu78dKAiFfegNmcbTsX7R4wHxvlf8dsQ9s409yjPDDcNAjwwfXFwptp54aSm8V
	4Jmwpqsq2jJF7KVOsuUJkpqVfvq+fbzAREHjKmiEyECoOGds2OvYXE/rcLvAH2JAQwqQqOWQb5e
	h4LoU1wWdk9vDQWl35o5Mvhj3+FOC9R397itTtUqBxvifHhAQUHUXguerUNOOfMKqVcnPC9FJGL
	1bwRLcsEizYn1IE7NYuxm9WupcWvMsCc99wqGFMjqeAi9JOlDx2CKSxyBSU1LHpLxWkWWUyluoz
	YpTk0TJESk0C5VcV25V/xboadzU9irXheFcA63yVERx/jTKLjcBhRXoHE+gY/rj7RptgnT+NZ2n
	JXTJ9TT2U57DgQ9i6AjDFbNXD24S5YohHMQ==
X-Google-Smtp-Source: AGHT+IE/RgUMhyr0PNdCI7Qukrbmep8ud6mpyF55q9Xq7Ba9E12fIy31kNibIcLkWDsgRPakkS/j0w==
X-Received: by 2002:a17:906:2449:b0:af9:a9ea:f42f with SMTP id a640c23a62f3a-afe294b4624mr125018866b.9.1755869641532;
        Fri, 22 Aug 2025 06:34:01 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded537f98sm606493066b.104.2025.08.22.06.34.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:34:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 4/4] arm64: tegra: Add default GIC address cells on Tegra210
Date: Fri, 22 Aug 2025 15:33:55 +0200
Message-ID: <20250822133351.312424-8-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250822133351.312424-5-krzysztof.kozlowski@linaro.org>
References: <20250822133351.312424-5-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1227; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=ns8imbJBx4C3VrvaBGidv4ZtmC/h7m9iRb2qgAqrZBY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqHHCzlRNg1LWEmhCPkSvmsoKK5EFWL5YhUIc8
 T0F13v6WVKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhxwgAKCRDBN2bmhouD
 12AOD/9kkxIAM9sdeRIOlxJGbkWTVEvSZKks+owj1bO6CEcAyE7nG/b+RpdarbUKdwEevGew3va
 pk4cK4k9oSMrawV9iw6KN2GSOWPCuJ+Exrkk9ipiwt9z9SADA6M9Y5LWIOgZrEJg+7ReeVf1TqG
 yANqxcVqxWl/D44sVcwyHMtGrf/d49hfAz8W3BQ7dcIQjh8a+i+1X8yQq/L34LGgpz2cimd4YyC
 xy2NmsO03gFMAGttStffuXHEwNtvvpcxrCdUiSeNTXLBOSFtTcRzyj6eF4jR0JkdsfYnV9dKuFS
 FtrK1HB16GOYZmffagOmi318yN6SCRlw22UZN5sriaedk1exqevB7RPyB26ZmtNSArgjzM0OWu9
 UTBngM+aAse1tOvmILQLOY3obyAohxrNkMtMl9taTJdQUhmT2hxhFP1y+Y23HeNIp2e01ZRpiFE
 SSl7cvd4buL/wca108cAnm8YWdD7hG+8+r+xoZS14LM1ITv1rCaARHiU2cArxTlOs2yGC51Xx7N
 rptFLQTwV1t+boUTPjp8Wr2G0Awpk9ljRjd+pwFZEVp3xRCR0/VbacQWyPv5SocGwCZ2Bqzw17c
 UbVCGGNVW0bTCYctp0ymt13N/C8w+CcIZPrcXmiM7xk89+xeV6eGVSGdhF4hmV5hdOGZ/wgbyx0 EdXBZzdh3feqdYw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Add missing address-cells 0 to GIC interrupt node to silence W=1
warning:

  tegra210.dtsi:31.3-41: Warning (interrupt_map): /pcie@1003000:interrupt-map:
    Missing property '#address-cells' in node /interrupt-controller@50041000, using 0 as fallback

Value '0' is correct because:
1. GIC interrupt controller does not have children,
2. interrupt-map property (in PCI node) consists of five components and
   the fourth component "parent unit address", which size is defined by
   '#address-cells' of the node pointed to by the interrupt-parent
   component, is not used (=0)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/nvidia/tegra210.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 402b0ede1472..c39c2b9ec3a2 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -409,6 +409,7 @@ i2c@546c0000 {
 
 	gic: interrupt-controller@50041000 {
 		compatible = "arm,gic-400";
+		#address-cells = <0>;
 		#interrupt-cells = <3>;
 		interrupt-controller;
 		reg = <0x0 0x50041000 0x0 0x1000>,
-- 
2.48.1

