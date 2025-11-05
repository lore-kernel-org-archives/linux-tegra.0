Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755FF334C21
	for <linux-tegra@vger.kernel.org>; Wed,  5 Nov 2025 16:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762358723; cv=none; b=qAi+Fxo97hGV2KwvQQeNPz7/qKJqPpo2YJVZg2L3qhEwT1lG3vgxTPHePsoPAjQ97PBOuHb8VnQelBsTqlsfv//n0XLemNZgFFUxWE1gr1ns52Am/5uITZ09g3Z9YtwLnGJZ/iKzMnC0lutSa4YrDMMe21KRCOLsLPBX3O7RBsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762358723; c=relaxed/simple;
	bh=EwG+dbhxi8tKQPwOTOX4S9P5M6dlpqzhm+2MgD2X0Qg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ag9sMCbjOca+gP6O4RGTM9vGWFXOk7JfSxsqVhk+dYrdHzZAob7BTPQtunKU9WuJo76ILa8yuFryaAyRR0QoFQ2x3zTYOLY7CTZvKCphQ32KmMvrYMexGDX5UeSLXnnv6+r/cmZt8kc5I9O1Hk//n7Nb5RtQmahneaNr41dYiGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K++iMOE3; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K++iMOE3"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-477605dc769so3929695e9.1
        for <linux-tegra@vger.kernel.org>; Wed, 05 Nov 2025 08:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762358720; x=1762963520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y0gPRO8ltjGC//EqHEd+0CranNOCKlhYc2rOlxmM4oY=;
        b=K++iMOE3hfIlKdnEHZuB2lklM/MxA8ECQJbG4TG86UEuLjJEwf6nacCCdDjWucI5eP
         BhD3YRdgwBi6NU4z1RWLu829NFdGh1v6unXo+vwjy/627iO4jGKc8XGDBg22HD1W1ObT
         FcBe5dXrEpTBw+DK34zWkpKR10oNintnh+NaUitsAvq7NKqAoFc75C3NHF48vAJROnHu
         i3PC2A38747CKz5zsUyDYzzvSxB89s7CTCDRYLllZXMFe9ZaD4CgDj2zhk+V8QvNT97b
         y0BthVgiH/757c5qW4541TMhwr7eixTElIrqbWBOMgh7RAbJEQHpQEA13wWYLj+/DWYk
         9exA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762358720; x=1762963520;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y0gPRO8ltjGC//EqHEd+0CranNOCKlhYc2rOlxmM4oY=;
        b=JCOMGMMZfsIMt5SI4tdzThyijN8PuUM9yhzMjDD6i3L47wWBb8uZmpHioifv+fa76V
         YVoXEGQK88SIHonV8eqcw3ELlrvUq/QxzqStllNT3RhvW+pp2hBDJhvbjNe5T6a0NE1Q
         UL8naYhDfapPsJEtod2MAIykJ8lVXtpKsBaBJe2k/EYBU7rjlOd7tNPOnHhmNh7TMUVo
         Pgn4cmc4EmGJlvRZLUWKaoa0XhkE0KRpj9c/2ELS3bQBnbs2mlqSGEaNPPV3BdD1mm3T
         vSBYJ3QBprBYwxXYDZNUG+fUWX0/jpZ3aU787/vox4KxpEfqGRVGU2ZqorL+WxtimP0S
         OkYg==
X-Forwarded-Encrypted: i=1; AJvYcCV5FOFdZbXqmEwSI8DnYIvQLBGrDLnuKnsPlCN73GjnTeaZe+fH4laFLDnZ/YUrejHtuMng2AGDBRm/8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyTrrzgzcQ2vq0sY1RONg1QhuPLBzrMw1Mp3n/livYd9KiClYc
	5eHHD/CFuZzZzSUoCP6d6RThvi/n2BxpaL95iwLME1CgtepuNdld4cyvWlwbpA==
X-Gm-Gg: ASbGncs7Uysv7KWMh9s5D3OdHU1698VGL5+3ffJfBBGrn2/ftf+ZdDkyMLXYb3zSqDZ
	5z2ROtwrKZT+5uW/sd4qXIoOe3T5+Wn9FnCxEpDj/dJsqx5ZGR7biGdWR32BcGeQ4+66Y0QOwJd
	pUXogJjosWXhsIRMLev96H4O8w+/LZwHbf+LDoClFLOxbQeNLDetJO2yOBYxsaRpR1SAy+Dy73t
	p7rvLaknB2Q+XmNcwKToDpmywwrYBn06l8mABPHIaBkUg8HfDiOwujntfo8agLJZ2hLjbcKFauW
	wGbrKuYQPEZCxXSLgF1eWfC6pTLJt+IipGPSrcpfgLDXaz/i7XE/JYQQoNclmbRTQ4b0X/vJxUl
	jYEHvVuUOdD1YLnBroqXvesMGjEe50CK8HEWDJCrkhagzLkWViVWQSGnVsNNu2TeMcMBl70eMqo
	eRyMTizaPgckyEuD4uB6gxavFHImuHYx2bD94t5zl3cVpb2vT6L22CwJ4wVOSf3E5uTiXZ2qrDA
	JXSWtQ=
X-Google-Smtp-Source: AGHT+IFmyNYl5xXskz/5ll5ztpvyfmC6oBvsYVoGB2HdYWWuVi8c9xmV9W/09ZNuLsTpWfK2LkUrSA==
X-Received: by 2002:a05:600c:5291:b0:477:c71:1fc1 with SMTP id 5b1f17b1804b1-4775cdf76d3mr37635975e9.19.1762358719486;
        Wed, 05 Nov 2025 08:05:19 -0800 (PST)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775cdee765sm68471675e9.15.2025.11.05.08.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 08:05:18 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/3] arm64: tegra: Add DBB clock to EMC on Tegra264
Date: Wed,  5 Nov 2025 17:05:10 +0100
Message-ID: <20251105160513.2638408-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

Hi,

Tegra264 requires the DBB clock to be enabled anytime an IP block needs
to access external memory. The external memory controller is the right
place to put this logic. This short series of patches adds the DBB clock
to the bindings, adds code to the driver to use that clock and finally
passes the clock into the EMC so that it can be used.

Thierry

Thierry Reding (3):
  dt-bindings: memory: tegra: Document DBB clock for Tegra264
  memory: tegra: Add support for DBB clock on Tegra264
  arm64: tegra: Add DBB clock to EMC on Tegra264

 .../memory-controllers/nvidia,tegra186-mc.yaml        | 11 +++++++++++
 arch/arm64/boot/dts/nvidia/tegra264.dtsi              |  5 +++--
 drivers/memory/tegra/tegra186-emc.c                   |  8 ++++++++
 3 files changed, 22 insertions(+), 2 deletions(-)

-- 
2.51.2

