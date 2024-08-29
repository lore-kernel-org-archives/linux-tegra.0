Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F68B1B372F
	for <linux-tegra@vger.kernel.org>; Thu, 29 Aug 2024 15:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724946154; cv=none; b=J/7MlVvkY3zXIuMgOO8Dz3OWUuaLMeBOISFQNXfF6JwXvCMCv/jXU6FVgVnlWSGdCT6E85m7hA9nBk1mQEznEsx13bz79xMgExgqDE2uhAQqnyAGddvuDGzMwOk2F7VVjSBH49w0eh0HQizPO9rXheZY5k/m0NYOHOLJA1jdwZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724946154; c=relaxed/simple;
	bh=D7i8P0QFx7KvqTpDlyZVQ43AS524G5RhgKo7+HvygZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ag7vfyZDno8KAehUOum5elNqv85KAaYZQ+2rcLxXuuXtuoBFfwPAx/ctkNEUGZQ86Px7mWXz9jP5/F3Wd5/JMWomTEsxiC90h5K0F0IpqosZkKuv0lTJ+EnYh2iMsltkRawRq7WXWfo6+6WmMzdAt1jaLA0WQUzzX/4QoFde5us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PSmImdYX; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PSmImdYX"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37182eee02dso559282f8f.1
        for <linux-tegra@vger.kernel.org>; Thu, 29 Aug 2024 08:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724946151; x=1725550951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zl1x2kxAX2Bl+j/LbLW+hkJuGJTNonG7at6TwFLy9Qo=;
        b=PSmImdYXxZ7acZ8Mb3KQM5EgKowk/dc/b7nviRzExiCxCqJhJe06aGqDgHdT4IISb8
         4Osuq6/wjeGw1rxNSe7JiwAXeGNPdCERAaBZbghfB219jrD/9R83GfXRYiIcInMifOo5
         4AtCX0mCurramdXdvs4HDod6taZTJpFB1QN+cOSsIFXxLMYzDfyFcnErW/AXUd0o8HGS
         J5c2Bypsdyle22895ZURdjO2XLtWwG2mCVHkVOy1gUiGbE6fqMzjZCifKyPJ8dcYmf9E
         EaiI1SeSgBjdq8/w4KaKWv7LBjb+kNNGFw1AnKdE53VeB1Wtd8w7AoqFbrIPjAAo1Daa
         O9MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724946151; x=1725550951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zl1x2kxAX2Bl+j/LbLW+hkJuGJTNonG7at6TwFLy9Qo=;
        b=tfiLuEzea8jcCMFgEmLN6NeSQUubMJLlomrNSeMWtI0qF9zLV5FpRrze4CrEBmlz1o
         djk1BVSsOfngaO8/4QwyYeOqFKwnJU+CidQXaU0UXiXNUpmf2pQ2fqDSvFYNSbWyBnWn
         sd27DWtZk9d8qV2oECnWgHbRpJzhJglJO9nkaD5i+WiZPSDbO5tS9B8Syn8QK+ExmqO7
         YbdcR+VcO4TvBvrGXEDvm3h2UHZuMuqRtDsx3X0fE9xnk6LRQ/E7EzWu1k2Bq/EABR8f
         FslAK9aIWYWn24LM0j3H4EiDlkgVqIjByQF4w2A89MTD2yVZkSDPrdilMpEtDL53V9BQ
         /jPw==
X-Forwarded-Encrypted: i=1; AJvYcCXWAYHahC69aJCy0MhyNhrwukTyQYBuge4sAQc5m/bupiBrCtIPTuVLm1/5ZNWFwKtPGisE6+MOlmhVdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTIMlVum7NHqSJucZntwGswanT6OZevJElNMQI1NEkpc0P7sit
	euWrZ0fUT1osALKv9SdBZC+R44jd2Il9xbAEtz8R6lbfHgiRfFbG
X-Google-Smtp-Source: AGHT+IEpej+/3gPV7NoE+Vep8VkJ3YSQdfaYS9B6LQQN1bi19MxGkTf2UZRQmE23l7QCIkvTA1SlOw==
X-Received: by 2002:a5d:526c:0:b0:36b:bb7b:9244 with SMTP id ffacd0b85a97d-3749c1a9b9cmr1572123f8f.1.1724946150759;
        Thu, 29 Aug 2024 08:42:30 -0700 (PDT)
Received: from localhost (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ee753a8sm1714859f8f.35.2024.08.29.08.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 08:42:30 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Enable Tegra194 PCIe Endpoint
Date: Thu, 29 Aug 2024 17:42:29 +0200
Message-ID: <172494614246.1305701.3893909344140141897.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240829134252.49661-1-jonathanh@nvidia.com>
References: <20240829134252.49661-1-jonathanh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Thu, 29 Aug 2024 14:42:52 +0100, Jon Hunter wrote:
> Build the Tegra194 PCIe Endpoint driver as a module by default for
> ARM64.
> 
> 

Applied, thanks!

[1/1] arm64: defconfig: Enable Tegra194 PCIe Endpoint
      commit: 12803ded10b88b376026c544f1ebce62c44d64e0

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
