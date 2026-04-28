Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF393D47AF
	for <linux-tegra@vger.kernel.org>; Tue, 28 Apr 2026 20:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777406859; cv=none; b=SZpTJjexRmwuVMxHxo4ms7WxqPlWun8Tek4vr5NWbyi6NxOLy7CJihXjHAZUB9YWokdVH+PlyrRzL6ZeCiBwEozwp5W9Usa9FiSb/+V9J+capHkv+2z0n5odbIMUWMc7vql6aF/+pbiYfKQ2WbQoC4Btqyn2L8sFegX3E7/mzbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777406859; c=relaxed/simple;
	bh=XO1A/HibqZZptlBWN5BCzJBPBBT6OtgGPpR1fmvJiA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qAPlcfBsi4vkNky2AQBJQrXqQtrkJ6cLDvlFDgbj8hyEF28iE10cJSoN0wrWfFdFM30Hp3tHYA9wZcPkUrcEYURBMV6hQnDDU/W1j+v1izknxLvC35TM8ABOOJ7iOwkWLxAWWjGoRQAkp0cL9Ckd1nT1EYtk1iQhskHJesY4mxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lgoFIlx5; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lgoFIlx5"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2de831d2b20so4561200eec.1
        for <linux-tegra@vger.kernel.org>; Tue, 28 Apr 2026 13:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777406855; x=1778011655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wyEh8MUYI6uV1LBlX4TWKPlLf6Jaa4vkUqpt47EeXpM=;
        b=lgoFIlx5tLNJIADdHllLhe2CgooduUbz4JdRKVvEGiRC6/BorZMWXqS3GvbBGZqWtm
         b0OsNU5naFbwnHe0Rwn4QgHD9vWZAGcEwN5AIK/KqQoQgjkIqssTJ8Ldmhh71JUY0vRC
         ZcmLlxLpVf0PWsG1Qf++1bgkRLrhUL1oiva6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777406855; x=1778011655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wyEh8MUYI6uV1LBlX4TWKPlLf6Jaa4vkUqpt47EeXpM=;
        b=jJvgid8kC6K4L/ulNRAsSjwSrzRjK/6C/pphx46EumgQPX8JfXHVlEulS9bTLj8Ysk
         cjYenzyQaJLtyDCHQntu6H+orXfUpm6Dvuuv839aL9Jjp7opPbZp+d54+xqV1wu8OdXW
         7MGHegO+2toPJPybrs3dbGJR73695QFc0ptxvajRL2l4w9tir+N0us2D85QP4mvrctDJ
         /ifBOmB0UP74H92Fii/YH5Ex4ryb6ujk+pyMdTYq5n/XSytumE+Z7a4lKk84dHgRT/uk
         E1pEnJCdWuiEQ9vLlaNLjZ3BZQuMPNMKY0jL60jYD9fFGxtkertoUtBWwdpD4H+kKwtd
         AGUA==
X-Forwarded-Encrypted: i=1; AFNElJ+pe94NBJ5FM2sM5p2FmTdPecfF2i3fPV7pIFJdfBxpcXs2zNXTYW91+akgkGk1ZAeJEWKMZZXBhvuTzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwicDdiqqPBwVwXOE/mGbi6RjLrFb1KWR2EGwfJi/3ba1hBMkP
	kONTuWW0db9qAL8blbB0DO9naIYjsG6/RJQsliwe0e9w3wOGsQZ2I1zmUyx/USG8sQ==
X-Gm-Gg: AeBDievu9F4z0X1IyTC+Lo+i017PB2bQGPqlyx0OUeam5BYg4dI1qJ8hF5FnAzuoCpl
	3h1bAxic+F3uclw5GV9iabfnh5fH/GS4E9X/VY79lFFqrwmhxyS7ByoNZliVEyeyK1Le40IQIoD
	O+YR+raXWniiFaqV3KLXrkhTWFzeV4kHR7BySD+Y+01VNeg4TI0484ObzHsINiyRhWJJ6XCBH43
	e8DmHy4TMKBF7g7FyrkvIuiJFaY3WbWW0JZcQvIzHktNk+wSzntSV8lAJZ8ca5vw4oFv0QgIxQz
	vTMrTslkFljSlxw2Jy0f15RGXIE4cQw3y56kfTkqPEE3/kCN56qUz/hml1td7kebdP5RDsGQino
	BE9LCW15RnSNEsJtDaghc4HKr5bhoKJtE+N8Jdakv+zUVbzFEirQtLgABV3vLi4lBKRm6q2Idbm
	HhOphskd9QUTPB3j1+nQDUO317o6y1dmvFt2PcFsT9jpZXrk+gqWdv/Au/sECBJf4xCGTMTn+Q6
	B/HCgdwUTc=
X-Received: by 2002:a05:7300:5707:b0:2ed:e15:c924 with SMTP id 5a478bee46e88-2ed0e15ce32mr1940281eec.32.1777406854721;
        Tue, 28 Apr 2026 13:07:34 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:4ff5:9607:c7e5:48f3])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-2ed09fb6b8asm3015155eec.8.2026.04.28.13.07.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 13:07:34 -0700 (PDT)
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
Subject: [PATCH 2/7] ARM: dts: rockchip: Add #{address,size}-cells to Chromium-based /firmware
Date: Tue, 28 Apr 2026 13:06:54 -0700
Message-ID: <20260428200712.2660635-3-briannorris@chromium.org>
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

 arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi b/arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi
index 2d6cf08d00f9..ca8e8e735078 100644
--- a/arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3288-veyron.dtsi
@@ -18,6 +18,11 @@ chosen {
 		stdout-path = "serial2:115200n8";
 	};
 
+	firmware {
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+
 	/*
 	 * The default coreboot on veyron devices ignores memory@0 nodes
 	 * and would instead create another memory node.
-- 
2.54.0.545.g6539524ca2-goog

