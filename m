Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3A147DF8B
	for <linux-tegra@vger.kernel.org>; Tue, 21 Jul 2026 10:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628682; cv=none; b=DFZ5oYDWHb2YCVhAlj5Mrgd+mFX7UBMXfgFJnUpEJi4HBqLuk3mDaDgShydDu7rtgAQm43C6HSlKqsUeQ4yBoX05TyYDkMw63PBO4LBWVa/sZRTjSoJU9dUUxQvKyAyAa8qkXzk8GP4pXGJB0bMW/65Qp7nEI8tDulamZ7TXMHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628682; c=relaxed/simple;
	bh=ZRKdbf4Dq1PCBc6VUndi+/kgDHv6ev1d+6/PG4zmJAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iOK3XuNDLL7+jljZEHCs3ZkIyrPX6mdtoO/CXFyRAk3/66OBp6X371sDpdR6rz7/4VWohAaB7koFDlNKReEHsKQ1ZfMNnqbIhoHZEYvUfrfxHakeB/7KGl+bevQ4gX8B9ZhzUBTEHlDaaJR9sNwk6I6ifT7D8mQLBv7c29P/GnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sssf1utu; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sssf1utu"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso16740305e9.3
        for <linux-tegra@vger.kernel.org>; Tue, 21 Jul 2026 03:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784628677; x=1785233477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7vsNly9Dxng/eQA268CICSe8sI1SJ/lZVaGeKmkMRps=;
        b=Sssf1utuC6WJafcUXkvwCuAY/Hl3PtCZH6w/lqP4Alpe6SXmv/d9s3jV0n7sdf9GpK
         JmbiPOBKQw0uWIPjdSYLN3cQtwpYQe05+O83g51obASHduNEjeTgHtKc5UxrXTuhf59U
         Llto/UOhxNxDt/sWB4CRmfoC1tUIIrhRQYKaA8apaTi8r2vKqXSAIaHxsrQB1QkVzFHQ
         ogAR+B375mM87occ2sdCl8G+1IUxRGO0eIrsPZI0ytekQlrRrlMVwKawmz4EMx4mxyyL
         E/I/Pkaqa+11wBrpkVlS561p3lbd25YAzAswx3PXngtiBRpgZjuwpCBB4W006fjXYGxY
         2TLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784628677; x=1785233477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7vsNly9Dxng/eQA268CICSe8sI1SJ/lZVaGeKmkMRps=;
        b=lfPOgi0tHo/nFSlmG7dhLoL1nBeCLzky7CCIpUmUK1LWrwQElZ6FSTzXb+S7mc7gLg
         MCaVZrieecAqM1esRhmrzIm3xDz7vRf95BVlwuJUlmC09YcI61JmOZBFmOuc9YZCFnZy
         QusHFcSN6LXVFLfjyFYgBJH2nlOnCAuGvGeM3IjDHgMOvayv5HK5GlUyoVZ3UP6NlIqr
         a7Yc7c07JssZYy1LgGa+0oc3/IdQApE23TyO43knAv0sPxnOh3DJK962jjuXBidw0M1R
         W/ldjAz+EUjCO/GB10b03DSHY+xB5Iq2puxLnO4mKK35K34gk4Peu2CttfkXtuZuWITT
         xnfA==
X-Forwarded-Encrypted: i=1; AHgh+RpG7OVUbXBaapg/drZNe4IIADc3q6fojDJycbi/OPSuvC1jypy2iqPQf7jpazdOGvnJtLV6Tm0AfdENDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzrPWqKoTAV7SJEhpBywQmtSoYFGFZAgAiSASozKAl8CORMU0DQ
	Ftvwxx+MlCcbY/14vhTdZVo09Xg613ywjSReeJw6shNa9z7zMcIVmJVD
