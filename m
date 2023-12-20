Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9E04E1CC
	for <linux-tegra@vger.kernel.org>; Wed, 20 Dec 2023 23:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PhzhskKt"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-35fc1a21f60so1140715ab.0
        for <linux-tegra@vger.kernel.org>; Wed, 20 Dec 2023 15:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1703116519; x=1703721319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NsTh8joUVqMg5ezobFr/U/KJPW/QvWwfP5qstPNIFW4=;
        b=PhzhskKtQnql6Cf6MBNgp3MbQUt4W7vUw1hDCxYygoVRAzjKYF7tudOUsnLhRQeOoX
         Uk0lpUNhqpkOvCrEwWpC0GZ/dUGxlAz8nVr+LBYGosS1kaittF95Nzz6OHoYpijigsUm
         3gYfkyWL09zkUUJNCtl1TWpze0FGuSKQO0F/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703116519; x=1703721319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NsTh8joUVqMg5ezobFr/U/KJPW/QvWwfP5qstPNIFW4=;
        b=kSOiesOlQIgRbu/nJhjkiaco9p2cOOY4KxjLIAUKNFj2oPvmWwnfQ/1j+9w1+zJCzs
         fP2xojM5jAlRGfaoqtvTVfXoHdAqRG6oIb/bd1DWOljYLEX+zeGV6dVqKBTmQW6sJSD3
         TaZv1vQP525X/IO+s1/GewDvwnVh2E+MapXu1peIzSE+QDrAfzRBAQ/VQYUjYqWogiO+
         wNuMBLc23XX6L4jmbSvsamO3+o0hTUdHRRGACwbacLoo598TKFRyj5Q2lKu2wa/6OqjP
         RMaLvgG2Tcx5pSUbBo370hdcgMDOBHkDK/XjspI3quCNMAsxwKWNBbp4IkLPhzX1VDjo
         4/9Q==
X-Gm-Message-State: AOJu0YxvwG8wp7E+YgymhfepCEhvc9rjf/RGRuqBteKdXLaucnowRiXl
	JBbMSkAv55JRnvQTk4VYPTGyYg==
X-Google-Smtp-Source: AGHT+IHpd/hQAO+JzgPTfDrP8J99ho1LatjOhD+y+1pzGqV1gGpidEZh0CuNI5ZEZbQoXBE9btwq6A==
X-Received: by 2002:a05:6e02:2607:b0:35f:9920:1111 with SMTP id by7-20020a056e02260700b0035f99201111mr9605176ilb.129.1703116519155;
        Wed, 20 Dec 2023 15:55:19 -0800 (PST)
Received: from markhas1.lan (71-218-50-136.hlrn.qwest.net. [71.218.50.136])
        by smtp.gmail.com with ESMTPSA id bp22-20020a056638441600b0046b39a6f404sm177805jab.17.2023.12.20.15.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 15:55:18 -0800 (PST)
From: Mark Hasemeyer <markhas@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Raul Rangel <rrangel@chromium.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Rob Herring <robh@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Mark Hasemeyer <markhas@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 12/22] arm64: dts: tegra: Enable cros-ec-spi as wake source
Date: Wed, 20 Dec 2023 16:54:26 -0700
Message-ID: <20231220165423.v2.12.Ic12bf13efe60f9ffaa444126c55a35fbf6c521cc@changeid>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231220235459.2965548-1-markhas@chromium.org>
References: <20231220235459.2965548-1-markhas@chromium.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cros_ec driver currently assumes that cros-ec-spi compatible device
nodes are a wakeup-source even though the wakeup-source property is not
defined.

Add the wakeup-source property to all cros-ec-spi compatible device
nodes to match expected behavior.

Signed-off-by: Mark Hasemeyer <markhas@chromium.org>
---

Changes in v2:
-Split by arch/soc

 arch/arm64/boot/dts/nvidia/tegra132-norrin.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
index bbc2e9bef08da..14d58859bb55c 100644
--- a/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
+++ b/arch/arm64/boot/dts/nvidia/tegra132-norrin.dts
@@ -762,6 +762,7 @@ ec: cros-ec@0 {
 			interrupt-parent = <&gpio>;
 			interrupts = <TEGRA_GPIO(C, 7) IRQ_TYPE_LEVEL_LOW>;
 			reg = <0>;
+			wakeup-source;
 
 			google,cros-ec-spi-msg-delay = <2000>;
 
-- 
2.43.0.472.g3155946c3a-goog

