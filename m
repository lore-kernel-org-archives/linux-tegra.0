Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D57C1A0732;
	Thu, 29 Aug 2024 15:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724945676; cv=none; b=J6vlNWnmrz93Pvea8CUNsp83HP+slJqjCu7dTwRkn5lg30kQzhsxOaKsTUjHzPLBa/3zpQVi3DFj2NNCfDrYgzf8XPcPuW3Eei2TsB6JP+UGLFnU00W4/GBE4FG5DfJslEpZE4X6zo5Ihc+vjkFjMbsA5DgKAeaSxftS7yo0O2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724945676; c=relaxed/simple;
	bh=y/fVmmCNtqQfkk4hjG5Z2JAFKL+I55qX+2uQAcUK3LU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OYem0xo9v+EgBRlaIDD8wATG/ZWlTD54mBEkAuzJMmdh1Vpi6z9jtCn5oMhaHmKJEiBjY7royhGl3vLjtFQK08nsG6PvcbvjSAp9oDCCMKXmjVgGyhsYBLOCG3lpmFCjCSVR7LKAgRaeeczwAHCbUNojtqFUTchToztO2MtfWu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kila/o4t; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kila/o4t"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-371ba7e46easo572092f8f.0;
        Thu, 29 Aug 2024 08:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724945673; x=1725550473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lMGz4DJlwPSsw6cNmF0/FrAY3O8lCXnqabxmSJHWP94=;
        b=kila/o4txdT4oFl7o5DvUiG0DBMUQh8/9BNnGffLylZUY9WA0ONdcZ4dYVH2uK/MfR
         e+uBWVRi/jWu52JTp64dF0rCVnqYAXuMum2GMgUuHLrt9OMorNN2lZj/X0aXNlqgRex5
         oAd8JvH3yeib+xLe0C9KJJBhumTvcE4bxejBChXUO/+gG7kdKkLMiYS1V5gj9FHMDWId
         30P9N8+xlL0FBY/MFklDeNqIOcC5YR+uboT6dlTsQnmojVau0O7l85H+K0oFV5fYzQ/3
         3xh10YbO81tQ0hNPGRiQ4PGZwG5DKEZtejL/hrraZ8jBdz7CXg3978esVwBT1H9ebIgT
         m9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724945673; x=1725550473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lMGz4DJlwPSsw6cNmF0/FrAY3O8lCXnqabxmSJHWP94=;
        b=OQ20NJGSx8Jv2zQBREZ8dLP9DsnCHxESh8ekrzDgO9z/ThkWuXOeO5qP6is14RL4AZ
         Ayp075np5AXFsroNDMV1aREpUtMllO+4KL2KZc3PsXiEmKm3BfzwPKIwlay3SgYwh1an
         diLNe7IwxMGn/Kp76MkXanlE1D4tSOnAnuW0MjqXK/q5xYRLr7TDmVVeQvf5EYUl/R71
         fukb2lwwfWSVewNOf/V9m4wdJvP2SQWiAZNvNBmGvsS2aRX4qy7FFE1znCr7yUlmYpgt
         KPeUB/AcluvaaENR7QvsaNTHoJbbM/OrmJPAMCV0/zmSfOcSLGu1eqK170KAKiCnx+rP
         1xsw==
X-Forwarded-Encrypted: i=1; AJvYcCVpNMYtxYTL5AEh0pz/TW5ybJRiNYfwcbaJyf7qn6AZFjqOIxBshLX6sinkMopnOt0MFeCwNB21rADyXSc=@vger.kernel.org, AJvYcCXT58zeHMDvnJTp7F65PU+U9L7ERYDzu4ruf6PukhuGfsBm7njk3qmo6n62Bf2eG4vexjW1dJoEb4mZRP0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3rgH8I7KaChupVgUYjdWHZbGxW4ogD42cZFMHOgERIlItFNCp
	01FhEr2hA1m/YM2Azd2INmAY7VlJwbLd+JuC5viBEEFWe4Vja9pI
X-Google-Smtp-Source: AGHT+IFxKaGRXv7lvD/MPu70PuRfTyCtPyTd2XObVZ6XcGeS8PxveGi7kO7jcRXs0Leo9U7LZRN4EA==
X-Received: by 2002:adf:e902:0:b0:368:41bd:149b with SMTP id ffacd0b85a97d-3749b550ef0mr2170947f8f.34.1724945672815;
        Thu, 29 Aug 2024 08:34:32 -0700 (PDT)
Received: from localhost (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3749ee94265sm1690690f8f.47.2024.08.29.08.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 08:34:32 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Nicolas Chauvet <kwizart@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Tomasz Maciej Nowak <tmn505@terefe.re>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tomasz Maciej Nowak <tmn505@gmail.com>
Subject: Re: [PATCH 0/3] arm64: tegra: add power sensors and BT+WiFi to TX1
Date: Thu, 29 Aug 2024 17:34:31 +0200
Message-ID: <172494565922.1303542.1681323776551991858.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240821185829.20997-1-tmn505@terefe.re>
References: <20240821185829.20997-1-tmn505@terefe.re>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Wed, 21 Aug 2024 20:58:02 +0200, Tomasz Maciej Nowak wrote:
> From: Tomasz Maciej Nowak <tmn505@gmail.com>
> 
> Jetson TX1 DevKit features bunch of peripherals that we have now drivers
> for, so wire them up.
> 
> Tomasz Maciej Nowak (3):
>   arm64: tegra: wire up power sensors on Jetson TX1 DevKit
>   arm64: tegra: wire up Bluetooth on Jetson TX1 module
>   arm64: tegra: wire up WiFi on Jetson TX1 module
> 
> [...]

Applied, thanks!

[1/3] arm64: tegra: wire up power sensors on Jetson TX1 DevKit
      commit: 33dea2aa93442559b4bca665e8a5d4e1443dc228
[2/3] arm64: tegra: wire up Bluetooth on Jetson TX1 module
      commit: d00df3a8fdecee044518fb77525b41efeaf26df6
[3/3] arm64: tegra: wire up WiFi on Jetson TX1 module
      commit: 867a8138bfa3be7e83c7671912b648dcc862b3a2

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
