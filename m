Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099383FA5E5
	for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 13:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778507848; cv=none; b=XiBqjEtII3ax6x7WJyoM+HBujosbAGSo8RDvVdbXy5+s2Tv3Es4xppJs6whgu0b6J7n9UqoVS5aKVuvjg0GQeD6OiQ5k+XEqbFwF6EFcwR/ApjilT4lLK8Nrl+c3uQf+3BoGXWuEmfsAOELxFSebfijnZxrTS9FNVzZ2JIsnE6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778507848; c=relaxed/simple;
	bh=kC4DSO7lEOOKLgNDNQTeigNoYcFvo7FOe74XyG/nGrE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EXypnxsepe+vtfNDsSbOz+u5Pjsg0MMRXbSuplZcxy3zH+MztVa5grOzOPUiOHMm9bIH2tB1sNUGzSgQ8y2IJilXqvgT8J1B1h/Zcr8z48PP4l7IlnINTegvHPU6IBXoLpD54sIvQmBGCG1lErUk8v88NjvxN29snMme4whk0a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O6s1o+Eo; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O6s1o+Eo"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-672645dbfeaso4528712a12.0
        for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 06:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778507843; x=1779112643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jKhdwsAy/86G+JOwXd2p+pdbXnbrja7bwh3PVXwh7m4=;
        b=O6s1o+EokPZ/vWnPsmsKyx5Ei9uZcDJWti+ZFv8hC+jHsWr6oAPXk0pIAR0Cqv8fDu
         Xy8CkOJJ30Mx1ekmPtxKUg28YkVeziO8oiMX1cH2iEsMAOdXbKVE1QC+ShJvh2MyHyoQ
         uuPgIU8AVRu0cNLHP9g3Gi6bkV3ZVIIOWN5vcKzQvxDofG/oXfh0H0NAB6RnQz8H8pTa
         +5ZGui77KCjsXMSqI4NYjoRgePzAwsJt6xWhVuiDAgm6R8XD5+YqdM3IIjbLF4OtbnnN
         IC13ErPxw0Ai3qnXNMwbDQ6G67Mlnz4Es9JHQHTLjJl43kEzW7ZYAF7pu9r4Vmq1pRF6
         I/Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778507843; x=1779112643;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jKhdwsAy/86G+JOwXd2p+pdbXnbrja7bwh3PVXwh7m4=;
        b=hw8px1WF1kpyvrmv04NivJrVDk/ZBwkd/2j1QDGgkej8un9M4WobHn9nFA/65FkJWb
         qDhrHYD1HpQu4+Sd001zLtJAPsSACov92rtK+UtDFN4z1ZsnAGKa0Y2XtcuusDJPRSm8
         bC33zA108JBC6CIGhgK3y3TcB1LmJRUDH+L3mlva7Z5TmItlSGwc4/srBOJ7Qt8J6SmY
         yCGmwxn4CuRWWlcaERBMduWq/77f9bQIELKSJM3SaVjklzUl77FzNtn5At5/ZNsl3RoC
         3cNq8UAwopQUQkFjj99BOm5VvFk3w5yQuWpVB267KJWVx1SaGr6btLRsmvPuSDyPKIdg
         TJlg==
X-Forwarded-Encrypted: i=1; AFNElJ+OtrqjZmYVa6Xl7VEPShhSe1pT/HEI2KWOV3Q9k0zo5hu92RFHs2brOllQ1TLEk00ZGObp7nyWBXZA+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc6qAxY0WcN9mv+2kTub5rpA8AR9hEWSkZGjGJWKTx36/f/HF1
	KWgs91vQLGuGJ+itGCsZX99++BdDRdk+O7R6mi85rsE+z6rkbgxYZtE6
X-Gm-Gg: Acq92OEHx9zqgJS+1ul4zWT1buSXd/5FvUsu1jffF6pHCc9vJ1ECJkPRHmjxFdq6aW2
	tP6kDHKMTkvvgAPls75a1gIkNyVeLEtOWZNegtSwmKBtoFktfkK5zct7Kql+IZd47RnQqGkV3iX
	/6YZOqyHqnFyFpw4STLx40TlL1xyCNq8kVJSSjsn8FpdePQ5QP1Mi/TMNzC5QVMBT+RMXLRFVoZ
	t7HF3mPLS0bD9L54ixQP86bgr5/7A1sm7m+VPhk9WbLPQjMXa7/s663GS+hzVIK8/VpG8mGxu8K
	v8qiUHInH2R4k0GwU5ANj/iTacOzunyh2wmpx4tYhYzSSOieP4tSFfpiNwUEoGsUgnS2xBsSCGL
	k/wPnEgbheYStYMlM3BGzRxvk3AobmOAP6tUicDpsvnjS+LoEapHsAUEunaM0hPDcnX45JUQx2G
	rJM8Tt1taLPCo3
