Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282D714C5AB
	for <linux-tegra@vger.kernel.org>; Thu, 22 Feb 2024 17:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708621303; cv=none; b=LnH/QsOqpHjqXH9Irz/w/CLCcmgV83ptRMq85ct1cHC6GSJh5o0HIkRBusWvJTtYo8UueaTScNuXnnFmM8/szNzlcarl1pq2tOpyI9tPHYep0F1BQ0xda1bm/OKjLRSF7FhTzfJH5jzyf4AHPz7vAHDWpU641nrYFlh5sDz98SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708621303; c=relaxed/simple;
	bh=cTVZ9PywukjWnFjS6XNWj6lksrIWtX6SQSd412cAKlA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o/uKNMfZFJHYvQP31jqkVvBsHXPqJBM5FlXNicGPp/mXNUlc4GPRfvLPxqq8rM9IO8AtMOLaTrk+XUCBoLfQbIIzUgabaEmjZaZEW3soBJIhjMV6uKPIKSo+77QLs27CnCEoU4xCVFekXi+SlzI86jWZfzvN0VZ29bf1R8TuIg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k6LQNbVU; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k6LQNbVU"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a3ed9cae56fso223184666b.1
        for <linux-tegra@vger.kernel.org>; Thu, 22 Feb 2024 09:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708621300; x=1709226100; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QAvdbWhw5IKrVbnuxBUP9yZ1fDUwN0s+Rn/+pZytV4o=;
        b=k6LQNbVUSWMDL5mt1qTSPAOZmkRufZjNF35dG6FF0OLZw4IFJ9JvhGjphmJh3MZAu2
         vnTdFQ1IxdlbgAfn84IkuXWCmFxzg38fYSYltik8FhRYSS42tdQOPZu+HpJF7fBGlDdz
         SpPFiyfBxkg64d0suksifmTHn2cqYqTA7jZWz0NEJvUWRHS+XQAhRp7R6V2EspZ0OjBQ
         HG63sKQjWOTV4FHFB8VYAibscrozePjhYjPPuRuNWCVb6MrNPkqQriptk+DhCo5tSAhU
         MS4wJTEZb9ccr+8dtFtorebp7cgAlW/Bt5MHJCdLCG+NOhw9J91yVSWJyvt3O5yCOjOZ
         5n6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708621300; x=1709226100;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QAvdbWhw5IKrVbnuxBUP9yZ1fDUwN0s+Rn/+pZytV4o=;
        b=r+/6hmyb4a3ey6EH8d/1Pvemw+tQ//XCsNgpNAu6ACfTD3gDpV/GcrvpctbL9pyXX9
         sn731aZCdk4pbao1YvbMGq9fRuFxYpCRYTE9FOTrYwgBO6iJWoSx8sO4h22AslmE2Ysg
         Swq+/lVn5y2XmEoYitq4HLhRHFrRpFuJudsY9IvgToHBtvyjOpYvaahsUPdHN6RjG+Zl
         03y0YUmCoSbeJmoWISJiorF82z7XBRdkgSQ4GsS12Ysqn2ESxXWzZAaOrMujPuh3p/Y8
         GnhwX+m8Z7RDpsc4RswMptIWNnnoCzYNFhaq65YiVUUyhwrk4U+d0Ue6cSvHV5Ta9wFK
         J48g==
X-Forwarded-Encrypted: i=1; AJvYcCWbc5+QVDODk6McybLrTrvYXRVbhZrWSmc11l+j162SwMxHiY4MuSaKmFYDo0kvV7l90AxtL2kyMpGgg6O0w2wpYGLm3eL9cwRfl+Q=
X-Gm-Message-State: AOJu0Yy8rO3/1vX0pwYEwYgEodObJwLxS6YAjmckC0gdzag2f9RGBKtA
	1jhlP8KCw0QvfeSkXkDDXgUA7W5ddI38o3vE86dgZ1ucz469gbiT
X-Google-Smtp-Source: AGHT+IEuMbyQakrCwBNvLimeiniYEeHsfkC9ZqfosHMDYEqM58PnPod56leT+cxTQl6X0pcAmsRbug==
X-Received: by 2002:a17:906:e0d3:b0:a3f:a7d0:b57f with SMTP id gl19-20020a170906e0d300b00a3fa7d0b57fmr636407ejb.17.1708621299942;
        Thu, 22 Feb 2024 09:01:39 -0800 (PST)
Received: from localhost (p200300e41f2d4600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f2d:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id wb15-20020a170907d50f00b00a3f6592d34esm1176045ejc.4.2024.02.22.09.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 09:01:39 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org
Subject: [PATCH] arm64: tegra: Add AXI configuration for Tegra234 MGBE
Date: Thu, 22 Feb 2024 18:01:35 +0100
Message-ID: <20240222170135.3096122-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

The MGBE devices found on Tegra234 need their AXI interface configured
to operate at peak performance. Ideally we would do this in the driver
based off the compatible string, but the DT bindings already specify a
separate mechanism, so reuse that.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra234.dtsi b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
index 3f16595d099c..84c74155a5ca 100644
--- a/arch/arm64/boot/dts/nvidia/tegra234.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra234.dtsi
@@ -1461,6 +1461,14 @@ ethernet@6800000 {
 			iommus = <&smmu_niso0 TEGRA234_SID_MGBE>;
 			power-domains = <&bpmp TEGRA234_POWER_DOMAIN_MGBEA>;
 			status = "disabled";
+
+			snps,axi-config = <&mgbe0_axi_setup>;
+
+			mgbe0_axi_setup: stmmac-axi-config {
+				snps,blen = <256 128 64 32>;
+				snps,rd_osr_lmt = <63>;
+				snps,wr_osr_lmt = <63>;
+			};
 		};
 
 		ethernet@6900000 {
@@ -1495,6 +1503,14 @@ ethernet@6900000 {
 			iommus = <&smmu_niso0 TEGRA234_SID_MGBE_VF1>;
 			power-domains = <&bpmp TEGRA234_POWER_DOMAIN_MGBEB>;
 			status = "disabled";
+
+			snps,axi-config = <&mgbe1_axi_setup>;
+
+			mgbe1_axi_setup: stmmac-axi-config {
+				snps,blen = <256 128 64 32>;
+				snps,rd_osr_lmt = <63>;
+				snps,wr_osr_lmt = <63>;
+			};
 		};
 
 		ethernet@6a00000 {
@@ -1529,6 +1545,14 @@ ethernet@6a00000 {
 			iommus = <&smmu_niso0 TEGRA234_SID_MGBE_VF2>;
 			power-domains = <&bpmp TEGRA234_POWER_DOMAIN_MGBEC>;
 			status = "disabled";
+
+			snps,axi-config = <&mgbe2_axi_setup>;
+
+			mgbe2_axi_setup: stmmac-axi-config {
+				snps,blen = <256 128 64 32>;
+				snps,rd_osr_lmt = <63>;
+				snps,wr_osr_lmt = <63>;
+			};
 		};
 
 		ethernet@6b00000 {
-- 
2.43.2

