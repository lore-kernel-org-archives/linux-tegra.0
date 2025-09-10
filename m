Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A984D314A74
	for <linux-tegra@vger.kernel.org>; Wed, 10 Sep 2025 09:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757497280; cv=none; b=Czl27Fv5CoDt0JwR5rt3MaUOyq98boXLvQjiEzPp15Qmuq5uGbq6PyX2IHsmsMIdw4XG6/JNY2MNiTX08zcAeQBvL6nYKMSdKDdWUjgV4JShWpVnZnW/73hYeC8/oYL5PotrCNbAallAFj+mjvMCPMY2rZDc4J5Cy8dC2WGwr8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757497280; c=relaxed/simple;
	bh=e/kiWQIK0YAP/k8eC5ojOTLdahChMbymRDPSoa+l+lw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=p5Dunpnbf6iOrecHMzInhKEtgsOsG4BngS9hY6rDhd9X0oS+/l0pSHUo+R2zyvtSsx62LZ5olrX1RIyuZ/6lJLsCGDEC03WJp08sAsAsC8fuz9VNCJ4DYTWBBjJUheEt9QZM+wEbbItQFTlM7Q+I67X2cMj1NsBD9Flx9haFh84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ecgLE8LF; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ecgLE8LF"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b0446e57a18so73075066b.1
        for <linux-tegra@vger.kernel.org>; Wed, 10 Sep 2025 02:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757497277; x=1758102077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+pt4wmXkU07xSJDhWQaMnUt+2pOc32GfIf3u3taNxfY=;
        b=ecgLE8LFVWZBvs43abCu5vIIy0CbrhXheFdt52h0+Z6X/3lfa5hpqWOzeuygD2hHiU
         iuMxo/9s+UR11GqZCpLe5lAdEzq+hDrgOcxJAj+Eh5Ar9UU2TtLgzbvK3ghwk6I3lDe3
         01slapou73yz5DESjE9Uh33Fa1qaEXTZt0kUjwR0iVdEFcWoSQlLf9A+O/4OkxRGI4JG
         DY7vAn7NrVeiNtarquuHfUcjGQQwxoxbaFBLvpIWtMXJveENLaQih1nEJQkW4MnszP4u
         cBTdGclpg/qTSJOBMQsJ+Xum6msqlKgDJm7zAo/5ASpi0ezOEb9cHOC33absZfwG0vJ7
         x5XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757497277; x=1758102077;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+pt4wmXkU07xSJDhWQaMnUt+2pOc32GfIf3u3taNxfY=;
        b=mUTCOxKtEfECMBB8+Hc2ZQMQB3xTFUpHAtQIjWcDpqrwIGjgOJ0Ejo2u/1CjLl19FN
         vtd74pMyM5a1C0WeDKigDLwlSueQYtpoRHVwb47mNxPLzlTVpEJwkA2rwQJltaGteVIc
         nnPLxZzFr8uy3xbz6IK6uyb0kBfoXNiHrou2rf7q+HLa/ukhk9orftd5Q9+V2sljBgUU
         A6X2HqHvqV5EBG1NlBixffrp1KwY+9i7xxKDIrvrLK2TUNflqfqNDKaDDIjmW6YC5TpD
         4QfdgznCCMf+3Ybnt0xoAk/O51iusVNhvbYLiGrhIjX0NkfAwz60k3f85J/YZlVOZUtf
         pqng==
X-Forwarded-Encrypted: i=1; AJvYcCXwVnWSNO99KB7PnpKH1gtzq5zn8F9XxL9m4luoQNqcZBSaoLKa8gXutOa35z9JGCzWap0I9LzAM+LaeQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv3gntr280R4SMqJ0PRPUqsTiI9ZOPG51auu2k5ojp+Ts69ODQ
	4cQi2KrzUFY+I54LFNaJeVASpoBvWqmC+K9Lsp7TxV45fs7Mm27enlabcvxHtTCda7U=
X-Gm-Gg: ASbGncsBiDv8geGPFTf3r9MbdkKWsfuJ1XNV6ifRgoBoScDs19fnZN5j5cPsxiSPTLd
	A1AwJlPMpiMLAgVaDaxklShdmxanvrT0vyYDi2ZAgqoMrLLk9UO7W3rBPttg4Ld3sRKcg6KjpVF
	ZQ5si0w9CsHCXy/+zCtQ3w0c5VB8b/l8mkiyPBZDxABjKbCoJQyhSKa1/BScifsRW+TYhNrK2ft
	uNhTi12c/Vna9flHzjIXcMmTRSzcdUk4q5OfjJdfInSXLbZB/GQQjfJa/O1Qkpjf4zp3knq0fF2
	D8Y5UhoTFu6TMgeS3WX3agsJdfdDIz17BExRgmr95FLsT8d8SI6arlxSGYoV9hPDVd8ux4/q5yL
	0LmMrQlicQ8qeD3AkFPTdk3arLX7y+UJJeeDL5ok=
X-Google-Smtp-Source: AGHT+IGveog/Q2RUQ1K2kmwHRA0crLrj7yzg10nc1PBAbCu+y27ReaxfY24xmgNZqJ6GerxKvTkBkQ==
X-Received: by 2002:a17:907:7fa3:b0:afe:7575:df0e with SMTP id a640c23a62f3a-b04b1737c20mr799525566b.11.1757497276998;
        Wed, 10 Sep 2025 02:41:16 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62c01bdb7e9sm3021590a12.48.2025.09.10.02.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 02:41:16 -0700 (PDT)
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
In-Reply-To: <20250906-t210-actmon-v3-4-1403365d571e@gmail.com>
References: <20250906-t210-actmon-v3-0-1403365d571e@gmail.com>
 <20250906-t210-actmon-v3-4-1403365d571e@gmail.com>
Subject: Re: (subset) [PATCH v3 4/9] memory: tegra210: Use bindings for
 client ids
Message-Id: <175749727534.29308.15110527994326578124.b4-ty@linaro.org>
Date: Wed, 10 Sep 2025 11:41:15 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 06 Sep 2025 15:16:54 -0500, Aaron Kling wrote:
> Since the related binding is being added, use that for the client ids
> instead of hardcoded magic numbers.
> 
> 

Applied, thanks!

[4/9] memory: tegra210: Use bindings for client ids
      https://git.kernel.org/krzk/linux-mem-ctrl/c/3804cef4c59742cf695e7b41a9aabe8d5bb25ca2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

