Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23C31B3721;
	Thu, 29 Aug 2024 15:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724945506; cv=none; b=YLSE//s20PKDlNSa48sSg/9zZ1vcO4qr8/khKhLUeZw5mfDAODdcMzH+K4eEPnpGavJ0lF353GWdTgE5ejOrjNhwRlkXst7ptGFL3TzboHczaeNS4wJkcG2eU8ouZ3wN5hHIqaG2KfFpZfUTZaB2K37kj68oCf0ciPL1CXy2cS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724945506; c=relaxed/simple;
	bh=YCHIXQeGGfdMkzQcp67/z9zzjfuNYJ12mrbH917xPAs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=siF3dSmWk7zm+X91mt8LkrWOrYecjl5VonW3ueRgmz3MNurO9De+dnT1vX84pokfXel4KTd7c16BOns8aGWy+IZfViHymTgfvIrHUYTTbsTqpgB4Ws04G+XpCZpr175XjJsEgvgV5GYMAV8gPZH7y3kYS295TaeIqyJ+TXRP7dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kCGMlUzt; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kCGMlUzt"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37186c2278bso1036147f8f.1;
        Thu, 29 Aug 2024 08:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724945503; x=1725550303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9p9exDuS+N2wHltVC5uHJwdiYcj0alqx1w6CprkGJjU=;
        b=kCGMlUzthokIt9BrtLNsk4PMwc5ehYk6la0RfyvNy6XSoVxGqLEd5s9pyQq/J5NzOF
         futncAaMsFkmOg+tcfIJjAzAbCWlcre1hCRGi+FXvSV9YpI0KyBoSGYrg1tZ6IiA4jzI
         GSJ0mepg3TSxLVdQEQ6prZRRYM0FOUAMp7iXLtLOWURV6eWcGFl++eD1ahLJT+yoKTZd
         HH69IVGsOM85bxk/dolilqG1OKh6C8oOt363xK/8Ee+nCF2OjsR3vBbLdxfOBhikl3iv
         xedkteECXw9cIXIxWoAmYQ7cMXVsGJ9nOBF0KjaRg+mUyiR2Gx9A+R8pkRwzGYgryPFo
         Lg+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724945503; x=1725550303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9p9exDuS+N2wHltVC5uHJwdiYcj0alqx1w6CprkGJjU=;
        b=EtC32Ro8PaG7FFwQ6t2SSQXvDlZPHIXbVupf4hsZeHhbuFKQq82qw1faDAeKwOQvlJ
         Zs6T4sE5gUGUeggnu0mlos8NRmcc2UK7LUbFKC5OVWJhvOcjju3lnlvOSvCYVvqMAQGc
         P5PY0mKjioVhSo/CScvk7bHeUMu/n2vQ5sR7X6+LH1dHK1zCDQkue4Dc/QpPcvKsW9Rn
         6gsPIKnQlV8puJRpN9vdRPyXIgD4y5ItCJpkbJ98PbTRdUe2is4gd+8aj2nLIPSaE1NR
         3IG0K4glACbHi4h+EUCYSgrBJZf6rE3iDuKdDnV/3Ku91kO8Ojo0CEAHA/iI2JGA6ezi
         VyIA==
X-Forwarded-Encrypted: i=1; AJvYcCV+jokbcMownGOk7K3fsh084mfF7gE3w8Hb/OKE9+MYcLMCFLZl1sIuY5HDnndnh1Hk0TTs6gagc1Fv@vger.kernel.org, AJvYcCWYVAi4ou4yHlbuFTurGXp3uzlUOX4tXNWL/ugvSo3jYLSFF9Pyh14TlZamQbAXQSqJ8/6txIy28FF9hpE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj3tXh9dh0DyU6+6In7d6l8eYdFNtLTVcMiHaPSy23vdjJpu5Q
	f2Ltpi0O5erJ2XJuiVH3ksoxtKSZe3xxpCR/92lE5vVO1g8IgdIHVIPeslvx
X-Google-Smtp-Source: AGHT+IGRId278AbXJB19K4JskBOVnXVOa49pIxlinyuqsEH5+4Y5PRH2Yn+vk8vi8tvgwgBl8lg5qg==
X-Received: by 2002:adf:f801:0:b0:374:93c4:2f74 with SMTP id ffacd0b85a97d-374a022999emr1686888f8f.20.1724945502562;
        Thu, 29 Aug 2024 08:31:42 -0700 (PDT)
Received: from localhost (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749efb007csm1693308f8f.92.2024.08.29.08.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 08:31:42 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Brad Griffis <bgriffis@nvidia.com>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Vedant Deshpande <vedantd@nvidia.com>
Subject: Re: [PATCH 0/2] Tegra234 PCIe-EP definitions
Date: Thu, 29 Aug 2024 17:31:40 +0200
Message-ID: <172494549108.1303006.803535931416332245.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240816184348.2072535-1-vedantd@nvidia.com>
References: <20240816184348.2072535-1-vedantd@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Fri, 16 Aug 2024 18:43:46 +0000, Vedant Deshpande wrote:
> Add PCIe-EP definitions for T234 Device Tree.
> 
> Vedant Deshpande (2):
>   arm64: tegra: Add T234 PCIe C4 EP definition
>   arm64: tegra: Add p3767 PCIe C4 EP details
> 
> .../dts/nvidia/tegra234-p3768-0000+p3767.dtsi | 12 +++++++
>  arch/arm64/boot/dts/nvidia/tegra234.dtsi      | 31 +++++++++++++++++++
>  2 files changed, 43 insertions(+)
> 
> [...]

Applied, thanks!

[1/2] arm64: tegra: Add T234 PCIe C4 EP definition
      commit: f52830f84c7113880aa8e0469cd204f906335c83
[2/2] arm64: tegra: Add p3767 PCIe C4 EP details
      commit: 74c396a4cda0f21bc413472731c3e571f3fe3709

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
