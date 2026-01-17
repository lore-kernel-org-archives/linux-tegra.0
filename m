Received: from mail-dl1-f66.google.com (mail-dl1-f66.google.com [74.125.82.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629CB1B85F8
	for <linux-tegra@vger.kernel.org>; Sat, 17 Jan 2026 00:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768609552; cv=none; b=fIChW04qVx3XHyZ5XESwdLFs3MufhmEBcz2Gvx1VuHGCH+2q9ljZx+GgKWvUi+uFYqHiTp19O3E63zDYy0xwMSe7sPCVcIR2yRiVlei6ZDMobl/Q6nNIdGS823cpdtWtQqdU6FMzd8Kf7grraQNWnPiDAxhxNSWy+XNIS11Slc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768609552; c=relaxed/simple;
	bh=1Pihf5lbWkVay8sxliYYrZJf63s7eUo9QUF0VnXRwZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iGOBe1N4TzdpmODZ1bR8uRbewsZISJlLiC4kurIW98xnJSnYuWli1TWvDc0ZSZOqI3kyEpA3NBxbKS5p3El7ouTKgfJiIfmVtOG3IdEWjrWHtTv8v5TLj02Qb1PEyHgsuWsNWgpVDnjBZse7wEkVHUOFAQ3osCuaP1XqL0ORTVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S/ED+WLy; arc=none smtp.client-ip=74.125.82.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S/ED+WLy"
Received: by mail-dl1-f66.google.com with SMTP id a92af1059eb24-121a0bcd376so1789599c88.0
        for <linux-tegra@vger.kernel.org>; Fri, 16 Jan 2026 16:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768609548; x=1769214348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWRJQTsxOUHCUsanLD6DVdXRUIeel0Iya9VReAfc2Qw=;
        b=S/ED+WLyi6Ifea4YMgL6aCaXSr62rPh5qfim40Ish5OTcoOW4qS840IZUQoelgmxP6
         tVKIcr2fYdR3xuBd7FgHDyFW50FPrD75F9i0mJdsOpHyFDeX/HVgYIZZJmoWzMT8wbrH
         oT+kRMLe9vyLXxbUO/moHVSyA12HHJRAPH03H16YkrjshWkKoJWJI7riZVOoAfhgDCVU
         MC5/kmM/xrzbbYorHT9eQP3ARw4/qm1V02T0o0HNBmvpkdAGnIvIJlk+NLZf7DCeDxl2
         XpIttv+8BEelQDtfi67rdir1A/15itJ1I5LUApgojSLBp4sWaIkDrXYFfbLcTw6f3sPV
         Kodg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768609549; x=1769214349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uWRJQTsxOUHCUsanLD6DVdXRUIeel0Iya9VReAfc2Qw=;
        b=xMwvZ0q6RzpLm5miL6SB7andQEVi0JjNj4oMRQqU7limF3sGkgh/Cnd/6c4RfWoK17
         PCoQKFVmhLYXva+YAQttdStadsMIUKabJtrNtnAX3fAsSqgQcinrANofpQ/VlxEw1kI8
         jgmG+m1PCN7dyA7Mm8vtlhN6ncSjFhldpx6Jo0tIj5bVqGtmAPRX+wHfFExg98BXg1ny
         VTcFjbS6uqRCRbq1maIR+H29sWdahanegLGKs0eDoLg2i6ch5dDUCCZ9Yp4Y4+3Y92yc
         Lg/XCRAwZ+mIL5bQmeba3i7agv26bvuegKcTBUWEybaEYf8DGbk4r9lTdTRDJo5M6Ku+
         kN6A==
X-Forwarded-Encrypted: i=1; AJvYcCXNNzvImYbPe+8z7ZgZsvIaWBVr0LJRIrT2bnLc3DvajOjFzO8DyPb13HV35uZSZ+bKJcIDRCUJnPiJeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxeRq91hoJZzroZNUuLg1xZ5HLZyk9FuZ6gb0olGeyuxyBJgrOG
	j+fVmfEaaN/p+mMOtw/JHO895jSK3SEy0kZEPjOhUH47XdWPJxhPG93x
X-Gm-Gg: AY/fxX6lWZcptOrUR/fhhDPjrl13UuowBIy6nracOTpLQvmiuXsV2Dvm6JiKfREv7uu
	h2i7ssnqfUFPqCMeLTDB1I9otOhxlpRKuZ8jHFY+zgGw61K/bMGTqDd/GdnHtZERfVoacE2vgmf
	CbWxQpjRNWSAYWr9alW62L9s98Bf554UEeVaDtK8lsaxk1TlidZu4qJiNSRYLinKC8BOp/Rycw8
	+gQKtUGoi16I+2dm+Ps81MZN7v07zlPDyeVJ70KiAbUxLOLiEX0Kq1DxjIGYOUqStm2C25ia6lp
	SwRCnN/ys0BescnEQyaIZLPKO9cD6XbWZEXTvY8yzU7FY54crUM7PpkTdbl2+EVsIsbZ1tBZ7fc
	FCjWfQD8tgKLzEQfMCiTFIh5BeJenCau62nir7NWQznL883iiVViDAvXRU7MoB7XIHiYBCmDUA8
	i9N4rrHqCi/1VGsZoBVAzXbiNlPUtAMscKOtQrqQ/IVcrtreicI5B3TQ1p/Fr2QCw9iCdIjKx6q
	E0RsCc=
X-Received: by 2002:a05:7022:4396:b0:119:e56b:c75c with SMTP id a92af1059eb24-1244a74ca46mr4331442c88.33.1768609548597;
        Fri, 16 Jan 2026 16:25:48 -0800 (PST)
Received: from localhost (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244af10c3csm4418791c88.15.2026.01.16.16.25.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 16:25:47 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: tegra: smaug: Enable DisplayPort via USB-C port
Date: Sat, 17 Jan 2026 01:25:34 +0100
Message-ID: <176860947659.1613073.1005694583898145248.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251226-smaug-typec_dp-v1-1-7eabcd59da4c@tecnico.ulisboa.pt>
References: <20251226-smaug-typec_dp-v1-1-7eabcd59da4c@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Fri, 26 Dec 2025 12:17:32 +0000, Diogo Ivo wrote:
> Enable both SOR and DPAUX modules allowing the USB-C port to transmit
> video in DP altmode. Tested on several monitors with USB-C to HDMI
> adapter.
> 
> 

Applied, thanks!

[1/1] arm64: tegra: smaug: Enable DisplayPort via USB-C port
      (no commit info)

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
