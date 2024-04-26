Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8437716C84C
	for <linux-tegra@vger.kernel.org>; Fri, 26 Apr 2024 18:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714154732; cv=none; b=IAtJsUUGncOyi/pA4Hg6tMBgeO7VZsFUZjBZpw1D2mNVkP0dhHkC017m1TuJ/Enb5zM2pg2BN/alOQnqqd+HOjX4FaTaMOVOUy2xhdmSLPDsxzBOL+tJZ899XUOu03YQiZMXFbiQlpC8vuW+mjduVcheNfsv0xAuAaJwpcvIPg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714154732; c=relaxed/simple;
	bh=T6KrFxVXm2aj4f6k2U2yY8qoXm0O232h2Ue3QmgnFuA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OrRMGMfGENn19ElNomBxx2y6qywYVVfm3bnhEFOGEKgoUT+EiXQYWNgVcDpN3IO9AZ2GeoeuiCq/upuYetaSlQ074mw8Z6481+wDX0Hs/k7yK2QDno0fBi0bGSM+L2HS20HfOoHJaZDYzjCRDzwqrcP3gkyfc8nQkbyKei9TUi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XsrYxMpE; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XsrYxMpE"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-41b2119da94so19934025e9.0
        for <linux-tegra@vger.kernel.org>; Fri, 26 Apr 2024 11:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714154730; x=1714759530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9fizBVqhC4Ce5f9/iqh/ic074DoEbG4uaUF9d5i7O8Q=;
        b=XsrYxMpEUJ3uehB6zwXmDB4T12QeGDr8ysknFSvcgfWtqLgwJDnlJ+0W0I7NkUTBxp
         4hczT9tLhHKfrBfhRktVuSPcrBzEE46IFV9tyRr/7IL+tNsGKUDsExYJy8BlPvgGT3Ip
         cudDOyMTHcUxHeK+nNrIzWbJzInw76w2kDzM9UQGwXkshEd9Ahbr1oUyscOR2zJxY1yv
         dpycxehhOCEk4SK2JmBK8RTdYf2Bxba28WfnqMvMoM4/3G1MrclXaV1EGYza+P9AVm3y
         T9X7Be+68ok+dMEp81nvmBTD7E3BlcnZ0djhCEGhnu2s1SE16enydXgdLse9IdnCYkwz
         XjQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714154730; x=1714759530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9fizBVqhC4Ce5f9/iqh/ic074DoEbG4uaUF9d5i7O8Q=;
        b=t8x1H7X9cPv52I+x77y8RbC3YgaZ5uNIuDRf6N4KkZiHoojKO4ad4hVokiON2ceC3Q
         wpRryRS4cTwntseSFTG6Vkb7OLp6H/FCoCrYDtV3l+vYV/npbWrjp/FMBR5oqMaJYIRQ
         2suGXZZD5NJXIjE6efIFRJe5a8fe+WBc4XqMZVEDa4kNnfsHz0ZDzdgtvb2QIxM1+Z9r
         RhyV+eGuv+n1lkZ4KIbmej/5zgzFE7mLrwHDEnjlnZIJvWIWfp5Sw31l1BJQTv/hmSKz
         +x+bas8yQhRp7cZTXdBxC9Gv8N4wx+YoXgI36Pdbaqa3ZP5HsBPWYxBwZ/bmxgmNQNnv
         sWww==
X-Forwarded-Encrypted: i=1; AJvYcCX+TBYIKZXPTFb12mVkTHlaz2ALDWxn98rRe+1zqgilIxi73PxXCU28ozWm9rE5Yfme3wEuME9SkMdbr2xpeVD3CJ4sX4F+Z5mFWL0=
X-Gm-Message-State: AOJu0YzofTF5jAS8F4Q6yszXkJ77RhiJZrSHP7oc/Ug5hN9ONWvx+579
	IJAWE+cj7KH52CaYZ1HMZ1Q/9bH0fB0HMMRx2lQxd85/hU51lbpg
X-Google-Smtp-Source: AGHT+IHumkVmwQ7zaIGDxs0JxQDFvR35S22xPS02xIpIwayE1JWqdPVB8NTTCdsIT+99zZdMNxXS1A==
X-Received: by 2002:a05:600c:a01:b0:419:d5cd:5ba with SMTP id z1-20020a05600c0a0100b00419d5cd05bamr2622446wmp.7.1714154729942;
        Fri, 26 Apr 2024 11:05:29 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id r7-20020a05600c35c700b0041638a085d3sm35248233wmq.15.2024.04.26.11.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 11:05:28 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/5] arm64: tegra: Default configuration updates for v6.10-rc1
Date: Fri, 26 Apr 2024 20:05:18 +0200
Message-ID: <20240426180519.3972626-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240426180519.3972626-1-thierry.reding@gmail.com>
References: <20240426180519.3972626-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.10-arm64-defconfig

for you to fetch changes up to 4d4d3fe6b3cc2a0b2a334a08bb9c64ba1dcbbea4:

  arm64: defconfig: Enable Tegra Security Engine (2024-04-26 17:31:44 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Default configuration updates for v6.10-rc1

Enables the Security Engine driver for the corresponding devices found
on Tegra234.

----------------------------------------------------------------
Akhil R (1):
      arm64: defconfig: Enable Tegra Security Engine

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)
