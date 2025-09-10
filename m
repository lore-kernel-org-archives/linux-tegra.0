Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C96286894
	for <linux-tegra@vger.kernel.org>; Wed, 10 Sep 2025 09:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757497277; cv=none; b=IpnEEV1Ndvfanrp0ltE5RWRuL3c40dQ+l8ajjJ1n11d0eYdQq31KC0rdbb8vLJqfiwMcWz/DpQuHeuLm49KrHhlcPGw1uX4EGUdolwuEd3Y8nU8Y3H1x7KtoeXrk3oEdSIdRYb681/0DEL7MzJ1KTGxliURU5QH6tFVcs2Jr7BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757497277; c=relaxed/simple;
	bh=iT6a/zPgyBzTF0XoggB8KlW7bpDBsu9wFGAHxlhXv7U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=q2CtRcs6HZow4Qp+tPfBkiFf0gBep7YF/Uz5c+co7LyLBOKhZgf7+YtXiAGbRIzgHEkGqAmyvibVIezxJn6vuFlaD2wQaRi1UDkMDQ6LbY6Yn/3Vkk9/UQhiq4TKh+sS8wUuH8Mg3fAzr/PWYVyumvmsvH2ZhYmCATcVDcJgdTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lHSKzCSZ; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lHSKzCSZ"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-61a54560c1fso1487720a12.0
        for <linux-tegra@vger.kernel.org>; Wed, 10 Sep 2025 02:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757497273; x=1758102073; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0SOuA/g/nVXdKYjh7EclBkYe4s8OIpHOm/5rpv34JIc=;
        b=lHSKzCSZoBSfplgHs2b1zbxD7ew72xpOmcWdm0omUOP7VhOk6JD8xrSK4504pKtvQK
         7BFHNwxgoN3uPVLYlJBh9TuwojPstdzFMS+Mlv8zSHSNZmtTUM+8R1z9jdE/xmJNuH0t
         JjIFlWQzwUKvqjA6e3w0l9FuNahuo33I8GpCedoU8odUAK36CQYI/pa5lNEFXUKHkb9K
         J2Gx9jr+eAY9AG/8aJbmDWM/+k0TnkBLKi8hIh7XjvibM130HrsSlmJ0riHH0pkSyqT1
         FPLMOp0M7JppOPy/x+HogbbghPr/6fyVnUeXHuyBL7ifVRnQn7MVacBEq9rgsHIuflLY
         NjJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757497273; x=1758102073;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0SOuA/g/nVXdKYjh7EclBkYe4s8OIpHOm/5rpv34JIc=;
        b=kLJqPEduU6KKd4634XCKi/2U8hwxLNbxknPFIylugN33sPW+chBHTQD6pWTmYc4mRO
         7j9tNM1PpjkKKTVSeWUVwKIjes3LLl4ntpWANx0yDcsKpG3/BGZefvWma9Eal43Go5Vw
         DXZvrNO/DePVLuUIiMCGWMtH/W7MXknW1U4S7Vq3hV96Ll8i3mHScyG8o7ybkkO7heeH
         oNoVERgU1e77TsVVFokmTux2XopyX6KeUjok2DEzAzD7yrVB8KLq4ueZmjOs1wZIimy1
         GF/v5EeNo/sGpzPIykA/3BEGxf/UjA8Avrb3tdVHjb+8BTrPGWl7anR67yqbBfwyHS5s
         Ll5g==
X-Forwarded-Encrypted: i=1; AJvYcCVHV7NfdDChujg+2KxA14v6Z/k9ON6mSgRRssWwnR6TG3NyaJMcygvzbGhPt/LfrxaGpai1NgN3QbGtwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxyUbMiCGiqTObFgDJ6lY+OmqHYkjuvIRt+69NTqrCZZV3kokT
	DkX3NYYuLOt3oEw298ldwulKqogupSBBCMek6iPlO0i64jRADAAhwFLVx5xIt+YPoqc=
X-Gm-Gg: ASbGncvufDORniY8a2/Nbc3nC0mVHP03yWJ+DwPP8dhc+Gs2J1mR5wT3kzOo7U0gMEE
	fw4sCtaFBZoCV4Kg+YlpyWZwwcYpxH0wJotAhz4EBMgi8258OT88ltvvMGfkCaNe0TxAyf4o+Yt
	SoYxWBFGjPZYT3M6Yf15t5gjV+xcXxB3zMhsXYI9g+YFVCTbREeGyBuyntTU9H8NIYffotaet4J
	P9XTqU7vjO2eDvWuLuNwCLLil4M9plFRSwzmRTgJLEEO6eCP64oF34mhmFNUykyYXBfIW8GwSeb
	0xGWfuqGRY9psy/PubziebSUfv+zmDfRdryTlsAt0FkU0Wys24fejB/sVYFKD4JtbYtR5PcHu0N
	s4RPfn0dz7MJTBWg9EmDnivsAM+F6jAZAlqdHaps=
X-Google-Smtp-Source: AGHT+IFFimeDDYyh9wXdVWxN7z2S4of6Ed5oLlealg+J5WJbf9k2XtQ+Zl7cp5trMu0jBLQkBELkhw==
X-Received: by 2002:a05:6402:325b:b0:62d:c7b9:b149 with SMTP id 4fb4d7f45d1cf-62dc7b9b348mr387259a12.2.1757497273537;
        Wed, 10 Sep 2025 02:41:13 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62c01bdb7e9sm3021590a12.48.2025.09.10.02.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 02:41:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Aaron Kling <webgeek1234@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org
In-Reply-To: <20250906-t210-actmon-v3-2-1403365d571e@gmail.com>
References: <20250906-t210-actmon-v3-0-1403365d571e@gmail.com>
 <20250906-t210-actmon-v3-2-1403365d571e@gmail.com>
Subject: Re: (subset) [PATCH v3 2/9] dt-bindings: memory: tegra210: emc:
 Document OPP table and interconnect
Message-Id: <175749727162.29308.12636309161261093675.b4-ty@linaro.org>
Date: Wed, 10 Sep 2025 11:41:11 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 06 Sep 2025 15:16:52 -0500, Aaron Kling wrote:
> These are needed for dynamic frequency scaling of the EMC controller.
> 
> 

Applied, thanks!

[2/9] dt-bindings: memory: tegra210: emc: Document OPP table and interconnect
      https://git.kernel.org/krzk/linux-mem-ctrl/c/550faad18505aac40a1551a5b467e0a63bf2d639

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

