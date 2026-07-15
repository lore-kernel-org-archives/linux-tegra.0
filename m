Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A4D3A875D
	for <linux-tegra@vger.kernel.org>; Wed, 15 Jul 2026 05:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784092298; cv=none; b=h3bYHw2RF2joSzOUlS9kUzAn52AncslTQsHLn79BXzO1sh+h/j6VukhFcT4opGvsXURnfm3U+/Vb456/eOnbc9XRcmMH2UTlpD+v2CZsLwNhrlGub5UB3pdvRNo7/03f5yFOu/sO8Cz5T8p+lY/AU8Lko8pDRRVrVyRza8ebmOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784092298; c=relaxed/simple;
	bh=wLfOO1NjrRiTtwaGm7JPjBb+fKmIip65GwFcQmhK/bk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=APhEAA9iNK+0mV6GzCKoSmDZJpo2LD3DKwYhlsJFw1H/730Rs3HtOl6zJ220L78FBIUWWfWHoZ+6ny7kHozSuzzl1P3OGDj7sHrL6Ifdt8PCCtwEO2XFzjL4q/NMtT5Zrs35vO2q9Wqiq+aGH3l+TCox5HPwCFzvw/ARv+FrET4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ffkm6Une; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ffkm6Une"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8484f229529so1233626b3a.2
        for <linux-tegra@vger.kernel.org>; Tue, 14 Jul 2026 22:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784092296; x=1784697096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hiWrcvhaZMjOWMul2Thf2vIaA7D/1tD3CdUZoRhlXBI=;
        b=Ffkm6UneWFj7jPceXiW/2Hg3Y8IZmnBZtTl96DS2N2wk+d26tvcOB+Sz3wa5p06qOG
         FK5QJvFAeMuig14DIMQjYZrC+q6xbu2QJke6IlYklwL2DqqUjatFahYQJL7gTlOZ224p
         86WcNVwBFDS2JnnjDDesnHuPcVkDmarQi8STdLy3gUIm63CIc1x5aRsEaln7QDziLdsd
         E4TqlChM7LvOVKgKSHsRpwMAHvAktoXmgbZgWOGHDAEjTTz4tv44sXwZfWCovqzy9vOK
         VdwTLAKSHeGyeX/r4rU2dIClYtFgTyb5anW6H7iVS9TJ4Dyhv9jL2wWJYv+AmGGQ2VB3
         tYQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784092296; x=1784697096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hiWrcvhaZMjOWMul2Thf2vIaA7D/1tD3CdUZoRhlXBI=;
        b=eIkpPyqUweRqJlC4X07fppDHWk+jCLKrt8Fr8PQfbuWaA29OCN8y0km/QPuAAhoyrY
         gnhnT9dfMk3HtKDN75yC5K+550dESNZ+lTptDgP8V9xNKvzlEqP8akZp6ME4RoHlLwJl
         JTWI/w5GUBDA2GvbFhgh6jPerZYPdV9tTXmVIXkQbvK+qtRGpSneDBCa6SZIkVPlu8MI
         0OIl9e3ViTS7CVDXoSK0IGxr3yb5ElmGWP+hQMQmD9JvTcTPzj/Dqnos1kDhapX4HbSB
         9oKtHxZ1/rlE4K04Y+3jcZef64IR6Ok5y5w66yRUaiX/UEQqbYD9D2c24YfT1PbfqlCX
         Jk8w==
X-Forwarded-Encrypted: i=1; AHgh+RrwVl82TnhUwaDiuM4ITYKQVoOmA+QHf8+EqZWfj8TZ+zzIrSXs4YP7/0rPwUiWGknstvB3e5A5FRhmrw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwVlef/uE2NCL+pty7T3s43jCKlK7R51XRvyC/AyJAAPvNVwwR7
	/+tJVc2Is7ylSWQxwikjk6bem/ImC3UYCQpegX9esuFsomKiMzgRTZs2
X-Gm-Gg: AfdE7cmzWkPrBqTd1PiACYC+eZ8+f3vqCQz/gvE7wtoHZrYXUKze7xoHmW6wUWNnvPg
	Id0LHtlhxGvRVSg41aUn9KGV95ECqRy4ahwt7pbLs6CLYxE0VbdbUBm99u4UEgCMnqcXzMDk194
	8/kBFcDvxT4V7zqRQqeQERjkoSo8IJtpAqS4EbEsEcYrbARVy0xpIzmnlE0/azMGmVu9yNCScmg
	Jl2YPpSNcmELHQHeNGT+iUA1VCzjX44bTnf8RS26Y72rM6g2j3awQGBqsMz1zJKLvJqtJwTKDT7
	DbcgCPmioXU4cbGnIfcEdXwXNvS7V/y33h/hHVHxrzsM5pFtyGNQPGNfmqQnlMpiHnB1+nxAdiV
	4eogCZ3w8zefxMIVcMvgCDz3zi8qcbC/jhmyLr5JgffadmL1KzKRaGDzOKOY9zEdi0p5NtQv2AE
	GjbEzM46/V2O/RLm833vuQV9Pyfn8B7dMKDyEQy1fhTiZsC60=
X-Received: by 2002:a05:6a00:23c9:b0:848:2f74:d8d9 with SMTP id d2e1a72fcca58-8488986df61mr14464978b3a.74.1784092295808;
        Tue, 14 Jul 2026 22:11:35 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f271ddbsm2594093b3a.18.2026.07.14.22.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 22:11:35 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Sheetal <sheetal@nvidia.com>,
	u.kleine-koenig@baylibre.com,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Rosen Penev <rosenp@gmail.com>,
	Piyush Patle <piyushpatle228@gmail.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/4] ASoC: tegra: Simplify error handling
Date: Wed, 15 Jul 2026 12:11:11 +0700
Message-ID: <20260715051115.17385-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series contains a few small cleanups for the Tegra ASoC drivers.
 - Use dev_err_probe() for regmap initialization failures.
 - Return the original error from snd_soc_add_component_controls().
 - Use devm_clk_get_optional() for the optional sync_input clock.

Overall, this simplifies the error paths and makes the code more
consistent.

Best regards,
Phuc

bui duc phuc (4):
  ASoC: tegra: tegra20_das: Use dev_err_probe() for error handling
  ASoC: tegra: tegra210_adx: Return the original error directly
  ASoC: tegra: tegra210_amx: Return the original error directly
  ASoC: tegra: tegra210: Use devm_clk_get_optional() for sync_input
    clock

 sound/soc/tegra/tegra20_das.c  |  7 +++----
 sound/soc/tegra/tegra210_adx.c | 12 ++++--------
 sound/soc/tegra/tegra210_amx.c | 12 ++++--------
 sound/soc/tegra/tegra210_i2s.c | 10 +++++-----
 4 files changed, 16 insertions(+), 25 deletions(-)

-- 
2.43.0