X-Gm-Gg: AfdE7cmYWaoxNtz+V/F8hzqJOzH+7ZhUCzg1Px28AGjjp9TGcx7zdslPqvsfquMPOjS
	17q8nIX2yoY2uzc4M3K1y0+voh7HVYuLRmS6bm4Ihot/UwIbszgmGZ3Ee6xujrVuZhmUT8TYioP
	vidZ06Yh9UPzbCeaIA4yGXOdKxs66svFPlRbnuH73CMler90gnwr1hEvg/Ng9BYZUbHHNj5gLcG
	P/VFF0w9H5bq3FqenyRZa/2GWlkwGfqobB9+a4a3i+EmlNgqCXKyxGUh2UTser6hvPzadQcOQK9
	q+xwaxEETfOpvFb/2WMuWaxAnMB5JGEQjNXLD5pzTnH6OMkti1L5l85Jo/JDFKE/Ht6t90Ne+N3
	0F3mxTlbQcx79o9D6qxUseYE4GnOYap9uerDeEWEu9X7eGsoW7HTCT8tfObMnIN2aeMIv/zkSKs
	0fFzixIavExw0HPl1EB8IzMUO3Qp9r2VZl9g==
X-Received: by 2002:a05:600c:45d3:b0:495:503f:cf9a with SMTP id 5b1f17b1804b1-495503fd2a0mr142245615e9.9.1784628677148;
        Tue, 21 Jul 2026 03:11:17 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956547319dsm57127085e9.5.2026.07.21.03.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:11:16 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/10] ARM: tegra: tf701t: Fix BCM43341 WiFi/BT chip configuration
Date: Tue, 21 Jul 2026 13:10:56 +0300
Message-ID: <20260721101059.451699-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721101059.451699-1-clamor95@gmail.com>
References: <20260721101059.451699-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop reset GPIO from bluetooth part. Add lpo clock to both WiFi and
bluetooth nodes. Add 'brcm,bcm43340-fmac' as primary compatible and
'brcm,bcm4329-fmac' remains as fallback.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index 3de5c84d5f009..b71a02b3fd86f 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -1300,8 +1300,9 @@ bluetooth {
 			compatible = "brcm,bcm4334-bt";
 			max-speed = <4000000>;
 
-			clocks = <&tegra_pmc TEGRA_PMC_CLK_BLINK>;
-			clock-names = "txco";
+			clocks = <&tegra_pmc TEGRA_PMC_CLK_BLINK>,
+				 <&palmas_clk32k>;
+			clock-names = "txco", "lpo";
 
 			interrupt-parent = <&gpio>;
 			interrupts = <TEGRA_GPIO(U, 6) IRQ_TYPE_EDGE_RISING>;
@@ -1309,7 +1310,6 @@ bluetooth {
 
 			device-wakeup-gpios = <&gpio TEGRA_GPIO(EE, 1) GPIO_ACTIVE_HIGH>;
 			shutdown-gpios = <&gpio TEGRA_GPIO(Q, 7) GPIO_ACTIVE_HIGH>;
-			reset-gpios = <&gpio TEGRA_GPIO(Q, 6) GPIO_ACTIVE_LOW>;
 
 			vbat-supply = <&vdd_3v3_com>;
 			vddio-supply = <&vdd_1v8_vio>;
@@ -1450,7 +1450,7 @@ palmas_gpio: gpio {
 				#gpio-cells = <2>;
 			};
 
-			palmas_clk32kg@0 {
+			palmas_clk32k: palmas_clk32kg@0 {
 				compatible = "ti,palmas-clk32kg";
 				#clock-cells = <0>;
 			};
@@ -2382,9 +2382,12 @@ mmc@78000000 {
 		vqmmc-supply = <&vdd_1v8_vio>;
 
 		wifi@1 {
-			compatible = "brcm,bcm4329-fmac";
+			compatible = "brcm,bcm43340-fmac", "brcm,bcm4329-fmac";
 			reg = <1>;
 
+			clocks = <&palmas_clk32k>;
+			clock-names = "lpo";
+
 			interrupt-parent = <&gpio>;
 			interrupts = <TEGRA_GPIO(U, 5) IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "host-wake";
-- 
2.53.0

