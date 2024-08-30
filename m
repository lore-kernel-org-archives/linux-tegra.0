Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FF51ACDE8
	for <linux-tegra@vger.kernel.org>; Fri, 30 Aug 2024 14:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725027010; cv=none; b=m8VwTWXQWIPl9w9uFY5tnxhkxMySIxF+XGLjsTNc4SkQsF2PY+sonCmZeePxa2G3uzs8liuQFBj1Z4rGpha21ri7Jg2KMuqTtZIZw+3epJqw97evLTMtfOeTNrzT3zZGuK5GZzIqGzgRbQAFhA9cv8oc+ckQC2yagVfoVEHVnb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725027010; c=relaxed/simple;
	bh=fHoI+/CjgNHBexuKR4b0wb98O+WvSpPwIbmMY5XOV2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fkC/us3AFa9MKNRiyjfiL7sG81rD0vMQ4SjzdZ9/22Q4aKc65GMUuVcTT2Lt3NMDHFS8EvVMaNAZB9KpVdUIgAqHtPQJLd6xX0cdBhE5RhoaFBiQfYNmvhqgoaq4t0pkY9twWo+y7OWNEU+zgzCE38GXy7HdS9l/ixR/xzsfHBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M5gfSDT1; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M5gfSDT1"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3718acbc87fso1079049f8f.3
        for <linux-tegra@vger.kernel.org>; Fri, 30 Aug 2024 07:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725027007; x=1725631807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RtpP67cv70Y+Louq0UOChaWqSWUFmRCVAXzaACPA2pY=;
        b=M5gfSDT17aeQ832Utdbq7XzffbwkPQaCo/b//1uon6uNnz143ayxv0yoYaHQLubyvA
         jUBvFsBhIt1lmeOsN48Vg+RsNhBZhWUkuiGfXzCIEcIL7R5A/vFbCZg94qmSmFIhFOzs
         4FrekRMakCmF22RIcQ52YfAYaMUKksvRY72OxyquoTZaAsbvOe39mfHvY7criXyQMyEe
         wBCBpCCjimN4JbkMxZsbNNOO1fJFB6/LIl6v3d8NXRkLrrroJPHDBowAypHAWxY+eh2C
         at/Opyvb79U9WgjYoDubF/AhlsCpC19Oy+G0ykc0loczw0O7UdH7Lp7WUiude3AuxItW
         vzFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725027007; x=1725631807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RtpP67cv70Y+Louq0UOChaWqSWUFmRCVAXzaACPA2pY=;
        b=OP1ajmVyEXt6WWw3J/fl/xbU2q0X5Qj3JyuQZN5kMg7chlb2wSKbjvn6quQFoGKHB5
         XwUeTn93MvmY801uogYpyTakoidy2WkIOS0iC2U7l/3gJpsrTQ3frN57MLs59H1ivNIN
         IRrv9YrALYQTFChK0YQGSQk8R6sEYdPK7c61HZv8Gt0OgLCkcwQYGV+n5XtV/JFOl87t
         jkhuLaGBxcKU0lSphmPTedQa5F0OjuhquMf8JbNCh2don/DKEGxfFieRg5cj1G6SAdK6
         27yvVSmN1s6QrIIaYME/WRPUtTCG+8hz6s4/n3jCoxxPsJ0cN5OqsxLhB/LdRTmihMM2
         FvBw==
X-Forwarded-Encrypted: i=1; AJvYcCWwriW3HC0++5tAri8Z89qweV3gBnxOCKT96P77wxoxqrBRY+qkCSdG9Vfs1gMlT9AbppTX7NR+HR+RWw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9Scov1iF7KXBNFZ7S7BJVQuevDweJK1smd+1spWZiySGZCjVm
	5JiUgPQL+X8tJWnrgsTX2sAvdwwaYfGd+kUB+RKmSemu2txG+jIH
X-Google-Smtp-Source: AGHT+IGw2yUzapuvRvvhKYsaUVgWMUVUqjU/inDZhwy9DTWkKdQqFGaIZ9mVoZA60vfBKxyefLPqrA==
X-Received: by 2002:a5d:590a:0:b0:367:8383:6305 with SMTP id ffacd0b85a97d-3749b587a49mr4178706f8f.55.1725027006588;
        Fri, 30 Aug 2024 07:10:06 -0700 (PDT)
Received: from localhost (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6deb1ebsm47580525e9.3.2024.08.30.07.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 07:10:06 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/6] firmware: tegra: Changes for v6.12-rc1
Date: Fri, 30 Aug 2024 16:09:59 +0200
Message-ID: <20240830141004.3195210-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240830141004.3195210-1-thierry.reding@gmail.com>
References: <20240830141004.3195210-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.12-firmware

for you to fetch changes up to 8812b8689ee652ee7f7e958473a9de56d7c184b6:

  firmware: tegra: bpmp: Use scoped device node handling to simplify error paths (2024-08-27 15:58:38 +0200)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Changes for v6.12-rc1

The changes in this set remove some unused code and simplify error paths
using scoped helpers.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      firmware: tegra: bpmp: Drop unused mbox_client_to_bpmp()
      firmware: tegra: bpmp: Use scoped device node handling to simplify error paths

 drivers/firmware/tegra/bpmp.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)
