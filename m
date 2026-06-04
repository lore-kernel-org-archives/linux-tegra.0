Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E940A3CF05A
	for <linux-tegra@vger.kernel.org>; Thu,  4 Jun 2026 06:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780556180; cv=none; b=uuqwd8rYEkk77gXJy7TgHznN2CY4+H0GPz1NaOutVlJGtCdAht9kIUN0+bo1elEw92YZwo16SD/ICZcHEt1VR8zZqD647gDfof8lqNkthJpd9YAawLnqV3/+txLYsGT7730Is2iQeCarMpEqCARXUG1HvdmSCvy1hEC8T/CEji4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780556180; c=relaxed/simple;
	bh=VMxmBMhiTLTzddssIUwmUZEIKtXmDkZaeZcPqnQK2RU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Do0FWQTuzmtJ03qWMcmc85QcfVC9+LgBbE2WsHW4M0n1te57TXaXCZ5dEzKiTeGTptYyLUgcm7TqnsIxYkixCKVzpkLgEzSiMfoCDVQKjpW0Co/f8BTmCl7+iqpBRhv4N0c/1YJQ6ldaTRVeXZDLgzApEQXd6cIV0DG54RUADhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lbH7cb9G; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lbH7cb9G"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-68852b58d87so580059a12.3
        for <linux-tegra@vger.kernel.org>; Wed, 03 Jun 2026 23:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780556177; x=1781160977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y47murUE2Bi/OoU4lIULUU17WHpCtlUIA1begJSq0eM=;
        b=lbH7cb9GLsQBLqG3PHX601AfV3rMWAVh1ZzJMgHtk07WZW1wWk1zCSYbDY+5Y9clkL
         wqTzi4Y5XZ2sg6RcAq7Tln5x6VDwua6fB3f9FgcJKYt0v8XV0vGBtvoVrUI2D5IUZWpf
         8oXjPXBFOULnuUcFjJIdD/UD9IWUc1Ox/FaibjXoutB79K9/KlnadTvdPoc5fQAa8UkH
         UK9J67jkNFtTD/38xERsWbq1QQKJdSSCzt/vJYMmCQ1TUAdUsYU0GG/GqLBBDaxS38UX
         laO9o5/9n5YKwssh9awVOXO6W30ORDYYCsYzNWgxvGzBcyrLMosqO6I5mTKYKFwFGbs6
         m/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780556177; x=1781160977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y47murUE2Bi/OoU4lIULUU17WHpCtlUIA1begJSq0eM=;
        b=iAEmMGIZvgOGIRxWbqk9WNrCYcjliYWAnkKI/tB9xPHYict6Doza+6FDFl9ndVglzE
         qEGBy+OdT6DiUIgyI/BhvI7AuTW77kEEe/Alw+BKTFYmYjnDFFMd5AEYZeKHiIKRP2R9
         xNxw3/fbZfVfXAWpGYE9xun18UfxQw+SlvlSQzxoiAr656bz7xIk9nYTVX++LIoNGNyk
         CA3fa0Dzw2/Kx4wg0pugDAY7GwR2rPjmWwvaD4YTYz+OOWnuMqVDctqRfeAtepVJUPEu
         skzoIiCSRlVP3OzG5xFEr87KqL/wWJBsO9kQQtajhYspVPfJLDbz8RPvmnuE3HNFpKkc
         6Ujg==
X-Forwarded-Encrypted: i=1; AFNElJ/DQbcX+75jJgbdBhjH83ITpseeMvPNPIC/V19EsIMKywD22rzGs1acvLlOocJCoLqDArFb6bbzqENLlA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwW45U4vCdNYdmgzFbmztI5MsdGVNydNJ82Mg0wKoEfCvCBAGYH
	365wWwd8THCz6F1sw7QwVokmHwrAZxHL58DhbZj3vdi3eICq5i+X7vRK
X-Gm-Gg: Acq92OHWoz5ej9KoYmwvBfOwPBz3X+KvNrlISEC/SKMIbjkQ8NiX+oHJb/UDXCS0nlb
	GDQTGYuwWckr32S+U7XWMgh6VSbCaz8b+dJQqBBfJmZRv2VugDX0r6wM1T0+dXOsH3wYAXs8cGg
	6GNakfvoFV8yHoz8oenDcjLh+J+UNPiGpMVC2E9YcbK9iWi3EeWSg9ANrOvm/fppYjts9QQywt+
	/EhHZIcBIKo1n5K8auQlMhwRsLDakMwEyShr6nFFkG9+4Qp15RpKeN+i6jsVKX1F66/xKEF4lSc
	oPMAonmifVWZdRJoHj3fl/OwFie6sJVk645GFhyVHwSigzZNQ7UVbBif7HtsYqZ+rJgWnSB0Azq
	WeA1Sc/sqbsCoEFVM4kLcl+GY71dpDqyYAAI1mAk+cp3Lzw0DESWU5u+KvfffISOAwcYlppo71r
	g5xg0SSYkRMf6cym0NDZxaEzKay004f0tivg==
X-Received: by 2002:a17:906:f58a:b0:bd8:1c88:cfef with SMTP id a640c23a62f3a-bf0ac50bb57mr345862666b.5.1780556177262;
        Wed, 03 Jun 2026 23:56:17 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf051c83c93sm264113866b.16.2026.06.03.23.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 23:56:16 -0700 (PDT)
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
Subject: [PATCH v1 02/10] ARM: tegra: tf701t: Add core-supply to PMC node
Date: Thu,  4 Jun 2026 09:55:48 +0300
Message-ID: <20260604065556.137614-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260604065556.137614-1-clamor95@gmail.com>
References: <20260604065556.137614-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add required core supply to Tegra PMC node.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index 041ea6e06531..f20c1db245fa 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -1599,6 +1599,7 @@ pmc@7000e400 {
 		nvidia,core-pwr-off-time = <2000>;
 		nvidia,core-power-req-active-high;
 		nvidia,sys-clock-req-active-high;
+		core-supply = <&vdd_core>;
 
 		/* Clear DEV_ON bit in DEV_CTRL register of TPS65913 PMIC  */
 		i2c-thermtrip {
-- 
2.53.0