X-Received: by 2002:a05:6402:278c:b0:67d:a63a:deb1 with SMTP id 4fb4d7f45d1cf-67da63adf40mr11744584a12.5.1778507842405;
        Mon, 11 May 2026 06:57:22 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0b3b904sm3685357a12.1.2026.05.11.06.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:57:20 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Chen <peter.chen@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH v1 0/6] Add support for Infineon/Intel XMM6260 modem
Date: Mon, 11 May 2026 16:56:55 +0300
Message-ID: <20260511135703.62470-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Infineon/Intel XMM6260 is a 3G-focused, slim modem platform designed
for smartphones, data cards, and Machine-to-Machine (M2M) applications.

The modem is typically connected via the application processor's USB line
in HSIC mode. To function correctly, the modem must control this line, as
it requires precise timing to initiate or de-initialize the USB connection.
This control is necessary to successfully enumerate the next stage of the
USB device loader (moving from firmware loading to the actual device
interface for example).

Patches 1 and 2 adjust the Tegra-specific portion of the Chipidea USB
controller to allow for the disabling of automatic PHY and USB controller
registration. This is achieved by adding the nvidia,external-control
property/flag. It does not affect any existing configurations, but it
allows the USB line to be registered or deregistered by an external
device — in this case, the modem.

Patches 3 and 4 add support for the generic portion of the
Infineon XMM6260 baseband modem, which was used in many Tegra-, OMAP-,
and Exynos-based devices circa 2012. This driver provides power sequences,
manages initial communication with the application processor, handles the
SoC-specific modem PHY, and verifies that the modem USB device appears
correctly.

Patches 5 and 6 implement support for the Tegra-specific modem physical
layer, which handles the registration and unregistration of the USB
controller.

While current support is relatively basic, this configuration already
allows the modem device to appear in the dmesg of my device
(LG Optimus Vu (P895)):

[    9.427014] ci_hdrc ci_hdrc.1: EHCI Host Controller
[    9.431488] ci_hdrc ci_hdrc.1: new USB bus registered, assigned bus number 1
[    9.457197] ci_hdrc ci_hdrc.1: USB 2.0 started, EHCI 1.00
[    9.460370] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.16
[    9.468470] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    9.475597] usb usb1: Product: EHCI Host Controller
[    9.480508] usb usb1: Manufacturer: Linux 6.16.0+ ehci_hcd
[    9.485913] usb usb1: SerialNumber: ci_hdrc.1
[    9.490862] hub 1-0:1.0: USB hub found
[    9.494005] hub 1-0:1.0: 1 port detected
[    9.657191] usb 1-1: new high-speed USB device number 2 using ci_hdrc
[    9.844726] usb 1-1: New USB device found, idVendor=1519, idProduct=0020, bcdDevice=12.74
[    9.850530] usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[    9.857594] usb 1-1: Product: HSIC Device
[    9.861606] usb 1-1: Manufacturer: Comneon
[    9.865627] usb 1-1: SerialNumber: 0123456789
[    9.908739] cdc_acm 1-1:1.0: ttyACM0: USB ACM device

Svyatoslav Ryhel (6):
  dt-bindings: usb: ci-hdrc-usb2: Document nvidia,external-control
    property
  usb: chipidea: tegra: Avoid controller/PHY init if bus is externally
    controlled
  dt-bindings: net: Document Infineon/Intel XMM6260 modem
  net: usb: Add Infineon XMM6260 Baseband modem support
  dt-bindings: phy: tegra: Document Nvidia Tegra XMM6260 PHY
  phy: tegra: Add support for Nvidia Tegra XMM6260 PHY

 .../bindings/net/infineon,xmm6260.yaml        |  72 ++++
 .../bindings/phy/nvidia,tegra-xmm6260.yaml    |  58 +++
 .../devicetree/bindings/usb/ci-hdrc-usb2.yaml |   7 +
 drivers/net/usb/Kconfig                       |  15 +
 drivers/net/usb/Makefile                      |   1 +
 drivers/net/usb/baseband-xmm6260.c            | 335 ++++++++++++++++++
 drivers/phy/tegra/Kconfig                     |  12 +
 drivers/phy/tegra/Makefile                    |   1 +
 drivers/phy/tegra/phy-tegra-xmm6260.c         | 144 ++++++++
 drivers/usb/chipidea/ci_hdrc_tegra.c          |  36 +-
 10 files changed, 667 insertions(+), 14 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/infineon,xmm6260.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra-xmm6260.yaml
 create mode 100644 drivers/net/usb/baseband-xmm6260.c
 create mode 100644 drivers/phy/tegra/phy-tegra-xmm6260.c

-- 
2.51.0

