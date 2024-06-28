Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA21C76C76
	for <linux-tegra@vger.kernel.org>; Fri, 28 Jun 2024 21:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719608908; cv=none; b=T05yYnzQvXM7FL+ohiOmnp+ZijUgHGLw5EyH2b91E5Zdfaj4xyr6S6P1t7xFTma6cphaELKHyxWKFvz1HUwd4b9fTOMy3Os7wVVY+Lfq2x/5vBJxyHddargoGF6yERzIrO8vJ0a+4npEkLJF1TUCTySmp7sgjGXg2Z+d4MZKDRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719608908; c=relaxed/simple;
	bh=E3VbUrocEmAzOM9EVM6oOuY1obnAouKfJxhCNwIx8JU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FQ0lQVyXBv95fvebBSWLmvotnKU/b/TNsOkAfbJP7F5WbMUcwU4MB8ahhCIECEH5noPFeNca3f7/cfrBQ//1tpTaKSk/R7IFKeELD1pOajUN4TYZsgEJRaESUPvPeSIi1YdkOVkIBIQscL6GI/GF5FY5v+DllwK9vvTyoVLNxXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hO4bKcu8; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hO4bKcu8"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42574064b16so4647865e9.2
        for <linux-tegra@vger.kernel.org>; Fri, 28 Jun 2024 14:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719608905; x=1720213705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NYFsmnNucLgksY/hbrNkPuFtGN3fvvq84p3a3PKYmfI=;
        b=hO4bKcu853PiMXANXohrW1ZLq0DkVWDN42y9liSqMCLFuDn1y1gn9aeHXN6REgpj9N
         vbYwj46A0wZp5YoR2FtdaZiYuPduGghsqxCLQjgaRvGKUwoIvyI1qtCX4wC9PDjvdgZU
         4B2OpcY9nuNcylfkMxPNbjL3zbTEcZdpABp3yQ1kg34YNa43YfOYcESaZiAdDvXual7w
         Z1P/o/6NHGdYbLuK29JpAcu8lXgEtqSiBQv+dQdHN2XR6vJwkswzswJMygs2c1PABgf5
         oa29iqcOVZzJm/5AkQ/Ra1mpr9jv9+tXMJ+DZsty64AMA2PKJnAtO5AF2cpP924Us63j
         8hSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719608905; x=1720213705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NYFsmnNucLgksY/hbrNkPuFtGN3fvvq84p3a3PKYmfI=;
        b=tzGr1m296zFIv6DoBKADRCLeMNsud56K4pCvr59jsPrxmOzVykveRH5ALmoBxxYAgG
         uxwMmJdrUj/ZOi/1brUngcE7T0wOz7LxHfOGq1niU8fErnMDO70tpw42dLC8DCqPtNjx
         tPCdbWw9AQnjxjk/tWfZxSeaRX/FR3hBDHOqr0Qsveu6eIOihYgsq/5fIK2+6Zgm5TqV
         h2LFmi1i9Hswh/99rnKf44G9pQ4eBm/vlQdjryYuEgn9dD9VSTifHvW/LwWPFdG8pxvT
         x/2Up8VO9NLBbUlMrwIpJPJN94qMHdkiagGT4Bl/nZOHHgA98WmIa6owPf3D3ANXea63
         S9jw==
X-Forwarded-Encrypted: i=1; AJvYcCX1lcSJqxyD64zoNQVnsfuqfI59cRce9yWEzYw09GfphJKppy55xLc4PF1+PXZyCyk9zwYLZXXANvVfPjggyoLqmHZAypNldOc+leE=
X-Gm-Message-State: AOJu0YypiWv8X7CaUu0/uxZFtNEpBYFQoyccKZ5qXSlSQ23KfgMKBqOR
	gbZYnSf0OnGMejcIJg7R3Vi4XPixUMTyHLwHrti4YpTRS2H89IFL
X-Google-Smtp-Source: AGHT+IHso1pi3hEugrAf4X+jvqXirbmBy8z7JOTxlQbB0GyKAYQDS4Zb2FVI1cR7gEq7dHjByfr+2Q==
X-Received: by 2002:a5d:6b0b:0:b0:367:c4c:1ded with SMTP id ffacd0b85a97d-3670c4c1f8dmr7704028f8f.25.1719608904888;
        Fri, 28 Jun 2024 14:08:24 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af376f5sm51186555e9.6.2024.06.28.14.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 14:08:24 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/4] arm64: tegra: Default configuration changes for v6.11-rc1
Date: Fri, 28 Jun 2024 23:08:17 +0200
Message-ID: <20240628210818.3627404-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240628210818.3627404-1-thierry.reding@gmail.com>
References: <20240628210818.3627404-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

  Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.11-arm64-defconfig

for you to fetch changes up to fa071acfefe84dc0a6a612afd1d8a35b97feb99e:

  arm64: defconfig: Enable NVIDIA CoreSight PMU driver (2024-06-28 16:54:06 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Default configuration changes for v6.11-rc1

A single change to enable the driver for the NVIDIA CoreSight PMU.

----------------------------------------------------------------
Besar Wicaksono (1):
      arm64: defconfig: Enable NVIDIA CoreSight PMU driver

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)
