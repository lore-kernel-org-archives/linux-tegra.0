Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B48C1C4EC2;
	Tue, 27 Aug 2024 14:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724768908; cv=none; b=eY4oLwpCkdzEhTLa5gsyP+AC4fziPcCuw7uENR1Qn42Ng5K0qe20DVy7ho7AN8TuwDblmQvhRb4tYuOxqVReYVqWm8WzfcShhX9GzO3NzCItEoxlswlcKyfkx8pphTpL+Ors5e55UfKCEzn7ooo8Gsd6yQKvjDKzA4E/4rhVgPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724768908; c=relaxed/simple;
	bh=wOSHC1AaLiwnZmgfU4tuY4oW05oLjIY6HoZvRVcQ47E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C6eJ38KKibe61kUNgQmkYXv22FR4y1LAJU370zRTUlOnswcEvaVY0APMNYE8NDDPLujz+39wN4XSoJnDiNjlt2+BAgErcEG1U45LinmEdYRSY7+WsGUN7aO18px4sy+7ip3Xnmu4GTzrZGy7dXKeTUeg2y0vdhfxexwtJ5ZrriM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ui7famTZ; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ui7famTZ"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5334adf7249so6603261e87.3;
        Tue, 27 Aug 2024 07:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724768905; x=1725373705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u5hVhjg6+Zza2L1PPYTuIh08JFmF2WuV7gi2prf9qok=;
        b=Ui7famTZzLRJjqoc0mH4kbArYUcAw6ggpHUr8jDTEMpRdlhrr9lrMKA+jHOQ9uVOgo
         0NIZbEgg+ipea97f7rBsn6DLfrS9RnuSrbYQPLBtYbFXDcNI0RJurUtrg7QqZq+d5Sx2
         hi5qvorrN9mfO1NjsUHW/oKLVJgJzt0Z78YSSQGLWlCnAu6R6dKjH/6ygT90ncs9IwXt
         JGCnxiqk5c1or2XLGa2WMhQKbBmhCfI+kahHRZgl+eyubRfwWvRlv9LpT76U7a1J3ZIs
         xCE21yY84pVx1EZ9Hmu3vC4vyW+yg3sBt/xaTPCl8/m6V71RxnJ/rLd/7yEbVNr/hceL
         gbUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724768905; x=1725373705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u5hVhjg6+Zza2L1PPYTuIh08JFmF2WuV7gi2prf9qok=;
        b=a7bu6R4F9zLQLf2uusmdPS44hzAQ9nMvlRSFKI4GBE3XrWVglLEGLtTq1HFerJYFgt
         TAHI6ziX5YHlcRQXHy+hvAiTJ45TklKREdpTc0ENwPtAiiyXmeJe4B2Ycq8QotUfNzJI
         Xt90p0EXDUIV3qSGw9nwqbxcROsz04TDejvCb1mX8LQ2Gr6xXcvNg0fevizrh4VKPMsu
         tE7MXrdndgCgfhbNBU2fNqAIVjxwIDRsq27dyyBKP8ny1KDP4d08sNyZxdPjWyNqsq5E
         CgeDGY2qcg7s0U/3k7cuNiMW9Ob4hk4HuCHT/z9S0fCkdxoJFyBEZ0RhDq2iammiIEDs
         msdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWD+WdszYUE1yL9yV1Aab6oLPMu0DPjaTFeoP1iSXFTJjdcYX2H1VbmTniAZ44CMV83aRtjvbTtNp/M@vger.kernel.org, AJvYcCWRSRP362VDyRpxGei5ZLOC8hpn1eRdeyuprLmLI/gWo2j/rXS66t3Xk2ctuZ0PnLK17PqpYIb48Va/X8U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZiD5BNeWuMuCLKd+awJHrIuPqD9JPoxKca9X7itTBolRWWeri
	vVDTtoGO/McSJ69kxbOjqMW3KO446cOg9WjYgeycLP4Z5MFouF2r
X-Google-Smtp-Source: AGHT+IEW+wQG5AdWKyx5Mz/Fy7eu5agBg0J16WHoVirz5FPxtCFrXBenhqTWcehJ9BrkMA4tOYw42w==
X-Received: by 2002:a05:6512:3a88:b0:52f:d69e:bb38 with SMTP id 2adb3069b0e04-5344e3ba416mr2241366e87.2.1724768904448;
        Tue, 27 Aug 2024 07:28:24 -0700 (PDT)
Received: from localhost (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e588b39asm116407266b.159.2024.08.27.07.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 07:28:23 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>
Cc: Vedant Deshpande <vedantd@nvidia.com>,
	Brad Griffis <bgriffis@nvidia.com>,
	yiweiw@nvidia.com,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH V2] arm64: tegra: Correct location of power-sensors for IGX Orin
Date: Tue, 27 Aug 2024 16:28:18 +0200
Message-ID: <172476889120.1250850.8381667576197596346.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240712132020.235414-1-jonathanh@nvidia.com>
References: <20240712124809.222395-1-jonathanh@nvidia.com> <20240712132020.235414-1-jonathanh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Fri, 12 Jul 2024 14:20:20 +0100, Jon Hunter wrote:
> The power-sensors are located on the carrier board and not the
> module board and so update the IGX Orin device-tree files to fix this.
> 
> 

Applied, thanks!

[1/1] arm64: tegra: Correct location of power-sensors for IGX Orin
      commit: b93679b8f165467e1584f9b23055db83f45c32ce

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
