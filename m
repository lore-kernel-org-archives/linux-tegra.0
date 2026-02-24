Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30ACF396B86
	for <linux-tegra@vger.kernel.org>; Tue, 24 Feb 2026 12:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771935626; cv=none; b=Lm3ceJimiMW11AGPVwiV4LSE4f1PPCuhp5rCkk6nDa8+xT6gGAEDw030GkoGiu2DcXaxybwurp9cuEcVk4D0QviwVVsZU42m8yxi7MPX68etvlXCNm73z1ADpjZVuxjvXJbkTRT6zOFljLdUt0UIzwRiKtgaL57qnChtXWRVoO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771935626; c=relaxed/simple;
	bh=Vlv7hjadzolvGAJw7ypQeoRDm1X9EIwDs9/wBQrRNZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CZjxgR6wMMhbpGJEeq2nweoFHPxFuKT+VVD+seVT30d4TwhlsOFMhBKMh6K6RTnt0BFhYV3eMExc4Avm4NL4/aPeeuaLmCHNr7iKjnPtN85HtYbHOpGKrFiMqVK5VXDXlXd+1zGO8xxHbOBcpaBJZG5A9byYUJ5GJTZPQqh76lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=crWRUl71; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="crWRUl71"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-823075fed75so2464167b3a.1
        for <linux-tegra@vger.kernel.org>; Tue, 24 Feb 2026 04:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771935624; x=1772540424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDJ0Gfg7oWDz1xGI8ZNNKjjsgjUS855MyxuHLu+cOXw=;
        b=crWRUl71awcjTgB76VKouvnpvuiOZUl1y2antwG0t6P7OmqbLxZodUNKpnIVRdhE0H
         EXohvyKwNI6ORwx9T3EdFFglU73it1amVLEUTVVR1+vmHWBCOtYdjTSoQgxN5YhaVe6g
         LC5U22NTl0bteIkmzdvJIqMYsZ/dders4lUOyj5Ukq+/6nnexOtXfx12fGeoRnhp356x
         1eiSzpDLIv8glt2+WpTC3FNpG7+njrKjs6ac08iR/2yg/+vBs5WxV8/CIqhO3Xkz8GsC
         llelz+oG1oSHrdDaGsLB/Y86uzj6r8LFv3td/cee2qKpqFi3girZsn8CTDNMjGgOxRmm
         8zQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771935624; x=1772540424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GDJ0Gfg7oWDz1xGI8ZNNKjjsgjUS855MyxuHLu+cOXw=;
        b=bZahDEMVe2dqZa4jTpBHYg2Appbp+tkLlieHwdS+kiO27CCXDBXnMxYANRyfmhB3px
         xYyp3Fch+u+vgt4XWqPfWxdzEjlpI1A4kQxgI5rJFUF7uxy8GK7ZA8kYWk8hNVuo49ze
         +69huhF2sc16Y03BDRxT2ahNQ1tJefWFmeumTESyN4IfoIkIKkLBQLMl14jTHuDNx6mk
         HC07mMODulrutTG7I5Yk2HcCom9hUNcGRomG83sia5FuCcVvcK8xpr/sv16Qk9Mbm8qF
         DImDkquN5ewrxyNP/re53E1xDDVHSu3PIfxWcGRxinpmuGzlAnghcPs3bVR/CvxoXaOx
         /Z4w==
X-Forwarded-Encrypted: i=1; AJvYcCV/a9Nc+ZgqcQxENzcmaDRCG1dVFGvAR2WNRlZep5mHtHa16aGKsUOhEt0sF0iFFi0Skh+wTtntTFEqoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YynarN5yiWrbK60rrAVpNX5CVLahtOuf1LZf3ZsIxf7moLh7jl4
	gjZO2LHwJ62UDBUazrPgxkWCUDjeoXvQ+6C7pPK01TTPCR5uyDP+mOKU
X-Gm-Gg: ATEYQzyCPR3LDYJxxv/9KmiE5aYjW5IVWEPeL/gxZmD3Ym/zBUlLbqP4fOjT16QMLhT
	+Wrm04LDyW2cMrPXQzmI89ieQdEwbYPzo8Botop4tDV7mpJcGbWH6EoVWXT4Vu3tvtEQKZE8tHr
	jQRSt8H2QzCLdWB7go2rECSzOgaGyaB1jdKU8koj+4pQGoVGyvfleu1nEjsETG5bJYZApsII7R4
	E3O43b5QDMCD2aBve3u1xxPBFcyQZYjmQ9cW8ajbY3Y4xQXpYMOPvO1qqiEqSnWP2TugBgcFP0H
	LqMYUo2heUwSFLFKlgipLNJ/HieW/Wb1TS5fHdmbWl9oroMLxHxy2mWMLIwUqfCttv+VPaBabpT
	+EkW6Uptsefd2JLZwUIh0B7V3rWjKqTq7LaOh21KjKuofbu+aGr/4nurKBKXKMsn6nq2oiqxOMZ
	KpGBPdBv9A7+pVMOAFn3xNjSSZA90Zkw==
X-Received: by 2002:a05:6a00:198a:b0:81f:4708:b46e with SMTP id d2e1a72fcca58-826db8c010bmr9648841b3a.20.1771935624430;
        Tue, 24 Feb 2026 04:20:24 -0800 (PST)
Received: from rockpi-5b ([45.112.0.78])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd8ba11bsm10613950b3a.50.2026.02.24.04.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 04:20:23 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Aaron Kling <webgeek1234@gmail.com>,
	linux-tegra@vger.kernel.org (open list:PCI DRIVER FOR NVIDIA TEGRA),
	linux-pci@vger.kernel.org (open list:PCI DRIVER FOR NVIDIA TEGRA),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v3 2/5] arm64: dts: tegra: tegra186-p2771: Fix invalid PCIe nvidia,num-lanes
Date: Tue, 24 Feb 2026 17:48:58 +0530
Message-ID: <20260224121948.25218-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260224121948.25218-1-linux.amoon@gmail.com>
References: <20260224121948.25218-1-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

NVIDIA Tegra PCIe binding schema (nvidia,tegra-pcie.yaml) defines
nvidia,num-lanes with an enum of [1, 2, 4]. The value <0> for the
pci@2,0 node is invalid and causes a dtbs_check validation failure.
Update the lane count to <1> to comply with the binding constraints.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v3: new patch

http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml
/media/nvme0/mainline/linux-tegra-6.y-devel/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dtb: pcie@10003000 (nvidia,tegra186-pcie): pci@2,0:nvidia,num-lanes: 0 is not one of [1, 2, 4]
        from schema $id: http://devicetree.org/schemas/pci/nvidia,tegra-pcie.yaml
  DTC [C] arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dtb
---
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
index 8b3736cee323..b4c6bfb09ce2 100644
--- a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts
@@ -2433,7 +2433,7 @@ pci@1,0 {
 		};
 
 		pci@2,0 {
-			nvidia,num-lanes = <0>;
+			nvidia,num-lanes = <1>;
 			status = "disabled";
 		};
 
-- 
2.50.1

