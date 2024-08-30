Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F1A1AF4F8
	for <linux-tegra@vger.kernel.org>; Fri, 30 Aug 2024 14:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725027013; cv=none; b=QwZticdYMvBtN6PD1ibw0Blq1pRoG+HNFW1FlZxbOXO7tf1Sai0AWEuScNyLHvFFd4muMW/PxKErXJqmpAKu8z2l3H9oOgFo0fMNWF2pb75LJ1zLPhzYnPWUlFZdz+PNzSBmqutbPrB81r37IKKKBuAgdTA+h2kQonI9dDoxzjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725027013; c=relaxed/simple;
	bh=S7LIiDnj7z5XdNG8gw5KyPV/56qVWWb1PYF5/QHCRXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DhTiuvHeeHNWDtHyseIDZGeuRCYarXnslnknNwZSdpoO+BxRPfIw98k3F0FWD13xi0ppNuf3ruZ9n+z9HQ2yvF6VJUKESOOjeiW4xha1FoDBCjyDuvmivuEBT0xFXAMgfRgD8Db+F8t/yqsg0Dw70fWZHgJBn0vPfetigtbUglc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T4bI7Hgx; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T4bI7Hgx"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42bbd0a40faso5126095e9.1
        for <linux-tegra@vger.kernel.org>; Fri, 30 Aug 2024 07:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725027010; x=1725631810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=46Pu2xVDjmRb9SN/gPNAiK981pmTCgVH/Qk0A/m2lQQ=;
        b=T4bI7HgxRsnMdCHUS8F4gL+AxWN3GqSrcS3Wd25uz6of+WpkuXkHY3R8nkDDXjRIts
         sWS54aoyuVxkR8k866PHLidsxTPpiK5TuNr+HNpC5L5O/RDzCAXPtJAC9W7icRHuINBf
         Rf0qpQTkm+z0oxAIr77q/WERCmZ56RQh3PxyCoYQQH4oJ6gZ2iuGSiuAHWvPEu+jekst
         1+lhFSdi5mtVRtW8YLjX2sFku2SWcM3DUAeR8FKL6rOe2e1CN4omtR/F5u4N2Tpbgqvu
         VL+0wOyeLjpiUrMEnDB9yL5og0n5Dpvt4BclOFnEymyz1LkUgMnpGZfT9HEGZj8XSY7w
         zc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725027010; x=1725631810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=46Pu2xVDjmRb9SN/gPNAiK981pmTCgVH/Qk0A/m2lQQ=;
        b=wuSSEiEFT7siUpGxoAlAXahx8qNXYZvJNVGFSnjITfkEDEWHBP8mudZEWR8DgHAFri
         QIExKJzhVOp/IfgaELbxyMM0Asv4nqJb9xmvWlSYJr/w4zUvL5tUr0aKJo1upuaSQfW9
         ooqCdz84b4hEloxIFokG5vXFDzNJOdMy0Fa8oRLiP8JvZ/8B6r3kfmWmgZDGp+CH9DQT
         m7CapVUYnDUGY/0lYRldYTsCZ3aM3RFcbG5dc4YjMSAaAuzjaYDg5Q2TLkuk1bgm9TiG
         UfbfbuQ6y07t1ghnLM1RzV1J3xM9ziemt8rgjzATuqCyKXtnm9VmK9OyMjkAgDc75ulh
         uxcA==
X-Forwarded-Encrypted: i=1; AJvYcCUtHCjETAjFUCBWK8ZVNuVlfq96t0rHDBumF0K4vlTM0LS9TUQoBIcFRizgxVsCZAQdGmbhJyMf5Kqqcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMK6bQEBK7WDMj+6oHVFhPzk+G52ITyF05dbOk70Jd2zug9zXZ
	S1TAUITiUJqnk4kia8PVH2165OBA78CaK9RZfoQTbJk9Al6g2Moi
X-Google-Smtp-Source: AGHT+IHdqpa68NopTVYj97JqK4wUDRPTK3BbA49Ueuq1PtVx0ZLZYybcNApVCirOtMkqMJgkrJfRoQ==
X-Received: by 2002:a5d:4682:0:b0:371:8bf7:d51e with SMTP id ffacd0b85a97d-3749b5448f5mr4645312f8f.25.1725027010005;
        Fri, 30 Aug 2024 07:10:10 -0700 (PDT)
Received: from localhost (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6e27364sm46931365e9.34.2024.08.30.07.10.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 07:10:09 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/6] arm64: Default configuration changes for v6.12-rc1
Date: Fri, 30 Aug 2024 16:10:03 +0200
Message-ID: <20240830141004.3195210-6-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.12-arm64-defconfig

for you to fetch changes up to 12803ded10b88b376026c544f1ebce62c44d64e0:

  arm64: defconfig: Enable Tegra194 PCIe Endpoint (2024-08-29 17:41:58 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: Default configuration changes for v6.12-rc1

This contains a single change to enable the Tegra194 PCIe endpoint
driver by default.

----------------------------------------------------------------
Jon Hunter (1):
      arm64: defconfig: Enable Tegra194 PCIe Endpoint

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)
