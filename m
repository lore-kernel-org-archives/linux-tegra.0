Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CF433B6D3
	for <linux-tegra@vger.kernel.org>; Sun, 31 May 2026 09:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780219676; cv=none; b=sJOlaq93HmYa52D6/JyhaCg0KFZZ6GeblxkaPzckRNrNYJLDWpkYnByNK6+vLCUNzqbVKdMkChQt0ltPpw6DonaO1WwLNHWJLplZ4QbYdWak0HiYbIcPxjwDU35nuwXho/ZdtvCzKOP929FQdve/OiFe4Ldk41emzHvh0VhUTfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780219676; c=relaxed/simple;
	bh=BNG/Nt3+CmK9Hyh4BW3hQ4JifMYdLAzHQ5ZifotMSIw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=of8CkeaT9jDboLHDnqLkOuNHQ+xigWLNhqtCfAaBPRDuQH9i/SW9DDeALLTWCuD53NDM4PX5shlX8bpmYnkTuIWgXuqKxDIAeefqPX3WIJ5FRU6iqQDaFpgwMiJR/cQPVSRM0gJK75X3+ws0jGYjnjyivcq9ZLalVo6idsOyfRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kXmkAQSy; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kXmkAQSy"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-45ef5146b56so1032709f8f.0
        for <linux-tegra@vger.kernel.org>; Sun, 31 May 2026 02:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780219673; x=1780824473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tIxTISlKz5zUY/5EeJFoGXkyj7v9D4tIsE5w4iprCUU=;
        b=kXmkAQSyWX5LouCuyJ+zfXZbCZPYC88HbyYchCtYp14qq+eeiXmfmQcINOCKKP+k8j
         T7rZu08lvEg4T5veFOKGVhTHHevJ3DXUidc345/0qYJiIUuUlapLFzjDnd+18RNmNB0T
         RC+mNiRmWLI6IJnnO691KOsQUzTy1OvkDktfjuSf/06XIwFOkqx/3dYRzFSWmTEhCaUY
         dPkzWSOAB9V22QGgURpFJPDwoh/2vvbSbe9WSVQ6RTYDtDerWTofgI0sbrVFbzYHHTJI
         lbU+h8/PCz2J3KBql0TT3heIwWHMnKV2LqD07uiKmOFuSIWEMD/+gkSX/DMgQ7GaL0Mk
         WfSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780219673; x=1780824473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tIxTISlKz5zUY/5EeJFoGXkyj7v9D4tIsE5w4iprCUU=;
        b=dsvCyUKggekncdyDUsF8iDKg/4/jso+yxEysUgsNIT1Z9LI++3oaG2inwDWWHbgkyS
         /+OwD+TDINcECCNJSTGB1gNdPDpWQGQCHu9e1VX8ZwVjBnym+AToOfoq7GMbB3a3psh+
         OjmmToZnqXsy8F9HuV9y43cI0gw/Zpaa3jFN4HSrBYGKfSbCvdF7DO5GeZ58zI6+62LY
         RAns0TAFUzLUHdZ8Ze1Nhc5OyMnJujq6wSs3e/8ygOBTR4M8893H1cHLobchlx610oCp
         g5OZCVEtjxEQYQUSqpWlZrkHUrbwMYgoi6qEg8QSX/RyIIRkfg3R/tY4kHQ5wef7jezb
         4EZQ==
X-Forwarded-Encrypted: i=1; AFNElJ80BMlNDuRoekAZuGHWfCLNETGrDgHT6gVlxf3TYyQkQsz176ny/T7GSuf3lRtoSEm+YOeFK1d8lgmu/w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHmzHiBz9/YHGRg7Li6yrdcY3cUyFDeBgLknve4X1E3W6QqN6Z
	OWUPwWLl3qapeXB0JZ2aVOmGC7bi0ajVFqvMmtww+svZdClpk0Deb4SR
X-Gm-Gg: Acq92OGQiW95KQ/wHaPYER2BwpZ/5A8PAz7PrNzkBsU4wty2ATewrdRIKgSLMpPrI3A
	IidjWqXQJsgfeHd2Ltd/3VB4I1nl+6t61o3b8oqXa/cqqtxvJRjDMoqe74dOAyG938fHluFzAXs
	FgT9j1sy3hAEg4RNpb5WbHVoVIs5YulQ3TR9LQhONcCmLn+pX0vP3pc4vXR+EFd5XpXf7zPcLD7
	a93dui6hToP5Aj53M3Gb8vwWnyqkx1I2ynoOI0r4YovbW9QHep0Go20CGVlWn6hjtnVKolgLmBO
	gAeTeMn62RGYLV84l8UwSBGiEhzTg7KATvm0KB3KHEPUNOoKkLYm3q1ZoX566woSmHFmCViYm+C
	EQjvtFybueGJt5gOOQeD/Dq6jqPwVn3GBORWuoPVuanVQWcTZ3Gn8iZUYocqwZQdSdV0l+V6ww3
	nKn50SEaqKq/m6D0ga18HNwP/7hbLA6Mzvgg==
X-Received: by 2002:a05:600c:64c8:b0:489:1abb:5559 with SMTP id 5b1f17b1804b1-490a2a1f07cmr88176025e9.5.1780219673463;
        Sun, 31 May 2026 02:27:53 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6a0e42sm163976435e9.8.2026.05.31.02.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 02:27:52 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1 RESEND] clk: tegra: support 48MHz clock for pll_p_out1
Date: Sun, 31 May 2026 12:27:44 +0300
Message-ID: <20260531092745.12738-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

UEFI on Surface2 sets pll_p_out1 to 48MHz which is not supported
by kernel and causes BUG() early on. Fix this by adding 48MHz
clock support for pll_p_out1 along with 48MHz support for pll_a,
main pll_p_out1 descendant.

---
Changes in v2:
- aligned with downstream 3.4 kernel for tegra114 logic
---

Dmitry Osipenko (1):
  clk: tegra: support 48MHz clock for pll_p_out1

 drivers/clk/tegra/clk-pll.c | 1 +
 1 file changed, 1 insertion(+)

-- 
2.51.0

