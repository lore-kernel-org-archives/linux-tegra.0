Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E26618DB29;
	Thu,  8 May 2025 21:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746739086; cv=none; b=e9LoFE0MHmFvIPPHSyNiAu+LJjNmW1SN7UtdBAW/5VosbHM4RWQJJYJqtGU4DJwHV6F5w9Jqngz2H5cIPvEqI6+Mwp7BecB5jV0ECw4aRAd4nHGmGC3TXSfCQs2d2aSFVdkO/4WscVN+t8HHUpEEhcohPEB3b3i4g/IVseKiDnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746739086; c=relaxed/simple;
	bh=3Yk0z7fIUOGUI+vdsRjd87e2CEvebKj4ubkrpzc+yQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n9+AIPX5IS2a2S0p4pqpPkkpzV6XR5BL04FaIEJUSsC82pt4r09qpcrxonqp7h8JBK+P+dmkS4Nr6ogurYcablu548LmX2FVOqk9UjVvTh+SjgiUHSZeRESw0xH/l0uNfRk/JDGXttAMLJCiAt8Nc5FnVwGIRuxWSV/lOlcK488=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LDkHgMnA; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LDkHgMnA"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso14660255e9.2;
        Thu, 08 May 2025 14:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746739083; x=1747343883; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HTl5UeXgezhdq5fOlpvOM3CHsNCY7phgkfM1mnciVns=;
        b=LDkHgMnAGCBCbiXEMcXlBXO60OiTJtF4X0+8w4C1Ha24T6p3RiPyHQmXqSxlPSM7uz
         IBf72L5t5mkAFeT6o+hECldXM7VzUek004HQ7yniFNPR78bvZZ9xrziIYWAEoS7n601H
         ye0I9a1oEu92X73Hre3ZzZkHJLCMatv+gEPRJbWVvFHv4RIu0hEBLHQYJBHDTTWMMV4p
         KAdjEJRbjIPaJVGuKTALPUvxwW6yZXnmeEY0ieP8u5uJsshk9DlRi8z/xHxcEVT+9SjG
         6OAGzV9Dj4SroMI2xYN5TMEojHLhTwRrxu3tgssPQlzqWf2OjSJISENX6XSGoeR3U1xj
         aOGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746739083; x=1747343883;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HTl5UeXgezhdq5fOlpvOM3CHsNCY7phgkfM1mnciVns=;
        b=No5GHxBMgdP0jZmvF8Qa2QU76R4MwEMDO3qbuCkeqzB2SshBwOqfI4SG+ekSknJwfl
         d6CzgXVPx7IODfX9t4MS4/9+yILCClmuYWi8j61qV96fOVyS4a0GU9MFjpZxsVgXt7zE
         nXzHdF0m85s+i8/qTkVduwDIAt34wv1wpESb54wKNs2Dk5NkfBaBdyRwpxDecJNW2LDw
         CsFA7sKRswPeLCSoRQTHo//+aMvi59p9pZV3IgHxcTKOY42qQ2+p+7eKyo4mITSPO1yf
         bZRP+vCmLeE09QbEzP0o/cmy/sBLQep/RChE/1KJBZYZg5bp8Knfoo8TKFty6T9WGHCN
         LutA==
X-Forwarded-Encrypted: i=1; AJvYcCUy+eqXlQjfWT3kzyj01TPfEeQxEE0/ZWlFgL3mmMJavysCKaAoX5IZzJb9c4cEntdpsQUDBkN6b8o90eU=@vger.kernel.org, AJvYcCVlHjACI1TNkx0plEZyt4SmpGp+1EaaECaKY+AcIAIqLu43hg2F8+uSBveryRXaRmfy8MTRFHwCEC4u@vger.kernel.org, AJvYcCVwF7EXPHxG/0G1cSpeddyVIoAgA/dYSshMgG5GF0qGhN3JqziAG1SHWgDjjMA74MTqGQM8TNn7CHmE+UQA@vger.kernel.org
X-Gm-Message-State: AOJu0YydsZwyC8EephEdOCBb6I4IVv2riD0XxeAIsMKHprfxi+5OmpAw
	2SN0xnxCMKp9x36NvIx0p5d1kfzo+mGsSgCv7jr2Cf1TUrqCqyVs
X-Gm-Gg: ASbGncufdIW+1bT0gSIQ1cJfx/9VdcsHy139ASO19Yr/cbUXEAoRqaboAwTpB2G5vmZ
	hgcfBPuw2h64zDa1oDU49fL1Var+RkCzc0O840fF9JofhVUHsVoY2uyYrPB3TLNKTy6Ru8e/z00
	nUD0tfclE68KwZpUHJTkhuDF3eJX2MyX6jkO5DklwgMsS0keHG6krswAyEYNtLB41KRQYrn3SR2
	AJMAFFn9ay8jXL4OSae+BHFLvaoEsiHVNiMk8JfZ6hP7/MRgzwSaKQm0+adUeN7MYEzPV8rfgoD
	XNw+m+VvCdwIt/zhVgoOcFp7QwW3bCduIZA0wmOiyOYjU/OwWock4LP8Nt3PsBT5xLmu3ne0b6k
	WnrzDohuu/e9Tr4f/yjJunIe0vXNO2At0G4/vjrBRDoE=
X-Google-Smtp-Source: AGHT+IFy4pg+iAFMaAV0bqV8kdAWvwoYyKpxTUia+RgFDAw2ASRuFOhA8MnwlNOSP9yVyPJ3eKJAJw==
X-Received: by 2002:a05:600c:c0c3:10b0:43c:f3e4:d6f7 with SMTP id 5b1f17b1804b1-442d6ddebbbmr5061075e9.31.1746739082701;
        Thu, 08 May 2025 14:18:02 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a1f57de087sm1097136f8f.16.2025.05.08.14.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 14:18:01 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] ARM: tegra: apalis-eval: remove pcie-switch node
Date: Thu,  8 May 2025 23:17:59 +0200
Message-ID: <174673907197.1570271.32227030842920048.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410063919.11199-1-francesco@dolcini.it>
References: <20250410063919.11199-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Thu, 10 Apr 2025 08:39:19 +0200, Francesco Dolcini wrote:
> The compatible "plx,pex8605" does not exist, there is no DT binding for
> it and there was never a driver matching this compatible, remove it.
> 
> 

Applied, thanks!

[1/1] ARM: tegra: apalis-eval: remove pcie-switch node
      commit: 7cfd76f086c640119f4c5201115cf73488cabdcb

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
