Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44AC8002B;
	Wed, 21 Feb 2024 16:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708532514; cv=none; b=Nxl0IqU0JniAEBiyYPf7XP+hRIZ3f0/wVl5E1hyELIPKrGRbH2WoLSVE3PGuJIiAM4a4hg8dodQeiWAK7QLQ8V+rQecNyH15zpxr2g1zHbEDCo7uJiKGNfICdnL9ECPhalcAu6BnnfFJNdzB+YEnGzqcfeS18yBEeteh0CLr1zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708532514; c=relaxed/simple;
	bh=c6IAI0d4rf33B/TEyMTET/0mJewT6I/BgtcPF5uREU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uZ8zL3HrSCZlpIBI/3N/Dq3XminvHs/eRSexrhaE0sRIiENb4NDx14M+pOEndRcsJ7iqbacDxyOOqtIEX9CIiTpNlm52epShnbJo3XRTlo+ykJVV9zg7zTe3PvmOFMCuNLmFl2J6vNj/jHXXeBUlhMoCTX//2MYfv5qytqNksrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GVm/x4Ve; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GVm/x4Ve"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a3e4765c86eso529216066b.0;
        Wed, 21 Feb 2024 08:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708532511; x=1709137311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7prFhpjayFvXIvvHtpQ8JCGfeAR1nSUHLtg8UyqzWwQ=;
        b=GVm/x4VeG2+1ZZ1zwBBNcqDmzjKu31dONy8hLXaIOyb6tjUYgPUfozLmbgSVN4krqG
         9Zp1AuJLb/50mQ7w0ce8W8n2DtNRcgMHVjUyR1FB1Pg0H9v8SPp37Xw4ZYHWMv1aSMxD
         a67qBbgyrOCUsMGeNLzjg6UzMw6k9BEX01LHTL305wvnItb2uKSBsPtY3NsqpvmKCAcp
         EVQYeqj1Rn1BQCugCm/KKKhJo1KqaUKwQEgreKnPC7of1FLEllcctdd0O4t2M5Bqwee3
         QLBoy7I+OOfOAiFQts98VbZAxsqjsMTOCkpZRzuwHo4yK3PeDQRUYdNh70mGI6Se4DsQ
         Ciaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708532511; x=1709137311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7prFhpjayFvXIvvHtpQ8JCGfeAR1nSUHLtg8UyqzWwQ=;
        b=o8JQB4u3BWuUCg75+FNrwfD/VP6XcBVti3SE4WJoCnMPiWdKbbGHFioJtkwmyG2CTZ
         2aetP2nMb77/2ZPKOPMMCClvWdelSWaxsXOn5oYk/X1/owDjIs2Kpyjfr0zwev9GgIzE
         q6NFj8hxbfQxgrqBk3+lVxUX4RFo5A1FLTnZuJtpooWzQHNlEpewK9elmu8apPFInjyV
         vCAJJOgpv57y76gQwPBx2tcIt9p4DrQbAeESl1LXShASwWf1QGSmWLvswEpAuWQMYVAB
         zmjOzF0DbfG1Y5IOSSI3aejvOir/7gcIte2LqOWxiOyCU1kOB4m6jb7CL+lfTe6gp81r
         GkOA==
X-Forwarded-Encrypted: i=1; AJvYcCVbx8ec860q53QNHGfUvow31DPlDooI3+6nL5+NxnXuA986cksBcp6mshoLYw9YGyFuNN9IPp3SiT8cYB4wcYORTPPIYx5YSjpPoYY=
X-Gm-Message-State: AOJu0Yweqq6rR3yEZPsy6dti+Do5RcFKW0EIs6PcGO03I0sL/1u18fdM
	BeJXEFH8FQzqZ4j/rg8Jfv8x/wY2xJlXQGklf03heCio3l8ZgElG
X-Google-Smtp-Source: AGHT+IHCECbBMXwb0Not1oP2H9Xc3C2VtC2/3FkrWYsCgUDg1LFIfFCF6FCXKrFrnR9g5XfiTK2cQw==
X-Received: by 2002:a17:906:b0d1:b0:a3d:4ed8:f5bf with SMTP id bk17-20020a170906b0d100b00a3d4ed8f5bfmr14147049ejb.2.1708532511087;
        Wed, 21 Feb 2024 08:21:51 -0800 (PST)
Received: from localhost (p200300e41f2d4600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f2d:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id st12-20020a170907c08c00b00a3e544f5d62sm4016116ejc.201.2024.02.21.08.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 08:21:50 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH V2 0/3] arm64: tegra: Tegra194 device-tree updates
Date: Wed, 21 Feb 2024 17:21:49 +0100
Message-ID: <170853250064.670293.12783848800491071416.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240220121714.16543-1-jonathanh@nvidia.com>
References: <20240220121714.16543-1-jonathanh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Tue, 20 Feb 2024 12:17:11 +0000, Jon Hunter wrote:
> Add the current monitors for Jetson Xavier based devices and enable USB
> device support for Jetson AGX Xavier.
> 
> Changes since V1:
> - Used generic name 'power-sensor' for current monitors
> 
> Jon Hunter (3):
>   arm64: tegra: Add current monitors for Jetson Xavier
>   arm64: tegra: Add USB device support for Jetson AGX Xavier
>   arm64: tegra: Add USB Type-C controller for Jetson AGX Xavier
> 
> [...]

Applied, thanks!

[1/3] arm64: tegra: Add current monitors for Jetson Xavier
      commit: 525684a0b8ae14389ce440f843ade4023cc64834
[2/3] arm64: tegra: Add USB device support for Jetson AGX Xavier
      commit: 4772ac35937a3d91d8695670e11dd5b06692b2f4
[3/3] arm64: tegra: Add USB Type-C controller for Jetson AGX Xavier
      commit: c707794bc3f31d9c56efe9967b1631ce7d44ab26

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
