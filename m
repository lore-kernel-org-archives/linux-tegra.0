Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243D142049
	for <linux-tegra@vger.kernel.org>; Sun, 18 Jan 2026 08:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768723392; cv=none; b=DVVJcOJslGq3NuPyWVyRfQBmGAoo8AMTWX08b9yoA6/Y7lCW+0zuWGkNBYju9wRWCk9liAOiN/xPhfH9NaH2myZXgk3mqE/ita6KgRI/bHwDaLyzAODTpFNFLpq7BjqUvn6uet2uC6FCcvOI071UNnJSGVp0W4QuDvxCCQ4w4zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768723392; c=relaxed/simple;
	bh=abPb8hIaBHO1pitSFBec5OO0Rd8g4FIfut3VTH1oglY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WqOvHhrnzo4kDWCK7pdqEWi6NKK6bFfEMIgIh7d/3J4c/9pOmKLMrdqtiMH6wlzyi+B/O8z0+BTXfUfl3yrnGzrvJBtJZCkEX2chiDI/gWnNH4lKnbrHscWjQpBWOUB404EuYVDxdQ8WibYwfAbBa2mxQmcIN6iNP7MpxmF6xZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NSNx5R5k; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NSNx5R5k"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2ac3d5ab81bso3600272eec.1
        for <linux-tegra@vger.kernel.org>; Sun, 18 Jan 2026 00:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768723390; x=1769328190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kj8UfNtBvaeaAbcPqe3cu399aKYUpefB3CwEh0ou4Yc=;
        b=NSNx5R5kmkOVHkla7nHvDnx42qctCyXadiwGvsMUxa101CvrVcaqgFMGxRxiejULq6
         QWiMBi7qmbpK+9/jDLkhsTg2BoYSHFYoKMVZEV1Rm4E+gaPjpnUVZzmr2siwAyrnYShO
         BKBylwPAntwMyLtfEt900GrV/iUuH+96PxIEuoI817qpiGCpQl8r/6oUGATWbfMwgSG7
         WD6R2FROCoEdyFK80x+Ny1CiQ3FDloU2SwXYp7gWBrkz0ahaNTobtdrOzsOApL91aW9E
         e5aMwoRwVFq63yvbwn0ZOlLEQMcJhC86HSvLxcGjXzjsEwPCDRX7w58cPj/JJEmudXHz
         aPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768723390; x=1769328190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kj8UfNtBvaeaAbcPqe3cu399aKYUpefB3CwEh0ou4Yc=;
        b=s2d7cELQ8ui6dUqf7fRbTApWymdivzKCdbezGMvBdKoseo4oxfgkBPjZV0AKSdMaHK
         BddJLUC/pakJmzJR1xEaHDC2R0mRvB/DMvO4wLy4dNjuHbcf/9efpMYiRklTA5OE3NEL
         t9I8NdUl/8s4YyAgeWN35SjXxTsVgmywdiYX7Tl4HfKnw4YZfBbTwhbHw39c91ZCBC/n
         Ymmdk+1iNYfSghhT5YH2yfc8ZPHEL+sJLWV0XznCPX2SVhYGBZj83cz2efM6ey+Kswof
         /VUVakdeE1tU+SQXHZnH3J22bY1yHfxjZ7ii0rTj0K0E3+sstyLTCjH/qLwI4dOfrLep
         iGvg==
X-Forwarded-Encrypted: i=1; AJvYcCUy8rFjg3E6ktQby0/Me32s+T21k5U9DZwQ3iL1LT55PGfdCt2Q1By0rZAyJvVa9s0ikFFZ9sJOG2vygg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwPkjxV312uODfqekAw3Iq1BwmieBVyzrah3tqh8rQmSaUxeIDv
	NCzrozl6dFNuZ+kE6zFYUbD0NOgDeRnk/BF4/9Cut4QnKEITnr6YkpGo
X-Gm-Gg: AY/fxX7nKGpR3sg8h1RUAD8egonv72psoD3kW+L1a9XZxw2Af4YVZNSIWZ2PZow0E6C
	XIgjkhyAXg4Cv9dFa8AtCUb9/envnHqCe6SNkrtvOJsukAzE/isg0xfVEZ+14B5zbyYUEmqAsnZ
	tEixHe6B86tlGtC9Tbhfhq2c81gJUdmyCuDeIEZzigIp+f8hXzS2OJj70LyCK4H97hrh0RheaK6
	p7vsPVuZFep08Pn5KVXjsgu4dq1s2cCpnOfg5UpEQHXk6RI5m17nKiCgj0PhsLrIUw9XNPymNhF
	IIATFCbtr/GA1h2gYGDNlXNMEFqlfWIx2Zt6Wy6QQSyn9q3tkKot4KhHdpme4c/QQ97ldZe1O8R
	g96bxsBSTsEOUDeCG5Lz2IFH4qI3rArFGZsR0GniPFDJ8fqAJoL/ZAw/z3OWDHI59/B1h+PlxXh
	97aIlvJyrHs9xJqR7K5jIVib8q6QzS+bYYss6deNwuWmNdYz27GrpgZsry7hOOvpa6IYNMbpw7s
	T6LY8E=
X-Received: by 2002:a05:7301:1687:b0:2a7:83e:7b17 with SMTP id 5a478bee46e88-2b6b46e6ddfmr6064907eec.12.1768723390082;
        Sun, 18 Jan 2026 00:03:10 -0800 (PST)
Received: from localhost (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b365516asm8498854eec.26.2026.01.18.00.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 00:03:09 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/4] soc/tegra: Changes for v6.20-rc1
Date: Sun, 18 Jan 2026 09:03:01 +0100
Message-ID: <20260118080304.2646387-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260118080304.2646387-1-thierry.reding@gmail.com>
References: <20260118080304.2646387-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.20-soc

for you to fetch changes up to 70f752ebb08c85a5ea19471a5aaf26263e53dcb0:

  soc/tegra: pmc: Add PMC contextual functions (2026-01-18 08:48:30 +0100)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v6.20-rc1

This series primarily refactors the Tegra PMC driver to eliminate
reliance on a global variable, transitioning to passing the tegra_pmc
context explicitly across clocks, powergates, sysfs/debugfs interfaces,
and power management callbacks. Additionally, it resolves a warning
during system resume by deferring an unsafe generic_handle_irq() call to
a hard IRQ context using irq_work.

----------------------------------------------------------------
Prathamesh Shete (1):
      soc/tegra: pmc: Fix unsafe generic_handle_irq() call

Thierry Reding (10):
      soc/tegra: pmc: Use contextual data instead of global variable
      soc/tegra: pmc: Pass struct tegra_pmc to tegra_powergate_state()
      soc/tegra: pmc: Store PMC context in clocks
      soc/tegra: pmc: Embed reboot notifier in PMC context
      soc/tegra: pmc: Pass PMC context via sys-off callback data
      soc/tegra: pmc: Pass PMC context as debugfs data
      soc/tegra: pmc: Use PMC context embedded in powergates
      soc/tegra: pmc: Use driver-private data
      soc/tegra: pmc: Do not rely on global variable
      soc/tegra: pmc: Add PMC contextual functions

 drivers/soc/tegra/pmc.c | 425 ++++++++++++++++++++++++++++++++++++------------
 include/soc/tegra/pmc.h |  60 ++++++-
 2 files changed, 384 insertions(+), 101 deletions(-)
