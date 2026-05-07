Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E533FB7FB
	for <linux-tegra@vger.kernel.org>; Thu,  7 May 2026 13:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778162021; cv=none; b=nUE/Shl4+MzSlNlAMd2S7eNpn7GTSYnnjaulyGyGyUMlKOHaHsn+ud7E2bXUa9ONneArTnbqwJLdPzzoD1Sg1lujr54tkBdlomt8HVPs3ps+o2qA8IUyAkSqn9BPTreaVOlGyNuDk89nf2WxkCpHi2BFjkJQfatcO7TAmz5DRtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778162021; c=relaxed/simple;
	bh=L9AP7K7IS/BQIX048gXZafEbvq5i3LmZ5GjfHPcHmZY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sGAVYIhkYdUI29Seh3gSmJyORWRXRcTztMr2jIK2ls/vkrwUGx3aB5gAV0hVxVDwU6FZFSY3Q776eCP23qjYp0RCxyI+JSZVQzZF4oIahv29iG3b0OyPNgDr6LWqZibV+dABgQCxkAy+Ixl85xQ49LAspSdPdX5LL/AC0Tn+dIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W7z343mY; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W7z343mY"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so6078105e9.1
        for <linux-tegra@vger.kernel.org>; Thu, 07 May 2026 06:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778162018; x=1778766818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YVQeX6F69iLnc7u2WDbtyBci9ESFJbN+KlbTGvK+NNU=;
        b=W7z343mYO7RU2hEA3AmVm+rctv1+bJdUwB9uk7jjHeb8jpnuEp0pgg8dpgrI5pfmSH
         /AxosvDQuWzkbxDHQpMViC2YupJ9X3ZhCEKAqrgWhh5eJNdsQlSbWzYZSWTOSNZ+1Vf6
         oAXGO2xifexFTbTEST5AGJxPMc580CreoWVd9sSKznCrqZpiLSC6ODr9er1rF4zYunXj
         YrthltcUhq5K/lrGDR4iBvJwoav8GIri8nGZQJj6TGlAVrZDgPpBsLovx1FtFBSOwlcR
         o4AQZwZHgVtp8RLuZjF6Ix083e1WQvJwWDSwJrCmRF4L116wEPx3WXeZlm1GSic39Y5/
         Vlkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778162018; x=1778766818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVQeX6F69iLnc7u2WDbtyBci9ESFJbN+KlbTGvK+NNU=;
        b=P7huRnsg85oW6eahFhnMy/03wRloTfGLKCXTEMsYKaJQlMYNbIVATMibijqzD16YQK
         ibQCRRVSXqQNkEagSyrbgfIvSPMhOF8uAI5bkLCj9RKm9V3oeafHAGyufS8UQqRbzDcL
         4RxfDOkj6o6RS3hrwXiXL1giFcjjlgf3UDQgpF9RrPUkHE+iP0E22S9/iiS2XL+5lDZb
         TlIISKBPeWx90P0puCM677Q8dKfjFHhLy3EgDs9qVq08nNCoiueaxIBbzpY4CBRkIjc0
         cNuGOjiZ74F4bOLuMRWTQtn+phVJM71/KGWy+HxS+Hc/YI4HzDFxOm3OnIxsBuXh1TpW
         8CdQ==
X-Forwarded-Encrypted: i=1; AFNElJ/VD4hJf6A/3bRkl5LmDzRoBcHykIzh2V8Zsv7pXtFNaJKyslkLuyEZ5IbRjNn3yz6X76FunzbOaYwVxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzejzNy304YsTfj50lon7deOd59n8xPFgyzjIAyOQvjfw59hBB+
	GpJQNzYOLR94nSmtOr3AdcyvTZgOVjnSI8okDMV9UXfuCTheVc4yWA4p
X-Gm-Gg: AeBDiettrIH2LgRVNNwZqwbzpcIoKiLPUncwUh9UQxie8ZgzkLD059raYB/HTBD0ISh
	aZ5+EfYt472Ivp6+g0F20fVEt8vCwKgB5K9JBUleYH2RItG7Bqf/tqq4HXYehayZQchCnp15oex
	H4c8C52hsjQw0DtS5xQ9CMK7XAddVPBc8Quf0zhmuUEfvtvBGMWmaZ7SI6VfkrkuaulW9sTT4Bf
	AgaTdJ03/GnFIY7HfexMtej6IESsZWewix5QDRuhEUpowTHJGOr9B+ch+1341Qh8TvPZq/AZwBo
	KLQhzTau4jwxI3NbqgfltSFH+37c12aXjPH58Q4D5HF8+Op5mOGr1sCVjlhQ53rEBl+hdzYr4/6
	NuGMQujO+oZsTKl40zCXjQs5qa9lA3nnHvdQg4PYaarjTBKZ5mGPREIOWmCW+JrM1g34yj5kjo3
	CFmdvhGsCl5eXXOr3lRopPMDg=
X-Received: by 2002:a05:600c:8b6e:b0:485:3c2e:60d5 with SMTP id 5b1f17b1804b1-48e5dfcd72emr49319315e9.2.1778162018318;
        Thu, 07 May 2026 06:53:38 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e538fad5fsm137882125e9.10.2026.05.07.06.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:53:36 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1 RESEND] clk: tegra: set up proper EMC clock implementation for Tegra114
Date: Thu,  7 May 2026 16:53:13 +0300
Message-ID: <20260507135314.76817-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove current emc and emc_mux clocks and replace them with the proper EMC
clock implementation for correct EMC driver support.

Part of previous patchset: https://lore.kernel.org/lkml/20251125120559.158860-1-clamor95@gmail.com/

Svyatoslav Ryhel (1):
  clk: tegra: set up proper EMC clock implementation for Tegra114

 drivers/clk/tegra/clk-tegra114.c | 39 ++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 14 deletions(-)

-- 
2.51.0

