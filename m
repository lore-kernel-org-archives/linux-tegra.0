Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F94846F
	for <linux-tegra@vger.kernel.org>; Sun, 22 Dec 2024 10:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734862093; cv=none; b=awiqTzqxr9VKvqWdl/oFvUj2iU/7DDkBtGxZaBBTqhtfP1nI+QdCxwY52abhY+i8o2aBRvEl8cD/BZJc57K5YrcQOWih/gwluk3wbNvPFvboyNhS3xSJrZfmRbzxjBzY7Kb+mFBp1ASLXAM/ZdT+F/SXY8/hMek8DGdCZ8AowXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734862093; c=relaxed/simple;
	bh=Cd428MxI2+UkJVGkRowNRB7pH6KPswnInIRTY3jrvJw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aXf883c37QzH0ekHQNrMLDtdppT6cEYO8+pWI2wyjJ12SSqRQklKL7wAXKHEHTb0kwIC5p39LmBkFfOiZSZDRj0oeePa69gxs7xe00esOSnhpqE2wWihqNCAzzmuRXSSDSJKQgGx8xrcTOEra0rCY4l0KNekMfusFuNXNj3TTFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bMDL7usz; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bMDL7usz"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d3cfa1da14so522129a12.1
        for <linux-tegra@vger.kernel.org>; Sun, 22 Dec 2024 02:08:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734862090; x=1735466890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KF16fKFUNQOnRqmFKP1Lm79MVzsyJfbwqxp7fgthkO8=;
        b=bMDL7uszhgkSijnsWAr0TJZwxW1rGjZZVAc+KomkOc0rEnti5IfqhfNUiBd1ym0BSh
         80S7T3qkJy+Cscap2KVQIvtDGtET5ImdcvSj4VHWnFfjf+KfDWO2q8Nx+VWGIwRwIL2E
         IosfktZGNBbiREI7l0DotyA0EVmN5bl/nOkmW7X9wlf4Z1C4jl75xiPnudsrazWK1CtT
         HSiakrGBeUpae3LDsRg+CP1rAHqhyQFbcdwAMyLobIQiMI5OX44zEFIDvdGIaZBNti0I
         33PNxkEI+gMr8l5VwR4MxNUG8jyBrfHjHd1q/N73Zc+vEOzfB/T3bzYlULfFZQAW3nIO
         kp0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734862090; x=1735466890;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KF16fKFUNQOnRqmFKP1Lm79MVzsyJfbwqxp7fgthkO8=;
        b=G9Derv5FlNRDHL95mkHmU0jWhouY7+jLaSWh8GMsoZgEOYv4N0zvZR/CtkN7Gckyix
         GLX/HLxEz/lDUmch0Hi5j9B+IABUxmrcUwDrKWtDAFwKIUIVKGYfZ9rpkQFftXqe6aH5
         3/LLtHpTmqlfdRHQc81EP2slbrekMfB6zb9yeu4Y/btQ5G1Mq5jkBc+zZd+VfeyMjpVQ
         6sypzagKuy5fNg+Dnp4wIA+2Nst7VOYgWrgdswNzBe1hIvBCPhwkuIGRtOpoATwLHRuv
         VHQV64sazcFZpX93PggpoF5zF01HxdnteDav/fXJ3vG6PimNZWgdLgu3UfQpHCmZXYWg
         SwdA==
X-Gm-Message-State: AOJu0YynyyhcTUA2w+WW9grXMJbr3xTOk4+gNPO40glN02rzJPjjYiOi
	cY3b/4piL+jdLUh1QB3uosxwJOtjQFbn4OStitpyGw9S95egZ++XGjtjBmhI/IE=
X-Gm-Gg: ASbGncvLzJNj97sTutFrP0eLoBVHL1Wnkw++7a3z1HqLgbnKWAnUtEdXgVI3Fklv+Yo
	VXxpIcTj1YtykOKHe+lo0uEW+bMLD/6Nk96xtkCuvJY10Dz6AfOkSi1doEdr4e4tODoyZionkFt
	4PgUhwVgkw0njZdBf9GvOaNqXCN9Hu/rXvG5JtZbGVWUgaViOT95XNs6jBpKPzsZOCDibRZWc5Q
	QWKYE9qyvWAgiStvfU4C5/SKX5fHCnxCt0mL1/bPC+QO4Qvf7EKGQbOvjeItiWHDCP7pZTV7I8x
	zWxtwfyR8bq7u7xmpNi2UsfdGtV1MQ==
X-Google-Smtp-Source: AGHT+IG3PhPzyW62CsYSdWPmkFIOorjc4o3Q5cqCUsA0+sb/EAdPh7y3FH6r98C3BxOaYOT6vIqSGQ==
X-Received: by 2002:a17:907:7706:b0:aae:b259:ef5c with SMTP id a640c23a62f3a-aaeb259f096mr114470366b.0.1734862089159;
        Sun, 22 Dec 2024 02:08:09 -0800 (PST)
Received: from [127.0.1.1] (46-253-189-43.dynamic.monzoon.net. [46.253.189.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0652a7sm373271566b.174.2024.12.22.02.08.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 02:08:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, 
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: linux-tegra@vger.kernel.org, dan.carpenter@linaro.org
In-Reply-To: <20241218024415.2494267-1-joe@pf.is.s.u-tokyo.ac.jp>
References: <20241218024415.2494267-1-joe@pf.is.s.u-tokyo.ac.jp>
Subject: Re: [PATCH v2 0/2] memory: tegra20-emc: fix an OF node reference
 bug in tegra_emc_find_node_by_ram_code()
Message-Id: <173486208759.9174.12081446531020310993.b4-ty@linaro.org>
Date: Sun, 22 Dec 2024 11:08:07 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 18 Dec 2024 11:44:13 +0900, Joe Hattori wrote:
> This patch series fixes an OF node reference bug in
> tegra_emc_find_node_by_ram_code() and utilizes for_each_child_of_node(),
> reflecting the DT hierarchy.
> 

Applied, thanks!

[1/2] memory: tegra20-emc: fix an OF node reference bug in tegra_emc_find_node_by_ram_code()
      https://git.kernel.org/krzk/linux-mem-ctrl/c/b9784e5cde1f9fb83661a70e580e381ae1264d12
[2/2] memory: tegra20-emc: reflect the DT hierarchy when finding OF nodes in tegra_emc_find_node_by_ram_code()
      https://git.kernel.org/krzk/linux-mem-ctrl/c/b9784e5cde1f9fb83661a70e580e381ae1264d12

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

