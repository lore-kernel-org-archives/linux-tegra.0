Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130D922541C
	for <linux-tegra@vger.kernel.org>; Thu, 11 Sep 2025 15:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757604772; cv=none; b=XN5TssOrg7hyvcQbCb+GNk9m4FITQksZbTkQTwByzrFtVxKjqaGLuclNZH0uCuckZbdC5cETtf44GVVo4XA+xlegYXg0cR68BPNvkXJLzp4Wj+pys7aitbyl+ov+FyQWMaJGnlxd9JFe4Az5anNbHIly+6ov9Cwznq5PjP2WJRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757604772; c=relaxed/simple;
	bh=9d5INW21jjr6oErj7y4Sti7BG3O8dXxCjtAuIhufDNc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sHIuIsXWKrc14ROarOo5tI1DPzZTQyzEBXObHPwxkMsDJsZlqz7B6t5Bmgm6TfTdN1Rx/Jripi72a4/nIUb4SWfTf7H33UY6eco/FkRq7lpv+PlYVpTfXh73pSQ1n+9vUSZsPRLoJVM4wzqX9ZsHTbt0JlQUA9BU2VaHv3lAbeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h+wirtxO; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h+wirtxO"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45dfe95bbb7so7717555e9.1
        for <linux-tegra@vger.kernel.org>; Thu, 11 Sep 2025 08:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757604769; x=1758209569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3axJvgEbFXgxfwL/zVY/UXD8zhBqiTBNfyhVw2O5KOA=;
        b=h+wirtxOZcmfcGFV1qt00csoureoSJAWB0UhFy5L2Q3B0L/z0rcYinbD3Nfvd5j4/X
         oaUU0o1jA4H8hKIO4VE74fM14ZQrcGllHA7ivBwEBqz4K4KYPZW/JQlUCbiAbUu0QJwM
         qzToOgJOU6eGR8xtOU89nJtF16v1tpGsaAG0A+ToaVjSnDK8/XhhCQGL/UN3ObGMYOm0
         OHKdOJiACoxgXZqRxHboU3BJoyNo7hx7Rl2UtMTZhB02XaicXy6KzlgJJs6GByibqlzt
         KwF/ca8R+/K2z6LxvdgVzHgrV4GrhzmnQ0sb3cugO9PzOQON//+6+qoVi6LRYHIvpqXH
         gNsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757604769; x=1758209569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3axJvgEbFXgxfwL/zVY/UXD8zhBqiTBNfyhVw2O5KOA=;
        b=Nh9dwSPK7yZnve1+083JZFUrflcpA/Vgw5tls0YB6yAU+3uhLfM7LHjztj+o9gHvE9
         er1/8YoQ+N6tFbUlVS/+UmfRMcqg3mXdZl1gdm7UDL2K9c6cS6Kt+JWx2eUpSeYZQp0w
         4O3oIRj5neSXaEZtUlU8QNDuCRnIDumbJ+SUYiIRav8q9ZbztSLrNDMlpXagyLIyNhm+
         wUvcZdUItRF5y4atRwPyNPuivbv5gv1KwgonL47QbO1IkqoXqrvMNNKq39DxGIyYMxsS
         pWJI8qUhmaAuQTaXJpkiNLzgFTcSa+cOusRMLLoEs8VQCaHmU4QtwZByhuw6B6RaIjJk
         gAIw==
X-Forwarded-Encrypted: i=1; AJvYcCXfbMoqcKV5IXpIkfP0cgD+0CEDDX05l60rqSCbs7jtxd2VbQLjRoyJq659KLw1tKwDf5QWm7uL7JORHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YylOU7Hf/lbhYg1VuNpnL4JYDWLUcJVBMn/TkEbLNojBdQzX6W5
	7HEEWEpB/o/Uei8MKeNOpp+8UAaiabs36NODFKoxSoNpwOJbvODPB/M0
X-Gm-Gg: ASbGncvhC3CoynnjA/rX0RCyGweO0T+3v79CeXKpxrmDAlfcP1A3z21swhPahExT0v7
	N1CxyDtg4hOFZMf7yLnw7INAdFu3V+PIQOHM56M65IsPhevy+g7qsGC6GKb+8NpDloUFE4m/T8+
	9LATem/5ohC/H0V3OCA4eMT65X+BX7A98mCM6D6l9JNuXeEXsXdsWvrTiaNXa5r1QFq264aLO52
	7j8wkQkSbq4KBXfOue5IgsVmBmT5IN1HEwriW/PmtKZz5brfz6z+MRYstyqHeoPh5SlBKprRPfq
	aBGrGUGHFYI9oYTHqhaxnP8HRCGCJ8o7fqnZIQa5LpJXza0LkL56G8S1VfDg/9yi9ISWgo5K7pl
	U9HeXoqaG84uVUXgsc4od+yVY3HTJXHhnf3zVLLHE7S2X/sBLNcha7l5uWkPhyZ0zIg7fTlft6g
	dlOPofuD1/Vw9UbJb/J6U/+fxj
X-Google-Smtp-Source: AGHT+IF3BLIq3kR/6GHqEPtT2eBTcLlyt514cWOzH9fOkQVX2eOkZCeyPsb05zloZHpD/Z4ENo6UCQ==
X-Received: by 2002:a05:600c:46ca:b0:459:d3ce:2cbd with SMTP id 5b1f17b1804b1-45de072e878mr165182475e9.13.1757604769028;
        Thu, 11 Sep 2025 08:32:49 -0700 (PDT)
Received: from localhost (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45e037c3cbdsm29794125e9.17.2025.09.11.08.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 08:32:47 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: akhilrajeev@nvidia.com,
	andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	ldewangan@nvidia.com,
	digetx@gmail.com,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kartik Rajput <kkartik@nvidia.com>
Subject: Re: (subset) [PATCH v6 0/5] Add I2C support for Tegra264
Date: Thu, 11 Sep 2025 17:32:39 +0200
Message-ID: <175760472294.2784204.8145431282909905411.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250828055933.496548-1-kkartik@nvidia.com>
References: <20250828055933.496548-1-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Thu, 28 Aug 2025 11:29:28 +0530, Kartik Rajput wrote:
> Following series of patches add support for Tegra264 and High Speed (HS)
> Mode in i2c-tegra.c driver.
> 
> Akhil R (2):
>   i2c: tegra: Add HS mode support
>   i2c: tegra: Add Tegra264 support
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: i2c: nvidia,tegra20-i2c: Document Tegra264 I2C
      commit: 804ebc2bdcc85f30973708835b47ee023a4be003

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
