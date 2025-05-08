Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA192040A8;
	Thu,  8 May 2025 20:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746737993; cv=none; b=F0BEHr1s11u6cEbdOm40hpApalD8C7Qt49ofSKceEJb5/yQs4qsE60EM+BVyeCSl2yuqBwu9KYjroEoQ04HuWoOFfcSkxQ0lP8A/uJuGhYzEchSE+QJLtwYg++Hxl68T0V4ZZpp10P6xdzzLxFbaSy9n57/9ZCmgB6n4Cj7buyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746737993; c=relaxed/simple;
	bh=zNcPbVT527xBHEHQgHyTSDQrCXXT5HRkwMvyqjt4au0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EO3bDXv4/zFMBXKVIif2ODNF/YYodMT6jZsP+CXglHhiDhfR9FAhze/Y44viuCGCr6fu91ldVpNup1FPbbCzG71VAcZDVgiV9HOjnbwFud5WgV0rZondra0Y/s0bCT3/wS3fP1MStuJvhe0XD3EVYYAGX7rpgl/fSSJMPDfX7cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kS1KpL50; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kS1KpL50"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-440685d6afcso15666825e9.0;
        Thu, 08 May 2025 13:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746737990; x=1747342790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dC40woTvHiyEphb/wzgOxUu2hA7W+qi2Kgh+mypiou0=;
        b=kS1KpL50bogRcxQw1Kv4A2gf+F6B5Hx4gXHZuGL/d1ty/ksO0uxGcMtQd3ucpa8Vyx
         s/Z2mUdjtYT8/4EQiKhgEcPieQdld0RmWJCfWNrKzbsOeO72HJ/f0d5g7+I4kdsF9A3R
         4FEGaPWV7mGlgfe1rvwA7AF8TQ2QPtU+32NbnJQcbJFEoCJTCyAuMGNxufQfNPf2I9kB
         K8xZ3VQBmKYDx1tXat99XWaayUsQ5KYSnYeCKkhCZCEhaXKBwUlufr/eBAy+nCtw8qR3
         G6g2n9bf1aeVyFB2TcTRTVfBbpYZAJsf2Ch9dxLlbmFf1iABO1rFXk3FmCMmosKeQb1J
         sdmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746737990; x=1747342790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dC40woTvHiyEphb/wzgOxUu2hA7W+qi2Kgh+mypiou0=;
        b=P/e75O8azlv9A+TuRJt+4vzVosEuo0C4q9ElyPxOHNxLdJD2MTZxnW1cIKeFoUlVCX
         t0a4aLbp0gsMEIYn6gTIOIDLMTQQCmeuutne07a0M51oH+xzYVdTiFwvjKtPzE4vKaxj
         f4qzIXr2ekMFuklXB0fSkcFOd1T7JaNQAOyyCrpzL9djnN4PuRSgyYKaPj+L2+DjyHfp
         Nb0utaERELshe6SzFGRQf/tAW/GiPFUN2KcJYpDKWDB8V4g0GaTBiW37ih/SrBV5t+5G
         mTclkMC+4Flf/QOvZVDwEXwGIYxp+B4ZCRxIAQD8l8zyY77nN477tMo+1DRYnaOMFtq7
         /e6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVFLSmPyxbPo9AwyUwrtVnCw6xti6tywyMcsb6GkTbwdHUP/0WGIWuJoWMB4UJbZZ4gBzrDw+xX2BVhc4c=@vger.kernel.org, AJvYcCWmwA+rblYbp5b4vrGokHzUFWoeyC4aFKuB21o6E0v5IFeI+D6wjNHBd92WMe5HhPoO7yMLIG6xLEz9VTfp@vger.kernel.org, AJvYcCWw2nZJYE93iL/cm3LM3x9+RaEQQDJYdJhY/We4cWi5G+cVL0saKMJUzLp7vujKgNlH5fFWZ20xoaWA@vger.kernel.org
X-Gm-Message-State: AOJu0YyF5fQre/9fshBxYHI3Rtddhk2ZbwxROlim81HoVlVskUCqK9dv
	vjJi21jWSM4/emqLmRBTtplWviwCON3p4eH9uEb97RmO8TU6z1JU
X-Gm-Gg: ASbGnctPSd9vvXnkgrswAeOVyOqMf7NHZvhxQmXk6WfK9KVBGR1AnIRmrWK7dvATnAT
	oKgqS9PYCCF0/2diuwO/ArzZagzvfS8x3+aNbMctGfrad2FCBX7rvWPYhbuz4WJ5ectizNJGDcJ
	5+yEJtVK03Fyu+9YnOdmJGrKHUX5HxLo3F9ty4QQzRQwy3ouyC1xoGW4jsKV/SQXy5GpUPlviSa
	Ix99n4XOXvxWin/K6IhpQOH2MzI8CepvNxstA3EuD7Z3oXIlBbtJbthxYuMc2P0a3XAQrzCvc4h
	hljdAZ+YKJzH4E7WjPrTDwdULLc5t1n1HTcJjUWxRwbrnR28nrvYARPNrfyQLFpyL174QDH7pva
	wcfkC/i4nm4AgMxVTu7E/61OmQ9aRTnPN
X-Google-Smtp-Source: AGHT+IFpg4wCzDPp44WYpMZHZK5/2ia9mXjaLYMCr0YeD2toTyHx3dBtYo0oCjgjJfpvtUYJ7uxKIA==
X-Received: by 2002:a05:600c:384e:b0:43c:fe9f:ab90 with SMTP id 5b1f17b1804b1-442d6ddf558mr4895445e9.28.1746737989615;
        Thu, 08 May 2025 13:59:49 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442d67df5ecsm6851885e9.9.2025.05.08.13.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 13:59:48 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Aaron Kling <webgeek1234@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: tegra: Clean up serial nodes
Date: Thu,  8 May 2025 22:59:37 +0200
Message-ID: <174673796549.1567582.1367450916774578609.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428-tegra-serial-fixes-v1-0-4f47c5d85bf6@gmail.com>
References: <20250428-tegra-serial-fixes-v1-0-4f47c5d85bf6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Mon, 28 Apr 2025 20:51:46 -0500, Aaron Kling wrote:
> Several Tegra186 and Tegra194 serial nodes still have invalid properties
> and/or are missing dma properties. This series corrects those.
> 
> 

Applied, thanks!

[1/2] arm64: tegra: Drop remaining serial clock-names and reset-names
      commit: 4cd763297c2203c6ba587d7d4a9105f96597b998
[2/2] arm64: tegra: Add DMA properties for Tegra186 and Tegra194 UARTs
      commit: 39e1cbf57e3034bff1272b83b9e606a0bc2c3dc3

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
