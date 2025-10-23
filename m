Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092313191C8
	for <linux-tegra@vger.kernel.org>; Thu, 23 Oct 2025 13:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761226454; cv=none; b=j9bIC2VjFpO5L9x9hVf4Q3lqsb49/eQ3XCSNMRCEtNqH873kURqOokivZgukhYOKewQSXgXfF9I0IqVe7v8NaeRQaUd2U1oaFbXKMqOgDoD2M7FDBTJ7jqOxkzgr2TPfWrRBQ3wfB9sXe6LSDYBxnBlazFacvga2zik8wemXxW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761226454; c=relaxed/simple;
	bh=xXth8SlDXO+ya0Rwx7TxjiL6fRIaXNPR/86PNBjKDaY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cdF3kAoU5Lx+UegwKUdgVBwT+bU9FEISYLMM6lIZJ3uoAHcL5LKVegv3AiDjZ230skupRDWELMv62rcIU2w4QvTPfZxK4k4LtEyyFp9WC+sx/M6m88+DL7+gw1m7x7xpf7zPZ2ppgqAvZF/86ZO2WS1R4h4g4LRaffLwZKVzB8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TQElGbQl; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TQElGbQl"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-414507aa5e1so41908f8f.1
        for <linux-tegra@vger.kernel.org>; Thu, 23 Oct 2025 06:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761226450; x=1761831250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=snm+ZjLDAUHwyYAgdyyjD1e1nZHd4R9TDNKsNTjhU3s=;
        b=TQElGbQlZuS8vVZ7pQF4grPHDOyjLiqBSEyCKqEt3oqDWfHEpTDYV2/K/H93WdCF8+
         AdVDUdQ6WUaNB7ItwHaiq+W/5dnfNQnEiQLOfsuVPYjZ5YFtu8sgThyxOtih2Ai881qD
         /I/CIO1WqHoE7IfoOzwJPA37hR//gRAXLxKjqvr3NIAYwyiKwY3LIloR6Ww6fczEypPl
         IHDjgqMnvCJ3beuy71G6Sb083TPMwclGT6w6sXtUI3UyDEB/1fE7pmmaGV26Zfb+cQ7T
         hxVKwHiolC3+SkgKWVIhvZD1dhTfWCPx36aP19hivUaLh9OtpA5xml4qWRgrL/VCpnK1
         oV+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761226450; x=1761831250;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=snm+ZjLDAUHwyYAgdyyjD1e1nZHd4R9TDNKsNTjhU3s=;
        b=fbZn6gH5fgtiAkeYEYQE+7fPEDi122cTobm2/G+k8OJx+82g7/OB+kFRuZxQOaTMWY
         UeYy5RXXp4J3hYonx0cJiYt+NPveSh30Y5PSHgrLdb8BqtZiHt9fZYAZalUlFZyoJmCk
         +82IXCizMyTfNewA+1pQDV5PU1IxDzyfiheyvD6DsbiNuYJwA/+OyYdWOYHurmZV9Y3a
         NClJzRRYufysmfKNNQom3izEW6HlDx+57B7EhTffN1Ou/azu+Nvr0HYxu4FwILj8z8j0
         SGKoI8Z2uj15nm/dzJ/SLTF1+/wZGFm15MsnP8DvTu+3zG+yVij+oi5Zkeulm76dEp1z
         17GA==
X-Forwarded-Encrypted: i=1; AJvYcCV7Re7sCuM4D/+V+zML8PlEU07VBpOkoSfaRdTVJUqAH2BVsMOKImwNf0Br9hmy+bocdHoJMm6uK9cZEA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp41Ti2ziK522ylUwD4txLkiSVQtldqzcG88wGITt0eAIIZAKR
	gSugNibBIr6xPPyI6wX4E/QgiVP+WvH/pW6/5DNMHIE+t61fgK8jBB++bLlBboXs/XGVOrvARB5
	M3qny
X-Gm-Gg: ASbGncslURZk69g8K9xe80ehl34WohnROLiw+BQP/F3hKfVkYc+HdP7b0wFp9a+qJHl
	m4kfcnd+LSUzU9xV5AkaDNcr6TzUyu8e8HVk7pccCdV8GlxF5AFzYHIfYh5O1YM+FwoutZvxSJF
	A44i26AO7Q9Pm43hdqeTGMqJvnLBzJrg5ZnpmYhdXrl58C1gtoXpC6MPQA7YJwv4Qu5P28wFlhE
	rbDRl13xLlZX8H1EeURN6pbD8qxIwH9E8T2Q4yh6slzLOy2Y+/FFiMVLkd/BKUYETzUgFbYXAXo
	3ycSO997thist4+JU2n+lqD18+vuMGRx0xbOd8kT6zJ+8lmGv4zy8NTd3Dxe7+EMAVEz6i93b6S
	e7b9HyFxU/fwzOs9B5sEdhry1s0yPeJUzySgFYa9Bjxi+NLRlACQQTuZI0c72Fs+Vqj/75TZhjs
	rI9LtxaGwRfbNMZnUn1cQVnsQGj4M=
X-Google-Smtp-Source: AGHT+IGIDXejYCgbX8iEcmglszIf/CJWYVlZznjEs22PM1eux1O0bog+AXkWL2i10CNC8RyE20P6Kg==
X-Received: by 2002:a05:6000:2485:b0:3ea:4a1d:b542 with SMTP id ffacd0b85a97d-42704d8ebc7mr9582378f8f.3.1761226449781;
        Thu, 23 Oct 2025 06:34:09 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429897e75a0sm4037198f8f.5.2025.10.23.06.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 06:34:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Aaron Kling <webgeek1234@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
In-Reply-To: <20251021-t210-mem-clientid-fixup-v1-1-5094946faa31@gmail.com>
References: <20251021-t210-mem-clientid-fixup-v1-1-5094946faa31@gmail.com>
Subject: Re: [PATCH] memory: tegra210: Fix incorrect client ids
Message-Id: <176122644852.70962.10111018550041208091.b4-ty@linaro.org>
Date: Thu, 23 Oct 2025 15:34:08 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Tue, 21 Oct 2025 14:47:06 -0500, Aaron Kling wrote:
> The original commit had typos for two of the memory client ids. Fix them
> to reference the correct bindings.
> 
> 

Applied, thanks!

[1/1] memory: tegra210: Fix incorrect client ids
      https://git.kernel.org/krzk/linux-mem-ctrl/c/6f37469a933030692741710db809722076f71973

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

