Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2B31CEAA3
	for <linux-tegra@vger.kernel.org>; Thu,  4 Sep 2025 05:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756962243; cv=none; b=OlKM7la8N4KidLLlO6ST7iJEhnudwp4vPglayuutpxGFCo9l6rPUe8Eb8LfA3/q5vX+Oy+wdEzjE8TN3si6hC+zD4Ukf4sCYgrlCTXe39k1IUbGhmVzrWavn2bKGqPlzFHVhFWK67h6sMT4nX1QEBI3UvpfVGdCPnsoTaMCrA/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756962243; c=relaxed/simple;
	bh=VN0eu04X+Blerv8n91iWc1v8Qm+cbzBBmKAIxRg+pTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n3yG1spcPPw9951jjibocv35oGO7fvALML7dHiBaDFQTIxEp5vWlxE32DPau+QCIoIIou2PdR3YkvMnk3NsUP9Pm1mQy/4vPx303tS+arBLTr6aQeDFRzfQZNORzsn/CeNcBaAWyzPc4D9Drf09u+qHI1o9mFQfhGhcr+WNvGrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zg6zZdZj; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zg6zZdZj"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7725fb32e1bso756507b3a.1
        for <linux-tegra@vger.kernel.org>; Wed, 03 Sep 2025 22:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756962241; x=1757567041; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PUDDmkRugVO/LR/xckcLSLxhh+WNZoJcwv9OrEHQ+Q0=;
        b=zg6zZdZjAMwDbXBOanb68YdKX9lsOQCVoGk2abp698AT7KFDZKQzONPHjJoYFqvOFc
         ial8mIUePKWdcRyK77IlSvgcEGdIgjTF3cIVMw5J1qqp1IMgseto7BNwsXT/78VsECsL
         8yD6T56kxi0eRhw5s3guONTwS0LpUynSNrDUndp6Q1CCTJ6LXjijPxzKZsnlCeO7HFlX
         b32C1R7x6J63nLw11uJvFuOj3+3zeh8AgpAxotFNA/OiVM+YeuwDotSmvGf+ap+wiwRp
         ZGQb7nBaOyD825skL28vn+QUm+4VaBTkdPCTgePlZ20y0PaYRmQDywJJNyHyi/7WNtzC
         5oOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756962241; x=1757567041;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PUDDmkRugVO/LR/xckcLSLxhh+WNZoJcwv9OrEHQ+Q0=;
        b=bnj+pv46uhsrgJKym1qL8aAF4aGSuYAkLIDfsnldRSEUFq6mHds4VgWZID3VtzAYe4
         qmn2heyIUbaTsmL6WTMY3j2Fkm69SEpFDEEFXBw07h0TET+bLsOBt4vWtjfp6WI+ydts
         9Fk+ZUWeuI621li4IFkYGUmteidmJgqYPyPFzXFbKxiyHZgjkfqQD1Kj8xo2MHaQiBZ9
         9CBX88dO8g1NYmQknaJkrg4APP110SRoHz2dA955yOF1BLiXp7Oiz4Y2trcK7Z1fiZRR
         p52Df8X4nqgFR7R77X+yWH0YrcvJwai5PVBSKf0p9TDk7suNwkAeRnyGOZ8XQoc8uM3c
         Supg==
X-Forwarded-Encrypted: i=1; AJvYcCWhR7+CmxMcl+m+7NXOF4E9DHdGVQ1919l9VDXym1CAUMifvEKtJ9LDKboGC07PO39DQh85YbiltUEQzw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6r9MUH0Ge446NfTuNmpzQBIv7ZxbpyWhCn8q7L4mbx2WSOWD9
	Qsoum29ha6lwLL4MCMFNhBP11r3iFebxv7Ea4uDhLOb3APqi2KqYpICyX0JsJyf9rhE=
X-Gm-Gg: ASbGncs24Qlk4KS2990WS5g/ppCqVmbrBBonJK0x2mjki31f6ti04F2/fmfYSlnAFkK
	OBaDf++dPEK0NLa6+iGrZC/ckTQAtXxFKA1TsIswamJZNefXuw+L8DV2zy1R5EaoHuA0PJ8IFk3
	yP0CL5NlCN7Cij0vYyJ62n9a79ugTAMuqdBHhKNqZpbchst6fWmP6Vkm9Q3btWYtA0pZdPq5g6s
	HIoFdIpSq4pN+PGvslQTaBIIHgOx/UoAFdmBDmVNuUx1o8Rigm287t4YMAZB0gAmjxoJw7esqsJ
	YL9uyokRSN5YmiRlG5IAkgBVZfC6RAOlvHa1uiHvNSWWLsmPwayXmFJpoYRH4AG1X3stNmktF0h
	VuxI1KJWQE10GWIB2CoIZAOu+jKxR+tyuGO4=
X-Google-Smtp-Source: AGHT+IHag2U9U1XvmmR0U1C9VDKS1Bo6WCQfCQMDOrQGMz82TQz7MiXq1aOJIWslun3n5e6SZdxUJw==
X-Received: by 2002:a05:6a00:2e2a:b0:772:65b2:99b6 with SMTP id d2e1a72fcca58-77265b29bb8mr15449714b3a.25.1756962241631;
        Wed, 03 Sep 2025 22:04:01 -0700 (PDT)
Received: from localhost ([122.172.87.183])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7723427c127sm16918405b3a.62.2025.09.03.22.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 22:04:00 -0700 (PDT)
Date: Thu, 4 Sep 2025 10:33:58 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: webgeek1234@gmail.com
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Aaron Kling <luceoscutum@gmail.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Thierry Reding <treding@nvidia.com>, linux-pm@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mikko Perttunen <mperttunen@nvidia.com>
Subject: Re: [PATCH v3 0/2] cpufreq: tegra186: Fix initialization and scaling
Message-ID: <20250904050358.kj7gxypu5mmov4f7@vireshk-i7>
References: <20250828-tegra186-cpufreq-fixes-v3-0-23a7341db254@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250828-tegra186-cpufreq-fixes-v3-0-23a7341db254@gmail.com>

On 28-08-25, 21:48, Aaron Kling via B4 Relay wrote:
> This series fixes an issue with shared policy per cluster not scaling
> all cpus and with some cores being initialized by the subsystem.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> Changes in v3:
> - Use more clearly named variables in patch 2
> - In patch 2, fail probe if no cpu rates reported by bpmp
> - Link to v2: https://lore.kernel.org/r/20250828-tegra186-cpufreq-fixes-v2-0-fcffe4de1e15@gmail.com

Would be nice to get an Ack from one of the Tegra maintainers before I
apply this.

-- 
viresh
