Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8041C0DE0;
	Fri, 28 Jun 2024 14:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719586443; cv=none; b=sW+KUh7THvqDQdXQb9u3bv/liFJJDYnMrdG5YLXhOmfl/SeFKJL9CxckW2h8bIRABN1qiIOA4WE+XwBsYvRVlNyAKfvEcBxRGIlyGoJZEbMCHyd1G1j1U2taVEwdBpPzU3IAcnb8eEH1ziFDuzIHa3Tjz4qP8CVO3NtKa93JTBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719586443; c=relaxed/simple;
	bh=7SLCOSdyoFmg7UU8Si2neqCswMU2V4UbTPgOBBYjaj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hq0soxOkrYsmV3pd7B9JxcHTfQDFj+VYtzww+ylCTzdrUIgOZtiZyW8C4JtyqQOAI5HiUsCL6UjFh8kWTBXVlInFgxUfRpH9FmKWUWiF2tr/hgkKXqQbiCSovsrQgjdk7eI0H7fwHYEt4ENIZZIkQM3JKxJbzHRlPlRuklqvEVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WnISho3p; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WnISho3p"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-366edce6493so429845f8f.3;
        Fri, 28 Jun 2024 07:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719586440; x=1720191240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJB4CLWH5EGH9lfwnNo1e6DHhdoYYus7j5hPs38e1/c=;
        b=WnISho3pba3AMjbu4/NqwlHrQbR0d7frSupmjGoea8U2irdUkV63LW3mnsbZM5nguU
         Pkc40AxcZdyxuGlnZTZMhogu7Mw4dkY18kWnMLTueKkn/QyuNlPuOi5CHlQt62RwLvZ1
         aCj0+vabc4DzpRFjWApz27u9ANg+Q9i2UVMiq5Ul/HLSyQ65qxjFCgZFQo/WVlvIhnIf
         iUvyRaB33mCHDfNFd3yYE8rutdLvxSEjhpIuRPZvuXfwDlTvVu9BpuM3eA8vHV9U1Yg8
         tYlBDSq/z1/XynghYvZUNasmX3zLPddNkL/Wk6fMuzT3z9/WfRwhUnKOEoYJyNoXK3uN
         4Blg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719586440; x=1720191240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mJB4CLWH5EGH9lfwnNo1e6DHhdoYYus7j5hPs38e1/c=;
        b=U+YY3qgjE1KDtkvZcirQ84+L52OV4gnIsFZveMzuC02hZkCyXb6h4hX/aQ8Egfxnr3
         pTurAigRTMZwz7VtyzW9ptzOwdMT193xusAVyBhzDfp8fRTZhtPMZggFgW8q9JeGbZRm
         FgKR0vZH5uvB2WuYO1f9O+FGVQcopFZOF6dt3W7NtLDE1NNbHHTt3+dhqSOiNXDAK9td
         SJKdnGX1km1D91AkJVGewkcr3zTg1gko27+jYkgPyw2GDWVC10MNKJ1MARM1Y0OQ5Q0D
         1eP5S75q53WUJpS9LNKQiHbygvzY8ejD06Rs+QSI8pd8GKdm+YPC4/bBxvRCwGx9BiwX
         Ub2A==
X-Forwarded-Encrypted: i=1; AJvYcCUaqgAXT8t+I+lLtM0NNk6RKcACqUXzpShlatV95s0x4t+lVpBNmnUx3NOOAV8Do0kmDP9rskMPCZD9kp3z/Rr33Ik30dU6eDRGKuJzXQLPzTGSN4KtxTWC7BEX3cnOXqGTFWSHIOIOifg=
X-Gm-Message-State: AOJu0Yx7wMvEU6u3eEWwbDB991f7pjaYia5T3qK6Wu/P9JSdvjJXNR49
	gmTac9Z1k9j5MiDpM4elGcysM1pgCE5hdfZPCqZ0aK3NzryFmFoz
X-Google-Smtp-Source: AGHT+IFXu6WFAyzE6T6EueeCszyjWkacZiRj/Z0pNn5w7L6AygL9Y+yafoFUv18VXYAUoFnNLkVehQ==
X-Received: by 2002:a5d:65ce:0:b0:362:dbc2:9486 with SMTP id ffacd0b85a97d-366e963036cmr9357222f8f.68.1719586440001;
        Fri, 28 Jun 2024 07:54:00 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0d9b12sm2533031f8f.44.2024.06.28.07.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 07:53:59 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	Besar Wicaksono <bwicaksono@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	jonathanh@nvidia.com,
	vsethi@nvidia.com,
	suzuki.poulose@arm.com
Subject: Re: [PATCH] arm64: defconfig: enable NVIDIA CoreSight PMU driver
Date: Fri, 28 Jun 2024 16:53:53 +0200
Message-ID: <171958642412.2431132.4521875314508984778.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240509215808.126217-1-bwicaksono@nvidia.com>
References: <20240509215808.126217-1-bwicaksono@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Thu, 09 May 2024 21:58:08 +0000, Besar Wicaksono wrote:
> Enable NVIDIA driver for Coresight PMU arch device.
> 
> 

Applied, thanks!

[1/1] arm64: defconfig: enable NVIDIA CoreSight PMU driver
      commit: 70870ff9015c61d4433482649138c98174f45582

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
