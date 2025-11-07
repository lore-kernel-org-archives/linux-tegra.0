Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA792E0B59
	for <linux-tegra@vger.kernel.org>; Fri,  7 Nov 2025 15:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762529253; cv=none; b=Fo36waVdP0CPEHHshiTMw2YIArAAC8qLY6cu0v0YhIL+yIVA99yoy76URmQar0VqNICZh8yqSfcdRmpSQ+/2JDkkyACPKMYSQ2XdxjTikjiN9SKqiX5yiCdqv/1DWHXa/owd4hM+876T9eYW+zi7xob5a8hs2W4J/yXdrGcNOAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762529253; c=relaxed/simple;
	bh=JPqsqEUDxJM832hfxt/EIsSX944d4iw7eKwKyZWxBpw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ygor0PSlrsku0z80wSQGV6aWQqSNkQO0t4yav5Wx/gNVx/eaL0iXsE810m8lolhCP1khpqi0G9N0FOOBOdToocXUIP+P+PbQjKn0n0cfhQqG91d+vXx3O6aQSht6KjKHR6uLMalZ+cCJ7irmHVZKoEeUVCLVGVx5nbtqV3Q5T+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ANiL9i4g; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ANiL9i4g"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-429c743e701so96116f8f.0
        for <linux-tegra@vger.kernel.org>; Fri, 07 Nov 2025 07:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762529249; x=1763134049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dlbmp6fE0f1k2kkwUq7eTRAh9UrM62Fdybj2ewg8dhI=;
        b=ANiL9i4gIGjo15TDyIv8pLlqssdCLmNLP+ks6xuPf1oCyY5aqLJo8a8kSXbX7cw40G
         lKu1v9cYIHVhi05BhDUuApGdgA09z/o38SU44Fg/1/yeIOIcKK5WyID3IgzwLUnQVF2V
         P4ZBHD3WT1Jcr7ZdLnI7nzyDepO2ip4S2ER9X8tIENFiz2xXU00xpFz2IJq10uvydGUa
         gmQ/kQYp1mLCa4eXHCUpS6R2RBwQJgF2e1Oe1ybBdBEoqdbdzSgmU4Ic04OWHlAXMqGT
         oLuBHSpWMT3MY/DfBkHcvFm8XACPc5q95Oln04dlbn6afoEEpGSnnB80xocAkt5h8ESG
         L9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762529249; x=1763134049;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dlbmp6fE0f1k2kkwUq7eTRAh9UrM62Fdybj2ewg8dhI=;
        b=qgAD8aytP+xlNvLF9n58iRkzYFXvuR2NKoEi4bWP6AvW78Snj90XHfkq5L3n7J40Yv
         tKUN9MHH6XDqwUbV53zh153gN31XEihR6rEm4abPtkU8aSDYV6a23G05ZIPqboKtLt5J
         hJ54lS50yT4i9vgdC3lVtGgPV2fYWrQXWaw/N1VHKkRP71uMnfAjid7ffID2IiOHAt9/
         WzmLhxC5/owc6LQ9d3hEvmMECZiLHKk1PH3XfCp8ksyCdAj5YMRtZ+KWBkKm+hqB+IW0
         zbmyR33EvGDNskowGRhUEXHEfmmY4D+c4v7/tig5rEz5olBnWAkh62e13sq0+mVsr+oG
         FXJA==
X-Gm-Message-State: AOJu0YwEM0n2vaimL0rG3N+anlZKgysr4wty8ixisXkqVXwd3n6pTUkQ
	5BofBS3pTC6ou/GM+biGPhoNShU7mKu9bmCoun8wFbcc7Q5v/1YXRFrkWr5EKVjWebI6hcyoRfS
	DaQ1E
X-Gm-Gg: ASbGncuQImibDqJvDJJAJHx6oeEcW/EtsbHjJG/D5k62r42rZWigUrtzkAYA3miPh45
	MX+SAiWbf65RSzVxgSOPxneOAvgZ9+8HddJ1nGzcqQs2lP6ooTtM1KkvUq+6JoJQ/2hKzxf73gv
	4A41iqjGujromMc8lkmQbdNwd0eD0tQr3gjWvk3pmupBwIUyOcZvi2CO251XruVNwLlPXlXXeC6
	iNBkxKM5ulzPHu5Rn0+d9896VfdsTsy61CTPRyEWkUpch3TiTIbAQxH9YwBrDMBjQNv6i0iD+Ux
	P/KXr3hpsdI1h7wkXQ+wbDpRcCYDBA3amSVye9pwHs1WhP6vyP3DxuUVytnDDpQcD3UL2Jw91F1
	94i82xOMEs+7e3qNjOkOecl29fRLNT8XI8raLxp5Bm4fkGGJ4Zx7BCFcYgWBFd+btQC2K5luoGi
	osDhjmyplgVfLchXNJ9IkaRsLVptBZQXQRncszRQ==
X-Google-Smtp-Source: AGHT+IFgyV3Mtr57pNZt2fqSm+S0QZhS5guQJ473AvB6easEY5dTCBXTRPXLCSENpuNy7W4WpTdfMA==
X-Received: by 2002:a05:600c:4f89:b0:475:d7b8:8505 with SMTP id 5b1f17b1804b1-4776bcc6ae1mr17454075e9.7.1762529249512;
        Fri, 07 Nov 2025 07:27:29 -0800 (PST)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4776bccd41bsm52157135e9.2.2025.11.07.07.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 07:27:28 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jon Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org
In-Reply-To: <20251106190550.1776974-1-jonathanh@nvidia.com>
References: <20251106190550.1776974-1-jonathanh@nvidia.com>
Subject: Re: [PATCH V3] memory: tegra186-emc: Fix missing put_bpmp
Message-Id: <176252924848.322630.4781681051514137437.b4-ty@linaro.org>
Date: Fri, 07 Nov 2025 16:27:28 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Thu, 06 Nov 2025 19:05:50 +0000, Jon Hunter wrote:
> Commit a52ddb98a674 ("memory: tegra186-emc: Simplify and handle deferred
> probe with dev_err_probe()") accidently dropped a call to 'put_bpmp' to
> release a handle to the BPMP when getting the EMC clock fails. Fix this
> by restoring the 'goto put_bpmp' if devm_clk_get() fails.
> 
> 

Applied, thanks!

[1/1] memory: tegra186-emc: Fix missing put_bpmp
      https://git.kernel.org/krzk/linux-mem-ctrl/c/8728bdd648f1b0f48ddfdb57bf6d9e7515e02518

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

