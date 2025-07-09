Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AF528FAAC;
	Wed,  9 Jul 2025 12:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752063728; cv=none; b=sdxS4kgPYfPab/BBk6eidfWZJ4bYxSR/YYzISQ+MAXGBDgcLThYM0D5R/h9RXz8i3GtLbwyLZgB8Pw2UoOVVAXxwIZqXprpTnBtY4Rhm+m/j0dxOGerk+A7FNls4GcIJoE2kddp5UpxykLSofZcwrVZmRKHF3Sq9/5zL0EtOxds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752063728; c=relaxed/simple;
	bh=m5kEpDlp3vF40VA1rhIyPl+AoQu/8JiBzjUyE5Efm2A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qkgBNDPuslNoB/2YvQRokH++dCJWahCgvgNN9Ao2tRaEUoi0mBCTffLlVFSGNbOMM9NIMGk2E6CMw4FRPdfIlFvOtbnZExqz8EgwzmsLpj+PCYKfYLfZDPU2y/HxYlPhSWxAbLLBydG7wmMthxuqz/vhAsrBxeNh7D+VTi5Ow1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Va+r68/e; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Va+r68/e"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a503d9ef59so4171552f8f.3;
        Wed, 09 Jul 2025 05:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752063725; x=1752668525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2AjhO5fjoOIL8dVF+sjsL9u1AY0VQCppxhDhCfveEvQ=;
        b=Va+r68/eH+IhoX1is7XAsQXjRdik3sGwvG0y0SrApkh/cF3s1nOOkWLxTFaAeS3/TW
         +eSxYjxgPColalyfpwVvWk0aLGRlxOh/Jx9BJhNooawl46YWimNR62LRXW3778jefrbl
         L07VDL+gTSzAT/vWsy75jdFJvNO6Fj5BPEqssIBNEld/GdImQdkmFOPdt5E+JdUMhSQR
         0nnlisj4HTt/1U7QMiICslae5tRbFNL84imDGFNoS0K91yAuf9ZosmRxg4Z93WdhgbD5
         Ku8GIYXkF/CAiOZFiPDAr0wBy168+7Jib8RpVyBRh2i9qw6fM+e9M0W0Lv+rmzMPQ+4e
         Xs8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752063725; x=1752668525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2AjhO5fjoOIL8dVF+sjsL9u1AY0VQCppxhDhCfveEvQ=;
        b=WpBuK6sS1SyUiF1JFCFthRelPT6hEKtQdjdgwIhO4mkzF/FEgqIXRZFjkQgugIFWdi
         7Pob4JZ5sEDVY1HoMJxyN1k9chMklnFr7u3ELQ36ry0KQlnNDWG1u+hodlhx6W8NNO2S
         kvOVVGuT3S760uvVVQWEjAVYygMfZyE2yfxNlMJqZFssHVvcrG1X1tNdzRcwNqS78GaW
         /R/P1hvaCyvVuqJ9uM67QKX18xJGi9Jf1Ir1uAh+gf3elj7juBKy2NHC8FJ0ZHCFgeoH
         O6zc24rmqIo2bbo7a6mL1v6o88F6VZSIUJ0/k+GC2fWv42h8i5oqNrG7dXOZ6Bc0HQEO
         BbfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhMduz3jmaLECSqbF6RTNly85AAE8adjs8KkQ/W1hsPvb9nrWW4isFUM9D7xllVviAyAfMDlsGHaTlweo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr6YdrxfCzfzVq99Prwyz4ZdTyDRH/yVagpGbLM2PUjkxTAiYW
	d0FjHInBWPfrpGykzRbK3tDr5oDt6Zdo+TjEy+6pS34hq+8v3VmZQebN
X-Gm-Gg: ASbGncvcxbTHrKHumq0RvawfjFmtRCnCJyggfOFdO2DF9tcQPuGfwC2NxqhbAdF5R7F
	MPQdFw5mDrSEOijVKJXkrQwpOpJ0YS92DkS+4EQQGqVbfQ+bpii0sDxikERr0oVxqb+ZVzWqZ3S
	nu+09B9dFBXIid3PZid6kzPVHLylB6oHpwaBkwmNAAVyqp0xY9WyKFrnYft3IEkD1a6lN4+/N2C
	Hspk1UsefjSbwgf7Q9okN/nabRznl1wYK1zmjHcA9BEVs7KNX1qsrxq6QcUNc1jpHsigEKfykMg
	tAvl4nGTaeajKqe8Bz27tTMlBcZcN5x77hN6/SovDg00FQEh7UmcTI05Tmoh8HT+MS3HUoOSFCv
	bX0qSNn3COQH35XRF22WbWVWMYB2DcAk2mSE5zVMHpY28gKW4l0g56w==
X-Google-Smtp-Source: AGHT+IEjgKCuEKWXjSpPe3p/Gn5aDMZ1rk3eGja+6fIWwh7wxGWk1PeGLJprfYTyXycma/nWexj/WA==
X-Received: by 2002:a5d:588c:0:b0:3a4:d6ed:8e00 with SMTP id ffacd0b85a97d-3b5e4537e82mr1887735f8f.33.1752063725041;
        Wed, 09 Jul 2025 05:22:05 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b471b9671asm15843835f8f.53.2025.07.09.05.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 05:22:04 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: tegra: bpmp: Use of_reserved_mem_region_to_resource() for "memory-region"
Date: Wed,  9 Jul 2025 14:22:02 +0200
Message-ID: <175206371320.1595609.4620745017655016486.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250703183434.2073375-1-robh@kernel.org>
References: <20250703183434.2073375-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Thu, 03 Jul 2025 13:34:34 -0500, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() function to
> handle "memory-region" properties.
> 
> 

Applied, thanks!

[1/1] firmware: tegra: bpmp: Use of_reserved_mem_region_to_resource() for "memory-region"
      commit: dbe4efea38d0a79ed58069499368e08b815952c6

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
