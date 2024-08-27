Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D2E73466;
	Tue, 27 Aug 2024 14:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724768854; cv=none; b=Q2YxrxwInyU1ogYbRrHh3z50EnhaKEIoYh/yzbQGKQcUTTHsPukvfm7IaEb0bxK2yppSReb3kB1+LFbGJN8GhRpPUCJ50YxY1sUIn48no3h90BP6rXdw+L6UKQbTofpZTpBV4exzOM+cUBfkd84GdtqP620u0Tsvdx/LTU4cu30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724768854; c=relaxed/simple;
	bh=9+fE61rKVtmjAwZSNnx+Z5N8InGoV86+d+K80kYtw3s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M3IeP77KplLflY52vgkO2CHYaAx9Zi5HRb+TzYtN0UUkT/RJllzp2ZsMpBGA4ets+gPWOLZo8SFqn6JGCagBu8OzI76Xb0X7SxhD2Lsuc+l6qbaDbPuP+2Bj3E622w9waHO6KzN3ulHAtJn9DXqzR34AklcXdxC7Fu4sX9KqbeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KoNAUGaK; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KoNAUGaK"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5a10835487fso8301624a12.1;
        Tue, 27 Aug 2024 07:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724768849; x=1725373649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nVeD5uWflgm4YCV5CAvBSyF+Co+VIw7Xmcbf9desJMQ=;
        b=KoNAUGaKO9aZMcWTYH6T32TitDSs87EjRGKJ3uCU+R++UgLn2XCZGDaVPLLFLb7gL2
         yObiK3N4RPkm1s2ueEO4qtGHwPBIRcPyGTGubAugzCItR2HD/IXA+zmCaz7dL0ibc/wD
         URx6IMbVfx0lmVS51WIis7sSVa3a6Nyi7NpdCdQksVhpv9zCjQGmDiLh0ahDT5Bh0d10
         n7Kmj4s+QpaQK8cukuIcTZMxU8KaKK3UayOVKNWsbeSywzHoe7jzKwgGZqF3rsHymX/U
         tucZ2z9L9lWVZehncLNoXohVCxxH+F3JR3yQWsN1wk9nJ+RmfvAXPbd12YLjj9wUbZsS
         rwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724768849; x=1725373649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nVeD5uWflgm4YCV5CAvBSyF+Co+VIw7Xmcbf9desJMQ=;
        b=QUcaRKMX+M3lk6O8e2g3aTH6L+//xthQGs8A75U6rqs/B+7jioe/HelU08xaLJheWh
         xRrKMUaqev2pq5aOYWTbp43gZjhO2KQK/5ONu0pgtiAkKeTR5tPsKmdFPt4LTcA6JVox
         bKWBP5Ww/Pi1iW+vWMi0K/uRanE9KIoszzqzEqPhT0KL1WUVE9oBGU8Z9Z++iRdm9eWi
         WewUBRd+pPbfOKt04QhTO7/+1yLutzli98DJPXQU4AioaPMeDghhxIvj22oIby8AQeF6
         hQbOx8QmPGYlXDaCHRU9knYnzOLA+f60TjbDboqS8Z7dBoLYLbQX2C0lY5MBa+1/LM6p
         ONAw==
X-Forwarded-Encrypted: i=1; AJvYcCWGJbzndr9RtqIE3JGkWrcX+IPckhWXtsetL0jkmWQ6Z0GA/W3mRU8vVCXqDIVhyREpyfSEC2Y1YMQu@vger.kernel.org, AJvYcCXcozzrhaevCfjx/q4BJfh+FwggV+lONe+00XQrHbPOV66Wxallc1M3NRGGsrbL1pftOY+D2DUFVeBHM90=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0IKJrjxn5SugkassBCZNNTpUqusFdrnCL1SKeselwDdcZSAXb
	KOjYlboUQJveTHB544oSBeg1f9P/ZPoQhBzp+pwWPgbeQ+GPoLe4
X-Google-Smtp-Source: AGHT+IHYwMGvsK9ShpMW1S+A4mG2ZmkTMolmtvbryre/WqmBnlX9WCz8JzS5pT9tHqCRnREbXoZmJQ==
X-Received: by 2002:a05:6402:34cc:b0:5c0:ba90:463f with SMTP id 4fb4d7f45d1cf-5c0ba904700mr1715386a12.7.1724768848246;
        Tue, 27 Aug 2024 07:27:28 -0700 (PDT)
Received: from localhost (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c0bb1c6076sm1079262a12.9.2024.08.27.07.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 07:27:27 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Brad Griffis <bgriffis@nvidia.com>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Vedant Deshpande <vedantd@nvidia.com>
Subject: Re: [PATCH v2 0/2] arm64: tegra: Tegra234 UART updates
Date: Tue, 27 Aug 2024 16:27:24 +0200
Message-ID: <172476883370.1250657.7943327214501260350.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240711171101.2798971-1-vedantd@nvidia.com>
References: <20240711171101.2798971-1-vedantd@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Thu, 11 Jul 2024 17:10:59 +0000, Vedant Deshpande wrote:
> Changes since V1
> - Added patch "Add DMA properties for Tegra234 UARTA"
> 
> Vedant Deshpande (2):
>   arm64: tegra: Add DMA properties for Tegra234 UARTA
>   arm64: tegra: enable same UARTs for Orin NX/Nano
> 
> [...]

Applied, thanks!

[1/2] arm64: tegra: Add DMA properties for Tegra234 UARTA
      commit: 7ac0be7a4cd708dd5139e68597c816fa4ce22a88
[2/2] arm64: tegra: enable same UARTs for Orin NX/Nano
      commit: 92331cc63ce378546368c8a58c4d8cbb044d1f70

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
