Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B881A0732;
	Thu, 29 Aug 2024 15:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724945490; cv=none; b=ewDtO0oBS8ScDfS1uKNBQCrNRKmk2moglRhcAZCGG3IwAA2MSn88Er76DXxHb5PvLLSPrnDSSJMAxuf1QZMs6lQN/n/qQ9CA2Ojmff+UYa4yYEVKIYcDGKxx352wmJbJbHVAbKYtA9iYYmJEVsdlGrOaD52Eu3EYeWxbgSGlpIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724945490; c=relaxed/simple;
	bh=7hGXNZWgx//c4c3r9ZLTcXRU4T/PDM96+23D1Ad4A1Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f/pv7LNrwLp4Q+xGV9sQKfWRpYU04Fq+8MDPasu4IELcDYIWFwvXY9yfWAX6qBJbpUCG/yO34cDQAYIFUbUieT44TPHO0jfrzbG7k1KNDXK6fzRgq9OvcplN2WJMiZdfrH9H8dHZASU/5X2O03XH5GlI8R1Xzo/QFt9t8Mw5Jm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IAw+5xmz; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IAw+5xmz"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-428101fa30aso7503525e9.3;
        Thu, 29 Aug 2024 08:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724945487; x=1725550287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1VX275HeOjFKVc6+k2cCnpqbGUp8cwQRAZ5P/IfojC0=;
        b=IAw+5xmzfM3Wqwjo0Bp/mqogeM7YI9WeUb0hOday0iLYwPc47mEGZVRpJYqEm7XDln
         kFXD9j4akS2Vxtx1FPjlrI3ciZrVlTrvAm3hbwxKmpui9FYg3rfgkQIPYoeEi5Xqp28Z
         v0XPrP/rQfHnx/EcFcPnTfBBtAw+jUBGaw58g2UR4nWWCCTC9FQzTXHZx75zbQ4PoUDF
         1UdE9YXxATXWuIqOu/f2FSXnG9P3hRHCPXeLbrC9OsSCya7DnCufhEvoIgsHP9/HjDjp
         r0kYD3gRthUykYRiHo7HvpMsa1i8izhKMUXLmRigEtpXWyoq6G7dDq1GCTjID0u35ZQP
         nI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724945487; x=1725550287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1VX275HeOjFKVc6+k2cCnpqbGUp8cwQRAZ5P/IfojC0=;
        b=heRyyJE7DCyHbf/LAJYCLBmtI3JvVgTaN89IjOxV2iuoc22LNQONzkWxT3anqb7woN
         jREINAiqRe/pb1GNiXMANN4Xm6iNFRYFjI6lPWW3WwoH+fZuAtXqAI86NSBrWoDzEF+q
         ZNg+gmrm6+eF1zep2ojMaM75lndcGfYdjdt/NyskiqRk96wodltGRvwxdEw9Oc1XT0gB
         P0OytQuDa5f7ldaD4H8k7O+8etOnasn9Kslf+PXUaINypMAVhw2k7GNqs/dgsY/51CGM
         jnorj7btw0oZfIdY5NGwvp9u7LeEc5Wz/Zqxvnl0lWQDGgNejPRSxhcCGcWHV/9k7bUH
         jYaw==
X-Forwarded-Encrypted: i=1; AJvYcCV30HVK86KV/PL3R9Cfp5SzrbjZTlfa6XzWp0Fz31PqLmwgLHgTZBGyq6Ad4BIPBL9FuKEtGXBKTKff6QI=@vger.kernel.org, AJvYcCW07jK1fvfxRGnwqc5NHPxrTQbaSnvlaQ52D1nG3eGtCcAsjwkn9XLVZO32hbC5xWCce05ULo7WbQMGVi8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWc/nMGxVXaQX9eWMDxFGx5Ynd49afNajouvPLeVR1U34wD/sr
	h2Kixhec7vF4nYnbQ0WwDfRwQLv/MIbSbEscy73iQcY0uKyge2zO
X-Google-Smtp-Source: AGHT+IE0z2Lk5+eKz7UAcfVxpx7lU8HWLO3PlHhGWPjs8//GN0A70wdsCXF+MNu0zbxcK4Yjk4mlvA==
X-Received: by 2002:a05:600c:1382:b0:426:6eac:8314 with SMTP id 5b1f17b1804b1-42bb02c1647mr28131805e9.1.1724945486229;
        Thu, 29 Aug 2024 08:31:26 -0700 (PDT)
Received: from localhost (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6e27c70sm20447765e9.35.2024.08.29.08.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 08:31:25 -0700 (PDT)
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
Subject: Re: [PATCH 0/2] arm64: tegra: add wp-gpio to P2957 board
Date: Thu, 29 Aug 2024 17:31:23 +0200
Message-ID: <172494536049.1302383.5328678787632525054.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240815-tx1_sdmmc-v1-0-7856ac25a204@tecnico.ulisboa.pt>
References: <20240815-tx1_sdmmc-v1-0-7856ac25a204@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Thu, 15 Aug 2024 16:50:38 +0100, Diogo Ivo wrote:
> Define the wp-gpio for the P2597 board.
> 
> For this, patch 1 fixes the assignment of the vmmc supply's gpio that
> was incorrectly assigned to the wp-gpio of the external slot.
> 
> Patch 2 adds the definition of the wp-gpio.
> 
> [...]

Applied, thanks!

[1/2] arm64: tegra: Fix gpio for P2597 vmmc regulator
      commit: 46a26db82748a9434fae662738ff80e350b179ee
[2/2] arm64: tegra: Add wp-gpio for P2597's external card slot
      commit: ebe899563a83c9bb578248eb4a4d56414275d9fa

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
