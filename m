Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C64317DFE7
	for <linux-tegra@vger.kernel.org>; Fri, 16 Jan 2026 12:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768566264; cv=none; b=iILE/NBxovGtMdxmlR6fV676igGD07lDYfS1pJuVyQrloJ18sML3DzXYeN646KgWqFA+fJei0ehYcHHJ69qrKcP8KQpuxykhG/csTvgGficUMBxodRAaFCf9PHza9lr4uuv5aAf1BvpMkeLlw81OJkXWyTUKoasexTdJXBqbL7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768566264; c=relaxed/simple;
	bh=EPuASnftfuGr3IGIzAizyzPx5TQFcBsIS0N1UGwj1ZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q1Jvtg/3QUuMX00WykmG5F6h2Fguziy29r5vIWJorNDaTwaZD+tdcIsg8OY6WmPBAkqtNC3MujzZhCVCJIi7HML07GmghaAuRZ1qX7e+sMfDRZJA1NvVgbejEC5cdGErWjo0duJaYi62lmsQ9rvmoIkHVKCD/YjTUKtUW7CBb3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mJkmrgAz; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mJkmrgAz"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-432d256c2e6so1557427f8f.3
        for <linux-tegra@vger.kernel.org>; Fri, 16 Jan 2026 04:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768566261; x=1769171061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmp1er+I7mC+/uFhYU/BQ2FcpuXWQvry2+6qzVFEKto=;
        b=mJkmrgAzP5hyvHUnVGvSmFzrC726Oncrnet0xQkJnKS83RKq7AWZClzluCD4Kpoc4g
         s8Te9D5r5Q7XA3MpPT/ZSWezl7bHlYwNLQkVaQBzkFwcHQGDeH/j2dk7xBQnYtY/X5/s
         aThLh9IWulqL+Splkonton46L7SIycfmCwiJcJy1Xe+zh5w6SSzCG6zK3AJ1QO2wJDVW
         nIcKYqWv1/Fzzp4de1X8cJxXO4pZthFLV31Y0iZeqYKb3nJwumFlRzJsXiG9a0d3DXH6
         jJmmRCgsFnwQu9oMZN09jmrn+idLmNnUWVsnUvSYLYuoljpbEdUB+LykQjnq3VHOlGHc
         +YtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768566261; x=1769171061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cmp1er+I7mC+/uFhYU/BQ2FcpuXWQvry2+6qzVFEKto=;
        b=KrdllsoF51jp7GN2I09iJcPVwyVCSXeEtHFu5XJHf2o8bkTl1Cgw9WGrJzgspU8t/O
         1B1ZRqqu1E00o1cFPsfyxLuu8K+kF0RYd1c/wNxmka/jwcFgVe46vi0dJHlY/FJXfcIQ
         m3Xk9OiJCEIzT9SPsJJfpGcHqxaz6dHO5J3IxtxBu3WttkSBJg36Q7lGPreKMRvzJF0e
         yqhqgqvWObB+oOxFqotmouAzAyDz98dB7ugCCiGrq0ZabUXf5aqMLsCL9UUvZuOxN/Cg
         EetrLwCEPUkKSrqb6Q+/P8vR92T7jsHpNJBj4w5Lq1/5ofTqGTQ3R97ikrz4GQIb8BeH
         WWlA==
X-Forwarded-Encrypted: i=1; AJvYcCXnzV78y2jbjz1CBPmmGMgwg+MfhMi//NuVHhhFOnylcCIFJ6UrmlcLP0tiK/HP6Ja910zxB1iW6bSoMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFsvN3mdSrLwQ/MVSLkps7NyHLUJRsoJrYu352zdMrHLkR96Xt
	Gk8KG06lJ8mL/Q7QshXWSuhZ9l7Gu9/7PWLKouG1OcBWAkoEYzgecclC
X-Gm-Gg: AY/fxX5NXZCfZdLxnEMsbVlESTV3gTGoMNTmKg+mP6BShYGrRLJiQFbGzTg9Q/bSMYY
	SbvAQNR/avNR5fB5x1A6tpO4kJHzhVafBXExbC6u56lz7W7fIWcmLaG2W5yT6aGs8BiY9T4Zp4Q
	kiZmD/sYXAjUidBGnOYd7Mkx9vu8Sc80Be5jUN384iiPdNTnY0ffVZxQFSZvjP0eQ7INPQB7Hzw
	f6PhhIbvtoR8Xrkrk9u7WWZkRBHggurD9B/MGLio4HQnI6WWkJBRcnPsQcJlGt+TXUeZc/mWEN/
	68EsmOGrg2zJSA3ReWAH/AOkD59Vgg97cP2/cB8wGdBXEpqZIvrLneW2D3we7wJ/4lLe36UZ8HN
	c5aF/b/nuqzt06tKxxy50DjnM4XVwrlGBPx4rRK8kF9VMzuweIvDlSGMJTs6xOGj+P8DLB5k11o
	svJB71lEqjtG+GnS6b3r+4qiHa2ZgLzBWrxW+SGMnPVJPqyqqaGRL0q8phvIxi5ZDHOaY4e9JWt
	EXuuSQ=
X-Received: by 2002:a05:6000:2893:b0:430:f72e:c998 with SMTP id ffacd0b85a97d-43569bc59abmr3297525f8f.51.1768566261438;
        Fri, 16 Jan 2026 04:24:21 -0800 (PST)
Received: from localhost (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997e79asm5022416f8f.33.2026.01.16.04.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 04:24:20 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Prathamesh Shete <pshete@nvidia.com>
Subject: Re: (subset) [PATCH V2 1/2] dt-bindings: tegra: pmc: Update aotag as an optional aperture
Date: Fri, 16 Jan 2026 13:24:18 +0100
Message-ID: <176856624049.138342.8161176745846496019.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251119093729.441654-1-jonathanh@nvidia.com>
References: <20251119093729.441654-1-jonathanh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Wed, 19 Nov 2025 09:37:28 +0000, Jon Hunter wrote:
> Not all Tegra SoCs or all versions of a particular Tegra SoC may include
> the AOTAG aperture. This change makes "aotag" as an optional aperture for
> Tegra234 and Tegra264.
> 
> 

Applied, thanks!

[1/2] dt-bindings: tegra: pmc: Update aotag as an optional aperture
      (no commit info)

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
