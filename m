Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1739A246BCD
	for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 21:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769461527; cv=none; b=gk/O9QM/5mUp/NoLAKGHJ8xLyg3XYGW7mgU7HsvRkMIzQXipGlPHb9ac9WbIqKZjHhZ5kxi5CwM59u4D7WCy+Wmqy7lAMy3rC+xSd8dx6Mu6nbu4YxHygfKu1On+nj2I53dfJjRBE+C1CNFN0Jjb/CysllT9l5zbTxizacyYI+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769461527; c=relaxed/simple;
	bh=QKeswrrz5eZQ5I0QaIfk5yZwP7AV+WqHF6DnCMGjhQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GDdVqA7OGzXrpKMxZpH9605/ey567QADsq3ZMgDnc05WiFFYR5wDehK7nl40BEO4FQWY+I1rkZEeaaVX5Byid6OVCQi4fBcbd61TUjOz1/9ylL8/4dSMjNHJRG71tqk9MybrKXvMaU0GH3XoWA0k76tMxnWwtBB++GO7/aQrLLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HXcJQxZI; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HXcJQxZI"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b8710c9cddbso608058166b.2
        for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 13:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769461524; x=1770066324; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6mugBn1QJfq1isXlMeyfqJ3cIMJHVuDW1YklSUQl2JA=;
        b=HXcJQxZIfvzcBMDApQCsCSIq2aqastew42yRsl4LDNZ0IxpgdaM37qz/Akj0PPUWNi
         fCd3pRgMSVvANSVCAykFaEzvRPQCfE4EIqMuC8qMKdf5+DfOOu9lAuO8Jf43qA2meEhz
         IE7El7RyVokviO51vrp1E2mJA77ybeCyXItI6O4KUwZNvYb4lKvsuaeekIjBRetOUCit
         O72+lwFyHgp7eDGG+3Egzk9exigJraaD9wKrcV76gOeJ4Edc+zFX9aVD/8yXqhNdazIN
         BzeoUgAVOlra6k0pkI0mtJk43h3+ss/sMMfOn47vF5pw8FsA+CTwXr/Ez0QR3a7d303e
         tVBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769461524; x=1770066324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6mugBn1QJfq1isXlMeyfqJ3cIMJHVuDW1YklSUQl2JA=;
        b=JrkN9BibLGE0rgSvj/jCeHdZzj9tr+auV//h3WXSfJ5IfE8s4rBDvmoaamb6OwuUVj
         55CUPgv/y8A3NQrvkFkHpeTqdLiQFiM4dd95Vjl9yNHnISxFOv2E1wPJ3IH2q6Pirn9e
         +zq6ndH6ErTFdAWXlL5K/ZcbtVUFpNxwhbMa1NjXU0uZTxNw8dY3HobPdh7hTcyEhlZH
         qi95AKNDmfhsKwl38sh2Ovgq4hNPLsovp5ZaGSLchD3/C+0k4q2tlTvXSkU6mxnm0Zea
         0lQt3WOYPENg/UZm7SvRkNhm0RHy4kxFdlhaEMIb24ZlkYS2III1Q4zkxBtlc3ZwtfHn
         sBrw==
X-Gm-Message-State: AOJu0YzCv1ADjkWAg1w+TakbxkZqOoi86np8vdvqvCeDiDoecx8mu22x
	cX4JUif7xOKoWmC3NSioj109KZ441gWlI5JBI50uPZkLMfPrtB+oXyJl
X-Gm-Gg: AZuq6aInPuwqZNji2CSdhGanbJqqRb9BmE6vYnCJdHLfuKVqX98H3Tbp8RdBQma5PDw
	DOjGlJxZlEQFt4Jf1DiTat9hiNPrntwX5G/YcqToAbtZnzWzIA9G8WUDBUbZZ/AEYaHnQa5t+l9
	MvmtowhLnVuCO9sY2/clC+PrR/FrZL1BdsQuhKNv+OwNf9D2a+yeKwF7d9gu0IS6NORmRFqa847
	MOwnM4Z7pHtEoZzp15RgrhuKhMX6tJoGHo88bBiTNL4OfGuj3KbYlf24+RzUKhX28c7MGfGYWg2
	W0ZS1m6M/yhJI9gXK3pkQlr+X9XTvpOstqTC0yFLUITHdST9U/GwUeYJ9b1XLvjDLnYdtmJBcfS
	vZl96fNrPb7tRE96EkEVkV7Q/FN4aPM5CH8snj1PWl/85bl43BGMOLhI5O8bBoRSAPDUm2j1dMi
	ps
X-Received: by 2002:a05:600c:46c3:b0:45d:5c71:769a with SMTP id 5b1f17b1804b1-4805d0646e9mr84695075e9.26.1769454136222;
        Mon, 26 Jan 2026 11:02:16 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c034dfsm7264525e9.10.2026.01.26.11.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 11:02:15 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Dmitry Osipenko <digetx@gmail.com>
Cc: linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1] soc: tegra: common: add Tegra114 support to devm_tegra_core_dev_init_opp_table
Date: Mon, 26 Jan 2026 21:02:05 +0200
Message-ID: <20260126190206.78270-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Determine the Tegra114 hardware version using the SoC Speedo ID bit macro,
mirroring the approach already used for Tegra30 and Tegra124.

Part of previous patchset: https://lore.kernel.org/lkml/20251125120559.158860-1-clamor95@gmail.com/

Svyatoslav Ryhel (1):
  soc: tegra: common: add Tegra114 support to
    devm_tegra_core_dev_init_opp_table

 drivers/soc/tegra/common.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

-- 
2.51.0

