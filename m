Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B5632937A
	for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 12:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769428984; cv=none; b=e8yK2S9u4PcZk8z2VQ65+QZ739h8SH62n8qQlaoV7oSXJKlUi8F549aEJPcXIs7p48cmhoU1sCSl+Yko0goWTmgjBltgwv0kq2IxvIVoV2M8S9dp5yOsyYGtCZS9hmNc4fV0PC0z9a8NJfvbYP3xtKa4zmea0q1WlbOGKfGtkIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769428984; c=relaxed/simple;
	bh=DyQH4ywLrrIHN2z3rMqKzOJqNYnPWFFSFzfKYpb57a0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U9/RrJKEotySoz55aqKCvt/efhA4jLynHPKTEJ9ykeqiYC98WXaTnqkr61oTJNJAGIWnZhLD7GlFl6Wb7HnKW5rBJ4Q9CyawuBR4ODRfDjDjLzd5P/pJTT7Lyhk7fML/aNitHzJKA1uohL1SR9Ytl+kj1fQwke++1MgIRF5BQ1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cbC8BOyM; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cbC8BOyM"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-65813e3e215so8200980a12.0
        for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 04:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769428981; x=1770033781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o+Czkgnrv85D+TUfJ4B21xJ9SxwxHnvyV++qaoDyGlo=;
        b=cbC8BOyMFmTb6ty+WldqlE8aYw1liZDMjGZmtLgwXgcWOKi2vrjEJAbJD3MnMjoIWp
         lEThZKaAkkos0soy0OPy3/rqx93aV0t23UKCpgBlkJQ/suUovL+bCElM1ibWgiszY5aT
         If8Wl/Vkhnh3pe5pR48fXhdOC1HDngu1IkQ6tnow9C7TpcCJpHcwHYgIgHKC7mHZ+fJ7
         AZLl6nkKcH9fYtjkPEdHFxdBXjqphw5uXfgmcA5oWXzIYZKCu3XUesn9wKBK3TGCzY0Y
         UY1h/zh8G8YT5NAbwK1467K3GrX9kcS55QtG1NbmZrxu0vNAp1/J1F42zBujSRtaXPgq
         GCtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769428981; x=1770033781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o+Czkgnrv85D+TUfJ4B21xJ9SxwxHnvyV++qaoDyGlo=;
        b=EllFv1XqBmr5bZBSLcwvbBz9QySEbe67iPJ6I6JNOqRs+GnNc3hP2RZ0z5kqOuwutg
         HQtrqaagBvx6UpwoWms1b7jEun5rxrf9578HB8HkogsU8Cw7d95/no9t3T99i/SWxgiO
         D90EgcqgYpHNC3jmzY1zgXVhTtWDVG9gaPdG8hVwtNMp2XX1ubLnz/rq51LsacLTu6E+
         n54IoqgyBZyrAt5nSH5/bfJFOp4eFjDaYtoj/mUci9jylUkEEUVPoZ5B/eLUrPDc02OW
         wSpAZ1CadiOSjg2t2rnDflvP+siQWn0u6zLLVpJkMBcUbQBAHXxLs+5hBYPMtHsX2GQk
         +KaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgmzOx0163pG3qR/2SaZ5tTkcsjcD341sxttBoFnW82vjPq3rmPz/JGp0qbkWJjz1I5/V9rwMg8MnZRQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBWh+bBASa69qhnibajYA7TWgkjO04q+7ycV1jbYhHthHBu+Hz
	jk0J+G3L71y8LnJqBSXrSG2Vg9iQ2V7OauRTnUuZmEinQBJC6kAYYHSStsZJlg==
X-Gm-Gg: AZuq6aJl/7dHuDdRRxHr3BpNvZEQtLJZKhqeujeJrCZCGcB+fXXO3iwfZVv3EWvOaLF
	ha0aNu/A4PFgfARbtEZbkmVKuoZY7MlDwZ7zrFmxHemcpHnAmNKM8Z1QHAfvcK6OOQoOjJEUvSF
	lFJLKqD80N5was1tE0cmfs1AGC+faCNPewGejIZFkACt/ZUE4rBEar7WYiAOIeS4eSO8Rp3tQkc
	OWOE7a7FLPBZBFKOBILvSW+x9k7LW2a3RPIhsKyuPBp/Qf5A6BomfUYTr8soN/49pBkYFKcPxXz
	mWJokjcP2TExM8HM69J2JASQkQWq1P/mHaqHouaGGR44So3r7PYxCwV5YDJPOTTxgwbeYSwGFZb
	z9Eto/uRHpbiEN9jcJ6yTxn2eR60rowzzLmeG9toBgtgpTs8/6FRtNxIHpP1uT3eQidDLQ74NUw
	CY
X-Received: by 2002:a05:600c:1909:b0:480:1d16:2538 with SMTP id 5b1f17b1804b1-4805cf67512mr71970965e9.23.1769422508913;
        Mon, 26 Jan 2026 02:15:08 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d8a5c32sm319771795e9.11.2026.01.26.02.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 02:15:08 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] ARM: tegra: lg-x3: add missing nodes
Date: Mon, 26 Jan 2026 12:10:14 +0200
Message-ID: <20260126101018.24450-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the recent kernel updates, Tegra30-based LG smartphones now support
several additional features, including an RGB-DSI bridge, DSI panels,
MUIC, a charger, a battery temperature sensor, OTG mode, and capacitive
buttons on the P895. Add required nodes to device trees.

---
Changes in v2:
- fixed dw9714 and tx13d100vm0eaa nodes
- added video device pipes graph

Regarding CHECK_DTBS output in v2:
- nvidia,tegra30-pcie, nvidia,tegra30-gmi, nvidia,tegra30-kbc,
  nvidia,tegra20-kbc, nvidia,tegra30-ahub are not documented yet
- nvidia,tegra30-vi was adjusted and applied, change did not apper yet
  (https://lore.kernel.org/lkml/176860988748.1688420.11717122647073678.b4-ty@nvidia.com/)
- st,m24c08 appers undocumented though it seems to be different from
  st,24c08, at least they google as separate devices. atmel,24c08 is not
  documented, though it is widey used in linux device trees and is
  supported by driver. Here is one of examples:
  https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/arch/arm/boot/dts/allwinner/sun7i-a20-linutronix-testbox-v2.dts?h=next-20260123#n33
- onnn,mt9m114 does not have 'orientation' property, though it should
  include it since it is generic for camera devices
- ti,lp8720 and maxim,max77663 have txt documentation and are not yet
  converted to DT schema
- backlight in panel nodes was not added since lm3533 has no DT support
- missing '#io-channel-cells' in ti,tsc2007 addressed in
  https://lore.kernel.org/lkml/20260122193549.29858-2-clamor95@gmail.com/
- missing dsi controller properties of ssd2825 addressed in
  https://lore.kernel.org/lkml/20260123073411.7736-2-clamor95@gmail.com/
- missing '#io-channel-cells' in generic-adc-thermal was proposed in but rejected
  https://lore.kernel.org/lkml/20250310075638.6979-2-clamor95@gmail.com/
---

Svyatoslav Ryhel (4):
  ARM: tegra: lg-x3: add panel and bridge nodes
  ARM: tegra: lg-x3: add USB and power related nodes
  ARM: tegra: lg-x3: add node for capacitive buttons
  ARM: tegra: lg-x3: complete video device graph

 arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts |  39 +++
 arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts |  79 +++++
 arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi  | 328 ++++++++++++++++++-
 3 files changed, 429 insertions(+), 17 deletions(-)

-- 
2.51.0

