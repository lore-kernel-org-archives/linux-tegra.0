Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8972CCC0
	for <linux-tegra@vger.kernel.org>; Sun, 14 Sep 2025 06:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757831976; cv=none; b=e5CaBc3foNa8VCT8mujzJGdXkp5foM3ZSybL2Z1Si5Qm2/9iT6vRdEPGU4W1zwTpUePdcbcnxWTDa6rBW7/3LycIFKSLc3hC2eYK71MAUwjH3/7bTXr31C/wmsNlNccy60TDtzhdlZZ/a1nr0PitDDI400mTqrEUgKeF1/qZ0eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757831976; c=relaxed/simple;
	bh=3yS91SafP5gs+0t5759+8H93GU9bqOUQXbyyno654MM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YuoW0we3nj1yyrYH5U9/iEusxIQ+JbZwWOr7Dnlg4TiH3/UeNXaAxmgMf0EmK9hZriPgBnT9SpdOXgHzl/buDGg6L9e1isnMx1god62yA6xJMGETcm/KO/w40P2l5V0gVKdHfDpxc82I1WAZdln0TbfCztEct4UQ+wanhSunBKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C6kj2swb; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C6kj2swb"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3e9ca387425so167850f8f.0
        for <linux-tegra@vger.kernel.org>; Sat, 13 Sep 2025 23:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757831973; x=1758436773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ldA2Tv//rSpgM2mgoWOf2ki3ZpiTNjsfn7bnpTA+85I=;
        b=C6kj2swbrYMcbbGcwuJqqGkG9U2pH+sMis03ajfxlBLbHqYPQLfPV5rjGKnztInCp0
         SmqyEEvyUtLKQ+Ow8r2sngFP9DShmtqcW0w/HaNYrRKhX8GmbE+xtKpOCEvt/7tF5X3u
         Yf0xDAGH/lx1M+fDFuAL4MvYt1+MTr9sLQVe8i3Y2n2Chv2nwBkI1AOTgsvlRLiFCodU
         kMojIfzyXrdpO0cVRhMZnkTmJgWPhxpHNOI4XehIEo8wklu85lQ3Pruu2tZVvuc+WFKn
         5AOV4cn6sJwvcxRtZpQuUP00Ne8QQLZ/d37nq0qblWGJToJaLA0JdgOUCyRy1G+KBF3b
         aXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757831973; x=1758436773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ldA2Tv//rSpgM2mgoWOf2ki3ZpiTNjsfn7bnpTA+85I=;
        b=f1QYlks05JvbQtNcePxe2ryjKAnNzbGGh4RUPPn+hMipqTXQwd33ptc2vGA0PZ9LVq
         GGKfwz/iWy0EGcZ91ayyWvwtasYzk/A12SDKAjlAByFiSiBMWsJ91ucAW7Cy5g5VlOdS
         hFXGc3ZTdjnzsADfSV1InPQr9uFLKMZemWF3sNEbYjcCi77cshIF3bx6hGUinFAT8dtJ
         pvED1rKNNA5o1oCEx7Cwvrn39aV8dWZC5qGAxE4TR1JF30z0y2AdQNNxI7ZFVKkz0ONy
         UlwcG9+uKZqJeGoj5EAtqy0P2NlrTMgndFTaF6+a67QozoeM01IEBPG1HguEIZDVYv2y
         tEiQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9+FyDN+mKNT4f8vxvYGiBGNVpIX5Gz41HsN9EtCSYNDsYyO2Q1Y2GncSVjfC/ngWDt/2uF653/JhdLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwY4mdf2fp/1YKSkjAE8vb0TMJaxSnh99PgvyHV4TINwiUUM84Z
	H9pJuQtHHDGTbnyJloeKn8rOrfnFbGvw1R5AtC5zLjxb0ZiPVb7bJssF
X-Gm-Gg: ASbGncu3GXiiu6qI73X3TDIA/0UDoFBwOqJLvBi58wko2O3VJxSfMWengS8IARAOfZa
	uOoFjTH5EWBuedaj/17dn7eHVhUXEreD+Guwq19sbWp1TnP07S+7IuM8pNa0ATWX3Ass77qwbTf
	SF2gp/+OpF8fMA+2yu/2SbVDM1eyFixHrOCyi/gcykpFS7D3zUAnDEcHdg5ZMh5M4V0OYEPYJ4J
	WHUrkdLk+4SsTb8MO9CxGbIaJ52Cgs/VVcFCoTyj0sYgL4FkNyREEG/VVuQmvI+sX0a8f/ji1Pw
	SohnClYpP+rA9x1DonDvoQXgjVTLc+IMeSqrHxuCmpZ3q+hVC8S/sS9YDFoggL3T2SBt1RXXD+7
	l7fpFVlH+iZm3OnzQRWv/kiVxMhp+mMnIU9UhPlT2hQDMDUoGxbbdms6dvZ94JMtZ8nEkEZQt2I
	Rwuvh+Fu75jq7nrADPqR8Joy+D
X-Google-Smtp-Source: AGHT+IHqdhP/BEDVPeh1xqm+EIUCLoLGr/3DaGswlta+efo6GD5amfhQUS/xtRQB1Gjk5GwaD5Mz/w==
X-Received: by 2002:a05:6000:2401:b0:3ea:2290:7cc6 with SMTP id ffacd0b85a97d-3ea22908137mr405244f8f.56.1757831973025;
        Sat, 13 Sep 2025 23:39:33 -0700 (PDT)
Received: from localhost (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e9c2954b10sm1561270f8f.50.2025.09.13.23.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 23:39:31 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/4] soc/tegra: Changes for v6.18-rc1
Date: Sun, 14 Sep 2025 08:39:23 +0200
Message-ID: <20250914063927.89981-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250914063927.89981-1-thierry.reding@gmail.com>
References: <20250914063927.89981-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.18-soc

for you to fetch changes up to b9c01adedf38c69abb725a60a05305ef70dbce03:

  soc/tegra: fuse: Add Tegra114 nvmem cells and fuse lookups (2025-09-11 18:19:02 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v6.18-rc1

NVMEM cells are added for Tegra114. These contain calibration data for
sensors and USB.

----------------------------------------------------------------
Svyatoslav Ryhel (1):
      soc/tegra: fuse: Add Tegra114 nvmem cells and fuse lookups

 drivers/soc/tegra/fuse/fuse-tegra30.c | 122 ++++++++++++++++++++++++++++++++++
 1 file changed, 122 insertions(+)
