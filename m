Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794821913;
	b=WTl7zdZDdUBfHpEUES6ay2flEN+1wQmm2A5mr9lFAyLarxj+MS+m9aETaJPyzidgCzZH
	 b9tGiTjuwpTQ/9dBN2dKw95Phgaecnc/f2cYfDvke1U3/4b5ATqZrDzakKEnpuCURL9PB
	 Pwp46CO6nqQauUOwnTh8b5Eg9O5QO7rpzeenpkPLgnRneLJwXUFWQ14eBwi1HpyEj7NWL
	 5MR0JxsnGKmaPi0Hlar4vxeW5sBaxEcIqKzkvntoO1FcqM+2mHaoPWV1fSPIl8Hq7ZgUO
	 vVe2JSV/g/ekRCYCNxoHTgdhat4uP7i/qmutKmWz/Eo7qnUUPGZDoGfCDmmoWxXziZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821913;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KVZRUyQxjEZeB1X14No1R2cixIaW3jXxvUBDYA6Pc60=;
	b=YoJXBpJTQBmU4qlctC/YXx5wfQHiMgOu2691tXB/Ni0Xz4X5a4SKkt8Frjiq6lyLCAxe
	 yOg3WkpvXKr0+9yKcK96J10IKUz57Kq84hmtTm0ARXFl4ot0qrgaMf0sWjRG9ucx580Hd
	 XM18SD3mhyChBJQ9ytIe1dU0a3PV57kSY84yKM9rk2J09ETr+l7nk8gkCJXHR46vbATXi
	 zoPiuaIvM+Ywumzl+sWUfr99wUm0lzgpNxk7khxbztzqu+7J8+rucV+N/GG4TDe5cu2ZK
	 FJXNuPzGwpvzqQZijplhtirpHe43hiTQ1rSw9KqOJ5ClQ4XXT8n2U24RFqybZ50zJKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UYpWc1sh;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 510B6606A330
	for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2026 09:38:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 510B6606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UYpWc1sh
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c40f29667e6so568234266b.0
        for <linux-tegra@vger.kernel.org>; Mon, 16 Nov 2026 01:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794821911; x=1795426711; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KVZRUyQxjEZeB1X14No1R2cixIaW3jXxvUBDYA6Pc60=;
        b=UYpWc1shzf8kBKXESlt/rmRtpLOuJDihEpFizMS9pLPsKgILSIB2MQiINeMJgSACZb
         vThq3hMHZMZpT/BZSTNfPPdHQOLPP6iuQ9Ot42sHnNwrkMyw6NDbqq1BqoqfMNVS1iGx
         8CBbPn/da+IbGlMvtMTvt5bBAdXjFs+fnSzmDF+FVAVjM+2NvO5SydpJTLDE0PUei/1X
         X8sNNO1XFi2ozqqXwBKcIQhQ5GsofOsDc1CZ4WTQThrlDvA6cuXd8M6R/AfHcUng3vV+
         G8+pIWUKot8EbVPzXtJKnlR0hw6DOr0vl8TBudSZ7mcQqa6jjOkMtviTr7u0bT4LAZMY
         214Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794821911; x=1795426711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KVZRUyQxjEZeB1X14No1R2cixIaW3jXxvUBDYA6Pc60=;
        b=UInSpjXyvk7ZfRf2p5Kj4udeara6PQunNEY4d0tPq3H5Uv4lHfAB85GdR6mFalPkgk
         bNgLmykvnbMva8U8cAgZUyeC+YNLY66owae8bhGNw7XbCqhrgYhSz69WiGHge1GRtnTt
         cSqiMrx3631D5vMgCQFkXKS6uJ/fM/YXgogC0eWCRDGvjSOeI/W2+6V+zRizoezxnmuQ
         y9+w5/IF0PvfSFriXNXsSSu7Gvaw0VHTku4fEeJI/bhTPvJgfgMjPOmvs2OQAycxp/g+
         7YZGW6lUyyas550cAxfFNLQI3KtSPpeU5FE/NX83IPOisueRKf/UrDV+1YdVbifCe6Ig
         GBxA==
