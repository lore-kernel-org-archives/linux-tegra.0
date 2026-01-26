Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D972550A4
	for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 19:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769454952; cv=none; b=mEITn8PBkZqgqSDmw/jS0pVSrQqqJES94jHW+STsowoSnOqvhGF5z9PevjCcXenuRzR/+gsdTiJR6Q6xmv8d0UP0vnWoBwyefOGWBxgno1/KGxMrfLzB5bKIcTrodHziaWMDxhNw4ZXpgSd0Cpc9HOsCHkh/INACZ2ygLO7EHKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769454952; c=relaxed/simple;
	bh=raBx+Qdai5ZkiQYhuTqQNlBy1l8tIYeinzCV8VWO67E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KK9192mwDSY1tIC67xyO/LuH2KCRYjbxnvb9iENsfOOtBYV65vG/B8ZnMfY5aNB/icRsScwpba3MomBZq+rO4A3CRDnylAfKrWR1OGn+ubo/R39qMMcPRrCDnCEhaFHLO4Mvr2qUbi9/JH0awxU81LzD9xzGXSbqR6lVpH2nJr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fcV78d1B; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fcV78d1B"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43590777e22so2949312f8f.3
        for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 11:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769454949; x=1770059749; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TbHz9AHsTxZBxTlKqWlpfBap6OFPOQasclNmZKuJ2mQ=;
        b=fcV78d1BJitlkNK+21CGtBcGE6WdY2GGXJRkt+HNIlJUYUQ3W6JoW5bPX+zuv5KYZf
         u4nY8IySStMa2Jw/OVNjy0L8eHyyt3TOM9n1Ud3zEummZDwOH+3lFbjvcPq7cOm4UwpQ
         z6WgQ2AolOk7rMuctsn3ACifh37uDyX/tmWbsgSGISyjsr92A7TKujwSMmAimoWqPmk8
         y2GnCqrKpQQQA7HQpv0XQhS6nmy93y/bP2ccrdqGcdWu7LuxaYktK1Tip4pNvcVn966P
         ejTeeRq6tXIl6ckON+wfPXKl3uFkvc1ujfTEQ/TRGWT8epSJTatvSu7yEjRZf07VV5rr
         zQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769454949; x=1770059749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TbHz9AHsTxZBxTlKqWlpfBap6OFPOQasclNmZKuJ2mQ=;
        b=m1i6eBjCwuL+W1SZ17ILTmxVulbuNVrI4vT9CYTYNTyVNE8CdBOoJg1QVEC+HiaPCt
         l7MlUXwpE6jshPAbYGJ7UZxujTKw+OVenRVdnO7rO0itWssknd4I1gwqmjG2wcD5AGui
         4/yD/GePA6/NysyN157IvFDXjB03EBBubIEDAVtMzj4vCpEKnK4DlvQkHrPY5NS7zZQu
         j9yma+MP1lDfR1ccNyBiERrMTAtOiSaiM0KI4ZOk42dpWAOMAXKfKqY/RqTm5X0coLXi
         +2asiyM9wrX1pfPeiNzRlV97LH4YoN+tW+/Kba3Hd/fgtTqnTRPvYjk06ac0XSi0f6e1
         oHFA==
X-Forwarded-Encrypted: i=1; AJvYcCWM/E4kPovbTRCwinSjlAu9rWWR79gGxD5R8v9evLgSLuHptKCcPt8qmAER+5tf+ExvpbP2cFsbFYZQ2w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0/PrSetToF1snsxqLsW7TJdFx+dEwhH70Bda5ZKMCGUwkQ3mL
	j+53tS2MykOqECROpo9WyA5qxP0JxFU7Hd2W/8EUdhuczN1YM7gepkz0
X-Gm-Gg: AZuq6aKKYZvUSWWqqro4Px3XDR1sPPnHv1f0fiUtmUH0pom5ZNyBsMdGNRg65I5k9x5
	vkulZd6YcR0+zOQ+5S5gIjs4i1F5gFPpcnT+iJqgmSEa2Suj8NNJPo68cH0m+PgoxwiAn6XLqF6
	OPumqpnwRlftFiH/AqHtm3LNGDEEkkGzUVOxSlc+m9vyR371Gc/+Y4IbUaGoFZ6R7a3W9yw5eQJ
	W+sj8fQsUnqTuuvxn8csDgFbjV7FyWT9RJXvQvcE58uod7LiHqmCWtydKuS/ht+gklBVvUzrV7x
	Q31TTCnEeBlN9I9Xj0clCIysIqbJPaSNXxgHwA709VA6X7P7jOvXPpRiL+S7ow9m8lwX1VWvwMM
	kgromjQmwuZ0zL5scOCU0bwqFuVxDLIUUQbH0terKCBycQFo3ztXgAxsPyiRFn1pHV7ULlH/eYW
	P+
X-Received: by 2002:a05:6000:4203:b0:435:a647:a3b8 with SMTP id ffacd0b85a97d-435ca1872famr9039595f8f.36.1769454949020;
        Mon, 26 Jan 2026 11:15:49 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c02d0dsm30958219f8f.4.2026.01.26.11.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 11:15:48 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/5] ARM: tegra: Add External Memory Controller node on Tegra114
Date: Mon, 26 Jan 2026 21:15:33 +0200
Message-ID: <20260126191536.78829-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260126191536.78829-1-clamor95@gmail.com>
References: <20260126191536.78829-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add External Memory Controller node to the device-tree.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 arch/arm/boot/dts/nvidia/tegra114.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114.dtsi b/arch/arm/boot/dts/nvidia/tegra114.dtsi
index ef0618e9eec1..77ab17f397f6 100644
--- a/arch/arm/boot/dts/nvidia/tegra114.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114.dtsi
@@ -259,6 +259,8 @@ tegra_car: clock@60006000 {
 		reg = <0x60006000 0x1000>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
+
+		nvidia,external-memory-controller = <&emc>;
 	};
 
 	flow-controller@60007000 {
@@ -655,6 +657,16 @@ mc: memory-controller@70019000 {
 		#iommu-cells = <1>;
 	};
 
+	emc: external-memory-controller@7001b000 {
+		compatible = "nvidia,tegra114-emc";
+		reg = <0x7001b000 0x800>;
+		interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&tegra_car TEGRA114_CLK_EMC>;
+		clock-names = "emc";
+
+		nvidia,memory-controller = <&mc>;
+	};
+
 	hda@70030000 {
 		compatible = "nvidia,tegra114-hda", "nvidia,tegra30-hda";
 		reg = <0x70030000 0x10000>;
-- 
2.51.0

