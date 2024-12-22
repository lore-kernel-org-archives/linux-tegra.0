Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0456617A5A4
	for <linux-tegra@vger.kernel.org>; Sun, 22 Dec 2024 10:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734862094; cv=none; b=feXssKYGLSH6bYeZfW+ou1JbWY97yo7QaeWHq67PE/4Ikkn8ncUW7GAN1RBD1FUoqk6cUDjTcef4vYuQGy0cqQsxf43LwAFcqN050r9K0h3zrLh+YepG9zyk9UHKqZNRFi3T/OdZ21sQTwgqghk3KiYXEqYKqH43eSYRNB3V8AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734862094; c=relaxed/simple;
	bh=AgJDFGT4EBaV472mps5wFDRGqDGOW2K+CpqonQXgAA0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=E46HpLz4MA6SgmQOQqAwMrYV8pfE3cyQKnKUoAWZpXXakP8p74AHKYKNU1neBJdTzFOiG7qGpYBXGdW+wtv3PvcjLnjTQF3AqWk6NBiCJ1MTx+oLTSf21zp8xW6Zeg07KwG71C68/hcso23mOa4GDq3PnEn7OqLDQFHFxNKned0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DuSCefxf; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DuSCefxf"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aa6a38e64e4so69483166b.0
        for <linux-tegra@vger.kernel.org>; Sun, 22 Dec 2024 02:08:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734862091; x=1735466891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ljxGm703ewCVfUElTTQJsqnmE+fPQJF9TeUPQzwsMy8=;
        b=DuSCefxf847JcQOPgezty0MY0JRmGk9sYFYc76m7T5OZnP2x+3YHc8Kdevvjui0Fv9
         JZG2HL2fiCdiV/QwRuU7SV+jWs05BPlbIQg/Cs6yiiwMkjZXFUt1lSq8/NjbvjkNCIHm
         JnWU1ovY6oEyqzaKpnTh8JvsZZOObdo1V7kXXMwoNeaE/HQAfHFl+iloQ8VPcgwz0Z1k
         ylPYBv3UEAQLrkkVs+PR9QYmi5RdnrP1wp+wLP/i4gRDvoar1nzT1Mzgdtn1xecceKvd
         d598OLqepHYfAfSdOpRO1ZjDKJ3cxlKoM7779MNFe4WQ7IxVaQ29Pc+K9fwf/Ql4s8OS
         xDFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734862091; x=1735466891;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ljxGm703ewCVfUElTTQJsqnmE+fPQJF9TeUPQzwsMy8=;
        b=vBjKY0bgewZMtL036Y8IV+afIg0vCGRvp+UB+tEnzebzKVMQYH+MfaasFAwc+WCwms
         JbNW3Q7NNk0Dkn/gw5AeWai53TNZcn5QJ6PdVYcfsmVQW5gmpIP+82x5xbgLSwGwhose
         bMEw1odIUf5q4pqX03qRM69/jbm2zqfgxSWV5b/BwHMnJJD4qtiQlS2f2f0N4HAJc7HC
         8HmFW3ngKyMcxKLvZj0QflnBLSduvSGfa3RxMbX05HXMp6srdAjr1+IT/CIS/lQKitVs
         12quX6wlolGQXNBy/74rhcJMZSURppL7uIACgT2XEvJtFZVAW3Ma+ykbh0xz2bqfsSK0
         Mvpg==
X-Gm-Message-State: AOJu0Yyt8XXrwBYq7aEN4izaGfEcQMWE3kGADJoMJ8m0Hp2zM6dOnypF
	a02bF5Wgt/xyLAzKdwzxciPjblWQkG3nGWbyaOrO5lTSeXv57/KKvT2c/HPhvE+eU1ihkNAh9dm
	9Py8=
X-Gm-Gg: ASbGncuGUu+679UxGEIz+HwY56ZXZApU3uyDIQZeelNRxTpxJO8Uux7kSDyN53qcclu
	rAbvlS2ye5BdmWsQRGefk1OUlvgGXgvJ7yUqhtgi8qJ0Nvoq6DK6EEHvFUDuYVUtwfI8W5Ec2I9
	vLEDjiuSgw6k6XbRFy9W2gfOsW5RHwZyXR20P9HXGh0fJXFHjhhvmKmDYSUwiG+MRkZGp/EJ/+T
	7Ux0UU7zNe9tm4+EsOieePFcMSFdVQqUPmJDaDYHu+DiGEnf0D6kjqL9ReUc9WvUWpVzfh2jIEh
	iuVMxHvrPaD3PHEfUV9dvFilGkCc4Q==
X-Google-Smtp-Source: AGHT+IG8qKfZqwddH6gDcDX1vqlVLyJBdxVerqxd/8PSKn3mmreAbaumx6RH2DCD1dh+lE0cj4WxHA==
X-Received: by 2002:a17:907:7f8d:b0:aa6:b08b:6b3b with SMTP id a640c23a62f3a-aac336903femr256123266b.14.1734862091209;
        Sun, 22 Dec 2024 02:08:11 -0800 (PST)
Received: from [127.0.1.1] (46-253-189-43.dynamic.monzoon.net. [46.253.189.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f0652a7sm373271566b.174.2024.12.22.02.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 02:08:10 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, 
 Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Cc: linux-tegra@vger.kernel.org
In-Reply-To: <20241217091434.1993597-1-joe@pf.is.s.u-tokyo.ac.jp>
References: <20241217091434.1993597-1-joe@pf.is.s.u-tokyo.ac.jp>
Subject: Re: [PATCH] memory: tegra20-emc: fix an OF node reference bug in
 tegra_emc_find_node_by_ram_code()
Message-Id: <173486208926.9174.136386735857237721.b4-ty@linaro.org>
Date: Sun, 22 Dec 2024 11:08:09 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Tue, 17 Dec 2024 18:14:34 +0900, Joe Hattori wrote:
> As of_find_node_by_name() release the reference of the given OF node,
> tegra_emc_find_node_by_ram_code() releases some OF nodes while still in
> use, resulting in possible UAFs. Given the DT structure, utilize the
> for_each_child_of_node macro and of_get_child_by_name() to avoid the bug.
> 
> This bug was found by an experimental verification tool that I am
> developing.
> 
> [...]

Applied, thanks!

[1/1] memory: tegra20-emc: fix an OF node reference bug in tegra_emc_find_node_by_ram_code()
      https://git.kernel.org/krzk/linux-mem-ctrl/c/b9784e5cde1f9fb83661a70e580e381ae1264d12

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

