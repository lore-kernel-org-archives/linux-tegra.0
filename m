Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4537C3B0AF0
	for <linux-tegra@vger.kernel.org>; Fri, 18 Sep 2026 14:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789742044; cv=none; b=NiWGg/4Rbid6Zx7WmZMZpqize0miOpegCk+qnrSOk502GSPcczmdTQboQaopLIMvJ4jDPaoHI+k+cyVu0i6bGcPPs0sVWS2Bd2VSW6X5fJ6BIiGpzO1PRk3ipKpjtxfoHIXjPpEKqbZmelXMlu6Mp/4tYqUXYQa9YFKU5H4RxwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789742044; c=relaxed/simple;
	bh=CRzKAxpUlFq5Wd+7/e0Agj6JML70XnNYB6sRMUphW4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ljNysMO3lZ7j1YNkLHUKNjCgCiZt6m9fZHnTJvAPV8xjrpxPkNOWXBooZACFu5gJF3uzSZGX9aZmImdC1CqVon18FYkukj87DwVJgpzDr7S2NqRCvx8tBsEqOo0N5gCurPDFEjwrQx/KGfKoQXZeZ//nz0lB/kafL9PMNNKfYfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=LKJLMBzT; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="LKJLMBzT"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3920so5871845e9.1
        for <linux-tegra@vger.kernel.org>; Fri, 18 Sep 2026 07:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789742039; x=1790346839; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Iw/Uos+s86X9GmGfeJVE31qnn37ChCYcPePO9lpThQ=;
        b=LKJLMBzTDb4omBz2Zjwwn+WkThB7xYzRS4e0xnFeCygy3E0usN76aLlenaVG37A33D
         HbfRtDLPPqRZzMiLeC2X2qaTCtegMYTb2BmNGRj0yBj1aXX+D30XVuaAhObvs1lUvtTL
         bfNzpNVBw9biYGRveLOXNjD10ocEkIpf7GXvJUniZyl4d8XvJOkZSy6oPwZ7dHlrytas
         np5U8VZ/jPdfAgXXqXSCeNO3ZiZ6LVvpMjZNv5L/l5Eeujehaixm0CNTDhELK/UrwP1b
         k2uVXDvFBAW2E0M+C2/e+9cGi+K9fJljyHVkoOq8zqINsNcJ/preE4Y1rXrivGF8naWl
         IL2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789742039; x=1790346839;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3Iw/Uos+s86X9GmGfeJVE31qnn37ChCYcPePO9lpThQ=;
        b=wiMpfTLvMthNbk7CC2wfCRp6/n6KMpnGaVB6pPbEodyf35kyDCZ8q0hNkt+FuiFmk0
         jDjbm7Pz8tZWrz8Lh2ZFs2Pjr7RbB/vfa8Q2ILnqQRMmA0A02l+qv8k+AbuhGlbto31f
         ch+nGodDfXbCM1euLIa5bhyvHUH3/ni7ArWBgVrkxFdrvUPKyIVBNsvWlrmC4JMLjDye
         uHnaHY4EHwkaC7KCajOAiEFT+94I6VbKAv20jlO2r6EjSD0ODSJv//lw0V3RJegLS75c
         /kgyuvoGEFsgHMJwWLJ7XdflXJendYqqq6ZocPPklA3QjM06PlL+dt6p75BnOvzzNn2T
         /NMQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxt+ga80XK2wobJa8gRfOVN3FdKCwmsofYg8zt8HMj3Y7rErdUD9DvYLYrg6qI6AIpUpOTLiSdn5suhw==@vger.kernel.org
X-Gm-Message-State: AFuF++lo36WW/g0AnHJshcDRqHQ6mf9Qf5ct2mW1KCZ2QI7MSmcf2nqp
	/WlwCL5iU/YVJCUt51fktQChHYData54fd1mHUmZXCuox/FRc3wpSFqHu06x6IU2Zuc=
