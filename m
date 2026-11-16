Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841381;
	b=yXwvaY9+XPaa85DeinpchmicAmkPF0wX4o3SIuh0kqSazEFCGClKyFrmE2lcT5ho8z0O
	 TtZ1F6wlYiULQJ+VyoIeKrTtstfQzjTYM63sSmbPhPm7KvtFf2ePHoQAI3n1hcVz4W0ym
	 rGC8UFipSjeskPQIBXfHMEkWdzj/rVB4wuR3oezlgV3DVqmMg3jXkL7ydm5l11hLrfk0K
	 WJhNAuXuYLGV5D8Rkr1xNLEl/Cj7QtNztEqW0Rkd9tMMFxDVXdD/fJXdYOPrIwjgHIgwt
	 0UkcB8N9O3DPm5J1FMvICrK4kIxPxJmNNEPy7zOlgAxWpn6curKVmFnTQboMguSOW+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YEZ2DXJU65RbYZ4eO+cfDGZnZORS4zZkSLBULNwsguw=;
	b=fx53MB/5Yp0k1sBuzsjuwoKGULfWUyaEgirkFZr3ZgRM6qhr4e2iN2q/n4JXOQ/u4YKJ
	 P6ZxQqd2XrcBFW1ltcNcw5SaLeIskraiXx2Nmzef4v7Z3X4vi9H8+mTUyf5QqRAD2kt/A
	 O2Lho7WrF5bcMTIOgcDJQ4bNgKK2s5odztQAfkeEsDq29XHGT20fnDDt5Wym7Gjpnoivv
	 kpw2y1Jbaj8aZsJP3OSVR+1AzKNSskSmuBGE2sGWQAxQ/60LGp0J8jOdvqeTQltoF8rHT
	 OC9OTUoGO06aPA7gtRc7r6JbUDxSf68N/IJKKJb4DmgycBYjV+g6LCMOAB0fFX7hH/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=drB0Ljxt;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BE2606A32F
	for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2026 15:03:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1BE2606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=drB0Ljxt
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c4697404c2bso479514866b.2
        for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2026 07:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794841379; x=1795446179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YEZ2DXJU65RbYZ4eO+cfDGZnZORS4zZkSLBULNwsguw=;
        b=drB0Ljxt7dHrG40ww1KORhWiVcEzVArQ56NMtqkUI7231QZ7f6L/AN55e1stCFjlqL
         fA7HwhA2wMsSJzPWtahQGy5Giesqt+1W3MFERRW1XpPQ1l1m4cpx5+T0OpsvtioucCl9
         16UjIvxuSj04KjPAEcWHe0ViZMCBUMoR6BEvy8+HmAl9K9Pl91itnxo3chV1Nmbzqqng
         mFFh+OmgaBqQboe50IfEx7UqDpVaTmTnpxKX9c6gRotqe93K84SNfrHxkoxy8jqpG3LM
         JiI87T0Jzbo1dwh8Gy/IsUe9iMZuef0yWRc3Lcsi9LbI9P6TrPn8w6YaaMTx1TBKR5nV
         fjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841379; x=1795446179;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YEZ2DXJU65RbYZ4eO+cfDGZnZORS4zZkSLBULNwsguw=;
        b=pyqImXYH9IFxXACSc2dw+Ml9tF7012H3/C7hkNz99qQn6CAZuP2+5fRPhG5Xy6qyH/
         VLZJbP96caKZl4iUUnIHAcOHjEd5/9yAImr3LSjwJqVwXGXVez9xk2HVL3Kza6tPZc33
         TAiRRBQuwzU8gq+exlQ0IXHhF6IWf6TfrTED6dmLyGAYmLE7ZbwstMnQdApQvpTjhHlh
         q0z0UnxouGAaGR7bfZLeunQuV26CBhi/jQlXft4xUgsReZGmKcxZPAxYi4f0DBTx1a59
         NrI3jEBAL9QnjlGftCZ4g4lSYLuykU97di82lbv0wS6uyfjVl77+wgFOBunvupyJssMf
         IF1w==
