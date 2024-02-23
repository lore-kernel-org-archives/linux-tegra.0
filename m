Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97C8142653
	for <linux-tegra@vger.kernel.org>; Fri, 23 Feb 2024 17:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708710536; cv=none; b=CUE0bxRzAjQ3nxwjdYSV0OkgJ+bqO7X+qJgbmVjm4oBZhhbooiaMT3CBsp26LUU5xf4Wmxow889RRN6Cqdz4q3whvjObUdKyelC+1XgVJ6tsLhHL9CW4XyM06JblwJdSHtfsdoDsEnTujLLlww6911vJRqr5jDsxUtqNGZJbpFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708710536; c=relaxed/simple;
	bh=sJg9qb0Nffl7ErEc4JNpTNlVr0OIPk4z9L7pmaf/xhk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gOGwcWd/hZylxGjItHU0mfp+wwnEbGJb0be2iH9tgQsFQGR5Oe8Ys/nEDz2iDVh9E5plxNaOr/YYP/DiS/jgzif4SaUhZv94vuII16QiBqQUASZGlf+OeGD6ohtBcITgwrE1wnPh3aCOfc51ZGc6c+fXixBEbGSHMYhiHDqv0O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SUcAupb4; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SUcAupb4"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a3f5808b0dfso153129966b.1
        for <linux-tegra@vger.kernel.org>; Fri, 23 Feb 2024 09:48:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708710533; x=1709315333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lCIQ4/ulGlcNxPa3K1zhN2WVh/iOiWmpWx/RUanbjVE=;
        b=SUcAupb4HKvWqUWAbaMg6JXmajhB5bYWK4Q7rKJGorGQQHvca5itOH4kMMlG3cv8UF
         HRSf5b3i8los4pDN2NzV5umJmy/iHz46Au5bVc8b40F511mxa2FM6vMVEbmTmhwsKQHg
         JwgYdAwgHvbG9D6yEk+6N1nkxUgRzu9L73feoN3U/X1M7R9OWN80j292Bob7zxbgEqD6
         mkJ9fqJdFuuwqs2fDLatnrpar9j0ngekZtkensuSe3R7oLCid+JNylItPNLvjSB9ALvV
         3pEJD+nneQg+FD38YnI8EFHokds0MZNlkwh8iuK8z3WXc4fXwi6NklE3riMhAXc0S4t0
         0aLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708710533; x=1709315333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lCIQ4/ulGlcNxPa3K1zhN2WVh/iOiWmpWx/RUanbjVE=;
        b=T28v0fko3Yh0BodyAfiiJwQ9DOEzAAmabREe268ghS5xu419Xz1KeY4TIZwmb253VQ
         w9Y+nurrGbsw2wRTrN4JSTrDPHsCLwg/7hO8PjbD6sMSenxgZ2IK2ELAnvginYRaiBfr
         4BrBYMGEGmMm2Cdb86UIVowbLgCunTbSpNHkDIx2QNXU0kfkVL5lOQpnDcZJDxlrr5PJ
         rRysPmNJqGGbYhUDvg6ot1nFre8x0qz8SM7fGOb5ugngRDfOyJeQgC6gGgpOCzM1ELGS
         2cJale+oAI9X/NHnx2WzniQohiwqzWWe9Ai5UYn+LqsEKvxArpl+OpcJ4lvc6d0mqeIX
         Vz1g==
X-Forwarded-Encrypted: i=1; AJvYcCUgJCwaNOA/u+FbLYOJFEN368KMUVQRZElbZSG4t4agXw392MT0IXS/fl+7q2RlNnUy0T2Jdnb7f2sYgTBsxJPPq/1nBUJwjaHxcDM=
X-Gm-Message-State: AOJu0Yw0ymnJDnUupR9JVwR8+C3x34waSWUi541KuPln+3TqqSzk/alB
	3T8alIOG3VKy6ZimxhZ5uTd6JZ6hK0HXwOat/F3Q4eFkgKHNAKzByxDOtvvI
X-Google-Smtp-Source: AGHT+IFCdHlfDvpD/xE/JE4qwczLKirwa+8R4nIjK4wIyZVrgNq1q90NwdbzTuXQ/mRTEFScPS2jDg==
X-Received: by 2002:a17:906:4813:b0:a3f:52fb:f93b with SMTP id w19-20020a170906481300b00a3f52fbf93bmr344273ejq.12.1708710533072;
        Fri, 23 Feb 2024 09:48:53 -0800 (PST)
Received: from localhost (p200300e41f2d4600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f2d:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id s11-20020a1709062ecb00b00a3ce60b003asm7163067eji.176.2024.02.23.09.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 09:48:52 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/5] dt-bindings: Changes for v6.9-rc1
Date: Fri, 23 Feb 2024 18:48:46 +0100
Message-ID: <20240223174849.1509465-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240223174849.1509465-1-thierry.reding@gmail.com>
References: <20240223174849.1509465-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.9-dt-bindings

for you to fetch changes up to a82242d802c7cea66aa6630707c60a456657d1c2:

  dt-bindings: arm: tegra: Add LG Optimus Vu P895 and Optimus 4X P880 (2024-02-22 18:14:58 +0100)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v6.9-rc1

This contains device tree bindings additions for LG Optimus devices as
well as cleanups for the PMC hardware block.

----------------------------------------------------------------
Maxim Schwalm (1):
      dt-bindings: arm: tegra: Add LG Optimus Vu P895 and Optimus 4X P880

Petlozu Pravareshwar (1):
      dt-bindings: tegra: pmc: Update scratch as an optional aperture

 Documentation/devicetree/bindings/arm/tegra.yaml   |  8 +++
 .../bindings/arm/tegra/nvidia,tegra186-pmc.yaml    | 58 ++++++++++++++--------
 2 files changed, 46 insertions(+), 20 deletions(-)