X-Gm-Gg: AYBFou1027wCbOI7cunDj+lAZ3i+igU0z0Ywux/V0kzTlFFI/diOymYMadjp4WF25uu
	7KbL6LAl1buF2fGpt3mDeFF8mSCTbxzLIz3diewkLzejBdx+SAiPkvVcs+6NoSH+Tt9RrnTNsG2
	vkJUDFp4QJkaw+VbPXEEWIxQADBzXbRT+C7XZcpurlAOEMFV/Ruz5AztSq5ALERXaa/bjRSOCf7
	LomkiRoMiU581PQVM01ZIMNF5EsHwV9UcId+VxODPnuWzswSuuVL4zoL+92ctDYHqUWCxpftygz
	8UDDeZRMb9gVisCrEc72sK67FNHGfDWyHRKWSJ5kYyRq1nmpGX1mdBVo2nIUXyWI/aNlWhztUv3
	ZdVXoNU7CPtJMogX2lyb5vbDOdodDMXUpNUIyN+HAHqcnwlwtFXdAGwPnALY2toVJD+rwFxJB2f
	kMEjsH3FqmY/La2pFJho4PjGCZNQVz2PJUFs/dgYHEccTWFCAQgbzAn+vIF7K3+NYFb0Cx5wYL1
	EYvBqtpfHH82HWnyuaQM/DFucEo8X/ZDIQSvDyJWhGAtdx1UDNE4APaPEbr3w==
X-Received: by 2002:a05:600c:8b6a:b0:49f:bc43:9e8e with SMTP id 5b1f17b1804b1-49fc5741199mr36086125e9.26.1789742038920;
        Fri, 18 Sep 2026 07:33:58 -0700 (PDT)
Received: from localhost (p200300f65f19a90444c8989fe13f5be4.dip0.t-ipconnect.de. [2003:f6:5f19:a904:44c8:989f:e13f:5be4])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49fc55cd8a8sm61606545e9.0.2026.09.18.07.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 07:33:58 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	linux-pwm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] pwm: tegra: Cleanups and .get_state()
Date: Fri, 18 Sep 2026 16:33:44 +0200
Message-ID: <cover.1789741839.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1769; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=CRzKAxpUlFq5Wd+7/e0Agj6JML70XnNYB6sRMUphW4Q=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqrUvJ4l3buWoLNn8yyHMgb4/NF2D3cdFjhzkst zrYNKYzgPeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaq1LyQAKCRCPgPtYfRL+ TlMbB/416PVhikXSeG+rl2Vn98ol8X4mjw+EfXcbGpU1LegxL2aAY8imKvrby22p5yJGNtkjbtb 0UEqZQ1jOjHciD+sfbFvEuJgjUvsteRW4Vy9KNMoW6P2jodsbta2e5nvVTM8PZySfg20Ftd9yUK 40N15CPLU2+hcT+ySHoisqocz69Swtv+Jt5xH0+e3iu8NCGdh3/BFbpvq/O9HzPPn2Z/c/rpix6 KWKyJTYHbyctTUr0+T6bkJIJVHNXlfRWxXZWMo6FZXN3nXB57yLYpkboezzzQW+S0i2cEo4yFI9 KHOWR9Gc/VhbKP0gj9Q5wytv4eEErvw7hWiN5r9vKchsjjR8
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

v1 of this series can be found at
https://lore.kernel.org/cover.1784030076.git.ukleinek@kernel.org.

Changes since then:

 - Reordered the patches to have dev_err_probe and dev first. Fixes a
   build failure in the middle of v1. This way patch 2 -- which could be
   considered a fix -- isn't before the cleanup in patch 1, but doing
   patch 1 the old way first also feels strange.

 - add { } around blocks with a single statement if there is also a
   comment.

 - fixed too many parenthesis in patch #3 (formerly #6).

 - dropped other patches as they reorder stuff in unwanted or at least
   untested ways.

There was a concern in reply to patch #1 of the v1 series (now #2) from
Mikko Perttunen. He wrote: 

> I feel like driver_override falls in the realm of 'root can mess with
> the system as they feel like but if they don't know what they're doing
> they get to keep the pieces'. So adding a check in every driver, or
> in practice having a random mix of drivers with and without the check,
> doesn't seem necessary to me.
> 
> If we actually want to check for this condition, could it be done
> centrally instead? I.e. don't call probe if there's no match data and
> the driver's match table implies it requires it.

It cannot be done reliably in the driver core, and IMHO even root
shouldn't be able to trigger a NULL pointer exception. So I kept the
check.

Uwe Kleine-König (3):
  pwm: tegra: Make use of dev_err_probe()
  pwm: tegra: Check for match_data being NULL
  pwm: tegra: Implement .get_state()

 drivers/pwm/pwm-tegra.c | 108 ++++++++++++++++++++++++++++++++--------
 1 file changed, 87 insertions(+), 21 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.47.3

