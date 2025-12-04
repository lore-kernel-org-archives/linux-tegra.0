Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508D92E0B5C;
	Thu,  4 Dec 2025 21:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764884229; cv=none; b=mhrpy484Hjkb8ZwLof4MfZz09durQ7+N7munlahjE2QccuQPp2lk3ZxokutgARD8EXA4GbEZMNH1qDKGkw4SgZ/PuUnV/XpINO9/DcmyKEG4midxvdQDG2wHxOdVPUE2BgHJ8lwZE7APB/4p1vqYSif5N6NjLix9Hi/572j194U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764884229; c=relaxed/simple;
	bh=QAsyGF/8PyoWiQ5QXCP5WKI5CwyfhHRlDaQdMfVskoo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XLHgsO1NQXYFLO9s5z18vNNI7pURrVDuJsvWvnzNH0X+hgXbt5Rg+0JOf8W9hbLqwCE28uKolT0olnAIJLOVo7s92xb201g6NJINk+XIWZ7qhJjSg+gQ8RP52M/MTL0tV7WeYDoNAQ8hJpzPwD8Xo4F1VcTdzaT3eDUr+kPODyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=dGwXvrpL; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="dGwXvrpL"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 7AEB06007C16;
	Thu,  4 Dec 2025 21:27:30 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id mAZNnVvXFtYs; Thu,  4 Dec 2025 21:27:28 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id C68626007C12;
	Thu,  4 Dec 2025 21:27:25 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1764883646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hflPBo5gx3XyxntkE8daEw/zN0MgJnRZTJzgwMp1hAg=;
	b=dGwXvrpL/H+KBMDR1JQ2sF8Y5xS1RLyPPhxUTiqYlX8R1rSDGAndf3J20v8M+qFY4XhMh5
	OhwcS+967Spp0R9ugOGE4JSYWF8V74a4gzrvtFRTDtHtWG6/6km6w4Cwq1YWdHIjdQeQ0X
	kJx5E94s+lBGVHGtdPk+KxeaojB/lWoznOxCZ/vVpqOhtFxX2yrNgjZ8ZQKFb0OjfFc3e9
	JvswYUP4PZ18T8Sj49mrDIV1sFGraN5UiYkff+51AadHBw7WrfP7AQchWnyzhT68EDIHqk
	gxYAEDPwn0i8eh2QJe25Su+W0XYUAhM2t5k410IeQLK75MYCvtdtcl9N8xVHzA==
Received: from [192.168.1.151] (unknown [IPv6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 3D48E360139;
	Thu,  4 Dec 2025 21:27:24 +0000 (WET)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Subject: [PATCH 0/5] Fixes to Tegra USB role switching and Smaug USB role
 switching enablement
Date: Thu, 04 Dec 2025 21:27:16 +0000
Message-Id: <20251204-diogo-tegra_phy-v1-0-51a2016d0be8@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALX8MWkC/x3MQQqAIBBA0avErBPSKKurRITZZLNR0YhCvHvS8
 i3+TxAxEEaYqgQBb4rkbAGvK9CnsgYZ7cUgGtFx0XC2kzOOXWiCWv35sqHXw6jVJlspoVQ+4EH
 Pf5yXnD9+EiXbYQAAAA==
X-Change-ID: 20251201-diogo-tegra_phy-86c89cab7377
To: Mathias Nyman <mathias.nyman@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, JC Kuo <jckuo@nvidia.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764883644; l=2274;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=QAsyGF/8PyoWiQ5QXCP5WKI5CwyfhHRlDaQdMfVskoo=;
 b=KjF1um0pLdUosSiNS/s/iJTy/tWxDsKxV4gOvWJBY1xWvrDHF4nedJtAMO1leWQKBkOdqn2b1
 UKvUctL0tdQCg5eZ4e7T4tNQpsXz7B3yeDGysLDHwQ9mwOBnxQQgLKK
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=

Hello,

This patch series contains two fixes for USB role switching on the
Tegra210 SoC, as well as enabling this feature on the Pixel C.

The first patch addresses a wrong check on the logic that disables the
VBUS regulator.

The second patch guarantees proper ordering of events when switching PHY
roles.

The third and fourth patches then add the necessary nodes and properties
in the Smaug DT in order for role switching to work. Currently with this
patch series this feature can only be controlled from userspace by writing
the desired role to sysfs as

echo "role" > /sys/class/usb_role/usb2-0-role-switch/role

with role being one of {device, host, none}.

Further patches will enable automatic role switching via the 'cros_ec_typec'
driver which is currently broken on Smaug.

N.B: This series does not add a 'connector' node under the 'usb-role-switch'
property added on patch 04/04 because for Smaug the connector should instead
be under the node for 'cros_ec_typec' node and as stated above this
driver is currently broken for this device. If it is deemed better to
describe it but explicitly disable the node let me know and I will send
out a v2.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
Diogo Ivo (5):
      usb: host: tegra: Remove redundant pm_runtime_mark_last_busy() call
      phy: tegra: xusb: Fix USB2 port regulator disable logic
      phy: tegra: xusb: Fix ordering issue when switching roles on USB2 ports
      arm64: tegra: smaug: Complete and enable tegra-udc node
      arm64: tegra: smaug: Add usb-role-switch support

 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 13 +++++++++++++
 drivers/phy/tegra/xusb-tegra210.c             |  5 +++--
 drivers/phy/tegra/xusb.c                      | 23 +++++++++++++++++++++++
 drivers/phy/tegra/xusb.h                      |  1 +
 drivers/usb/gadget/udc/tegra-xudc.c           |  4 ++++
 drivers/usb/host/xhci-tegra.c                 | 17 ++++++++++-------
 include/linux/phy/tegra/xusb.h                |  1 +
 7 files changed, 55 insertions(+), 9 deletions(-)
---
base-commit: a8817ff3b5cd99b0a5af57a92d1a3a7980612550
change-id: 20251201-diogo-tegra_phy-86c89cab7377

Best regards,
-- 
Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>

