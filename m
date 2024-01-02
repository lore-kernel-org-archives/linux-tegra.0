Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDFA018647
	for <linux-tegra@vger.kernel.org>; Tue,  2 Jan 2024 21:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="J/iviGxT"
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-7b7fbe3db16so507815239f.3
        for <linux-tegra@vger.kernel.org>; Tue, 02 Jan 2024 13:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704229735; x=1704834535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xWplU6V/74zhrE0fU+phMJuFQc01H2ditVc3hsW/nY=;
        b=J/iviGxTnseTosGYD18/rbF8CRnnRPLnuoyhM+uMxt2rHo8zsjpoIu858je2rx9fSw
         nNFtxc1LOzjg1Bb5JrY3peV4KD6mCmd/qEqnogrUal+3AjklC1X68C2uWM0UK6ZPDF1m
         MCEH3hKAIXs4HL84mb8+Hlm2oT8Lv2Jt3Vbtk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704229735; x=1704834535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6xWplU6V/74zhrE0fU+phMJuFQc01H2ditVc3hsW/nY=;
        b=SV7g025RUAGbT0VINEv1wJ/fKdURETlANNHcx+P5m8WAiGtJDfyBjRaeVq9Lhpc/az
         sCcbaXt1wbaibbasKXfELu0Nrv9czT6RVCLCfqF08WiGXla7DbhKdgMO38ifKmK4rqV0
         FW9CKtAlg+0KzruFvtOqnpXZLT6L6QYYERksjKgp3OzZVmUx0UlbMC0eJQ+DOcg2qfqL
         yb8boyT7eZXGqhWrb5dxGy1MRRYrx5hlPQCCb4k/MHn0fMnOVns0t8O9KxXLmbM9tF2b
         9qrAvyVP0KH/LZ3nsm0Q/p+H5xTF9nefZa97Ir95+JuCZVVjpH69QXyktzmG4xr6BQG1
         /RZw==
X-Gm-Message-State: AOJu0Yz3TmRIplIJBt8/2aAbGNN08tnA5j59CHrYJaS4DwFiZCNKOuyf
	6B18ShRPVUdki3yIpAxlvXFu3REb5Y6R
X-Google-Smtp-Source: AGHT+IHfOsWwH7XeGwxyO82lQ7Beiea2aMSZMszgEK2VhB9dcZJ2V4KeyfBreF3d8IlhWEEKQTrnQw==
X-Received: by 2002:a05:6e02:1be1:b0:360:2197:4bbe with SMTP id y1-20020a056e021be100b0036021974bbemr15914894ilv.59.1704229735102;
        Tue, 02 Jan 2024 13:08:55 -0800 (PST)
Received: from markhas1.lan (71-218-50-136.hlrn.qwest.net. [71.218.50.136])
        by smtp.gmail.com with ESMTPSA id bo18-20020a056638439200b0046993034c91sm6956978jab.77.2024.01.02.13.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 13:08:54 -0800 (PST)
From: Mark Hasemeyer <markhas@chromium.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Raul Rangel <rrangel@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Mark Hasemeyer <markhas@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v4 13/24] arm64: dts: tegra: Enable cros-ec-spi as wake source
Date: Tue,  2 Jan 2024 14:07:37 -0700
Message-ID: <20240102140734.v4.13.Ic12bf13efe60f9ffaa444126c55a35fbf6c521cc@changeid>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20240102210820.2604667-1-markhas@chromium.org>
References: <20240102210820.2604667-1-markhas@chromium.org>
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

Some Chromebooks use a separate wake pin, while others overload the
interrupt for wake and IO. With the current assumption, spurious wakes
can occur on systems that use a separate wake pin. It is planned to
update the driver to no longer assume that the EC interrupt pin should
be enabled for wake.

Add the wakeup-source property to all cros-ec-spi compatible device
nodes to signify to the driver that they should still be a valid wakeup
source.

Signed-off-by: Mark Hasemeyer <markhas@chromium.org>
---

(no changes since v3)

Changes in v3:
-Update commit message to provide details of the motivation behind the
change

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