X-Forwarded-Encrypted: i=1; AL+hErEYggEiGfqOtTjVAxOdzcVkDWzVhCJRw2dBWojiAmEBo5Brivo5E/9PCZomXeka9o6ijRbrHE5j64EzWg==@vger.kernel.org
X-Gm-Message-State: APuU4Z97sFtoUAkO4hLYaGx+u/I8JtxnqwnSxr3VNJOy2RNS/URDcVjD
	zlqGm5aPe9vh7pUbQUXF9ZLGuhtkIixpDK/O71wvab/G+H+iB1XZiFJaNUvklw==
X-Gm-Gg: AYBFou3+K9Vg6yVcZKtUKwW0bf/ueN7zVeqbfm8Zh70s53XcsJI17qB8AiVsWjmA8ec
	o6vWB9lt5eVI+tyvjP8tlhyPx2z+ngNaMs8OP9V72qTV9QaY/IyWJKV19PBzqy3nYStnjYq782K
	3gdLAsdvDjqSrINJmnk+K2wo59agR2jNT5dE6ovdYHX5qxea09kPcNNfvR/bFXpcCfRN/9Vt8aF
	kQwKmp2bOQAdL7Bnm1NtzWte/ZxACLHi+B+rWedLY4qcEoMji+xK48C/6eT9KwDunuZHISik/gn
	rC9T0sdWXCacIWfFgmGxEJOL0vVyaE8vHje+wyyV5jXUF17CXW35uT0HsM/YNaQwaJIFJ+DwCWb
	g7wp0XDcEgV0jOYKJqo689eUrqn0SNaAZ/WFcr0sR7To2LhcRWxU22Nem2AqFU8TTZJUogjDNaS
	ZxmnWWc6JqoDDpSCFvJeN1obEQ/Dt/ejLiOfr+dns5eMRvKgrKk9R2V+lu88K1ZQ8JwoJeYlr9P
	eOUlKMPk/76wU4orXlJxfKk3flUZ4EhgQLIxD8Ls7gi0hqSVxhkviwCXzePze60Rl0COA+ahazg
	0q8659hODWBbnpa70pVmS8W18GlIYL1Up8sAfO1LOl/vNrHyBYozx4b4/JeRFKgZ5wlnVvqgUtB
	pSq+iC+gkxXgvlehdA7zqySPrCU3OOZA=
X-Received: by 2002:a17:907:3e12:b0:c4d:4ce5:7733 with SMTP id a640c23a62f3a-c509642fb9emr826689366b.30.1794841379065;
        Mon, 16 Nov 2026 07:02:59 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b7eb14sm439306966b.75.2026.11.16.07.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:02:58 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 0/3] clk: tegra114: Add CSI pad clock gates
Date: Mon, 16 Nov 2026 17:02:36 +0200
Message-ID: <20261116150239.264139-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Tegra114 has CSI pad bits in both PLLD and PLLD2 clocks that are required
for the correct work of the CSI block. Add CSI pad A and pad B clock gates
with PLLD/PLLD2 parents, respectively.

This change is similar to Tegra30 pad clocks and is required for CSI block.

---
Changes in v2:

- dropped CLK_SET_RATE_PARENT form tegra114 pad clocks
- added commit to drop CLK_SET_RATE_PARENT from tegra30 pad clocks
---

Svyatoslav Ryhel (3):
  dt-bindings: clock: tegra114: Add IDs for CSI pad clocks
  clk: tegra114: Add CSI pad clock gates
  clk: tegra30: Remove CLK_SET_RATE_PARENT from CSI pad clock gates

 drivers/clk/tegra/clk-tegra114.c         | 11 +++++++++++
 drivers/clk/tegra/clk-tegra30.c          |  4 ++--
 include/dt-bindings/clock/tegra114-car.h |  3 ++-
 3 files changed, 15 insertions(+), 3 deletions(-)

-- 
2.53.0

