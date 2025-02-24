Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EF5219300;
	Mon, 24 Feb 2025 12:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740399980; cv=none; b=KCkIBHgJsmgsKAtxBZuE2UvhAD2Gfb1b5cRYb++MwOB9iSkiG1CaKdKuVPtlXPjXV21K0s7T0E9z71nCGvU5wzUt7i+LRdXT9BGIKoIP1pKkyToLMbV+PT7IoBkd3eMagXaEjl5rycTnEF85Z+pWvBVBbSWHmdH2OULnLlsXC8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740399980; c=relaxed/simple;
	bh=G2N23KBDZVV/hHfklrc38BAnNkdsiijRT8unv63gSxk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=m1WA1CTDrix8HDptQ8W74k7Q5GcTqI06570fX2yPPZGxmbGl+2cOIwEQC+ktxj68tAMFRq6ZMImvWeWL7fF7f23xcpbdAURP1rgYGJq26yLXGMMxqX8hLnDWNP59Vz3rrrDtvMbeFjMEfJTS9tz1/ADqkfduV+0D8uH7yAJkdn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=K/ekEqEO; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="K/ekEqEO"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id CA92E600023C;
	Mon, 24 Feb 2025 12:17:51 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id y6bHkwreMmQl; Mon, 24 Feb 2025 12:17:49 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 84A7D6000222;
	Mon, 24 Feb 2025 12:17:49 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1740399469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eUghrrODC5tYhJWWxxitsDp6QHNc46doVfbUxtKXhPk=;
	b=K/ekEqEOkW6Lup0Ki8fo7kRM/u64l7Kq6ENY4EpNHs/CjxEyLDBDnUZ7Gu/7co/n2BEl9j
	4DS1DYPN10lCjDzu6h1ACuEBqc66g0MvTTJ28tBBUD0zhRE+mz1kGcsQfBhy/a+6HHucTn
	Hj4HdEwBsIspTWLP4BJxpVRGUGtcdb0=
Received: from [192.168.1.72] (unknown [IPv6:2001:8a0:fbe2:fb00:fc96:36d2:d34:1e80])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 1CC9036012D;
	Mon, 24 Feb 2025 12:17:49 +0000 (WET)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Subject: [PATCH 0/4] arm64: tegra: Small hardware enablement for Jetson TX1
Date: Mon, 24 Feb 2025 12:17:35 +0000
Message-Id: <20250224-diogo-gpio_exp-v1-0-80fb84ac48c6@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF9jvGcC/x3MQQqAIBBG4avErBNsSKiuEhGRvzYbFYUIwrsnL
 b/Fey8VZEGhpXsp45YiMTQMfUfndQQPJbaZWLPRzKOyEn1UPknc8STFzhpzYpxmHNSilOHk+Yf
 rVusHxCUJh2AAAAA=
X-Change-ID: 20250224-diogo-gpio_exp-2fd55ce489ea
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740399469; l=1333;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=G2N23KBDZVV/hHfklrc38BAnNkdsiijRT8unv63gSxk=;
 b=mE/BN4tb/ccwuOkH/IKl3s8ubezZ/zCen9t6QmDIv6rOzRE5nkcdL4coPjYxYTftAsOWzlkY9
 TrsaMKH2HVRBhJQm6JIaGFhznfprsxiyp/94rrNtGoCGYag7TqBDPs2
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=

This series consists of Device Tree changes enabling two features:
 - Using both TCA9539 GPIO expanders found on P2597 as IRQ controllers
 - TMP451 temperature sensor found on P2180

For the first feature some preparation is needed:
 - Patch 01: fix the enable GPIO line number for a regulator, freeing an
   	     exposed line on P2597 expansion header J21
 - Patch 02: add voltage level pinctrl information
 - Patch 03: fill the TCA9539 DT nodes for IRQ controller operation

Patch 04 simply adds the TMP451 node to the Device Tree of the P2180
module.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
Diogo Ivo (4):
      arm64: tegra: p2597: Fix gpio for vdd-1v8-dis regulator
      arm64: tegra: Define pinmuxing for gpio pads on Tegra210
      arm64: tegra: p2597: Enable TCA9539 as IRQ controllers
      arm64: tegra: p2180: Add TMP451 temperature sensor node

 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi | 13 +++++++++++++
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi | 20 +++++++++++++++++++-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi       | 10 ++++++++++
 3 files changed, 42 insertions(+), 1 deletion(-)
---
base-commit: 737742d382b6d05aa785f041723cc7f10d4824dd
change-id: 20250224-diogo-gpio_exp-2fd55ce489ea

Best regards,
-- 
Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>

