Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047441AB530;
	Fri,  7 Mar 2025 08:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741335081; cv=none; b=ghkOlBEZD98jigAU+5YSwDmYulkJ5jHPr5S2wSGcUxnWajmQloG0z7kzTUicdh7ZvHu3Y0lCd/OX2vkw6IAUZ4mSv/ed0fG7q7tCDtEd1TnCtFJas5o9caB6eSlf/ww3EoyHtH/53zijeRsHuKbXS4m1CS6GxINP4cTb6kq8ORo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741335081; c=relaxed/simple;
	bh=9O2yTo+i1ZHoNggpkDtGljyX2/wZqu2U6nC04MEtJpU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gvq+1jIHYZIuo8thYzow+Tl6bRV0jr82gvnmE2kbvv6pKAc4OBt62NlxJ9xfrR+8BSh29nEMth7EfGxoKJrHQl5V0sjFS7Ff6otB9pE5ReMghCLaSzus230RFn7BKdmXzC4dRCYB3vQKEHo8GohITEisXud2YmPW2o5QEW1DMok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O25tHfGa; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O25tHfGa"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3061513d353so16801741fa.2;
        Fri, 07 Mar 2025 00:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741335078; x=1741939878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EACn5ZEmroBWhkkHnS0jtCgpkIqemQhbx20e0SXwibg=;
        b=O25tHfGaK0xmMLjGPC9Id6InH516YX8lh6fwBVKVJLgNHiWYoVN1toIaEDHet8scJv
         PCQt65rDQTaRo3KGV38puhdADmwKfn24Em747yGJoVHTJ/0I8tH1IdlGedZ4c2549OWW
         SW8pOkhlmaX5aLn59joJLzc5mh5rmVpFrkYpWF+uN5tE2lfdmOq0oXx/xdSS/9oYETwy
         Uopu0W6gXbJGPltp5r8wl21fWfT5ax5BTi0XLR/CXVkDG+XU/cjIEQLG+haeAKVWPcTg
         s4IVUzc77UdwA3vI+Kf+HcvA3gj0PLdW6nEgQCHtZCpKD76R6DPbzEI+UlvYTMCNBih8
         oI2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741335078; x=1741939878;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EACn5ZEmroBWhkkHnS0jtCgpkIqemQhbx20e0SXwibg=;
        b=Dn6vRX20sNZO5nM2MuTCUHJe6wWujdTCzCM7yz2DFXrhDqCB3PGQ99nkGqUWwLpBxX
         WxblBx2eblKnWFJv3apHfLJFVX718pKT7Ffl4/qF2xtoaY4ueRAzcG9zL8CbOQFxxlua
         1txjLq3brsA5nf04gI3D46WHWFfYzDnxvwaj5KuiTE5DbfCzOb7bKrXZ6rEturG7HTC0
         hK2TEWdwwH68BXBagRgagBa0vLqIJa9RKZzorgtVGwnXzFw3iteU+eyveLJRSjQku4lv
         sMrLzzJwN1CDK6OmcKSKdr74RT4mFR/goNB9c5+1M73a7wwYdQ4+qyu+s3Ow+cGGHoXq
         dLjw==
X-Forwarded-Encrypted: i=1; AJvYcCV0IYxMYgVaZIktu390esY0vMr1jQ8u17R/M8DI8lzbAoxQ/+GZXXCLc30oxpF04iti4C8kTPGz1nEVYqs=@vger.kernel.org, AJvYcCVifze0q0Us1sw9K6GIHoYtSuhGFRqN6lODJ+02JRmXOlD/e/nMLO6IWHeOyA9/t44zBPK1bsg7l6Iu0J4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxowxsffJ3asNGGFFgdIEoze+i3aRm503+0UPG9jE7MBF2p+jG0
	Q04yd0a52xJT23QBDxyKQDSBcXtjc1vqVBUv1kt2gGvsQY1pTgFH
X-Gm-Gg: ASbGncvWoT2S+Ygs0EE0kjEYI6enz+QYA8uOgug4YSVmqHafuvhFUx2yE56gwdEQZK3
	2FpnSbqN5j0PoYIavS5hI3aYcrnSwggtLdkR9UVwL2H8dHb2agqVGZjmMSQyzcAgJpw7LgZKN6+
	8LJNYbEcYyy/aYg3bE9DMCPGb1Q5q9LI80HTwVRsl5xpfbtJ/DE1yL7g2PM1SQmV7BUiMwwMV2o
	Zj4rTErIdQ5NIMIjKx11p3DJjl97tCgppaa/ljF2Qn7sdw/9XCWJzWFKiikF2BQCw/Lh7Eg3ji1
	r7QQ5CXBGX6mEVZUBkOsXNawMx65U3e1rgH+
X-Google-Smtp-Source: AGHT+IHCyQK6rg+Ug1l1K5fhRSWMJ2xoqvJVN+E01YmHZiM4j9/UetbTozdUENzPCNND8RPYlfQ66w==
X-Received: by 2002:a05:6512:3993:b0:545:3032:bc50 with SMTP id 2adb3069b0e04-54990e5d470mr814973e87.19.1741335077648;
        Fri, 07 Mar 2025 00:11:17 -0800 (PST)
Received: from xeon.. ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498b0bd148sm409886e87.139.2025.03.07.00.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 00:11:16 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] ARM: tegra: complete Tegra 4 and Tegra K1 device trees
Date: Fri,  7 Mar 2025 10:10:44 +0200
Message-ID: <20250307081047.13724-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Complete T114 and T124 device trees.

---
Changes in v2:
- dropped accepted commits
- added EPP, MPE and ISP compatibility for T114 and T124
- added TSEC schema
---

Svyatoslav Ryhel (3):
  dt-bindings: display: tegra: document EPP, ISP, MPE and TSEC for
    Tegra114 and Tegra124
  ARM: tegra114: complete HOST1X devices binding
  ARM: tegra124: complete HOST1X devices binding

 .../display/tegra/nvidia,tegra114-tsec.yaml   | 70 +++++++++++++++++++
 .../display/tegra/nvidia,tegra20-epp.yaml     | 12 ++--
 .../display/tegra/nvidia,tegra20-isp.yaml     | 16 +++--
 .../display/tegra/nvidia,tegra20-mpe.yaml     | 30 ++++++--
 arch/arm/boot/dts/nvidia/tegra114.dtsi        | 65 +++++++++++++++++
 arch/arm/boot/dts/nvidia/tegra124.dtsi        | 65 +++++++++++++++++
 6 files changed, 244 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-tsec.yaml

-- 
2.43.0

