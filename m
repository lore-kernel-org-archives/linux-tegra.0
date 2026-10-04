Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07C13D16F1
	for <linux-tegra@vger.kernel.org>; Sun,  4 Oct 2026 16:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791132739; cv=none; b=MHWlHA6XAG9ODIz6Vmla6RckFsK4145PD0xu2unooPTviymDSGU3JuR3iCYoHlZbkwdMfxoiGjVi8b/08Cl39MGQL8PUz7ap8/JnZ/N1VPIKA5kpRxhd0XswUl1iVGaeQAE7/1ZpE2gsefUT01ZQ/8FRcA1yzu2nENdtRMZnXvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791132739; c=relaxed/simple;
	bh=v+M6jZZkpPcV65ZunZ7LyGs21aPM4qlR+wPHbDyhJRA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ES5fWFIjrjBHh9hlOERhQdLLf3wJ5kGW/dAzcFiDQjXeq77y528VeXTM1NuLR8q7T3VvMUHfNSBDRokr43yi4YEjWMUPDbPrcUQ6ZMzCys2MVi83tBVo8+7cQh4C4W0Uz8EbB2QGJpHePM1h1Jg2YMB5sBx4e2IXzznlvtRlj7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K/8PimF9; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/8PimF9"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so774500f8f.1
        for <linux-tegra@vger.kernel.org>; Sun, 04 Oct 2026 09:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791132735; x=1791737535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uWLAU/sbLj4UO8gIVZOge/N/7MAezvztdN1AgRtXNUg=;
        b=K/8PimF9FwoLvW9WqIiGJP4GMxTwD1xLltHZWrAfNRIWFb3IcYuPT1DwV/A2uuk2WV
         +itZ3oPLVDIT9BixPyQQX1f1EDA267huN/+CbmeEkl0mTAD39CJ11wJLRQuSoG7CAyYk
         Qd6/eHOV8Ys7SVz2LGG/+1+qgCL4Br2YqcJcMIr7Cn3OTYhwUKldsfhKDbSdqs79w1Bt
         xIwmaBLPrwVclr5ZU5O6Z4/r2+GpvMFZoY76tqa8u9VCN2PvTUq6yLTtxBjf1XMXNrL1
         vNDbBrAFDa8H0KKEdr4oCY5rBwNKu6YBT2Op/BqwLClTIblLYPYFsT+zR1hbAIHQPK8j
         jwMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791132735; x=1791737535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uWLAU/sbLj4UO8gIVZOge/N/7MAezvztdN1AgRtXNUg=;
        b=vC/JuMgCCbhaw9XIZcZBWQPCjrvqKQP0hAkPa1jOb+h9UpWiEwiIbl6ENgrL36BzmQ
         8u06mpIbv4MELi/g6jwfqK+yrpl5w0oXi3XfFTFn8o5k6VlsxZBUySB/62iH5JPFQneS
         /4jzVioWfKy8MPZejfSsRlb2PBsPU3TZsFtnFsiw+cRmzo2puKOh8RLXg0m9mRFGR+pN
         Sf5B0czk8aVBLzk8JsBr6qUCRsQGERFDYEO1Vzo+7fOcfq9YvbA5VmWO6skIL/1u0dol
         8f0EVS6MepYga0gxpgAHIp8RIpRU87CNw6gyFgpxHNL37MGwl9ETymsxyh0gWLybphpm
         cQ+A==
X-Forwarded-Encrypted: i=1; AKwUvBxLKoXAiBiqUQupaoBt627I+Tc01bOvEQYZyH5pVkqsY/eYgv8EYXAbRsWEBHYj4CKRUQoCznrJ6nV1pw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJvRXF0dWOsLyFednLZwAvOt2QpO1qmS7Ce3tFu0ExVQA3A+nlG
	4OBC+QXXPCX6AC+Uq0Ub3tQFBtfTKktkeI9KK4xMsQHYFBpCSwLZBctG
X-Gm-Gg: AYBFou3uWjR2AkX1uEUUenkd44yccla5SGeeCdj14SlevfQIxpn8EkA7+9x6wL9m3Of
	4wgCpnwLDbPj3D7zOaRLdVvGTNXq7kK/mfiR966Jsd2B3OtfxVDvNeB0yUPh9MKdz+ajtuTSDYs
	OnKGx+1bcMYPbG5CxS8t+j+ayy9hmwklg9BfOOyMiOHFGAFzUXyZMhbmoVe1qyZ2NpzZzuYu9Wq
	fNvftuqpagCNl36mDxgsI2iQv6LdG04xP+9oinu1STuWBN2CzQ/jAtARi5UrnG0szbzRGtNO38E
	0QiPXWl1i+YoXXXrnyguZL8tWYAMtn81DPTMr3jus6n3Ke+0bSF8OImZuorrRfNc96uTJmnM9Bp
	DN94VTzk8bUtwrHiwv5f7K+Ad3/e2jnlgn6TMmvETG11B7aA0Cm3JzZu/WJOblJyKu1qjRg86Df
	3rZtuwSEuHld4mFgUrw9xCo7L2qaCkPI/2b4HkSTXcAui1P76TS9jQ62bBJNfn+pBuxhfvTqLcp
	+Y2EZzYAKQ0+V9HklzYQnssgAEuFA==
X-Received: by 2002:a5d:5f86:0:b0:486:e835:ab88 with SMTP id ffacd0b85a97d-48c47fc5cb6mr8242586f8f.13.1791132734865;
        Sun, 04 Oct 2026 09:52:14 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b382f8c4asm20902213f8f.37.2026.10.04.09.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:52:14 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jordan Viknar <jordanviknar@gmail.com>
Cc: linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] usb: tegra: separate schema and adjust OTG logic
Date: Sun,  4 Oct 2026 19:52:02 +0300
Message-ID: <20261004165204.205660-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Separate Tegra specific USB controller props into a dedicated schema.
Adjust USB OTG mode behavior with extcon use.

Jordan Viknar (1):
  usb: phy: tegra: Disable internal USB sensing if extcon is used

Svyatoslav Ryhel (1):
  dt-bindings: usb: Move Tegra-specific Chipidea USB properties into a
    dedicated schema

 .../bindings/usb/chipidea,usb2-tegra.yaml     | 88 +++++++++++++++++++
 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml | 22 -----
 drivers/usb/phy/phy-tegra-usb.c               | 55 ++++++++++++
 include/linux/usb/tegra_usb_phy.h             |  1 +
 4 files changed, 144 insertions(+), 22 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/chipidea,usb2-tegra.yaml

-- 
2.53.0

