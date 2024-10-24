Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59CC1F76BF;
	Thu, 24 Oct 2024 17:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729790671; cv=none; b=NMtU1aSgzTOY2ZcEkitH3gZyurz3zUgcU7Ofjfhea/c/1o70jZIOvPYPuVK+XENJzUO+f5drsqw0COmKtoN4KulYN86uPnKWmPgwZ3dvKe4iB+R1+kXRTg6qmrrz8ErJe3k8169zHQOIMNWO/uTEebpabTZlE2pOUOvCkjRqslM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729790671; c=relaxed/simple;
	bh=dEJuKtDgLrZKGnOu7p+sQEMzDRm0HmrS4w7BZ0eERdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AUC4VdBdP5c2NL0Sc+wr2LFmUJzJvSg+56OcFwJOrxmMcoG/M2EkA8yjY9JwbmoqgevYFg57//ZUJcDx9S2577BHYlxIy4yNsLPISEdrS9nSOVAE9S4x4MTtGHJNfbNOuC1lWcY0iW7qbvZV11SaWYudMbwwzkTRhzpix7Q+6aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ngUkUrTJ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ngUkUrTJ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4315e9e9642so11380445e9.0;
        Thu, 24 Oct 2024 10:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729790668; x=1730395468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xu7sebsROVup0TRKJm2VXXgM9dVMUDOYoyKG4aG3nDc=;
        b=ngUkUrTJEBCBaNq9Z4aoFToOyC+Aquh3JjZP7UNP8gtiDT0dhGGXw6Dg8RTWB6jsgN
         m9cIqd1XBtgc/MUa1vxdd6Gi/3pz/5qi4bGv5GlWa7YEikRQ7ro+A3zhVlAmRLsyF6ii
         NrmQlyOz5Db4EeepP3UQN7RGxsCheozDJbFJ7setnT0eKzA0qeEseqS4qraRNZzPGQwm
         ZmVr6KOMJvohOqnPakpxMjxQRmNEeVKfE8roSYfePZlB1hBTkKM0y8MmoxR4NFzIzpX6
         YZTzOLJQEpHUMFQRKJLVoAOes+MMU/dMl0gV8/XCPGD0N9ghmggE0cnSSJw0WtCLb/yL
         WwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729790668; x=1730395468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xu7sebsROVup0TRKJm2VXXgM9dVMUDOYoyKG4aG3nDc=;
        b=ZPJehXpj/bl94uwxpYkxeAmrIEto8gWA5EaEz8xOjSdYo+V2QeZVl7aew588vosj2t
         dJFDcfXFEpC4HcmZJVHFMxiSSjhVteqLN2nkV8uniDQ+QjlQPSYQ559f8EXP65pS6JAq
         m5o3WjsFYe8aRR+JQzkHFRVf/Yax0PxKSRvdLaXtNDdhIgwMGomeDdNWp7ffIfOcefgN
         I8rLIDsdRgZzJ1I6UkN2Bt6AM9cbEOv7CGE+vjFiTAAyKebTBiANZnxNWbt5ERweSVey
         SAc+gggyP+ddLPwMXVllp5rxqtbqJ9nZqaLELl62LqRZpmLMd7Yvw6L4thhh0QP7ZKXc
         ViqA==
X-Forwarded-Encrypted: i=1; AJvYcCU/6vjh7jTg5MK82NcT6xCmSWnyvpun3xTlfffKe4sU3yYJ2Psrzk2xJtSHJ0VGkUIzXJ35WACgPP8NthM=@vger.kernel.org, AJvYcCWYNEwJZLsMf2bvbBzswRQXaKkf8A6utl9PNvz7rPZHgguxWiYUAUYdT5BUrzHsHjEtEdGctzxqcra0FIg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYHpfqkNALXsUlOIxrILzrqLs8UcSc4FSyvrRbQV98GaeDzfs6
	Jrsrj8vZHXMqevsJcGs+OuvKozkUkFNt6Kc3V5i+L5kUfA2w03dr
X-Google-Smtp-Source: AGHT+IEYGWS7Oi+15sqnj0WAp2ZqaTN1sw/aFMWHdzRLOlvCWbQabJsRr1Lvks2WdDUtG0gbXC7PiA==
X-Received: by 2002:a05:600c:3b16:b0:431:5194:1687 with SMTP id 5b1f17b1804b1-4318415c403mr53753155e9.18.1729790667797;
        Thu, 24 Oct 2024 10:24:27 -0700 (PDT)
Received: from localhost (p200300e41f26ec00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f26:ec00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43186c0e132sm52774745e9.34.2024.10.24.10.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 10:24:27 -0700 (PDT)
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
Subject: Re: [PATCH] arm64: tegra: Add SDMMC sdr104-offsets for Tegra X1
Date: Thu, 24 Oct 2024 19:24:22 +0200
Message-ID: <172979060256.717947.9252972783310396692.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20240923-sdr104-v1-1-ec7b3394f880@tecnico.ulisboa.pt>
References: <20240923-sdr104-v1-1-ec7b3394f880@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Mon, 23 Sep 2024 19:24:51 +0100, Diogo Ivo wrote:
> Define the sdr104-specific offsets, preventing the driver from
> defaulting to the 1.8V offsets, which cause the system to hang during
> the SDR104 mode calibration.
> 
> The zeroing of these values was chosen since it restores functionality
> and no better suggestions are provided by the Tegra X1 TRM.
> 
> [...]

Applied, thanks!

[1/1] arm64: tegra: Add SDMMC sdr104-offsets for Tegra X1
      commit: 87b90082179daf87969ad9ff44032acc59d9086a

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
