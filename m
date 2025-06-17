Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB0C28B4EF;
	Tue, 17 Jun 2025 07:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750143825; cv=none; b=iPHCeodCPneSvt+LhYxm1G9RXL3xn64epf5KUndxnOH1uxqhEiZdmOaKyFA+oE0CMb4XuJAbV84KtxUkaPYYpaCBiWyqhQLEbI221Y7oQuOFK9ogOjGz02SAEKYlk0oIhVyjwc+w/8p93B+yh1IoIhtLTpx7zyDPgUDNs0Knf2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750143825; c=relaxed/simple;
	bh=PfdGmg/x4/7nB3EQSg7VVR9RuCzYHYcB0MMRz/XKzV4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rzji0kuEx5IZqam/L8o86hN56N2FGN22+ACK6H7HAfsX6EJYWsHHSp6tFyEUmeIQd6ul+F1V0912uAceTqv9UNVKW23UNraQAVrzkXrPJswGHP4FgQX1LVDDcBH8hCIFa9l3usaW6QM6t/BilcFgCnTMlnVtKfyZWvi1ZIGHhKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EwR4um2H; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EwR4um2H"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5533303070cso4980128e87.2;
        Tue, 17 Jun 2025 00:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750143822; x=1750748622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jzozzkRmHvGfmxyMSPRvg/0NGpKdzQJ5w85bzdYdRTw=;
        b=EwR4um2HuaF16hoPMnkbl7xVv50L4BaxLZr0id+4Js3BRnNuIA36zUJSa0nHRdQ3P7
         7IIhVAwLLkShQXCPevgciCqr233Hnry+nNTkFCyH/aPphW5aT2PwTRlMNh1g8+QbjFb/
         UjpfiaatzXlvd5v57wNBnqr/3Y1lNFu53PqwU0dZeyY2CZvvWD/vqE2uvFIsAYUGjnju
         1ChEDbbTgLJtpCGqiwsi0uf7G8BCiUXqUY4H/7hJgDfPDHjjtRPQBunnkApxv2rAjl9B
         D+wmqTatCDyxuuzzc1z47vEnmEM2lINaMrbF6bitZqAryjaRIYV+h6GEF2HScGmef+j6
         F05w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750143822; x=1750748622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jzozzkRmHvGfmxyMSPRvg/0NGpKdzQJ5w85bzdYdRTw=;
        b=BjMYcOniUh9lhWD9mL3/Ir5Uvq4lBKap2+peWjoEDx5GmgYGjUwVYpUjj9jAo+Ysow
         EA7zIlaSfzkpeS7ckiQNkChVase1iFyuThULdPyO9g5QR6fB0a9KU1IWP4asbk9kQC3W
         yJgCB1Tw6S6woOY5cCv41UIry2jBy4qz5fiw9Xvd/9YV/CcLA4HAzewjI0IkJUenfOdB
         MTN7csh/ScjI5FSOENvp1x+yb2+BIXkraGss3jPXvULcVvxWmPiptrEfvQ2L7ImpA5Dq
         1AHEn/R1UDkeqyw0nPN8IvJLksucMc464M//DqU0TBYah1Lc5fPNJ4YbC57gT3YvL3XS
         z53A==
X-Forwarded-Encrypted: i=1; AJvYcCUL2yBBFwrUZIk1PY+S9j3N4IhRE5pOZQsr1Za+Fc8O0Dm+7t+FqhcnmOyK6xPKCSykNQPo0X5FAa9Tb5Q=@vger.kernel.org, AJvYcCWpfMG1MQpboHsjFslc0unXDyxtEe6osFW84M28MSwjWRkU1j0MHC53iqHRPRWjys0p6fTEQhst5kRj2JE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRNOkaD9Ffi74GBaWqKE1Soa+jFU8u69MIQC/qoBmfKT31onsX
	FhL+Sac3C9CQHVhea5b+bzuqHUMvY5ZvYNv37YP8hzu7unizYXpto4ny
X-Gm-Gg: ASbGncukFvTXwJEoPJdjhSyjZ20/vRBfpeHtNFKgWoUVNSUpi8HW+VVtss4HbAQCfkc
	XbJWCIG8P4u+SiYAvO4Nv06kLTYJbYGgPtKSXKQWpmo8GGdSOFBLWVlXe5D4CCCV0kbPscV4mVV
	i5yIKXKy86buRqSV6PpEe7/uomnCI6NvBtLygXGiD5L7+bGB0us86PhzIMlpuhxmIM8VA/WFeAs
	ZbwLU8bEzBzo73EHTZkYeGd4ouUTMGW2vpBPJ+XpjcNa27f5be8nZBqwK7Ng+/FmF9HOxKYb2nd
	H1XKLUiwdAk6LjWhOIrknfylaE7F0POgmzRKjWcx9p7BmAvKRAmCxw==
X-Google-Smtp-Source: AGHT+IELiQKRDtuK59YcZ2fZwrR1yDb0i5IMoTwgFHWyXf9bGNSSHgdGjjBRBGPDeXJnqpETDLY61Q==
X-Received: by 2002:a05:6512:6ca:b0:553:25b2:fd2d with SMTP id 2adb3069b0e04-553b6f16e9cmr2803309e87.30.1750143821932;
        Tue, 17 Jun 2025 00:03:41 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac1ab9c8sm1800427e87.114.2025.06.17.00.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 00:03:40 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	David Heidelberg <david@ixit.cz>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] ARM: tegra: Add device-tree for ASUS VivoTab RT TF600T
Date: Tue, 17 Jun 2025 10:03:18 +0300
Message-ID: <20250617070320.9153-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device-tree for ASUS VivoTab RT TF600T, which is NVIDIA Tegra30-based
tablet device with Windows RT.

Maxim Schwalm (1):
  dt-bindings: arm: tegra: Add Asus VivoTab RT TF600T

Svyatoslav Ryhel (1):
  ARM: tegra: Add device-tree for ASUS VivoTab RT TF600T

 .../devicetree/bindings/arm/tegra.yaml        |    4 +
 arch/arm/boot/dts/nvidia/Makefile             |    1 +
 .../boot/dts/nvidia/tegra30-asus-tf600t.dts   | 2500 +++++++++++++++++
 3 files changed, 2505 insertions(+)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts

-- 
2.48.1

