Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057A012DD85
	for <linux-tegra@vger.kernel.org>; Fri, 23 Feb 2024 17:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708710535; cv=none; b=b4ZKx9+3UAuQqZd+uD8XOlgh8dWUA2Hv7Nb+UH52iNHqF6FrX6r6owhI+lIbi5SdNPUecFvGCIbl5AncoeKcybBDUvOK/qGaI0IAg85/LtkRwTvHbQlEyXJPcqE4R2EFeJBBFMitc7TZQlCGt80kOWgkTnb3Q99w8KqWyfZ2HkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708710535; c=relaxed/simple;
	bh=lk7TvxdhGkhRDDp0cWK7GS4VvM4s4eCWbCwuRpZg0tU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=axDEa3BG/xm++NC5lCHFBu751uc4tCxJ5pBvpJrrRK835foy4oMzBrT5kw+Wt83x0/jO1CuvXaixjD0zNSuH7brtel6V63kpNpjkqStxtRN1/GfRj7O14r+QmeEY4Twet7GzG9dBD/ojaVvNiMbsKNeEle9dxi8pay9CoqPgNBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hwgBij8y; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hwgBij8y"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a2a17f3217aso82969166b.2
        for <linux-tegra@vger.kernel.org>; Fri, 23 Feb 2024 09:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708710532; x=1709315332; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+RrYVnNaRmD/8rrhice/zUEoVqJn7gxBFdzuygNeRdc=;
        b=hwgBij8yZdSDsRSxRgWqlQeA09SSVA9mLVZBdGmcUCpSmYthpJ65jPVaAa8m+2t+TA
         i9iYobnbExn0e6AMBhcakki2B8mBoY9Zscd8VolM1hmqyPACcUM99ETrxfsUZhH9Crbn
         0yg0B/8ZfTnT0zc/pYtQ1YgRsrtW5IvivGesPgDJLi/eVy+hMZKCo6KcTvEaNADphA0t
         WowR9oiEGTDBHeGNGWnGuf1rbxvzFi5QPDqRaMLLhPtFBde2md4OpgWOOMXUeoZb+TmB
         QLWF5kPROSPm54PZqx9xAur2JpewqwVX0wuJh0hY7oUfUNF1gfohBSAjBufHi+JByK5U
         ljpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708710532; x=1709315332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+RrYVnNaRmD/8rrhice/zUEoVqJn7gxBFdzuygNeRdc=;
        b=dnvUj77rWH/uhWjTrjR4Nl85ooyy90vVuJ4GsnVCg8vnDJfc8o0ebFnGeAg3y5uC4W
         1Tq6J4/Mb6nTrX06ChdMvqB3XAGUbLiv3f9lbIaWnVg+qzdkxus6+V/X6RJgVK1B5Nfa
         O2RPl1pvjxqxutUYZYPi4e7aIzRPD3efbZUn9plNCehiHhkgF2Y+5/sD8Dp0aL3df886
         EA504DMlFExwbTlHtm3vSBmxXA+6flICYK7L+j9HBWyHnnus/zPDee2bJiZR7DOour4E
         fXL+zCt62vwrzpSlTKNcQlD7TOTP6Jl1pt9+uaOdZ8nNXw3yki2hUV2AeBPC7BdZeBt/
         rPnw==
X-Forwarded-Encrypted: i=1; AJvYcCVNzAiYbNkmevOnnBCGoBH/Nq7o9XKkkTroACwkzZB6XuXy++dqg2wZMv1FnTqZReCBq9nhxV0Nu9P8odMFR7AsYjulZUQWi1ndkx0=
X-Gm-Message-State: AOJu0YwOVIcNgMBfHvY38n9CJ2KNAVYTNAFNHxDixtUe6SfVMhy908UB
	RpPDai8AhQWoUXd39WHqla5kN1n0eqkhkmnNbZ7vDgcZRQ0ApdS3
X-Google-Smtp-Source: AGHT+IF57rhhVdRqu6RONusoD/RkywTGvxiNFKHjj3MCHgDdawt6/78fxqbN2NNErg1F6RYnU3+Zfg==
X-Received: by 2002:a17:906:8d6:b0:a3e:91fd:c0f0 with SMTP id o22-20020a17090608d600b00a3e91fdc0f0mr252167eje.49.1708710532209;
        Fri, 23 Feb 2024 09:48:52 -0800 (PST)
Received: from localhost (p200300e41f2d4600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f2d:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id zh11-20020a170906880b00b00a3ec216ec6csm4607097ejb.45.2024.02.23.09.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 09:48:50 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/5] firmware: tegra: Changes for v6.9-rc1
Date: Fri, 23 Feb 2024 18:48:45 +0100
Message-ID: <20240223174849.1509465-2-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.9-firmware

for you to fetch changes up to 1315848f1f8a0100cb6f8a7187bc320c5d98947f:

  firmware: tegra: bpmp: Return directly after a failed kzalloc() in get_filename() (2024-02-21 17:10:32 +0100)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Changes for v6.9-rc1

Contains a fix that makes sure we don't unnecessarily call kfree().

----------------------------------------------------------------
Markus Elfring (1):
      firmware: tegra: bpmp: Return directly after a failed kzalloc() in get_filename()

 drivers/firmware/tegra/bpmp-debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
