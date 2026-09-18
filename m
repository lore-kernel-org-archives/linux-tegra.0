Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A18A654704E;
	Fri, 18 Sep 2026 09:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789722435; cv=none; b=XHw3fvjWl4SIfWbX98K0ZUlko4tcLJ5r0FfZfEevTjfGV+Pmwfh4+EjtlJa/Eq9y9Whjvzqca02gfE/yCkRcLqYGf2MQcWaegDb/tM6oTPCzm94GBasv8IdqEGOypBQzaSxgJFGXRgDsDJfySGVJHD0JP21vHXPAViW6DOKpL0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789722435; c=relaxed/simple;
	bh=uVMGV6mW+9McPX2jlcYqWgyFcbTHghD5Rr/hke0J85A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=in/jEqINBZYjia9jh0ij4lL8damymh0ql/uivt2uEGt5X/qk5RJOPZAHg2raRuIqM+dmxEMg4MZt8ZbiL/s4h2UzKxfnPahZJvNH1t62bWuSFBcMIYaZkD2qZ5oCgYlspt5TlbBPuQPQ+pLg2PQ44qQd1LtIg0rSloPZ3CGYgVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ms3SArsN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ms3SArsN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14FE11F00893;
	Fri, 18 Sep 2026 09:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789722433;
	bh=36KRSidEpS51Zb1bKWhm3XI3hlhvN8uP5EwIs5i6OQ4=;
	h=From:Subject:Date:To:Cc;
	b=Ms3SArsNpwxupNYZmptYC/aNSZG1oj/QcDsgqGHVRmlT6KF1+3ctpnjm30ySOeNXV
	 9ZruOaQYIkgnxG3YAeONW7ggp4kuEdZmYGhUF7kiZiaO0KZmTcTBQpNFNcvRmIKGSH
	 8pcymmjOWUWy7R+m+yj1tQf+Dqzy8iXgWFbnpH9wPdg2+RFyywePUA2hnJNu3Oqg6d
	 tWqMVfdwOv57PtKNsPPtTftQVhjdF2E+dhu834NTIx5Rdxd77uElKMd0yJFHC0i03u
	 jYFG9zUJzzK9wMcU4nPiOuy5m5id0YwQfDmBwsPdHPaFU5Avf3mX7lsuE7Ny3mKmIe
	 NNPTvDlJusY9w==
From: Thierry Reding <thierry.reding@kernel.org>
Subject: [PATCH 0/5] arm64: tegra: Miscellaneous I2C changes on Tegra264
Date: Fri, 18 Sep 2026 11:06:52 +0200
Message-Id: <20260918-tegra264-i2c-v1-0-3adac7aae717@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS0ML3ZLU9KJEIzMT3UyjZF1TI8Nkg1TLVFODFGMloJaCotS0zAqwcdG
 xEH5xaVJWanIJyAyl2loAFYPgOHAAAAA=
X-Change-ID: 20260918-tegra264-i2c-521c0e9e50d3
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Thierry Reding <treding@nvidia.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1538; i=treding@nvidia.com;
 h=from:subject:message-id; bh=uVMGV6mW+9McPX2jlcYqWgyFcbTHghD5Rr/hke0J85A=;
 b=owEBbQKS/ZANAwAKAd0jrNd/PrOhAcsmYgBqrP85E9EJE68J7QBWTBwmzc1FA2wDIVcqZt2UV
 xBo3kecqcOJAjMEAAEKAB0WIQSI6sMIAUnM98CNyJ/dI6zXfz6zoQUCaqz/OQAKCRDdI6zXfz6z
 odP7EACRvRY8ivrK2J0ClLr7BlCS51jqY3gQnZ9mCBogu8sd+oAKfpOGA//iUG7Tw91xT1nZPYv
 GSawXaieMQ4DmaqD2GVK4eA5C0TGuSbwDsUaRb9campumpIi+a15byi/H6Jm6yTrn3+eljoSRom
 nyeVSaaKcmrTdIMEjt7ituB/on78fuXFlqyvqmeP3j2o02rkFE/IpADaYMRe03Br5EYIpfjDxZe
 u0MYy5PDNeZXCrnYE+gk2vd1c+0e0y4roYXaPxVtEbG0Wa2PSohbUiaVrYn3HGIzHT7/Zwox2O5
 4/li/ircmuGiqtbdlCi+aqCVLw6PGw5Fl4EiCU45n/D9tw7jZPkAWLJGsBaYavvNUWkeCD5l9OR
 ub0lpwIsVc80BWKc1CGDpoUc5hWDMeO110RiBqdDFOwyFp04A1JqeM4ijpocbGNMqRaGl527Stb
 Anh79M3F34ZvHyvBrssbunDzawMH9zfXl2q1Ev4klzjBCipJDi5kDkTw3iWdwm7j82Ag12QgXYv
 tyv+IapjPzhDbhbaVEjG3MqPb0tU9FNZ9iHnFE/mjBw3fKrLFb7jEsi2eZzyz5Py7WLCjgew5QB
 AGNQoqvZcURInvvA7ZIPVbl7dDa3jMINELyJIYYlmeWLk1G0a+QiuugpNHIwWSLex8CqYg+7WZA
 uVtGZuZFDnPkUTw==
X-Developer-Key: i=treding@nvidia.com; a=openpgp;
 fpr=88EAC3080149CCF7C08DC89FDD23ACD77F3EB3A1

This series of patches fixes some minor issues with the I2C controllers
on Tegra264 and adds some I2C clients that are useful for these systems.

Patch 1 adds the missing #address-cells and #size-cells properties for
all I2C controllers. These had gone unnoticed since no I2C clients had
been added so far.

Patch 2 ensures the I2C controllers are consistently named (and their
names correspond to those find in various documents) by adding aliases
to them.

The module and system EEPROMs found on most modern Jetson devices are
added in patches 3 and 4.

Finally, the thermal sensor found on the Jetson AGX Thor module is
described in patch 5. This allows reading the local temperature of the
module.

Thierry

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Thierry Reding (5):
      arm64: tegra: Add missing *-cells properties for I2C controllers
      arm64: tegra: Add I2C aliases for Tegra264
      arm64: tegra: Add NVIDIA Jetson AGX Thor module EEPROM
      arm64: tegra: Add NVIDIA Jetson AGX Thor system EEPROM
      arm64: tegra: Add thermal senser for Jetson AGX Thor

 arch/arm64/boot/dts/nvidia/tegra264-p3834.dtsi     | 25 +++++++++++
 .../boot/dts/nvidia/tegra264-p4071-0000+p3834.dtsi | 14 +++++++
 arch/arm64/boot/dts/nvidia/tegra264.dtsi           | 49 ++++++++++++++++++++++
 3 files changed, 88 insertions(+)
---
base-commit: e657a464aba873f5eaf3ca821b6e4016674492d6
change-id: 20260918-tegra264-i2c-521c0e9e50d3

Best regards,
--  
Thierry Reding <treding@nvidia.com>

