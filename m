Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2687F204F99
	for <linux-tegra@vger.kernel.org>; Thu, 16 Oct 2025 07:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760600546; cv=none; b=PuhsFy87XNdMaVfMCAWdKm+b3eaP985hZFLE11frKorNxOR513Yirm1/yYtG5cYFoV2eFsuoIVMw6EPEln7bpiY3wQZkuypl9bUr7CGnq2n5cbEJpjTkSrhJnKko4yeVBajTVJq8Hb7sa3Z8obz4XpCNNU4Z1Qv7EASWfTFKCyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760600546; c=relaxed/simple;
	bh=TI1ysOXPP4hVMHn60o6TUG3RYzs3fDZDuOhKElmj1NM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SG8w5lOBQmAy3M0ImUSLzU52AykgYMHyriY8NvDOuwN1x77lVjEDpr7op/79bwb4zq4B4amfKqY2AJ2dBcVVIXs9bai7694v1gTkl0LZpue/n9JfQPi0lWSgF5weipSTURobf/+JfrdO7+DJDp1v0L15PrHpJN4q4nwQz8RrPII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lwvrmy0F; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lwvrmy0F"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-367874aeeacso3689011fa.1
        for <linux-tegra@vger.kernel.org>; Thu, 16 Oct 2025 00:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760600541; x=1761205341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e0TL/ekeJOQg26wztgmTDgEuvDo0zmkivmyNIAbPqQQ=;
        b=Lwvrmy0FR4SSoTtcsz+k6eel0nldj4A65RjZdGhN88JE/tBUxH96s4h+YSwUtVEMd6
         V7+0OEX1S4NMBNnqFbagKcBO5U2sHUPKo5su3skF2mkklIze/l+3Qw/PB0SyOnR6a4z1
         PZNfDKybX+ET5BdHo4XTi1drTMnryJO63v44eDZ2zyFNOb1xBrVFKGVjE8YmSriA28qP
         w8STUjf5qEqlONfS0WIu160nY+7oGQ5cOulO11V6tMwFM4Y2kai6iiR0cvAPC54EfU1t
         RR5hrpGkGY7HFzWmLaPyTllMQKV069nSrd150HjZPXCMo8VMIvucyem3reIAd1/q7GgI
         6y+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760600541; x=1761205341;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e0TL/ekeJOQg26wztgmTDgEuvDo0zmkivmyNIAbPqQQ=;
        b=ccatIKc3lIb+ZNmtFBThFN3Yel6WqyAsuY51CGh3XrVvwr0OuwAVwLi34u/1Jf/vhv
         zee3yJMNje6Gb8MAuXIDpX8VyitTN6kzJWfN+OraJlwetqKsb/69nT9lO23coH308527
         x7xxmNmX/L4WSIlfoo0ZzSsdA8ixDSwTYPjwUBqKp1rFlCvtUG65XWMchHdLqpDH9KQO
         sH7VOromHdJqrq+3N0vu4ie7LyoVAZRpOfKOl095Hf0/0PHTEKyKP5T7RfT/2C1DtvTa
         3jCKKcSsVdEKdJvcRiOj8tK2Euz89dxf460VWtDGA9OnaGKX/QHgnYr3AUOY0POOPCZA
         bcuQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtcM++QUU7CLXrmZBRRG1RNuL3YNvVbB6S7HqG8gxvgOwiZN65a8zMsS/V5CXRmGXW1CzT0vrfBJ0f6g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3XpzIQm4n2OzaJ7/xkiFkHrxX4sc3PRsB2DSYsueEawHv/Ip+
	XdjnSK40+HNYaL22dyafKfn4Rwygx9yiOll5rUW3StRUVwEI/LDuZmcx
X-Gm-Gg: ASbGncv4uueIfULjXx0nWp2CHQwR0YxB/bNOebBzsc4eANMeoY33qkifrVQE0L97Jw1
	3yX2la35l8/z38y+yqxu0DPz4UNY9s4JvqiFfmRcn0MAPAzSdzBvv84b+UIb4MXACn60DAiH4YI
	YLn3yX/zaMk3jRenCalZI0CtcvkTHP8FFfIQNgdx9/e8ToU66F7W6tNE/kj1zZlPIthliUlk7m5
	MpVQWe6f57/d7QS1NfbvkSctgeMlGAiQFUE2CGfoRlrdjmlVQioz7T9tMVAIGW/ZQ55UFlOmrbV
	8svRLktQchChfkj8dZ6r/tIhUqc9VAOZ/MaSpzdA4NB2MMsOSd5N13RMkGlHh3xmzBvQqXiFb0Z
	M9KbtIDMJ9Vbl6WZI49nPxjqvqYWaPoTP7+GF894R8KthIp3/JqfM/bxwMsWKvpp44y52QonE4K
	iXHw==
X-Google-Smtp-Source: AGHT+IHbI5nRs9M56J22ztjzyvcXIL8I57Igr4lqZlKhfr5x5C0oH/gLGKHadu7CjkSyNXpdSbLboA==
X-Received: by 2002:a2e:a99f:0:b0:372:4d3d:aace with SMTP id 38308e7fff4ca-37609f3086emr82578691fa.38.1760600540863;
        Thu, 16 Oct 2025 00:42:20 -0700 (PDT)
Received: from xeon.. ([188.163.112.70])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762ea14d46sm53226121fa.34.2025.10.16.00.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 00:42:20 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <treding@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/4 RESEND] ARM: tegra: complete Tegra 4 and Tegra K1 device trees
Date: Thu, 16 Oct 2025 10:41:48 +0300
Message-ID: <20251016074152.8759-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Complete T114 and T124 device trees.

---
Changes in v5:
- dropped clock and reset names from TSEC schema
- removed clock and reset names from device nodes

Changes in v4:
- configured tsec schema to cover Tegra210 TSEC as well
- added required to tsec schema
- reset-names preserved for consistency with other host1x devices and align with T210
- added clock-names to align with T210
- operating-points-v2 check https://lore.kernel.org/lkml/20230119131033.117324-1-krzysztof.kozlowski@linaro.org/

Changes in v3:
- added tsec description
- swapped compatible back to use enum
- clock and reset description dropped, added maxItems: 1
- reset-names preserved for consistency with other host1x devices
- dropped interconnects and interconnect-names
- dropped isp nodename
- dropped multiple rest names for mpe/msenc
- dropped tegra114 msenc example
- fixed reset name in second isp in t124 dtsi

Changes in v2:
- dropped accepted commits
- added EPP, MPE and ISP compatibility for T114 and T124
- added TSEC schema
---

Svyatoslav Ryhel (4):
  dt-bindings: display: tegra: document EPP, ISP, MPE and TSEC for
    Tegra114+
  ARM: tegra114: add missing HOST1X device nodes
  ARM: tegra124: add missing HOST1X device nodes
  arm64: tegra210: drop redundant clock and reset names from TSEC node

 .../display/tegra/nvidia,tegra114-tsec.yaml   | 68 +++++++++++++++++++
 .../display/tegra/nvidia,tegra20-epp.yaml     | 14 ++--
 .../display/tegra/nvidia,tegra20-isp.yaml     | 15 ++--
 .../display/tegra/nvidia,tegra20-mpe.yaml     | 18 +++--
 arch/arm/boot/dts/nvidia/tegra114.dtsi        | 64 +++++++++++++++++
 arch/arm/boot/dts/nvidia/tegra124.dtsi        | 64 +++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra210.dtsi      |  2 -
 7 files changed, 230 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/tegra/nvidia,tegra114-tsec.yaml

-- 
2.48.1

