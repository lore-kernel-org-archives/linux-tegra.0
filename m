Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A385A5519B6;
	Wed, 23 Sep 2026 16:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790181930; cv=none; b=ajl+mqKPxMIQXOEPkTJD3thRCAdLGqLYihy2jbumBzrtxpTO7aVA5ioqfIoG+jVPtOQgTGWbzt6mwpCXbB3gmdMO//mWUvoBLSvTGDD21D6YvTcHMUHUXs0fiBNBu36feepj0Q6OsnuNnlXj9ZZeWjZX65/0TAiRXVkCC4A1oBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790181930; c=relaxed/simple;
	bh=ndQ/W86sQaqZf0V1k0ctnD629QwuWYPIvmxVOeI4f58=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sVP+avM2hm9u1sHsFajZ4RpRFgpzXfqy5+SNV94P9oT2dl6DLTtPwGElBTdp9+tqTqRAIpCSN47jBXhtiiRevC4yt/JwYXBT47mKMorRQFEhTek4+YfOMWMOl4q/GaFRFh6c88ZrINWbsCbTH+/0AByyfVgQUGCp3e36tceaUOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=LtLD6lef; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="LtLD6lef"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 837A86005407;
	Wed, 23 Sep 2026 17:45:18 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id Ae_8Fxp1Da5o; Wed, 23 Sep 2026 17:45:16 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 193C6600540B;
	Wed, 23 Sep 2026 17:45:16 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail2; t=1790181916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pYiByiAW26TQsM/xP6y2GkdODf0Q7x3s8xhMCxUBYmI=;
	b=LtLD6lefuuMDNngHDLHY3ecj/I4tPkvAWOmMSa/RT7OpBcbLmJtR98n8+GhiLRi2madYgt
	Q1GHWn2emdl/NuokVGp4HHEkOxnRXEVsIVKgJx2iN5DzSuBD4kOn3KDIl9FpqvrgyBYHj5
	HAdz+UM9bLFpUQTseFD2Uam3e27WxvzTXAuTJrcpoBdVBWR+ESSmVjhKhcHPbbnLNiuVKl
	NFi5jwHak5l44+OY8abXyCWc+1dkmqS6k9FQq2WSCukjk/0osOISmpVbfjaqvBLO0jUcpQ
	v10NJ0ik4O2gLPh0GPdiYi7ByVUp2i8WdRYMookJsXNiFbxt2eWEypFqNR3xhg==
Received: from [192.168.1.82] (unknown [IPv6:2001:8a0:67f3:eb00:ee56:8d5c:4e29:8df0])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id A105836012D;
	Wed, 23 Sep 2026 17:45:15 +0100 (WEST)
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Subject: [PATCH v2 0/2] rt5677: add mclk to DT binding and define it for
 Smaug
Date: Wed, 23 Sep 2026 17:45:09 +0100
Message-Id: <20260923-rt5677-mclk-v2-0-6ca31e8f68a4@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Nyw6CMBBFf4XM2pqWAg2u+A/Doo9BRoGathIN4
 d8F3Lo8ybnnLhAxEEa4ZAsEnCmSnzbITxnYXk83ZOQ2hpznFa+5ZCGVlVJstMODdVI7VThTSBS
 wLZ4BO3oftWv74/gyd7RpT+xGTzH58DnuZrF7/8uzYJwZJXSpZSllVzfG+zTQdLZ+hHZd1y9Eq
 2rFugAAAA==
X-Change-ID: 20260903-rt5677-mclk-f3ad74db43e1
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Animesh Agarwal <animeshagarwal28@gmail.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Oder Chiou <oder_chiou@realtek.com>, 
 Ben Zhang <benzh@chromium.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790181915; l=1076;
 i=diogo.ivo@tecnico.ulisboa.pt; s=20240529; h=from:subject:message-id;
 bh=ndQ/W86sQaqZf0V1k0ctnD629QwuWYPIvmxVOeI4f58=;
 b=M+mYxjCyroAinyBw5WHYubUnq0JsSRzBAR6ExPe8Bus1G9/3VnnJKoCTo1VxLgsGyhDr4SC8H
 t4MT2wYoTINDnoZRPQHkqniA59l3U/i/1i8djLUb3h6LOnZG77jmx4D
X-Developer-Key: i=diogo.ivo@tecnico.ulisboa.pt; a=ed25519;
 pk=BRGXhMh1q5KDlZ9y2B8SodFFY8FGupal+NMtJPwRpUQ=

The RT5677 codec has an mclk input that can be fed by an externally
provided clock signal. This small series adds this to the existing
device tree binding and defines the clock that is connected to it
in the specific case of Smaug.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
Changes in v2:
- As there was no feedback from Realtek's side rename "mclk" input to
  "mclk1" as it looks like the codec has two mclk inputs but I cannot
  confirm this at this time
- Link to v1: https://patch.msgid.link/20260903-rt5677-mclk-v1-0-b71a5a3533f9@bootlin.com

---
Diogo Ivo (2):
      ASoC: dt-bindings: realtek,rt5677: Add MCLK1 clock property
      arm64: tegra: smaug: Add rt5677 mclk1 input

 Documentation/devicetree/bindings/sound/realtek,rt5677.yaml | 10 ++++++++++
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts               |  2 ++
 2 files changed, 12 insertions(+)
---
base-commit: 2616c70ea74afbf077e040fd538a9a97fb05a5f2
change-id: 20260903-rt5677-mclk-f3ad74db43e1

Best regards,
--  
Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>

