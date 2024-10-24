Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4A61FC7D5;
	Thu, 24 Oct 2024 17:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729790675; cv=none; b=WcK1qMQL6SfeHpbwxk8nLw1F6+ZBSffAxW6iuO03RxE5PG/lm0LiSn2y3AxHI0tbiAn4Zki7LIcE142BqOkYJBiNSmMosvLVPFu8+MNoYr6OjmqYssGJ+Qaw6NA39/IHip+XIOOGrjalHSXfxN4kIHFKB24zF0rxsCbKns+xHBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729790675; c=relaxed/simple;
	bh=nIU5RGZBGj6AglzRmtLgho0SrGl4Vu9/6ceBO3NtQYQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NHUe6VaDGykfxfyM1oEtyhgZRas1SkteWIPrLsi6UK0CdYWE4qh4aHowURSvtsn1L7Zau/+vNNc4keJVYOnz+ZsyOCqCO2aYHp53OP9smM1N21M2TU4kW/PNxjlTdOS5vU/ltTkM77YPA8EtdnhIBTULawVoLqRGoEOT9HHIuC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ghX0p1BS; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ghX0p1BS"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4314a26002bso12413735e9.0;
        Thu, 24 Oct 2024 10:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729790672; x=1730395472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0QxqFM1Hkl0tufP+atgF+sk6kuXyJIln3OX0G/l5oS0=;
        b=ghX0p1BSxScY9G9/oawwHDA2sD1UkB97KoEAiMAF39xGDvRYVBVB5MijJKfHKM0OIq
         mJCynZJX+9QCiNBwDfPRLOl+GYbitKax3jlsn0Mb/NQoumvuG8HuZzIWWFkNizhnJ9Xs
         O4bM0uoO1ngQ5vuJ+rCFJ3UXRD2VC1o8r1xcDRXjB2RxhoKpNTWR5SmFK6kaXyrevAs1
         mK5CSYHgB5IyRu160XyHgLxW0wxoh4ozdw0LU6MF0WUVTuXTKCsUEJx0e8uJWNrCygzz
         BpBjDVCUDzibt7WDW2Tr/0FTq+qq2y6FMyeZbcundLdtn7qHlTY6TzvT/xLjpykUiakY
         IYlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729790672; x=1730395472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0QxqFM1Hkl0tufP+atgF+sk6kuXyJIln3OX0G/l5oS0=;
        b=Qmx6i8kxlibQKsZleXJV6szO7/HsyRjlp5Y6vpLJHtEvwuYEcl6sRRulrkQkNXrEYA
         IKwc7bmBXnnzkdVeQVRJZAgxY7Fe+fqoppP+1B+K1NrovWwP8YgLdSTyQQ7QGuZ3iSMU
         5SyQa09aMSpWOxrMrmLqfBxTTnJwCJOcVBt16/WdZB3LYUSxo0w8CzM2zseuRC+iE5fi
         ilfA8DHIdvuui+jGRcbRHjGm14459bVYMSk2Q9WlnK31/XtKYUimQaOWtEHsrpamRqLc
         uunwLXA0noHNG1Q7DhOOF2QWWuVg/AdTI3XJQTHP0U3fx8MQcZ86CuNbr0C1Gg32KfWi
         EfXw==
X-Forwarded-Encrypted: i=1; AJvYcCUmkiagBHXRWPKe+N2OW5KPtD8p6Whqci2oug3Cxit2IksYE0U3cAm4dNBomXyjkaHK7CAwwpvJ8Bqa6Kg=@vger.kernel.org, AJvYcCXphjcVALIHd5941ofXYvK+QXSf3YLJRo1bzB9Bnh/LjHeCw/61j7IsB8hqMcGGIepZqRvCHZuxcxzLwX4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTrVXXh3OE7vropssy2tyV2NLg9xePk6cQRgXP70cD7/pc22eA
	pdKwtH+rQQ/J5LtFIk+c22jNked54oWtUHYplD3WE0BdB+Dur9mphRMsy4pW
X-Google-Smtp-Source: AGHT+IGs1kPR4BD4I4Bu6h+OyVlwI/etLR9GpZlR3desKnw6hJ1UVyKwI4hNum53hj3kEKOyzyJNuQ==
X-Received: by 2002:a05:600c:1c04:b0:42e:93af:61c5 with SMTP id 5b1f17b1804b1-4318c6f1765mr25240115e9.14.1729790671677;
        Thu, 24 Oct 2024 10:24:31 -0700 (PDT)
Received: from localhost (p200300e41f26ec00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f26:ec00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b567fe8sm23501945e9.28.2024.10.24.10.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 10:24:30 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Tomasz Maciej Nowak <tmn505@terefe.re>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	oe-kbuild-all@lists.linux.dev,
	linux-mm@kvack.org,
	Tomasz Maciej Nowak <tmn505@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] arm64: tegra: p2180: Add mandatory compatible for WiFi node
Date: Thu, 24 Oct 2024 19:24:25 +0200
Message-ID: <172979060252.717947.10687585732746114503.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20240903132200.3350-1-tmn505@terefe.re>
References: <202409030438.8tumAnp1-lkp@intel.com> <20240903132200.3350-1-tmn505@terefe.re>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Tue, 03 Sep 2024 15:21:48 +0200, Tomasz Maciej Nowak wrote:
> The dtschema requires to specify common ancestor which all SDIO chips are
> derived from, so add accordingly.
> 
> 

Applied, thanks!

[1/1] arm64: tegra: p2180: Add mandatory compatible for WiFi node
      commit: 2e57d3dc7bff60b9fb05eaaf4ebad87cd3651068

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
