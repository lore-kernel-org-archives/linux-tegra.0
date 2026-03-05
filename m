Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65EC3CD8B4
	for <linux-tegra@vger.kernel.org>; Thu,  5 Mar 2026 16:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772727064; cv=none; b=iRUXD7BuzFKXEUxVGdy9zhipFxl5Bqz7lN7G57hFA7G/oTtQoGrRK05br9Nw0i5lJvELaYy4WNaTkUA7lJwbIGyl0WiDcC3dlsxofWTwded+5+HnoJPgg7k/PH/Vj+hIIk92cSXN4aQ5opitaO/uwajLnr5I9IYDkBlQENIyJvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772727064; c=relaxed/simple;
	bh=7A5SaJxm6A19wscHdaLNNyLuVvs225F1wW29IZZfcEo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eBi0Q2tJpBM9kw/kFtcLVtq8nciZ0TXGLqtQWui4TMCDSFMTguyypTTyoFzdUmfQpGoHRPLX2wMgJuL++3u+44KudLV2ozKbX/Q8cfwu7V1VQpw/TISa6IN5gUROtIUATaY7qaI/I1pbqV6OUOMEJYyjQoEs/I6pmy6aY6hg16c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FThXYIoE; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FThXYIoE"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-439aa2f8ebaso3408716f8f.2
        for <linux-tegra@vger.kernel.org>; Thu, 05 Mar 2026 08:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772727061; x=1773331861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k18reyTAC8BmNDz3OVBl9e3+SF3GLnxWQZFfdgkzu28=;
        b=FThXYIoERxPYAELsjEZj8P3kJxrtO+UvXYxpDT/xZlwrCrvp+OFh8yGGz74TPY9ZPv
         KIVALtQtVfliItSaRhqNcgrQjBTmUveav1i9e3VxqHOIfsZE2wopw8A8KD06jImbpnvB
         bZ55UB4pRzVkoy8HAMypUs/96w8VEJj1nsERyOhitp7VCEvziGhUgH1oMMkKHzlr3N5I
         WgpKYGcosbppTvS1tl15174VwGRKkE7IYLv8RxnLSlxO94lZPlMCmm3GviIf8ZQ9/bNT
         zAFbQKOQ8lAkn53vGW9btwhu3aPHk6AgAWpBohdnduXCaVqslbwvoKeePLFxfCowqrD4
         zw3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772727061; x=1773331861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k18reyTAC8BmNDz3OVBl9e3+SF3GLnxWQZFfdgkzu28=;
        b=Z17xRobymFphnNl7oAtAortCZhIpdoDQW9XQBt1edofmeHxpUHIZlL6PbPQLbF3F+S
         f9h/Vw7fil5ZDxkV6OwR9coPvOInl3URvIngTvYoBUj3bvxFuno8QsmmaPVwZoHDp7Hs
         FyAC0R3LpymvOFPLdnejuPcbsMUtCHa1k9+mNC67buXJI7lfWv9fYMaCWiisD4176P89
         oRJkRZhI7tmNHb9K8mJlzpx3nSfixOXuJUegPO3fDgZzhNhOZesIYjaeGz9LgApkQ8Wx
         q4h6IpU6qgcCCydUWnkMg36oYPXqtrP+GTdBBdN3tzc+nLyI0y2f+nASyHseSRNMCCze
         3jiA==
X-Forwarded-Encrypted: i=1; AJvYcCVKnmU8nkswFo3WQVpjFXJ0/HZV8hKE//ja/G1AdPmRfXA0qLx1xqFX+So32ia2Di5u6y8VvMfXRgb9WQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoW9rnvKWF6mPITyHdXQugdpJNhWd+bYJ4HEGL6p6lVnOloiah
	LUbuV14FRya+tVvqyiUcUu5Ql3+eHsaoF+OVMc2RpmPNLOtyz+XKso6L
X-Gm-Gg: ATEYQzzVop+lfay5NmLBAuRr8FSq2FO/ma34QabLJShmzOMJiJHwQ3ijEYGx6e7NVwK
	YG1gVyEox8XnYknogpE8UGkgEHfeb8yH6PwCmP4AN4WRzMTvP5yNQGvxhY40XR6uYWE8W+z1RbT
	KhTVRbBGx07Hd/HSEJ49AztjMrHzOzPQJDIXCIS9vWT9PQhaGA4X1rwQZCRxoGrdparobxjknDt
	AQd6gBH6/pWINAhGViJbgMaDJvqvcctclqwzjGWXzbGO+dR/YEgTOSp+aR5ZrdUf55dPyWFUjYw
	/3MNtjQfTpoZHQAq/PACrm9nc/ChVHVK2RX3b+mrvDHEAxe+l+efj7Q8giNrczVzGOOzBR+iI8a
	AMmQsVL3qe7o0UjAtAB87aBnwkqTS2z+Eo0Ztnwv0PMeMJQqzp0uElU8LTicKocM7rMdPqG5fz5
	Q06WJcxejKeArTv21qg+Ss7Ek=
X-Received: by 2002:a05:6000:290f:b0:439:ad2d:99f8 with SMTP id ffacd0b85a97d-439c7fffea8mr11452126f8f.30.1772727061010;
        Thu, 05 Mar 2026 08:11:01 -0800 (PST)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b8807a4esm31426496f8f.4.2026.03.05.08.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 08:11:00 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] [RFC] drm/tegra: dsi: remove tegra_output_probe use
Date: Thu,  5 Mar 2026 18:10:33 +0200
Message-ID: <20260305161035.64548-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The tegra_output_probe() function parses DC, DSI, HDMI, and SOR nodes for
panel phandles, OF graph endpoints, EDID, HPD GPIOs, and DDC buses.
However, this function is redundant for DSI controllers that define the
panel as a child node.

Furthermore, it creates conflicts with modern dual-mode panel bindings
that use OF graph links to both DSI controllers. The function incorrectly
treats these links as standard panel links and attempts to resolve a panel
that should not be handled there. For example, this causes the Mi Pad
panel to fail initialization.

Testing shows that bypassing this function allows the Mi Pad to work
correctly while maintaining compatibility with other Tegra20 and Tegra114
DSI devices.

Svyatoslav Ryhel (2):
  dt-bindings: display: tegra: document Tegra20 DSI port
  [RFC] drm/tegra: dsi: remove tegra_output_probe use

 .../bindings/display/tegra/nvidia,tegra20-dsi.yaml          | 6 ++++++
 drivers/gpu/drm/tegra/dsi.c                                 | 4 ----
 2 files changed, 6 insertions(+), 4 deletions(-)

-- 
2.51.0

