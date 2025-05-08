Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22CC21D59B;
	Thu,  8 May 2025 20:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746737995; cv=none; b=lgwFktTrxHUvVsHzkGOZJ0da7Wjf7/C9ZcT1tkaWXRHeSjI+8yCHLp3WBVgP4LfFxx++0nqK9tJt5nrBR+uXHTyVfs4clbJL7oDCEMT4699qldmAxcN1uy+m3ul++6LeyVFV/kS2E5Gm0Qt880e1IXP1qGoWjNCstHkeSYGaFG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746737995; c=relaxed/simple;
	bh=GdaEsrnH7Dr6d0TmTLMtJn0d4ArQy+5p2CCU1kBH5i8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=olYe9EPaICk7I3cJfleQhcSyxDjIZI0VHhsvM89jAupcw0dXTX0TjW8W3N3MN0VumJ8afLLkv6JK23yP7zrZJcXNX2V5QRApH2OCBvTNIDt0TP5aYm7zWL+4L1OMST02K/NtdqokjRJ7M51SpUkXkrIhDgvPofbl1aUZrwS4HUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mq7jR+A7; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mq7jR+A7"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a108684f90so638183f8f.1;
        Thu, 08 May 2025 13:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746737992; x=1747342792; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W+c+P6Jj+fuudW1Z95S8YbmE1GlqFzD4Yiyj7CSz/20=;
        b=mq7jR+A7pa6c5KJUm8KEPNJiMq6ayg4GBPf/3X+Hy/FVJvohEmRDeOqrxGvlsY5qjD
         QfXQ3maKR1ErxpT3p01lViAvthecgbZkb1Wve8jGPsdM05YNcBiYVJI9Y4rxvcRyOyiV
         3nhq3tZod4ConBYySzBAmFIWzUTEDd0vaa5+PaUEazqH4EQLtS9JSiXA5HLiiw5pww7m
         qlkXd9vCSv4F6HwpQp+mNFqnULNuhNR9z5kwWE3gOeaZHErlmSFWQC1RqgE7L9da4Ggo
         UENqNq7C+L1NCsuV3p2DP7+Eosmse1lVkBi2FtQ4OnLNO4nS1mwm/8RtMtW/C405HqSd
         /N0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746737992; x=1747342792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W+c+P6Jj+fuudW1Z95S8YbmE1GlqFzD4Yiyj7CSz/20=;
        b=bJ7LNWalq3epCEj7M0YQxGpVTdaFl8aBM3C43RPzcd+118ni+brHljU2nY2Icag0c1
         6ahvjeM71GXSf2zsx3i7/cXQXd+NDE9EFtJlf+WPGfzh8dOtxL73Ai6WK8ZQsmg6cfaB
         t8Lp/esX+L9YZXrBGuHVUURXEA5oDW52YAtFfr7af+rwOWWNMLE603VE3uAPg+Jr93Vo
         1KL6Lo7foOhshUzFPzhBmb8FeSrg6UTmi5WO6J8Kyv131bbTeZjkFESR2iQ6D8CpPYUR
         Jul7XxliNZpZXBcT/ZZOGFai5fnATb2QzGUnu+JdwLZPrddBZJbmDl0E6Xh1OmwRrg++
         Hhbw==
X-Forwarded-Encrypted: i=1; AJvYcCUGsudx1Bd6wQUZHCC1drp0gm1wKT7l1PBBrfU/U2FKmgE80MQ5Mgg7Fg9ueqWQwT0JsGu6x+LqoN9JUO8=@vger.kernel.org, AJvYcCWWiDdy6l5tTzLD8/flt9+TnM4+AcAvsZRc/JxWBX6oXNhzk4xdMPT6eNkUwnUeqblpa6oBwDdlcasY7EI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCtET0eise0qntxcMA7CfnQrZEs1jekSuahZJc9dnS5PTv9IXn
	ILQPvglfkKOkHts4hBtsVWkttAbywnRih00lBR5CIZ38lnIOupS8
X-Gm-Gg: ASbGncu3vnQ0XlZ7G01XnCKYpddrIhwt/q88QFVnDP2EUKSGYnsHCwspW1+tdam2VPB
	dSvbazG+9TtWUHerYwoM3BRgXD8aEaX23bq4vXxokbA+qbfJSaJqUZPFiQmyyhgO3mZcNiLfHNo
	A/+q99iaJSLo3k6IrPLCZD+1B4Fa8uK2h0+icch129dxo/v546Zjj9ZyEq/0glfHPFWn4i+kMPg
	j0mDshxCahcOARJiaj1rocFDhnYU3XX03V34x9Nnvg8kCKBnF8kJVI1cPdObch/g6DPNnZoTT5/
	rMY8h0TE+okD1mO96OapWhcM0o3mI6yDs7+oYPTfuMNc7V85TkI6jkurSgAB+moaJ/3ya5cCeLb
	vcVFDw32HP9DfsR1CYuAm76S1g4pAOtEXPCN1xHoQAxo=
X-Google-Smtp-Source: AGHT+IHUG469K1y6lt/rHPx/Vgi5pdGpJsjO/7hh89qhpxYVwKoKg6fbqSV8YtoxkggGXSFP7IHYIw==
X-Received: by 2002:adf:f209:0:b0:3a1:f702:4589 with SMTP id ffacd0b85a97d-3a1f70245demr334126f8f.35.1746737991828;
        Thu, 08 May 2025 13:59:51 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a1f57dde27sm1063276f8f.17.2025.05.08.13.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 13:59:50 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Aaron Kling <webgeek1234@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: tegra: Enable PWM fan on the Jetson TX2 Devkit
Date: Thu,  8 May 2025 22:59:38 +0200
Message-ID: <174673796549.1567582.87816307027034861.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250427-tx2-therm-v1-1-65ddb4314723@gmail.com>
References: <20250427-tx2-therm-v1-1-65ddb4314723@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Sun, 27 Apr 2025 15:05:32 -0500, Aaron Kling wrote:
> This is based on the existing configuration of the Jetson TX2 NX devkit.
> The fan and thermal characteristics of the two devkits are similar, so
> using the same configuration.
> 
> 

Applied, thanks!

[1/1] arm64: tegra: Enable PWM fan on the Jetson TX2 Devkit
      commit: b84f1c0187653b2a91919624e2da0dab0b036a6f

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
