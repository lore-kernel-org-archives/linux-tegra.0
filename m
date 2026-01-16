Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3A6399A66
	for <linux-tegra@vger.kernel.org>; Fri, 16 Jan 2026 18:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768587774; cv=none; b=gTX/LwaIJo2VfcqngaaUynXgJFZywEeJPZfZnklkvtSXsKHS17Lhc49usyyy/WKk5eLMHuhju0KC87caAps8uJGWZ8Shlmc1M5yHa5c57DQ8XWepupm7p9Euug53N4fzvfH0nTeKWNUYfOg08qjj+StIL+hHaD4gz/NjrdqUD5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768587774; c=relaxed/simple;
	bh=uy11Shdpgv9uLU9B1TkSwOHyZp/lWDjQfah9Ah3Fmes=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=abgL7ysat3yhtIWnPtgwJrP3MT8gPz1MtPgdL+L08yoTMW4Dj/T6u2BIIr38b+ToDDcHXmrlG1MITD7l1s4VG+zqoyZCgDFtZ5Z2YP/OL90WhREz7Y/EK2kz6Dznjfgd+qbisFi5wVPy73gCSyOMzx4ZzRc8sU7Q6XYsR3OxzfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qr7/f6GD; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qr7/f6GD"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47d59da3d81so15347265e9.0
        for <linux-tegra@vger.kernel.org>; Fri, 16 Jan 2026 10:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768587771; x=1769192571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EvgbuX9nAhyJ7Hwsvuv5371paiIil7d2Xe1Y8FkC62A=;
        b=Qr7/f6GDwATjpJ2ksnPJPOAx1gxw6caR+cvzLqYCr20UllwJbHDtQF/C/kO3p6WcFr
         TIenR1IDFfJz0V7dgmxNFEz6kqSYs/Fnu/SWBKuWIvudO6zje2FGjkZG8NiYAsDLER2+
         WFu1P49/ybsO8kKlRYdgQEiEY7Jpy4cHuigE8ENB3wMoR9kzJbgZdQInrL0Ks0Gk5rzI
         Cy16HJjWJMFPEDGkXLrSSIIHS0c3EWU9xNmAakCL1pPmtrmRGaGYkEdHa5AWlc+X4S7p
         XWKuHLq3PbF1ZeesYrwiFGg6CJ+vL+IJrAHbaXiX2ZiXk71+WMPDk9C86EaM6tn3RV/y
         LaSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768587771; x=1769192571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EvgbuX9nAhyJ7Hwsvuv5371paiIil7d2Xe1Y8FkC62A=;
        b=SkEyxqid5GggqGYBUTIUy3hNKzGOAh5mR634vbr3dIHWwrvtoh/s8BY8VjTsMbh1G9
         Zi9G3ukV9/9pFIHHTMrkOW8E7OXOK8bZqYZDv1M3m8XzvgC8dC374dWBo47QSmVb0FBo
         PUgEdEFzY2M/Dd4nvjGwpoaLF1DBA/BjJTjkwM8pQvMdWbXsszap0BcMiZsfvPxEKYH8
         1Ox+K8Hs9dEBVc4LUjEtbeOWZyAlOdE6tbgio+anFUXtYZaiqhblGvTqO7TPTLLwffcs
         Ho2/K4qF37PGkHuot3m7Nsw1H0WnfUduI2AkbGpFX/NEI7XDka8pxcGWV/TpYZXaQXUJ
         flZw==
X-Forwarded-Encrypted: i=1; AJvYcCURotrnupIrdQ1xn8vA6IBfyhzl6bxfBinEnZfjUB60bXirL+sWJiolmi5smL/6ahh8YbuBC68GcVxeGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJn694ORfG7zRW1mtASIjU5n+WDzhjtMs4zIfzWpNqIa4+mdA6
	lfOIg+5WQnXq+ofXd8PLQ9BPgvi9FQNGEa5eta+fpd3Rd1u/z8nyNEGO
X-Gm-Gg: AY/fxX63PXzMgZGz+UBUYbS4r122ekeDDrgyVOGigwxJY2hVT8Jpn7y4A35nsb6mXDW
	IGUKhHt/P4YOXHYKG1LwU+ptb3vkmPrEiZP291vS5AWqS/+48VN6vX8BHt2xIDk/ZYgDepi9GhH
	ugxQQRzNGOuh/x1RDZgilylPgSEdEvo3jKZIEL51PX3Qb+JPGXFehHyqsAPSFH+OKZzGyhYlZLk
	cBZaJyHEPHCl47DDrUekNj1utdysYV1DhRkc8HjDyIHwFKUJy3L9otE9JFpnaXp58mziHLZKaZk
	aQICd+zl0kSoyG7/Gs7mZy/UCbvmnai0e0cs2+Z290VS5HG7OeHwzqfW6XUkEWaKD0L+xjoE79z
	PoZpQjdYm7/QuXwrVMHfDS9EVkEALHjRw2ptciMy1uRtmEA/A2xTN/3CUaC8KuEVoK4kJl7Q40i
	TW3V1suHRIM/Ey8HLZnK/k8zbeia+PUwL0hoiBH8o10ixVycHZAqJK3UhtU/GoFe5J3DJCtUil6
	WkJNr8=
X-Received: by 2002:a05:600c:3593:b0:47e:e59c:67c5 with SMTP id 5b1f17b1804b1-4801e547d1bmr49651095e9.8.1768587771338;
        Fri, 16 Jan 2026 10:22:51 -0800 (PST)
Received: from localhost (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47f428acae8sm110762165e9.4.2026.01.16.10.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 10:22:50 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 1/5] arm64: tegra: Drop unneeded status=okay on Tegra186
Date: Fri, 16 Jan 2026 19:22:45 +0100
Message-ID: <176858747081.163050.17024691327969889246.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115184840.310191-6-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260115184840.310191-6-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Thu, 15 Jan 2026 19:48:41 +0100, Krzysztof Kozlowski wrote:
> Device nodes are enabled by default and this DTSI file does not include
> anything else, thus it is impossible that nodes were disabled before and
> need to be re-enabled.  Adding redundant status=okay is just confusing
> and suggests some other code flow.  Verified with dtx_diff.
> 
> 

Applied, thanks!

[1/5] arm64: tegra: Drop unneeded status=okay on Tegra186
      commit: a52ae3c90e557b3cb845e8055860550f548d4b84
[2/5] arm64: tegra: Drop unneeded status=okay on Tegra194
      commit: 43a41ac8ecd0555e730ec79034cfd7176e50c4f3
[3/5] arm64: tegra: Drop unneeded status=okay on Tegra234
      commit: cbe8d19ae78f3cacb802d1b99b7f94539c3f5550
[4/5] arm64: tegra: Drop unneeded status=okay on Tegra264
      commit: 86adf1f9b3a4077a0283f43dc657d64f3fae3465
[5/5] arm64: tegra: Correct CPU compatibles on Tegra264
      commit: 7fa96da464327dc4068c1dc4e1ad2eb7805d3c1d

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
