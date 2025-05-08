Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB6A21CC5F;
	Thu,  8 May 2025 20:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746738000; cv=none; b=QQztv+kcB5q2Mqw96G/rCe80q3Rw75L4OzDAMD/OJGJ08oCt+ToWgjFuPvp941z0bJpD/pza8yCAGP9k1wqwHuNyU3Z9vLAgZd18eRPA73cXiZCpImgdkexZz3X6XLmi4bYUGSsqVtDKO3kJfnbzdaDNl+wlcmD/+cJcgfXaGf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746738000; c=relaxed/simple;
	bh=1f6uRG/atN2IxIF7hix3SM9mpHcBWaLU6Jdup6jEUPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tQLCWhSOsOqUVNWBDWIbfcxcS3Ij1xHfD2Xr44jqztH6c2qMlnkdYTiOrx70syRB7ygT1uSotlsJVxpgKLlxQPXsJvY9Et4ebN8P9u8+bt233caOlU5qTqmaoH6jH14RjCRBvCvzLZKRXs6HsPYU0QuILViOu/QGGjj/k7zQGn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a+mN0zsy; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a+mN0zsy"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a0b9303998so677599f8f.0;
        Thu, 08 May 2025 13:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746737997; x=1747342797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P+oK33lhh3xzOMvbgHcoxo693v7D69BZv+tpKv1bhyE=;
        b=a+mN0zsy1LIPLSiGsNRjowr3Z4pCzTQAKsEVuvvSx5YcppAEtr0O5njuutiTCz0PhU
         xorxc1HuDe7YJWDcfxnfHzuDboJpH33S2gESSI40T75Qa+aGDmn2Flqvmq9qtxZr/s/H
         3BLYJvhgVaYl9PvoX0kuCIv1fEKRqaJ98aGuQCBOfoSMNh8OE39j12A1pUJWVYEqyy1A
         oxHqMWN0ccc+82I9eGWGkYHlk8ekb5/W49kgIQ6DQstbgu8tzSI4MAYoHVL32NjG91Qr
         U1XWp2SaoKXefHvdJfVQTjm0e7ms4s7D/2XDWDfU1IRqk7hrIuM90Cm8nC4fTK+GX+ig
         wWtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746737997; x=1747342797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P+oK33lhh3xzOMvbgHcoxo693v7D69BZv+tpKv1bhyE=;
        b=TxQwXjgy2bvKBw5jJUyex3F8oN6TLZdO0lthoIvBh0FwzfqKCLv1S6FSZix8+jQBYX
         kLrMCiuk6A1yQbHayGbOR/G643clPFxr+JqGWvmaa8GCner6D/dPDih5AVZaaMNXqbUx
         /g9RYlq822crytLiviCA+a2J/6WIBWHsUI25eBZMzqWP0/aB0GY0Oddn7NBRMUevRRBf
         bzCRWBY3/H52edKtbv+mud2FsGDYqJ1Aa1mLa4ok9o1hh8/Ap3uDdCgYQ/oocf9tRU0l
         jbrMod7gsz3zYpstbiYcJ0sSfpIbgVd9yXWcQ0LeQ0gWk681mV1KG5TgqYMNy9/LZ6UV
         pM7g==
X-Forwarded-Encrypted: i=1; AJvYcCWNoMwS5fWnhcBEJD0FvqW+7eb2xrKeKYP+yuQSzLqmsA99vz30iD1CI51zxmP1SvhVMTsO6SQutNOMmXw=@vger.kernel.org, AJvYcCXdGF94Njs2QJ4gQA4xurFtL9PA50fD2Xgssd2VbtNeFT5Idmnkmcte/Pt/On8lTQqSQei9QAilz0ttjEk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/+Lrmk6S2IGNQO2aRxLE1jPNPK3KJSwKf3Ed38eTdH7SDpiHg
	s40cC3GPASevRbXckBRrwE6eULunwW4RZrfNZMPWLRDx1KMh5Laa
X-Gm-Gg: ASbGncuUIIIQNmTdp9tEuAFFn6qqxj0GxQ5wWdNpIfKp7tO54hYO4sFP2bGZ6liw5QM
	U+F8iKS+RlRMSh7itz9VfMArn41dLWuW7Qyk8gBoWnQI7YU9XSTyzJ0VeM/zpg+KAUCwpKzsJBz
	39kOb2h7f6N4/wMirpIlqOKbbN8eREUnH0/EtDVBa29Ao3WnFgZI836/vEUIMRFZ56floWflb1W
	A9JyOzDovMizMMS3gnfBypuhSLkcwltO2JZQwslCwn1geVnYpXXSSNFzd0c2zEOhlcQahM2EXG+
	DuBvg3GXzklB64mpkqZF1X+9XUZQ2duFwX1qnVxlm6m1i/2PEuY6ysOWExO1J0++shut8PoOahz
	M0yn0TVUX+1jXrKAReKhPKRIsgnjBnl8Q
X-Google-Smtp-Source: AGHT+IHb/rSxQqKlFYxVU3GOqpC1q71xzUwAlXdVcNRtIJjhgRowK9nGso1SFstRXuRYcI6piccFdA==
X-Received: by 2002:a05:6000:2dc4:b0:3a0:b1f7:c1e9 with SMTP id ffacd0b85a97d-3a0b98fcd85mr4686360f8f.1.1746737997075;
        Thu, 08 May 2025 13:59:57 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-442d687ac8csm6476275e9.33.2025.05.08.13.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 13:59:55 -0700 (PDT)
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
Subject: Re: [PATCH v2] arm64: tegra: Enable PWM fan on the Jetson TX1 Devkit
Date: Thu,  8 May 2025 22:59:40 +0200
Message-ID: <174673796548.1567582.9511557114395024866.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250501-tx1-therm-v2-1-abdb1922c001@gmail.com>
References: <20250501-tx1-therm-v2-1-abdb1922c001@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Thu, 01 May 2025 17:32:23 -0500, Aaron Kling wrote:
> This is based on 6f78a94, which enabled added the fan and thermal zones
> for the Jetson Nano Devkit. The fan and thermal characteristics of the
> two devkits are similar, so using the same configuration.
> 
> 

Applied, thanks!

[1/1] arm64: tegra: Enable PWM fan on the Jetson TX1 Devkit
      commit: 01f11ffdfd909e870c3863af60875e8de328790a

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
