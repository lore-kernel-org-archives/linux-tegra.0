Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621DA72614
	for <linux-tegra@vger.kernel.org>; Fri, 31 Oct 2025 13:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761916907; cv=none; b=HQrB5EImzqcXAwG1824KiyErCXc3fl3L2YfOV+pR3iLm8qegdR1a1ptE+RWlZbppBXTzU3ZhE+el4GpEkvVjuq55Hwa4yz8F0WpMSUFLtDTxkFKgfYXw6k85Zw9pYKw2XZ8CXllZs4trE+EHtkkG+H1R8H14WYPtxWwpdB7A27g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761916907; c=relaxed/simple;
	bh=9F8gqc4rpAW0lwHjC+yXvFyXO3F6d/9S0upqMfbC7T4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=b+1yv4naAZAsCRz5Q4FIKhz90SaUXxodRmJp2cNgk7ix4EwR3Q/aWGzA+3CCR2U4aRDID1HO4da2HYPNHQNJUT/+yRDaZxculVxZ7DjwfH2FkDgJmkA2pTSiEP4fsJNCfwmTt+H8FZ2yjN6YtiOyxkli5IYpBBX//q+GbB2HGfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y+1qLC4K; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y+1qLC4K"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b3f5a6e114dso39924366b.0
        for <linux-tegra@vger.kernel.org>; Fri, 31 Oct 2025 06:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761916903; x=1762521703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5rcO1WrShaPm5De8Wjzz/fE42huUhjGMGtrFHb04y+8=;
        b=Y+1qLC4KK9MQxsAJIOOGOzedunVHVCZwCJYjCtmh5fhXGS598PmyI0MshNA2B36HjZ
         tvL6kJcLbFNpoDIDtfv3cQJXwZ6+4Re2wyh/DqO/pkZ/iFzhpd5//H0HYS1fpRIhIgl0
         +dZCpHxR6TZQmfULI6J59oPZAJ3Dq8yY4AaTvyNO+moAU48sGSCr5Hg2iYRdRDfqxGSQ
         R5OTPaRPI4UarfCZ5oQsElBLOQv5RjPc20n6F2AfqLf1eagxY7kLmxv9BLXt0W5/QBAK
         l8qnsYULTCabapLhaiWj1dLGiCuJcXJdw7hX37AekWk6ozmbA8LMzKbbSwECbwAAFEX0
         BeYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761916903; x=1762521703;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5rcO1WrShaPm5De8Wjzz/fE42huUhjGMGtrFHb04y+8=;
        b=YzPkBc5qkz+qTwpaQ1FY29fGyxOQA7VBLBEqFpfVH5GPAog9Sb7tINjvJ1v2ski1Ft
         KGvSYT5nYBYAm3xlVVsfCGPzkQ/28Chw7pBvOLfHmNbFLndgJwa4RQ+v36kTlqxQBI0m
         XGA9UmDC8eCKLewQI0ztAfyUq4YxhO3mTatT+xt5m4GaTfBsPl1GF1yQASHur2wrfo/5
         rUP4avRlA053u1ak2CMQgY36fGVFzTlcI89IO2it5fdy4ZCBAC2uvMdXwEi/0h4DUIW7
         SpSt+4LYv0DWNlAyggaCwN+y5GSzQfxvGytmdLTkElhnNPApSa0ntxXnclX+Oup3nwXo
         EwxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOHHBKGUUwV4NlND3p9V0468h2jtTrCZ2ZoN0rqrhk0B+y9Zl56WwreJFt7C8YFl2nK5FI1tbcTZGSpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzmkpACugG+gjmoQiuuHvyCo7QRpJaKBlp2DtRCEbSs1cTZf8WC
	/mH4L8dPKOHIXgqBrOBbvPtxnPMCWw7tyAePDSxrisLunb4vltFIIJEyUPs9o1W31ig=
X-Gm-Gg: ASbGncuLLZW7F393e45cDc/2m6QYq7qkykVbK5Er92rlQ7E78X20yWCW0xQiYURgNa6
	Q/suakvgkhcNsHi87v8ZMYuL+iZw7uUGyR6uZABgBN0mxj6Ud/QwjyVxTzHj5ZJq3l9mhdti/lK
	QBcThaQbHmAuYZcPUIBVaWuh7LEAKHfx8bINMiTmq5oO6/JaNjFCfNJ0vVA+tXCukSCFJI3UTze
	cN1Ne0//pX4iEPV1XZrT7V7oPMgDcvALEXSzCAZbkNMfJnyjXIl9Hy2uIVWNUxzykJkcDTRGCqq
	czR78LLYPsFpyjPW6TeiCfgUGXFyIP+NPko1+aiCN9Tvm3lw0OdvVQJf2pPO3NXjQjC+V1HPHPX
	yQz3i+EyN1tINg6CqjenRSqxRcFNSRZRndz2RXT6HZ4QcnRnbI7KEyPwUmmNuilXgXNGcHmBVsi
	vb6oCGZ4BRMF3DTvfW1lvqq6bPtUw=
X-Google-Smtp-Source: AGHT+IHrjxX6puaY6w2PZtpMXH0moreOfvriHk3Y/1virPJB7joYYP7PIoZd61/ZbxsYgldtkurG8Q==
X-Received: by 2002:a17:906:fd8a:b0:b6d:5106:86d2 with SMTP id a640c23a62f3a-b70708a3f30mr208643866b.8.1761916902672;
        Fri, 31 Oct 2025 06:21:42 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7077975cfesm174858266b.4.2025.10.31.06.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 06:21:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Aaron Kling <webgeek1234@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org
In-Reply-To: <20251027-tegra186-icc-p2-v4-0-e4e4f57e2103@gmail.com>
References: <20251027-tegra186-icc-p2-v4-0-e4e4f57e2103@gmail.com>
Subject: Re: [PATCH v4 0/5] memory: tegra: Support EMC dfs on
 Tegra186/Tegra194
Message-Id: <176191690156.74562.382156724041473426.b4-ty@linaro.org>
Date: Fri, 31 Oct 2025 14:21:41 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Mon, 27 Oct 2025 13:55:14 -0500, Aaron Kling wrote:
> This series borrows the concept used on Tegra234 to scale EMC based on
> CPU frequency and applies it to Tegra186 and Tegra194. Except that the
> bpmp on those archs does not support bandwidth manager, so the scaling
> iteself is handled similar to how Tegra124 currently works.
> 
> 

Applied, thanks!

[1/5] dt-bindings: memory: tegra186-mc: Add dummy client IDs for Tegra186
      https://git.kernel.org/krzk/linux-mem-ctrl/c/c15b28b1b3befb7ebf1c01c42623c3cede4cf9d1
[2/5] dt-bindings: memory: tegra194-mc: Add dummy client IDs for Tegra194
      https://git.kernel.org/krzk/linux-mem-ctrl/c/2aad3b30a7df710ff281d12a81bf84aa4bd98500
[3/5] memory: tegra186-emc: Support non-bpmp icc scaling
      https://git.kernel.org/krzk/linux-mem-ctrl/c/1004666bc437e234910c660f9d03a71ad44c027a
[4/5] memory: tegra186: Support icc scaling
      https://git.kernel.org/krzk/linux-mem-ctrl/c/dd6814eefbe524e433e1dbc25229c9338cb50027
[5/5] memory: tegra194: Support icc scaling
      https://git.kernel.org/krzk/linux-mem-ctrl/c/c9e39dd13ad6650b46ff3288ed33130a8bc771f8

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

