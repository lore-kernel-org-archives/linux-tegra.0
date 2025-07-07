Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BB4262FF5;
	Mon,  7 Jul 2025 10:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751883617; cv=none; b=SItKWRN15mu2/MoWmGO2MzJ2MrJjfe8etFGF4/bsWV3tAWqrrdFga0K1tuW8rBVZM8kRo+V4li1aIOmjQNzNR4+BeieaVx9tQCOod/9sRu5MwpV4nRPSLpyvSGcW1OyyFXDwNln4XtN1BPDibNwEm+Hl8IWkGIesDayyrILI57s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751883617; c=relaxed/simple;
	bh=gtjPYpCezkEDWByB7tIgWXzptFOInyrMouY/RPBzoHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uH+7Oj8ti3gQ0vDNm56/kMNDXnM6FuRM7QA0ICzMN60ayDgyE6H1MGGfvKGFuffBxmqc3ocftuluqtL6riG6DYYCBdMBQ20ZTVP1Bbv0hjmxyO/8wWqUjWeeUDptFX5t3oYlP3hIOL6EI5WU2C879iCJkbx1BTSJFGsVD+V9QeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gAB+mJU5; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gAB+mJU5"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4537fdec39fso7643475e9.0;
        Mon, 07 Jul 2025 03:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751883614; x=1752488414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kHUwvTfnjSEmpcztlWS+Zdhw3cEDVg/IjXMugjFFPWs=;
        b=gAB+mJU5/R+Bt+/9NMBQMgxTblQKxP4VNI6FV1LEzja3HxZhVm1bZNtV/RxeNbBkmu
         2K96xlOIqmuPdefipZvZJkm4n13a7Agp7MY6pNvf1oo3MHED0vTCXDbEJA78OiuxRiSD
         ma7/apUMfdqrSYNu5/7q16XkhI99OHsi0+yREgcXtZ5jP5cM9QRQBqfkRRBPMgcEjoKM
         lzPfDC6pnzRVQeCN/9ZBW5+KIY3RTmCGy76r0PdTisciWaVRDswGtz8fXQzqqJoxwplF
         e96uMYUpUKuhbRJAe9DSNvwuJLwITN9Pz4+/bLf/1xL5F8JDeq0OTk3N+KCYxPdg1uNq
         8uFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751883614; x=1752488414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kHUwvTfnjSEmpcztlWS+Zdhw3cEDVg/IjXMugjFFPWs=;
        b=Hi6xQ0mxvyhnzLxnPgvEMFZf4H/tgT5GEgJPFzRURu/Bn4jzqVUjYNPew/CAUssewV
         rX1h61Mwevd+So9VL0rqBvk2ec4gGhvh+5CukpTUcrP90pwJBC6ML7I7GelhGlOtmIP+
         NZhMRqlGvwzC8/PXt9xmTOl0u9HJejHy4vKbsIRVM7ha+zUkz7g2S+OWM3kRK0129X6Z
         xr3DCth7w8YoJ+dskO5dQo2AL5GUhp1ohVIj5Orch76STL0CeEaPu2JvfI/We5OUKDp9
         FQqCjzh+mpo3kJHP+xKWPu+LDRKmj2bw12JaqMXgT04vI4kdzT5gDSiFSkvUQ+lYqazs
         7gEA==
X-Forwarded-Encrypted: i=1; AJvYcCVK2IGo6+rn+GXd4SvcnCuDuz3joeUTVcU7YEaKJhOi/SUZg4muewvL8Uy9EVfFFEfU1fPTlyuzXMUT@vger.kernel.org, AJvYcCVWkUbPGH/W6eInzgjulYq7jeZRMKlFRhZmtjgL4HYaQZZH0zu/4S6/g6hVJ8Av7aDjNrKd/ZZfNvGXvRs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2kFTymG4tfGw3B1TEpBskKjuJPhyAS4NI30RgwCiiwvKGMiph
	01gS0JY+XKCHV4D2OjEPCucy4VBPzJo3jxQpr9te+HfwAHUXNqTKZEQp
X-Gm-Gg: ASbGncsCTAmMF6NgiYdmxps10KM8wM+QQnXPiAr1mUHImEX32nz6rLqEDIjHjYrnADq
	UVbPGr/MnaBltHdGy+Y8FTRU46xGtCdmJxGRLu9jPTJnj0wpvckDD8tvZs25KBtZaObjCgONhbe
	pLo51Ctzpapw/WddcqLtwokeylkO6cmM3K4qykuAdrhMv7R6sSpa4Gbf8NX9k94TB8X+O30BEdp
	pNVPYWJFkLRJ8YX9qtD3iYnN0V/osYL5jI4aiV3Y72zrnJqwacNOOsNlT5+mP+k4ZiEiev6xtO+
	Bd+70YDU4HxZ+4yss5zOWfpwHvdElYlF129H2MEWsm7qZSVRnanZSAeJncw7jZK8mC5gDm3NUA3
	CnzewU1nQ/rZYyRAGmMQPdQBKDmRQGjkNa19KC+BlsiAcGpQ9toywZQ==
X-Google-Smtp-Source: AGHT+IEBzgDT7wIm3e1zpg37ZK8wP8jTto3HqLMBUK5O7zlQTGqg1rZHhi5m/jFgqFJzbmmfcIWWAA==
X-Received: by 2002:a05:600c:8b72:b0:453:a95:f086 with SMTP id 5b1f17b1804b1-454b311637amr99037235e9.12.1751883614008;
        Mon, 07 Jul 2025 03:20:14 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b47030c2e8sm9583420f8f.3.2025.07.07.03.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 03:20:12 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 01/11] dt-bindings: tegra: pmc: Add Tegra264 compatible
Date: Mon,  7 Jul 2025 12:20:04 +0200
Message-ID: <175188357609.1321171.837662238630621185.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250506133118.1011777-2-thierry.reding@gmail.com>
References: <20250506133118.1011777-1-thierry.reding@gmail.com> <20250506133118.1011777-2-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Tue, 06 May 2025 15:31:08 +0200, Thierry Reding wrote:
> The PMC found on Tegra264 is similar to the version in earlier chips but
> some of the register offsets and bitfields differ, so add a specific
> compatible string for this new generation.
> 
> 

Applied, thanks!

[01/11] dt-bindings: tegra: pmc: Add Tegra264 compatible
        commit: 5b820eb176846dad95b0a45dcfe788931f5e7527

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
