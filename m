Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4455212B3D;
	Thu,  5 Dec 2024 11:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733399439; cv=none; b=F8rSaJgcwwL3PnpRVM3qH3hiyE8qbynZlJAtJ5jgLHIJWM8QSTg1NTQtePSEjLI2FGe1p3zLJhRmbXzRJZXQD3z1kDjWjHRVGW8pcFu+tuO7xfkMrB/x6iMseiUHlzk/BluiS/2d07fu8wR5Taivb2PLHa9lZSZ8CpIFylr+bXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733399439; c=relaxed/simple;
	bh=09ZErvOPilkcxrhg8MYOcE6zCdxNbMB3/4gU+4cpInQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mWKu5il4I8/W+VAUnKmAR6YyEK14TcK2PFXgQENo/l2PFz1fH56G62vO+E2D7b2hiGgjCVDCsWctTBQHs7HJu7wEf5YkGf5uCz/viK5XE0n2BLK2iCt2RJ+NPSa+Az0TS2ErSWkkFBMbGAkeD+Qeo6RHbr7MMqtuBjnLeLa3zhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c5El78I6; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c5El78I6"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-434aa222d96so9079415e9.0;
        Thu, 05 Dec 2024 03:50:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733399436; x=1734004236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S6NnyZQFQJZ/bR6qZgAFz+vbUbEYoSpUoCinAEz1xys=;
        b=c5El78I6IJJ/MM7Ha9TMj767FUz2Y84TFrhnT/Asav7LuoZaxBYWtwWdYujBfMhU46
         NdGWgRZNaJHkehjoDXuUddfqUr6N3TwZdk+LUbkzKCoghLMVSPTHXMonrY/JLKoB0dZa
         ccilczZzl49tG2zdpCGl3fcP1SWr+lmi1f4SyqvQkZvETt/gAu9KDaU4QQZ/hvZRZwgd
         MNs5OfEJwJPwfWJKLkkQcNyRr3V1G3uEeESEHnAyOgDIJEUN5o+vevr8mfoDXVaPC8gS
         yZFConY3zMr8e5ztqBGYg+FJgvcTwodZbIAAh5KdRSNN/CVBq97+LPNXI8iqlX77c2gt
         RUDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733399436; x=1734004236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S6NnyZQFQJZ/bR6qZgAFz+vbUbEYoSpUoCinAEz1xys=;
        b=lQu3a7QEJ7SSoR7X0Cx7aPYnB7oxeEhVTbjWG544zP+MRwnzhOa8/TrCvgZAASe3gT
         ePpB7Zx4RJYEANWw17DtKeS91fDYS+7Fqx8lmR68tsRjjnE4/O0ZjTX4ilanQ6A4lzO/
         bcz24I1Tr1wEfF/ypwvEz15TqPdqC1Zc87F31dMOLEFdx6XP1merCkWIHF2PZ0NUcmrT
         UcCNeCRP8cmygdJRvmL2Rwn4fF3uYoAfmtZkeIj/mACxy63HcdVaHpvG2pNdaH+rKunM
         eyQzDbz/BKtTj4dZA2zYQg1c1lJareDXQx6dlrtReO76AW17IlqtuZzY7Np1jf41xAU8
         jlSQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7YBwqg+Qjd3aRe459nIyCiJIyzbYBvthCCd4jiiycFko+ZwzR+YppR+KzPkAlvOHBssurkmtBtLaq@vger.kernel.org, AJvYcCVOkIOEOVf3YLRInFBcCaPtsM3pSvFYVn4bFoBIeHL2a7eaC+rPXjGWq8IhWhj2tgVvnXTlVeyK+1aW5ps=@vger.kernel.org, AJvYcCXrU7W9vUOc/2HGaD0/DNYoI8iVrB94KsKWMrW2Vbfc7PZwzby1y1QkfCMaUCpuU/V3vvbNofU2oQj8aCcY@vger.kernel.org
X-Gm-Message-State: AOJu0YwRC9fj2F0fGNpsXSspceJDUhYu4bCP9bzgoQALM4eWejvvLN/f
	vzQRJzwJJJZrzm6ly7bWwgLh3BEOeuFp1UHElhj8krHU/I/0ct4p
X-Gm-Gg: ASbGncvmIh3sLgClB02bfoNuyAXT+2QX2BjhBFdl9L6ywoICSOysqBfsr3K8Caqzz4b
	udSdKHyVkPPxfHjPljS43GF8e6rZh81iEZy9REJcFQvItFb7Sekc2tuEI340wiom2uIDB4DFizJ
	uwrI9T0zrHUzs6dfW6j/xlWJn2yQ2WxKvP5UfvTTeXzlefBNy5e4HEVR1V1eVqmAwo3VZUcVZnf
	VJeR9Exy+WlvxZVTZZ7Dd04wLBywi3oLuLM62uieFV2DwFlFep1MLzi2RZfDGyK03r5T/3B/kSJ
	AyDsSnnZjf/sMw9PhS9s+ZJyDMjE/G2cH43gtoappQ==
X-Google-Smtp-Source: AGHT+IFvdNmuBNbs/9Q5tFDh5WPSX0JQsB3Qmer1TrPs+pisGft0fuZ5HMY7sZM83dxJDY7ZxXqYMg==
X-Received: by 2002:a05:600c:45c6:b0:434:a5c2:53c1 with SMTP id 5b1f17b1804b1-434d0a0da50mr81873705e9.23.1733399436065;
        Thu, 05 Dec 2024 03:50:36 -0800 (PST)
Received: from localhost (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d52cbf57sm57046095e9.39.2024.12.05.03.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 03:50:35 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mark Hasemeyer <markhas@chromium.org>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michal Pecio <michal.pecio@gmail.com>
Subject: Re: [PATCH] ARM: tegra: nyan: Maintain power to USB ports on boot
Date: Thu,  5 Dec 2024 12:50:33 +0100
Message-ID: <173339940395.3942914.13239093539349741162.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241204214443.3d9c2224@foxbook>
References: <20241204214443.3d9c2224@foxbook>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Wed, 04 Dec 2024 21:44:43 +0100, Michal Pecio wrote:
> USB ports are turned on by the firmware as it looks for disks to boot,
> ensure that they aren't power cycled before the xHCI driver comes up.
> 
> This enables USB devices to be ready for use faster and reduces wear
> and risk of data loss on storage devices. A particularly annoying case
> was booting from a mechanical disk, which takes time to spin up again.
> 
> [...]

Applied, thanks!

[1/1] ARM: tegra: nyan: Maintain power to USB ports on boot
      commit: cec785a7f25d9ebe3a151ddc4f3a4ede7fc0dab0

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