X-Forwarded-Encrypted: i=1; AL+hErE8sCxcKVQz9kiQjkSh8Fl++xAAQFXoPwJV80RRhU2hN47hjGpztSsOBAPGZMtxZSFUI7ReRTdrXV2xtA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8MTMpA2jo8eM4RzAl8YnhrkHcytKVxnDLlh67Hf+yvrE2lMfQM
	w7FNcWK8plHxh+ngqzipZwVMEpcFkODnYxm47yU6a6nnqPKmgI6pDWNl
X-Gm-Gg: AYBFou075S+wexhtQEG885ibVCEJJhran8gsy8T/rSrg3F3LybMJqC0JO4FHTnnLYpV
	/QM6xed6nP9OoopvtaD7xSaij4RV8/kmKwU+BsBJBXAReUBy8tsLu/YfLu/AeetEEBWddGKYxkR
	y/gz5hv8vcuI1vQYXCRiawewSseCBejfVrSzjLWVOtGTlQuseiP3u5g0MQ/6stV5nQXqmixM6vP
	0yZmWgB+shWglA+90sCv6ku10pOkNO3mip1KWSavHiP6v/iNWEC/s462Y7ltIjK6t/LfslWIV19
	rPpB/k6SI9/OQGbc50Kqt/1l0VeJ/lvxtpY35bjqgGz1K0NP27sFFCu6+uMml6jzkd+MJOFPr79
	7cokyKeSrVcSmcBYTKpUoDZfOCRkq6EdPneCtu3JsXO5GzDX2OZ4UJshgmfyEokEhvHauz1LTLH
	3q+FUZuryI/Iz/3bDpBUOClzZysOmn0XxIjbLkW7NqwN1539bm4bNM4bi8cooti4jmCzJS4QDhD
	+lpuynZ/gxndzPXC/bKuZSpOr8f9bhAVrv7tBrA85gdh9tZmg1bkIhzxxLmbfCW9CglawrYCbnL
	7FK/+2hswUzaIMc/kKmEYMm5wGg7eFYey6d66/k/XqBFehF3agUqPq6KZ8Sj60UzdTfThUAUtgs
	qRpkAxY2zig==
X-Received: by 2002:a17:907:9349:b0:c50:4720:4aec with SMTP id a640c23a62f3a-c5096398b9cmr726615066b.12.1794821911427;
        Mon, 16 Nov 2026 01:38:31 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b72868sm379906166b.65.2026.11.16.01.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:38:30 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v1 0/3] ASoC: tegra: Consolidate and update tegra_asoc_machine
Date: Mon, 16 Nov 2026 11:37:58 +0200
Message-ID: <20261116093805.73715-1-clamor95@gmail.com>
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

This patchset is based on 
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/log/?h=for-7.5

It requires this series to work ("ASoC: Convert last few codecs to set_jack")
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/?h=for-7.5&id=30b0682691a3709441146311a4f695b08eca567b

Patch set consolidates remaining wm8903, wm8962 and wm8994 partial machine
implementations into tegra_asoc_machine which now is possible thanks to
conversion of codecs to use unified .set_jack callback.

Second patch removes repetitive, boilerplate codec-specific initialization
functions with similar content.

Third patch is just sorting, no functional code changes.

Svyatoslav Ryhel (3):
  ASoC: tegra: Consolidate remaining separate codec machine drivers into
    tegra_asoc_machine
  ASoC: tegra: Generalize forced DAPM pin enabling via tegra_asoc_data
  ASoC: tegra: Reorder the codec structures and sort the machine OF
    match table alphabetically

 sound/soc/tegra/Makefile             |   6 -
 sound/soc/tegra/tegra_asoc_machine.c | 510 ++++++++++++++++++---------
 sound/soc/tegra/tegra_asoc_machine.h |   4 +-
 sound/soc/tegra/tegra_wm8903.c       | 188 ----------
 sound/soc/tegra/tegra_wm8962.c       | 165 ---------
 sound/soc/tegra/tegra_wm8994.c       | 175 ---------
 6 files changed, 344 insertions(+), 704 deletions(-)
 delete mode 100644 sound/soc/tegra/tegra_wm8903.c
 delete mode 100644 sound/soc/tegra/tegra_wm8962.c
 delete mode 100644 sound/soc/tegra/tegra_wm8994.c

-- 
2.53.0

