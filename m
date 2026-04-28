Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B693CD8C2
	for <linux-tegra@vger.kernel.org>; Tue, 28 Apr 2026 20:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777406876; cv=none; b=TjCRdgNrZSfoNbviPPoDXRRCgSLXCiVQjHtBK+U4rmto6rJbUEsjXshG6f2th0D88njnkX/EbGQGgmhYznir0MhiUCR1VT7ZV3I2JWXnY7rB3bADv0pO/8jEOwAv9UUMEPb4NM1ONfg+q4eIWv87Iv/MfEyUABZamtBI/PgCMcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777406876; c=relaxed/simple;
	bh=5qSEGoSFEbZ9Aw2s104tTg8FW55x+SU2f7LQRnzdTp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hvEcdCwLLccdCew3rfyvryQpLyBaVY0Bfi2Nt10wNRDtwQj4J6sR1BLxeWsaAg8pabkFoGz7EAWd19fm2R+AdQR3dXNsEfWUT8/0+q2N1wXWV7li3p0ECZjHqc31kHuO6bPiruvp4jHaWPvVnPGth3BC3aUXBbAsRBg18tepvFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=EkLyTgPA; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EkLyTgPA"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2eadb000b8cso3156675eec.0
        for <linux-tegra@vger.kernel.org>; Tue, 28 Apr 2026 13:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777406869; x=1778011669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=63kFLuS2ZunRuwIKFamabno0yfYzwQFLWtzreaffIiA=;
        b=EkLyTgPAJVV8g7Dhrp0Xta6ycX7glzqwHLsIyM6rYiAoTSnxQkf84NcjPg1g8ZAYGB
         02u+JNwGAhNaeLrHDLXiCx4LKuKoEMGzXKh2lkj9FS0A2Xbb2HcuWWJVt0ROLOzGswlr
         DF24gepVJO8mgt5r7T8MULcNYgs65wQMv1h94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777406869; x=1778011669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=63kFLuS2ZunRuwIKFamabno0yfYzwQFLWtzreaffIiA=;
        b=cBOVmYzejvVkB2aXcWufOLVrE3ZOrAbheeRCa8TWl94U2BhaqTO5DHMZXurhZeZuSy
         Mx/Bwj5vRWH9Tq9PKn52HB3M9ZfY3BM4zcNEPQI0O3BuX8ORHQOvEX6o9VxHIDAzS1MB
         BICLmC4iAEdrDyWrEfq1giqkAUdvnoivbEfQW7T3qFzoOTv5OqpjXlu2PQcBQglwrUg0
         gH5zWJUpo174AcZEQE+eSOnXGrAzv/ZZs0CAGkTb6Axj9PhkgskwAwiBFjRoV1KsFPnL
         63Elsodc6Nv/uRCKU5nG1HSXaFCHBUfpNC5ML73p9lDrfuW0txz0szJdnr5Q3W7vV6P3
         5myw==
X-Forwarded-Encrypted: i=1; AFNElJ+IhnhnlUimulY4Kvx2CmgJ5zeGmkhdRONebNwCbc4LV9gI9tzW90pWE8+hHEUBd/pZLQFmuW1qJrSN5A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8fNt67aEvhA4Un3O66YFnEyOuNpQVvUirul50MgmwLi763Pfy
	LUfPv0iqa7Tf45rIs4BcnA1HcuawLJd/BIx3mW+1QQKL2JZWSIu8Kya/jThvTdKmnA==
X-Gm-Gg: AeBDies84wUbcX79x0AmNK8cvwo7JOG3pFsUoK1j+yssN1HiISJn+FZB3sFeL6WQwYz
	t+pe73F7LJMp22pilfdfvx9Ei3VXoKvbsL+eddvt1IPRoTsP3KRLKCPzETjtN7idT1WUmySa4Cx
	udrltQJSU3WVQSwVfD8ME+TyOVOMk+qT2P3tHxzuML9bVqYozdBhZOwiJyraiHJJYrbUXnKHsBu
	Q6J6UBDeQ7LdKoGtskLgtua36IeKQZDYet7ZT4POZptxBUZXnvjOIMG87ExPmK0On+KpeYpM4Dy
	sjs035UqJpQZh4bezxc0/71woVV5lVIl+NTPBRdUqvK46Wl1fyaggd9ru3OR463tVuPO6sngHcE
	1+TXULzq/W100eK+hlAkkRqUA89vH6PQDEeoE63g4negsrPIvgqJ8eUzZoHS4Oc5eBMCTycBfYw
	29FcY3Ac9U2gxoeFk824t4a6SwAHqtVBS8NZTlMkAGndbmgj/B6/GPkqq2zleu6QHntha7c3dO
X-Received: by 2002:a05:7300:7255:b0:2ed:e12:3771 with SMTP id 5a478bee46e88-2ed1991b2a9mr467588eec.33.1777406869213;
        Tue, 28 Apr 2026 13:07:49 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:4ff5:9607:c7e5:48f3])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-2ed0a0ce761sm3064459eec.15.2026.04.28.13.07.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 13:07:48 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org,
	Doug Anderson <dianders@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	chrome-platform@lists.linux.dev,
	Brian Norris <briannorris@chromium.org>,
	linux-rockchip@lists.infradead.org,
	Julius Werner <jwerner@chromium.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	cros-qcom-dts-watchers@chromium.org,
	linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] arm64: dts: nvidia: Add #{address,size}-cells to Chromium-based /firmware
Date: Tue, 28 Apr 2026 13:06:58 -0700
Message-ID: <20260428200712.2660635-7-briannorris@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260428200712.2660635-1-briannorris@chromium.org>
References: <20260428200712.2660635-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Chromium/Depthcharge bootloaders may dynamically add a few device nodes
to a system's DTB under a /firmware node. A typical DT looks something
like the following:

/ {
        firmware {
                ranges;

                coreboot {
                        compatible = "coreboot";
                        reg = <...>;
                        ...;
                };
        };
};

Notably, the /firmware node has an empty 'ranges', but does not have
address/size-cells.

Commit 6e5773d52f4a ("of/address: Fix WARN when attempting translating
non-translatable addresses") started requiring #address-cells for a
device's parent if we want to use the reg resource in a device node.
This leads to errors like the following:

[    7.763870] coreboot_table firmware:coreboot: probe with driver coreboot_table failed with error -22

Add appropriate #{address,size}-cells to work around the problem.

Note that Google has also patched the Depthcharge bootloader source to
add {address,size}-cells [1], but bootloader updates are typically
delivered only via Google OS updates. Not all users install Google
software updates, and even if they do, Google may not produce updated
binaries for all/older devices.

[1] https://lore.kernel.org/all/20241209092809.GA3246424@google.com/
    https://crrev.com/c/6051580 ("coreboot: Insert #address-cells and
    #size-cells for firmware node")

Closes: https://lore.kernel.org/all/aeKlYzTiL0OB1y3g@google.com/
Fixes: 6e5773d52f4a ("of/address: Fix WARN when attempting translating non-translatable addresses")
Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts | 5 +++++
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts  | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
index 683ac124523b..1f5222d43e62 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
@@ -18,6 +18,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x0 0x80000000>;
diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
index f0b8c2c80aa5..a6d31650245d 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
@@ -25,6 +25,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	firmware {
+		#address-cells = <2>;
+		#size-cells = <2>;
+	};
+
 	memory@80000000 {
 		device_type = "memory";
 		reg = <0x0 0x80000000 0x0 0xc0000000>;
-- 
2.54.0.545.g6539524ca2-goog

