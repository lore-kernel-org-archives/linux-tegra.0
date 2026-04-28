Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409A13CCA15
	for <linux-tegra@vger.kernel.org>; Tue, 28 Apr 2026 20:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777406860; cv=none; b=a7Om6PXSV6AbCX518AttcdSgvhENZzm7D8BIXHTHHps354WvvOkXhXpB7ZKcJRyV0K0MT08/SDk2k8Nrh8F2JCNhSkIxCwQlaBSQl9jYrwcEyzgT1C/mVeFZJCQntJqDcNvhMevbiiGstfL0OPK8lqelt+oagPbjUESF/IQbZYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777406860; c=relaxed/simple;
	bh=pccXu/UZ0/UgmYrUTp8RKqR5INDSko9XT3nrfNvRcuk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uTwjX+4Kp1rVwrjalReDdHoRqCc2yPx5SH9DLJxr4dD817gflglbrxQNec7KgvOCpvstkxnSH7odk8+qoq9/ADnHOIUB+JwRjUT20HMs9nyNpqZxdv1mCtBuwyQaQRtB3hHcc0OHmuP7Jvgfo/8lzdAQUOAFIlVdbh0WFWfrB5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=YsZSCazp; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="YsZSCazp"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12c726f46baso15211950c88.1
        for <linux-tegra@vger.kernel.org>; Tue, 28 Apr 2026 13:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777406858; x=1778011658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uToK6kNcjQgBzaJfDVLEV8EKOZh7WlLcbjBebhI/n24=;
        b=YsZSCazpGJCwN1OHhygeQxjMvJ61gGu+mZ8LXay0+dPCXVw4xGB7j/uyrJVCh97r2D
         FMBgU3xmB49yHnGUh9bDt4ugHcJf1SNdc12w1J3iols17UMOBz1eWS0Vvuf5S8AoTjLW
         74dutQn67ErHSMv126frgLeUagzwt5H7UJ1rw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777406858; x=1778011658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uToK6kNcjQgBzaJfDVLEV8EKOZh7WlLcbjBebhI/n24=;
        b=CkI2rwTcuz4eRb9a3Hif9b1CgzzD2wkEDmQe6R6IB+j0m0gbJUGDrtpgvHV+U7eM6x
         lYguAoBjU9T2LU1pGEOjvRz0c0vKBeIWRzBTG2Yfvrvga9rMuHYdkpjk5cyMUhdyi16n
         j9lCHg2/uFm2OXDeKY/BDHOeJ6BNQm6muQqhjqlWu4RJM6OcSHC77XPxAPCzgMYUD+4w
         BK/4yKK6Ll7xgDXOI28AYBLF31ZOAonNIGF/INEeS3FsqlQeO/cZlWGKc+FMRje8lfFl
         sjZxjfhwWi1qmhUSlU+WIn33i7AtjdTuzX/K0gX9Z8LqG/jB9XByF1PML1uhxx5DffnE
         MgAA==
X-Forwarded-Encrypted: i=1; AFNElJ/8aNet0c2sFNMCBJWdFDbjqkFfgNpD28wkit0cSURt4mu3YvTamkwuzmn4bVbKqFQIuwPzEcvYfbvsVg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yybj46Eu+Jg9eZCL91WzagUxxn6uTs5AZ3j9g1OfHrk3M/DsaIT
	/CN5WlB3ZLMytg+JgJWUkLXyVGLN53s6F7/JIdda//WOEezrn9Trw7GJHxQJnYLNMg==
X-Gm-Gg: AeBDieuMNiYLN6dDICHdgdJCfYiPN88oWgLuKaU9IBRyTw2qEgPcxPQ0o+yyHcTVK22
	HOfIp8aKAxShg67rEdDaaXnQctboWycb0mD8QXLgBageoKYj9LRQ+tjeqh9P5wUAsPn8YCGGvs2
	15Az8bt/5x+Q2ClFmcoxvwfa5Ayxh6gzySrWC65gsh2g38e+xWcjHOZb+i+UcQgR3MmDTC0NONQ
	vVRP5x2DOuRdFkMuqIGmFNXUJmWFLSjsfm1EIwy3wgTOZuWXAf5VXH98TVvUkpgBjXk3pZMUzni
	JIn0WrIxBRJwPrCfW0CVEPxrna+LYL7srNjUqkKk6Cmne6j6NOD87qwOvzvJpUlxxaqAZFKI13Y
	L2YJMzdTXZoMURrC9KFkvyz0Od6/BfVuSptifIDZbVKIgQfljWGGF+p6q4P0tDyl6GAi0FjQq2U
	LolU3XQuMg++hqlho8YAqiosPXbrvUo8jOBIPgRpy5CwjA5r9b1t+oIM1OwM2uafvF7jyVTi88
X-Received: by 2002:a05:701b:2505:b0:12d:e126:b7c7 with SMTP id a92af1059eb24-12de126b941mr735154c88.14.1777406858194;
        Tue, 28 Apr 2026 13:07:38 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:4ff5:9607:c7e5:48f3])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-12ddd933044sm2796623c88.5.2026.04.28.13.07.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 13:07:37 -0700 (PDT)
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
Subject: [PATCH 3/7] ARM: dts: nvidia: Add #{address,size}-cells to Chromium-based /firmware
Date: Tue, 28 Apr 2026 13:06:55 -0700
Message-ID: <20260428200712.2660635-4-briannorris@chromium.org>
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

 arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi   | 5 +++++
 arch/arm/boot/dts/nvidia/tegra124-venice2.dts | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi b/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi
index 974c76f007db..89a749cb8933 100644
--- a/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi
@@ -14,6 +14,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	firmware {
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+
 	/*
 	 * Note that recent version of the device tree compiler (starting with
 	 * version 1.4.2) warn about this node containing a reg property, but
diff --git a/arch/arm/boot/dts/nvidia/tegra124-venice2.dts b/arch/arm/boot/dts/nvidia/tegra124-venice2.dts
index df98dc2a67b8..059ee6c5b13c 100644
--- a/arch/arm/boot/dts/nvidia/tegra124-venice2.dts
+++ b/arch/arm/boot/dts/nvidia/tegra124-venice2.dts
@@ -18,6 +18,11 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	firmware {
+		#address-cells = <1>;
+		#size-cells = <1>;
+	};
+
 	memory@80000000 {
 		reg = <0x0 0x80000000 0x0 0x80000000>;
 	};
-- 
2.54.0.545.g6539524ca2-goog

