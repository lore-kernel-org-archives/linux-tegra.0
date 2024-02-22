Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5054314B832;
	Thu, 22 Feb 2024 20:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708633309; cv=none; b=FJAfcjT6KaBKKAxzsDiPnnEHiJJ7qi7aka9xpMwHZFoCixx8NoUnVEX3inOHWE+I1g2r3Hdv9T5lCJaC6XjgpgoJybu0dqLcAUucGh29Ool1612qNNSsDyYCOBg4ll6+m+ViZWBwfv3SIMYdltyslRbAyWZwfJJhXjuakFs7cJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708633309; c=relaxed/simple;
	bh=SgFxhOq+EnrXdHT0SYVq/FJ3HuLFv4isdMn8h8YAW4o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NhQs2W2SIqf3XsFoxNUvyt3zpv7S1DTXxddRTd26COHkOLm/XzY/ESFvkSNzGnN0sfkbnZ9PbF9tbt8xd8iIS2OFzss/ZBwBfB00RcR3d99n5KUfLeVTVX4wSr5eAJsed4zzcglh6OSjIG72cY8o55AyunHQKI3ni4echncqvXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U+4jAzrd; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U+4jAzrd"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-412897a2f9eso1176995e9.1;
        Thu, 22 Feb 2024 12:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708633305; x=1709238105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=99vnuqEXMLe3Jmfg/HJHmgn8y+UJAkAraWQlEnUY7ic=;
        b=U+4jAzrdPdapVZyfaFppi5rtRg9NdXa7SjTs/wSsoEy+QBhytgwj8fOg1h3nnQx7aZ
         96WqRpCYDtNdfk8eC283eGtXm+TwbcsvFWkjtXC21ND6t3/Kn4oEJ1iyEKNv4bIBgl79
         BOQc8vluwB76TvzQhrEgiCRQCkc2YcPlUr2r8fWpTvSIFMK3F7xmr5DUWsvIrHx/Fc3O
         h156DAIVQ1i1jhTXEKVHv0vaX0M+XDKS4gFKnrsC7VzkKuPq682K7tDM4uSq/ijXPS/X
         tDYS6Tjc/UmGQXp7YY42JfgoNyz+PqwMPjs5tNczLAG2t16ZEysLRd6gmPxJXz0e6gal
         8pjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708633306; x=1709238106;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=99vnuqEXMLe3Jmfg/HJHmgn8y+UJAkAraWQlEnUY7ic=;
        b=vVCSBnDhA9Cy2HwB6I8wQEvKabecb46s8RBBJkiHuswhOq8EuDuKr18NFdqLpWerxs
         sLEFgPpy/zMdc5gYgCqDdIM6sJuh69m47KrFbucgmJqRonzBHdfG09Oapds36xU0woav
         bWCyZT1QJoRbrgmK9vcBbM9rmBl6Gqc4617MmcLh9ViLWROYrOTiRyP34wC5CiSHCsGD
         GaXwfvYGVekZ1+ZSFgvfe6DZTSPwxa8MGkcQ3/Zmt/PRGk+jd/08O0Q1R4b8eyUCiVtA
         C7s+5oebVUEQWvr9cFlDk2L5de1IOuIpTWqTcIh1Yaly7CiuLuePOdKDaPWNNH056KKP
         MtqQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1OwOuNNVP+p48/RlMM8F7pj8nrnPi+YyYufsvhgr3j1E3BdmbUQFDHklvoeH3zquf00KnmZHp5rUJ85eYe30CSVeeBuk0TrN+Cg==
X-Gm-Message-State: AOJu0Ywi+0Kc9Z1CXKAND+bipqM1UhPY5M+J0ADcwGc4tACkcU6J9Ifm
	S8PD5hK7sII1EcdkLU9Q9++Q6WmkfdjvCssZrzj8VD033ekKpBiedpE5JjcybRM=
X-Google-Smtp-Source: AGHT+IGyWVz7dF80oqRaSk3e45BDjiWLpL6Ezf8tUtNg33PSaV+2fPL0yYo9wtVgTm717Llwm13CQQ==
X-Received: by 2002:a05:600c:4706:b0:412:5652:138f with SMTP id v6-20020a05600c470600b004125652138fmr68354wmo.16.1708633305497;
        Thu, 22 Feb 2024 12:21:45 -0800 (PST)
Received: from arrakis.kwizart.net (home.kwizart.net. [82.65.38.83])
        by smtp.gmail.com with ESMTPSA id a10-20020a05600c224a00b004128da16dddsm1785707wmm.15.2024.02.22.12.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 12:21:45 -0800 (PST)
From: Nicolas Chauvet <kwizart@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Marc Dietrich <marvin24@gmx.de>
Cc: linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Nicolas Chauvet <kwizart@gmail.com>
Subject: [PATCH] ARM: tegra: paz00: Add emc-tables for ram-code 1
Date: Thu, 22 Feb 2024 21:21:42 +0100
Message-ID: <20240222202142.129807-1-kwizart@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The same table as ram-code 0 operates correctly on ram-code 1

v2: rebase on current kernel

Signed-off-by: Nicolas Chauvet <kwizart@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra20-paz00.dts | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra20-paz00.dts b/arch/arm/boot/dts/nvidia/tegra20-paz00.dts
index afb922bd79a7..1408e1e00759 100644
--- a/arch/arm/boot/dts/nvidia/tegra20-paz00.dts
+++ b/arch/arm/boot/dts/nvidia/tegra20-paz00.dts
@@ -533,6 +533,49 @@ emc-table@333000 {
 					0x00000000 0x00000000 0x00000000 0x00000000>;
 			};
 		};
+
+		emc-tables@1 {
+			nvidia,ram-code = <0x1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <1>;
+
+			emc-table@166500 {
+				reg = <166500>;
+				compatible = "nvidia,tegra20-emc-table";
+				clock-frequency = <166500>;
+				nvidia,emc-registers = <0x0000000a 0x00000016
+					0x00000008 0x00000003 0x00000004 0x00000004
+					0x00000002 0x0000000c 0x00000003 0x00000003
+					0x00000002 0x00000001 0x00000004 0x00000005
+					0x00000004 0x00000009 0x0000000d 0x000004df
+					0x00000000 0x00000003 0x00000003 0x00000003
+					0x00000003 0x00000001 0x0000000a 0x000000c8
+					0x00000003 0x00000006 0x00000004 0x00000008
+					0x00000002 0x00000000 0x00000000 0x00000002
+					0x00000000 0x00000000 0x00000083 0xe03b0323
+					0x007fe010 0x00001414 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000>;
+			};
+
+			emc-table@333000 {
+				reg = <333000>;
+				compatible = "nvidia,tegra20-emc-table";
+				clock-frequency = <333000>;
+				nvidia,emc-registers = <0x00000018 0x00000033
+					0x00000012 0x00000004 0x00000004 0x00000005
+					0x00000003 0x0000000c 0x00000006 0x00000006
+					0x00000003 0x00000001 0x00000004 0x00000005
+					0x00000004 0x00000009 0x0000000d 0x00000bff
+					0x00000000 0x00000003 0x00000003 0x00000006
+					0x00000006 0x00000001 0x00000011 0x000000c8
+					0x00000003 0x0000000e 0x00000007 0x00000008
+					0x00000002 0x00000000 0x00000000 0x00000002
+					0x00000000 0x00000000 0x00000083 0xf0440303
+					0x007fe010 0x00001414 0x00000000 0x00000000
+					0x00000000 0x00000000 0x00000000 0x00000000>;
+			};
+		};
 	};
 
 	usb@c5000000 {
-- 
2.42.0

