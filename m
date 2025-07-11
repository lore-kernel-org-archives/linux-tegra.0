Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363C321B9C1;
	Fri, 11 Jul 2025 12:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752238281; cv=none; b=LpR+DBIcbjwvlWG9DP0zdiG7OC7zEtGNiH7ARgeChLEzwXDg6YnvrslmIlAvz5r1d1mepAv/MX3gPkzTB1BFZIjuRLbVg7kf0qNtwJxRlpHJ6aHwSiryaBXh5NqtOo6n1nKHk6QNNvB6M4OPCx98U1jHV2gE7uCMX52IIXt0DKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752238281; c=relaxed/simple;
	bh=VfyM7iLFEMis1DtUKT2+DGLeCNPteqNHQaFzfra7ouE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jz/jDi/ksPcGCMKIvGt+lKo9j7W8i7XELwSDKWxdLLtlGWpyZaDsmK3ptRQrIXk+GC0O/SNwmnTvxWIxx09M80ZlSaPE/CqWfiapqDQLG+5/M+DDKC3imeRNU6f3fFy6A+XkAfcYoXKa56oC2srGthdK4SjtU5VjQZZYPlfLlTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZLRuJKPz; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZLRuJKPz"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso1257000f8f.2;
        Fri, 11 Jul 2025 05:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752238278; x=1752843078; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dk6zTWd45C25u9HaNPVhxh1YehFcfpLwf2Fe3wJuBxc=;
        b=ZLRuJKPzBpkeSbaNAfyY10549+v4kcHDU6LEOB+QANkrhUB4CW1+Aqx4qnAzn9MSUI
         FmqWULbzgwjz9ViPN8RqECkzHllW+fUpie82ZWCl2wJ7C2GvUUQdEPC6HrlRxtFSNfPE
         EZi2cdvBY0QbVbkorRywIKHAqxrUIK9gONE3Za7FdvoBVAirHOKeQ+xhl/uGuw32MG89
         ieaaxdasqUWpSC+WSHmA6aae4/YOd5VDpcMRX9cU2HHMlKpwT3Bq+qQYA8sGGO30i404
         pw2h183FP5zePFcd3gfFwnFGbbllrSHa+O3WJ9ATVbdHhxOTB8Dl6DqLN3Wt9svchRIJ
         0cqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752238278; x=1752843078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dk6zTWd45C25u9HaNPVhxh1YehFcfpLwf2Fe3wJuBxc=;
        b=DP3Fid6+0UkxGFh0AETFKLCjDlVA5lBPdsWPBb2C2gzRR85n8EcssBiDBtTkhr0m1a
         JaWEN7YoQXmWyPrNOSNA5d/E1LpDwnYt4NS47dxzLhuN/3uuLaTgCrwsYjNTybQ+rqsU
         NvApRGFQ+mf2/AXGghjaHWeB0D69DftXcfKEsJ3hmqxFHsIxC4v0D0TptFaaJe0/EtxA
         GkOry+USu5PzrI/lMH2ORzJcU53GyLW1GiwaBdrnnnURPoUlw7gAeCQoagn/pESWJy3c
         XftQEBt+sXRjBkEBwZS9aoaIIimc6vS3uQVLvrKtuzcYeAgqiQ9Bo6c2TaLTHerAJAMI
         5JeA==
X-Forwarded-Encrypted: i=1; AJvYcCUmeChZbS5+0fwx5ECK1JcV1hoIoNgnyP6VXE6bvrc8AuzNxR7Vrj9aHJlK+fXJsSaPx8K2xyTePFsJxqA=@vger.kernel.org, AJvYcCW1OEnv/LrBNLJxhgBKAHxZcIwOdtixEz9FFsvIkviFYVv3kKrPucms19yGUyBdAVTpefDDSlrZEC3BBEc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsX82yxl/yvHkFWOJ0ynfXfvl/wWHSYFJBRdIE4bbc3VN30aQ2
	jOj3ahAhojlv8JQdNYDuVUntz8BatDidr3sY4fCUYVociwrOKf+R2c0V
X-Gm-Gg: ASbGncu95NPAh0vWFal4+lf/AKvmLGkGeS3/TSWcHYK8KiRJoc1Qb3XGxXpJ3f0a2gO
	8qn0rl25l7Hof/WziUCJS2uGnZyfeyaD8N4R+WD8wpU5ZWbQrqbgwlTe3Ni+uICB12LaVgZwHoB
	88rNFtDfzfQYVYlAeYtKJ9b5r+ruxzDpy/BqqsnsOd5qWxjCatdETHydyxrZ8UXXZvRSMQTc1xB
	gzSqvdtK5DQeBk2Q8CZZqOFCZTx6TN30U1FFSSTpba0ADvDwGl0Fcfhq2L4uNVLfWLrO05KxO/Q
	TmtLHYYh7yOU+/a/uxGWOJGDQ0AHC3QNs67TJ6nF398weuRHaHiovdvr7GwhpfWSv9orgmmBvsl
	OgVzBTdMUMdOqY++Rk2iZhMqYNdws3hoi5LnlAtr2Oyw2b7OVSgd9uRSdyuN9zcVPsLeAWixdZ6
	Yf9D9EeXhzta8ZrQ==
X-Google-Smtp-Source: AGHT+IGFNHZKH6/2cOt4nmSVTfZihS5QXXGQYUEZ5NHbaKMojMw+b9IsjH8Lnni8LzZ8nBaHTeakWw==
X-Received: by 2002:a05:6000:23c7:b0:3a4:e387:c0bb with SMTP id ffacd0b85a97d-3b5f18e27damr2229282f8f.59.1752238278187;
        Fri, 11 Jul 2025 05:51:18 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8e0d76fsm4478061f8f.64.2025.07.11.05.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 05:51:16 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: tegra: bpmp: fix build failure for tegra264-only config
Date: Fri, 11 Jul 2025 14:51:11 +0200
Message-ID: <175223825748.296981.8763315213459609754.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711082409.1398497-1-arnd@kernel.org>
References: <20250711082409.1398497-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Fri, 11 Jul 2025 10:24:03 +0200, Arnd Bergmann wrote:
> The definition of tegra186_bpmp_ops was not updated in sync with the use
> in bpmp.c:
> 
> drivers/firmware/tegra/bpmp.c:856:17: error: 'tegra186_bpmp_ops' undeclared here (not in a function); did you mean 'tegra_bpmp_ops'?
>   856 |         .ops = &tegra186_bpmp_ops,
> aarch64-linux-ld: drivers/firmware/tegra/bpmp.o:(.rodata+0x2f0): undefined reference to `tegra186_bpmp_ops'
> 
> [...]

Applied, thanks!

[1/1] firmware: tegra: bpmp: fix build failure for tegra264-only config
      commit: 83f96a7eaaf0e3ac1b1447f74a8d3b2213187b6e

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
