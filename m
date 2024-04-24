Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C21616D9CD
	for <linux-tegra@vger.kernel.org>; Wed, 24 Apr 2024 18:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713982587; cv=none; b=WcI9Uf96vmdX6w7kXCI+iSSJRyTW+obqm5WLROwXdvXlb3g8dkY10jNzkRJ6ixkC8KNiijeDHz8kASOywTK1ot5r5kLSuv710Td1R/pgly/K1MmmtkOwZ8Xu4urDFwceiEaIZIvmpWdJMCxcqqLcj2ZbjtoIaI1mt7fcUOTBsqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713982587; c=relaxed/simple;
	bh=y7jejx2vfONKyEiaLswEcfOcgjCAOmhrmGJDNF6DVVw=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=p/S9LxPbTAVXa/X5JNkdBq/Q4lzi6urTQg29aQQI1sRaEAkC1rmUPNL4za9PMKEEK95yphhGDgH4aKu9susiZVpDPc0ZgGhlXRmnGolOKBaqGIwKBV6rBvpa+xt1ItP5TJt6e5ymDmR0X7/xrZYFr6rGMf5k/dR053lXZ6UVGQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uZdCV4+g; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uZdCV4+g"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4155819f710so1040045e9.2
        for <linux-tegra@vger.kernel.org>; Wed, 24 Apr 2024 11:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713982583; x=1714587383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e8OZkXZf11b2lPI1V6Z/6sbpWahJnB31qscNrW/lvNY=;
        b=uZdCV4+ghAgxkIXfWCIuN5SDf6Ch/NIM9IsEDm3W/jBi453g86Kl1XY7sxxYon2vot
         CR0XJce5PL+kewmj43aRciw14VjofZx+UpLptD9zqULn8YCQdTzie2hYmxxB+TNmyKAZ
         ulNN6dU2TiHzT/LaGRijXstqRAiq/vpIGjpc71ayfqKjrGOLiUs3RjPssVR4XIKA831Y
         stIGYdNMg0qBRzWaB7kOnOGE53UUf3Qg5tYqqpaMJy8aE1/zt0nvzbmPNE/lMWYISPts
         ezfqclsrWPepkHrkGkXCa0Qw1dsviOXpZFkGGHe6GPtNmFZd0QAqruOcLMPj7neNpSmO
         G/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713982583; x=1714587383;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e8OZkXZf11b2lPI1V6Z/6sbpWahJnB31qscNrW/lvNY=;
        b=TGWt1kFxxGmSZJj367FaVlSEOiZpnGnmNxtEV3Ub1qmxVImOlPUgYILAYY4vNXp6fh
         NAPdtUvctQO+XT99dJFEXQ7baBxNtLOPlBkZscI05AsUJNrDC7I7xZMVT2FaTNRKt56k
         mwJjtaPCXNgnLK1h7/UH77oS32bMyJOde4WimSVvtiu5/W8L7pbK2ii8S2eGMH8+hhEt
         /k95jmz6NrP6g3GnIYgvCKFhJZ9v3AQbwDMMc2s6+qxOTQZSYkP3/+0Es/ACK7u6GUQ2
         LAdycNh/Hb+6ogaiYQy0xFc7Z1tykwl4ekifP2NlcJAjkF+ENCvZHoMG930jahzifKEG
         gWVA==
X-Forwarded-Encrypted: i=1; AJvYcCVAxPN6WVMsDBzL33sqabQlYTPGrXF7IvtEI2PC4GY8N1ObMKZP16hMmboXWZLD8R1oA0bLN7UtDcI+z6sQ4QT5ShMzN9jXdZIRqs8=
X-Gm-Message-State: AOJu0Yz7l5RDa0c5PhL2RAJ5CD/owzQ9WLxonwhdvY28OIofR0MGjmuA
	G3NuChMNudiBXl7DrODMPKiFZFaonOGaEVJK75HYD4gZYy0/XqRThe4dc8rCRJo+gYzR6VnHppW
	Y+dA=
X-Google-Smtp-Source: AGHT+IGBGjujdojebpWqm+ec+7xBLpVVvqQk99UBZyDZJI5qXttdUk66c5bDURxCLoaUDChENYTTgA==
X-Received: by 2002:a05:600c:154a:b0:41a:9fc2:a6b1 with SMTP id f10-20020a05600c154a00b0041a9fc2a6b1mr2350501wmg.22.1713982583236;
        Wed, 24 Apr 2024 11:16:23 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id k29-20020a05600c1c9d00b00418948a5eb0sm28590899wms.32.2024.04.24.11.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 11:16:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: thierry.reding@gmail.com, jonathanh@nvidia.com, 
 linux-tegra@vger.kernel.org, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <20240419104516.308975-1-diogo.ivo@tecnico.ulisboa.pt>
References: <20240419104516.308975-1-diogo.ivo@tecnico.ulisboa.pt>
Subject: Re: [PATCH v2 0/7] Cleanup Tegra210 EMC frequency scaling
Message-Id: <171398258237.275534.7331223388966262711.b4-ty@linaro.org>
Date: Wed, 24 Apr 2024 20:16:22 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Fri, 19 Apr 2024 11:45:08 +0100, Diogo Ivo wrote:
> This patch series consists of a general cleanup of the Tegra210 EMC
> frequency scaling code for revision 7.
> 
> Currently the code is relying heavily on a function, update_clock_tree_delay(),
> that is responsible for too many things, making it long and confusing.
> The general idea with these patches is to simplify this function and its
> surrounding code, making it more modular.
> 
> [...]

Applied, thanks!

[1/7] memory: tegra: Remove periodic compensation duplicate calls
      https://git.kernel.org/krzk/linux-mem-ctrl/c/f8037b3d9a75f4963c1fd3eaf39b968f206d37df
[2/7] memory: tegra: Move DQSOSC measurement to common place
      https://git.kernel.org/krzk/linux-mem-ctrl/c/09dd3744d7c02a3844e8a6c96ab2fb3c1e94de52
[3/7] memory: tegra: Reword and correct comments
      https://git.kernel.org/krzk/linux-mem-ctrl/c/d48076e5bb9be787b769efb3e6439902dc8e99f7
[4/7] memory: tegra: Change macros to interpret parameter as integer
      https://git.kernel.org/krzk/linux-mem-ctrl/c/56c95667042ba12a66157477282ca73605a25481
[5/7] memory: tegra: Loop update_clock_tree_delay()
      https://git.kernel.org/krzk/linux-mem-ctrl/c/0d647b9031fe4f6b20d2f18b3d087dea740eecf1
[6/7] memory: tegra: Move compare/update current delay values to a function
      https://git.kernel.org/krzk/linux-mem-ctrl/c/c1a70060c654327be4aed6e617f53bae5af8625f
[7/7] memory: tegra: Rework update_clock_tree_delay()
      https://git.kernel.org/krzk/linux-mem-ctrl/c/edbf2db5ae95c4d8f189d05e827d9dd3ea75cfbc

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

