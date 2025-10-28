Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FAE30100C
	for <linux-tegra@vger.kernel.org>; Tue, 28 Oct 2025 09:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761643539; cv=none; b=ivTZn7/uKzKIaT97+DrB0xaJFkI765d9ngIMoUPvRrA8wV4N/a/66kpyAP6dMoiLDuLzO/5CLqkqdt7V5YY4cS/qMn2/vlj/0foMu0TUskPWzVt3aejnJNcTa1VspH+tJVWtcMekwIPQ0twUOAPHvt1xsuBozSoqivcLzm/xz8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761643539; c=relaxed/simple;
	bh=/Iii+N1pB+IX8ozivJEIczKINrVHiSyEufjWtYoS9l0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aLTKBJyO0pRC8Eha6gDGIJxWdQDUhuabSWJfFAa9e9IkG8NBRGVr8a4gxEm+F699aHiWHDeXXY59ZF7mAYaMPtsBBD5Mwon7/UbiFU8oWezv4+mWP+fH1xQTIL3FcoagECALRvCXpBb2QxXHv9RHSh0GObMT7vk9/PG3aKsU7aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gX332T8P; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gX332T8P"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42421b1514fso4031658f8f.2
        for <linux-tegra@vger.kernel.org>; Tue, 28 Oct 2025 02:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761643535; x=1762248335; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eAEySv2XWlwHuqdOI9fzzrs359mLloz83GdyEXxt2mU=;
        b=gX332T8P5aM33tKcdtBbI+kbhYvc+VvpvHoy68n3pCyd1VQXx8CFjdOJX0fs3tyjMP
         I6DK9D7rxBevhg4tJTo83L/DtnoQGgqkJPXz031eq0WzlyRnYTDsOOoNZnv8AYIPgNTQ
         dWjKJsw5epuhjco3d1G1S+pIDmV/eBeZjk6gkIt5LTcdr15UcT9qQM6vSKnxuzR7nn+W
         ksFAj2hLeA+zVlUOOUN5e3vbxBkpCaf/BKNyt10oBfZiIRoXKih0oYcQvq5iJ61q31lD
         d6eKu/Y0feK4iK4grTBoBo8fWIVTjWJbbHgWarUHSZh5jZVG0C8h5ygC0SewEMKEIP9d
         l/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761643535; x=1762248335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eAEySv2XWlwHuqdOI9fzzrs359mLloz83GdyEXxt2mU=;
        b=KCvAgS9/byM4wx6dXbEhTBCyx8LRkpwyo2jn9MMwCKeC4lEfnqqri3hLgJNWr41qv5
         KCqg/8yHC8MIEdF1ZoDKHoIFqegRnFr0Vj2e5Mn/vAiQu3/rE91/bUhgn/ygeHgMrUJx
         LEwNzcGewzk5JIk/MiP7z9cB5/gtMYTFu3/Fmy0XxnOMYRnjMOhxijYh46rOqaF4l+No
         VjQqybkcmiPwzPIpuFW9yipgWKFCgWn+fPxEK8RIHUZZwuFBYbOlRR6voOSeS42OdKqY
         UJOABOiGgKWZviW3V/DD7pqlIyXst43Z+7cpuzwF7iHi0PoOllt8nKW4rx+87sMpRi14
         f8ag==
X-Forwarded-Encrypted: i=1; AJvYcCXkZQ/FjW9WNVYYjA2AGszAMC7yjpn99O6/P6w5R4qMGt6liinKqph3WxRETqXdrp8uHjHL2p3AolbKCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyE0DtuDbQ2WLCQ/o3dAoFUbQUjMxMldvf64mFwSr1ER7muckA5
	Wxpx57jDFOTcqRxF9OS/shAOO+PgUc4Sz0Gn7qS9s/N8HCDvs2BuOp6Y
X-Gm-Gg: ASbGncuVwqzLGEWPTVehU7D0ij2n8k0ln2XaymBVK5wCSmYE3aeMUFfsHnhlNPhuyhe
	BiDHV8aEVoC/JB9HPfAidr1lY6UbkQHKyRr1l+bl1/aGd4cCVq9jwNpA4/p7H+Hy7dfNktrYXRR
	cDFw7COsX0/HYgCj3Mke80we7/yMhABlE8WfN/QXNq+vVvAD6JuBGsGFIq9w2owRf3iumAfuWHr
	0Ih6h8MpAQO44XySMonaYcOZuYvoKJeWscpnDhNNQ0b06FydsQ5AsUcrJp5E6BNRQf6xkeelCeU
	mGFWUMArm6Pw7oHB4HSpzcAKoOCPN8QB6oY+ZD6AzU36Bq/m0tdz9+cf8GwfkutWKo/EdNA8JiL
	3deqrH+aBYaJWXeRBM3EKFM1p1vu9KCfpH4VaGpTx7Zzrqp5ibq3HRvpl2o/ZpUHP7ZQ=
X-Google-Smtp-Source: AGHT+IF3+1mOM9sG24twLPTOS4d6Ytk3inqVnLJlDJGYU4qNs2J8zRECxVSlGJ/pgP5nQ5QB1eWkjw==
X-Received: by 2002:a5d:5886:0:b0:428:3cff:3240 with SMTP id ffacd0b85a97d-429a7e36fccmr1692146f8f.1.1761643535448;
        Tue, 28 Oct 2025 02:25:35 -0700 (PDT)
Received: from xeon.. ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df5c9sm19231079f8f.41.2025.10.28.02.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 02:25:34 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Ion Agorria <ion@agorria.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/1 RESEND] ARM: tegra: add support for Xiaomi Mi Pad (A0101)
Date: Tue, 28 Oct 2025 11:25:25 +0200
Message-ID: <20251028092526.7349-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Mi Pad is a tablet computer based on Nvidia Tegra K1 SoC which
originally ran the Android operating system. The Mi Pad has a 7.9" IPS
display with 1536 x 2048 (324 ppi) resolution. 2 GB of RAM and 16/64 GB of
internal memory that can be supplemented with a microSDXC card giving up
to 128 GB of additional storage.

This patchset includes some schema changes not yet applied. They can be
found here:
- https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250909143432.121323-2-clamor95@gmail.com/
- https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250912065146.28059-2-clamor95@gmail.com/
- https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250912064253.26346-2-clamor95@gmail.com/

UPD: patchsets above were accepted

---
Changes in v2:
- added fuel gauge interrupt
- added CE gpio for charger
- removed always-on for vdd_gpu
- improved pinmux configuration
- added camera regulators
- removed usb@70090000 (already disabled in common tree)
- set correct modes for mmc devices
- removed thermistor thermal zone (not used by mocha)
- fixed pmc interrupt polarity (removed interrupt inverted prop)
- configured OTG support
- removed bluetooth reset-gpios
---

Svyatoslav Ryhel (1):
  ARM: tegra: add device-tree for Xiaomi Mi Pad (A0101)

 arch/arm/boot/dts/nvidia/Makefile             |    3 +-
 .../boot/dts/nvidia/tegra124-xiaomi-mocha.dts | 2790 +++++++++++++++++
 2 files changed, 2792 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/nvidia/tegra124-xiaomi-mocha.dts

-- 
2.48.1

