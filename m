Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5973141C2FF;
	Thu, 14 May 2026 14:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778770534; cv=none; b=t1tuL/bEKFjvg/HuNgBrOmnADyKvgl05al7ynjd3ooBzobnRFkSPV7162WybtvocN+1Lu/jCQs+AvYP0MagOWGoV+vCBbqbXu1Daeo5oFgDiD5/KzkuocRMD7THuReRlwVKe4rCYVWKMVxcXxb7NAqD5ek2uVIA8ksKVVnt3Wps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778770534; c=relaxed/simple;
	bh=ZpsaXMnT8mGaJqAf4d/VAYCqi6dkod4gfaRjgq9A7Bw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=J4U+qUmZGQkDLQqFJvYMQjMu0OIabUFTI5CcysU/p9985+qmxRrRJ3WMQpNlyBlXvvAydoGNIMssroJITXkHzQTSlI72k35y003FdTYCa9C11mVOJ0jTywUXT0uykEBZheKo6biIp9vHEeQaVsdUcuTTxn6zpoqLXQQX9ahgmB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=D59NU0rv; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="D59NU0rv"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 2A7F56000874;
	Thu, 14 May 2026 15:47:30 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id muTaDOIg6hAT; Thu, 14 May 2026 15:47:28 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 4DB63600086F;
	Thu, 14 May 2026 15:47:27 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1778770047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eYXd8HA7NIedKDT16VEUKdG9K7xMUHUqGq+blCrAy2Q=;
	b=D59NU0rvOt5xK4H8TdW4OWgxoGyZ/QHLPKe5y3ciaIviesFMLfoOFf6+JuFvit5g3LQH5T
	I6T/P5Lu9wCF0XkYYLSs2ApDh/3lUc3y4oAp5ZPmb8LdC34upXp2TynafKjoChSAYWluxN
	FnW0ZjiK5Vn/aT8qvxu0CHDGvpc5mFgvfSc68ZCzq9zrV9plNzzJetDCEkMGSKFM9MxGJL
	mnWVn/lhrIz5m7VzpvBV1O5O2PiLTmPpNuy9Y7htfaJiX3/widNU1ytHmQhenhRqIbNeU0
	xceE55r3AqAj+E+3CcAaf4ZOUFllXU6G1ifCm0bBwZgfRpp2sZxkkVKyNaQSUQ==
Received: from [192.168.1.94] (2a02-842a-00d7-bd01-2527-ff0d-f555-b6e4.rev.sfr.net [IPv6:2a02:842a:d7:bd01:2527:ff0d:f555:b6e4])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 9D94D360249;
	Thu, 14 May 2026 15:47:25 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Subject: [PATCH 0/4] power: sys-off: fix Pixel C shutdown via MAX77620
Date: Thu, 14 May 2026 16:47:18 +0200
Message-Id: <20260514-smaug-poweroff-v1-0-30f9a4688966@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMzQqFIBBA4VeJWV9BJYV6lctdpI01QRnO7Qeid
 89q+S3OOYAxETLUxQEJV2KKU4b6FOD7ZupQUJsNWmorjSoFj83SiTlumGIIorLaemOkcs5Djua
 EgfZn+P295sUN6P/3Bc7zAuqVfTtyAAAA
X-Change-ID: 20260514-smaug-poweroff-9626c5501bbc
To: Mark Rutland <mark.rutland@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778770045; l=2142;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=ZpsaXMnT8mGaJqAf4d/VAYCqi6dkod4gfaRjgq9A7Bw=;
 b=/P4GnGyDmcmpOljiLDZFxUjiKx9mtbf0Jo+QarzqIuAHLNZ+yx8kBKj4Cu8dyidx9Qkn3qAES
 vSqDg0koDmyAb37rWOnWoDs3v0hpZq1cm7MmrXt5dFMIx2s71uDXlzl
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=

This series migrates PSCI and MAX77620 poweroff handling to the
sys-off framework and fixes shutdown on the Pixel C (Smaug).

The first two patches replace legacy pm_power_off usage in the PSCI
and MAX77620 drivers with sys-off handlers. Besides aligning both
drivers with the modern poweroff infrastructure, this removes the
global callback dependency and allows multiple handlers to coexist
with explicit priorities.

The remaining patches address shutdown on the Pixel C. Although the
platform exposes PSCI firmware, its SYSTEM_OFF implementation is not
functional:

    __dead2 void tegra_system_off(void)
    {
            ERROR("Tegra System Off: operation not handled.\n");
            panic();
    }

Downstream kernels instead rely on the MAX77620 PMIC to perform the
shutdown sequence. To mirror that behavior upstream, register the
MAX77620 handler with higher priority than PSCI on Smaug systems and
mark the PMIC as the system power controller in device tree.

Patch overview:
  1. firmware: psci: switch SYSTEM_OFF to sys-off handler API
  2. mfd: max77620: convert poweroff support to sys-off API
  3. mfd: max77620: override PSCI poweroff handler on Smaug
  4. arm64: dts: tegra: smaug: mark MAX77620 as system power controller

Tested on a Pixel C, where poweroff now completes successfully
instead of hanging in PSCI firmware.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
Diogo Ivo (4):
      firmware: psci: switch SYSTEM_OFF to sys-off handler API
      mfd: max77620: convert poweroff support to sys-off API
      mfd: max77620: override PSCI poweroff handler on Pixel C
      arm64: tegra: smaug: mark MAX77620 as system power controller

 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts |  2 ++
 drivers/firmware/psci/psci.c                  |  8 +++---
 drivers/mfd/max77620.c                        | 36 ++++++++++++++++++++-------
 3 files changed, 34 insertions(+), 12 deletions(-)
---
base-commit: f327c8ef8a6905ee97b62e42d808603c5b759418
change-id: 20260514-smaug-poweroff-9626c5501bbc

Best regards,
--  
Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>

