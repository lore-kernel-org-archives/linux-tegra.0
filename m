Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D71FA39A047
	for <linux-tegra@vger.kernel.org>; Tue, 12 May 2026 10:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778580242; cv=none; b=KTsDl2gw+a4eZwRhvOZqb5iYJYick3WfrqIWlX2BZ25H8oLohbOIMMPu2/36zirOK5dDDzxW6Tgu07pLPFRJ1WY2AMAc3mNXi8pvA7sA6m+Un1812ZfT0SSUU2Uc3zzeVIETSOOb2P5Q/t7bDyRz0iGEUWkj01p4lc+E3RLyTiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778580242; c=relaxed/simple;
	bh=nMF5wmtNIU0TdQwozJkWBIpubcYRs7NEVSZzMuEjElU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ISps2F2CkA9b0Ly8L+GNKDlzlv8YqWklOHb4h520VqksIK2ZBH3K1596V9qBJ7SpI6D2UdHRpsYoAmrhUbwzJcfKumDiTuj5+bX94AUJ0b+H0eC7NNEpTCpTEqZADzEXFYEGHaxY9CtR4JnPdWf7kKEi9DcA4j0wFc6wPqa0G7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lIi7YxgG; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lIi7YxgG"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-bcd3c190f71so409196966b.0
        for <linux-tegra@vger.kernel.org>; Tue, 12 May 2026 03:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778580239; x=1779185039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RBMmjAeqhyczJE1w2fvu/8tw1IKm+NA+d/AMe2qIoNc=;
        b=lIi7YxgGt3/21SKWulgiGFz9KCe/8gi2+YjRxLh8GL4UeaMVX42qKq/Dr22lwSiLV+
         StIuL1VUyb7nC4F7b1pkCrdgAvXaJ/3+ejBynVDbn7eKQJUhtuq7iRWsD53vv/dqszWD
         Zvuow9MbxGfnHTNVosZNQ+X7TlT17+2JJcrqpy2ej4JSUBk8Ibxo0e6fV5/Ia5yqXizx
         zd3q1OONRlcGJJMyBI7LtbFyO3pfD7jMLgCF6HV48mo6ADTFOxxAm2hp7wwjKGQwopP0
         bWZzNLq6E2W3u+mAq8ydwEiYh6KttWcLQDiH4HA0wcGDA/aXddzbLWOCSDAuYPoY9N/L
         3mqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778580239; x=1779185039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RBMmjAeqhyczJE1w2fvu/8tw1IKm+NA+d/AMe2qIoNc=;
        b=SIN7aUmoK+6G64CKIKkCH4CV2AAY2SlmstLFKALAesm5vqGIlE4zKUJaYrXWQmsABP
         1rWCZwpAk6RBccn0uRbmDHeG+4if0WToFFOZbz4mzUXFlxd26Gg1tUCTr+y8/jqF6UYe
         qdluL0wR//TcczW8F++8QvbiPuZ12N8h5E9Eg4YnH5Ah1rbEGE4JPKk4dfpCaBume1gE
         68T+hplJ4lgV+oAgQ1lgMROTFQFBEBklYiAh3WCfHV7Zf9o3DItZ5hZlz5PGSZcVDGQr
         d3M/qBwPQ4zqsMp/0pv7zdvqEdZjtc8bEqjL6Y2+O557e1xLogxEqOycX1k/146YwURy
         7naA==
X-Forwarded-Encrypted: i=1; AFNElJ+G8491BwI/GOwpH1Z01Yn7Eg51+DbryrSoK49LLU5X+aWh9r1gcTltYOsCNhSKtMFRjrDt1JDELg6hJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxYoa97Y419aElaNmKrFiIvUBJ9n1GtRORYsBwJAAdwipG4wFLH
	mAX1qNOfmDlQz84mjftS2cMQvKA5sxSq1jPI+xlP7Z5EO4Dx8vbhES3g
X-Gm-Gg: Acq92OFhtnC5OFFRiWS0ZBVds7AkVbsrpdOv2VvuR7mk0x8GL7KKX4Nd84v5qKmHZLZ
	Z6t7D3lY5RZTW8QCzsUi19iuox6ps2GsbpnJ4l+Q2LRozH0HeS4wlEC6/ly7c8mmzCCZrb2QJwx
	9eNr8p6rhg2Gou4vR4vtA9qcMIwksxbcExqPvO0dDvLeSKty+3D4a+jQ1/t1QWoJMtQCxPVJxwL
	loegDby/jWaCnF7NbmxwoMnwX3+G85oIBAq9U9EZw/j9uev5Pff6pIImQC6yUDb7bp9x1eEWJ7w
	1bCwBPcxOk2Vc0dfRfNufSpD58yRttmwPL4LTMadVjcFfJrRpD3gYXBidGku7y+5bjTBFWegCQ8
	9DS66BLrQmaFE/Mz1e+N9MqmScdFuizxgK3lCOaCWyNhgAMhSxwofsIu4nIc5BXuOrOph3zkNKC
	fp23EOwrRJ1AYBaPZH2xSUeJY=
X-Received: by 2002:a17:907:7fa0:b0:bc3:7b0f:91ea with SMTP id a640c23a62f3a-bcc12768e96mr741948866b.19.1778580239083;
        Tue, 12 May 2026 03:03:59 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcb94415c94sm570531266b.53.2026.05.12.03.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 03:03:58 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1] staging: media: tegra-video: vi: improve VI graph building logic
Date: Tue, 12 May 2026 13:03:40 +0300
Message-ID: <20260512100341.53769-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing tegra_vi_graph_build function relies heavily on a one-to-one
match between Device Tree nodes and media pad links. While this works for
simpler configurations, it causes issues when Device Tree nodes do not
match media pad link logic (e.g., mt9m114). Switch to the
media_entity_get_fwnode_pad helper to verify and retrieve the correct pad
linked to an endpoint, rather than assuming the endpoint ID matches the
pad ID.

Svyatoslav Ryhel (1):
  staging: media: tegra-video: vi: improve VI graph building logic

 drivers/staging/media/tegra-video/vi.c | 78 ++++++++++++--------------
 1 file changed, 35 insertions(+), 43 deletions(-)

-- 
2.51.0

