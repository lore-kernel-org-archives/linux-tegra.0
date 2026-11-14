Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794665584;
	b=dLRQZkdf/7gfGKbAODbP47VQzt8WruSNV3a13cYMdPGMhqtAzqTULPKKYS3DPfoLIP7B
	 tjaaYssHe4SFA+cY/7MhuafIbvDUNKMxhZSio8FYq0oG2Xgt3g/og2Mpw24Ey9524posk
	 5vWWUBVHhGvCv+MbZtSQuN3pow3+BcBu3m25980G3G1VCAnJtLKhqFMUF9zZ3mGPiw8Xp
	 Vknhqj2PNWWMkpfs5zL39NgBnAV3LRc6Fh3KU9qodo6aAwwEnI2XV1k1GkiZTXcoxnPzv
	 eZMP8+BhPobjPb5r0gjEhjddGQCV/nOl7aZIDA9bQ2Rb79ccqkxlCrjl+ZmylYuo2nQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794665584;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=7bD/tTxkN5IVY6wxaY9USIisxYaqviNPjAz31Te7PWk=;
	b=3CH/qdrgSOW+2fRmmO0EgewU7gWvw30tiHbvCicAOuOvgDAhymA4egXbqUjezo4wLWbq
	 DYmsZUoZlStXCRtnIeGVT4ZlMEQW5++co9o+Xire/S5nZhUGyOQ3kPnH8s0TV/LhDHwjQ
	 yugeaARKBUkwQ2f+lxD5tAYza+GxF501Y1hOA4VWIVOuz7LXr02cMctKTTZ8JxqpLB1Ur
	 3RDbHdzIb2DaW2Icn9JMCE8zj1GHllrM3SFNJ2aIBgYTUMW9PyZNH855wefz64w2M5cic
	 d29k8cAQTCf/LDmmFtSGhm3L0ql+wF6S4IVdqdBGmlsJs4csCcBcyHXNmjJV62aJ5bQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L7pm6wqL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27002606A327;
	Sat, 14 Nov 2026 14:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=L7pm6wqL
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794665584;
	b=ka+KsQwPaigpxqQxEO8YQeuhR/QtWX3iWuhx2SugI0bwFvjA/1SnbJz9fhZknbIYQTBA
	 shB8g88/h5BXguBG80rWE9pyJZB1amkAMUAKJq2DcI6qVCwdXg00QL2di3LptBKcVthVR
	 J4acPoIN1ufDVGGo+oLZC8qJ+CKe2pW5tpKBLIPelS5feGSL9pF5GcykMaz1kmmf0L2/H
	 q0YPK10Arf/sNl6BLtxpLGui0ej9tRT1sZEQTkvCSv48gBQQKeJnT6Iwzexs/plfE6rDS
	 Oni6TweZ7Dl1DsdRmjXoHGtfAwGZoVOhSHU8YMYUTKfKr58NQbZxbVVBrY+0wjgWn1w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794665584;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=7bD/tTxkN5IVY6wxaY9USIisxYaqviNPjAz31Te7PWk=;
	b=orjw7CCO9vUJIaNBaCo9jVhWfger74Z7NKFTBX+3b9s+eDJ/6HF/1FgUuRkUNCWdsrJd
	 XDDPSitPppT+RE4zvE15OaBHfunZ2HlMiaFz+VYQmY8db2H1sO/6IEYtLE23KEuMi9/NC
	 dWeCSz4bZqbjAckTU5xDbpzYAtzB+98rbGOlhV3zOuXw4HUx1GQLYMtAqqXSJUmDnkBVM
	 gJmlBfNtNW8/z+vvKxqmVlAgp0wFhvJ1H752fV/W7cvpfc/v1abhPAsQvC48AGTGgq1N6
	 UhRL6v5FjCa7ShFTteUtcz892NlXLDt81Z9+ckEE5vxrLjB5k1q0rAf9WoLfiZcBZiw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6F1091F000C5;
	Sat, 14 Nov 2026 14:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794665584;
	bh=7bD/tTxkN5IVY6wxaY9USIisxYaqviNPjAz31Te7PWk=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=L7pm6wqLXJPMvFyNzKr+arToKN/2jtrqHliKuqzp5ts3WcPJpjAXXwCzpFUEV8Out
	 fYY+1FDQQx1svbJbirzgJ8VbDA1REkwhEa7pifapd335eCxLpDerKxSpQ8DCsmW46+
	 bnr5B3KJipEVip64ygNdJhKDn0EVYzYVGUW5yUxm3a+h0ePIrFK+/t7FOVHOTEoCWC
	 MFn+b4U4Zk78h8R18alUav7q4WmPXV0TblCfVCP5RNxvmm9+Zybg6i18w0jBt8wRY8
	 4iZQz+9YO/Sfu/ZGQjCxXrQCgWJyeI/y5rkOnt/OAFCGZ/5XBcPH7jwbXZINMS0cOJ
	 zeJMrJ8W+Racg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id EDC8649DDA;
	Sat, 14 Nov 2026 14:13:02 +0000 (UTC)
From: Volodymyr Chapman via B4 Relay <devnull+volodymyrchapman.gmail.com@kernel.org>
Date: Sat, 14 Nov 2026 14:12:49 +0000
Subject: [PATCH] ARM: tegra: nyan: Enable the 32 kHz clock for the Wi-Fi
 module
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261114-nyan-wifi-32k-v1-1-311c6f2163d4@gmail.com>
X-B4-Tracking: v=1; b=H4sIAGBs+GoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0MT3bzKxDzd8sy0TF1jo2xdS0szkxRjU0PjJPNUJaCegqLUtMwKsHn
 RsbW1AMJLh35fAAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Volodymyr Chapman <volodymyrchapman@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794665582; l=1933;
 i=volodymyrchapman@gmail.com; s=20261114; h=from:subject:message-id;
 bh=ZYcx9OmFDEjiXweNhRDW+WsVewYRwZNRDfsX+1SjsDc=;
 b=NMdixx4IBeNvJhZM1A6u2yGr3+ELQuQjkDfkP8V8Bcrh/XFhHeTIMPhoj9VEJ16PrrFP1lz20
 sN18NkBfuSPAcuuarT8GdILuCfV9gx2CI+nazixyLImdiEMivERyqGw
X-Developer-Key: i=volodymyrchapman@gmail.com; a=ed25519;
 pk=MFRHEFOAD35s30Ob7oHqbHPECBoWpPLCMrM4ekqB900=
X-Endpoint-Received: by B4 Relay for volodymyrchapman@gmail.com/20261114
 with auth_id=1527
X-Original-From: Volodymyr Chapman <volodymyrchapman@gmail.com>
Reply-To: volodymyrchapman@gmail.com
Content-Transfer-Encoding: 7bit

From: Volodymyr Chapman <volodymyrchapman@gmail.com>

The Marvell SD8897 Wi-Fi/Bluetooth module on the Nyan Chromebooks needs
a 32.768 kHz sleep clock, which these boards take from the PMC blink
output (CLK_32K_OUT_PA0). Nothing in the device tree requests that
clock, so whether it is running when the SDIO card is brought up
depends on the state the firmware left it in. On warm reboots it is
usually off, and every attempt to bring up the card fails with:

  mmc2: error -110 whilst initialising SDIO card

leaving the system without Wi-Fi. Toggling the reset GPIO on each retry
does not help.

Describe the clock in the SDIO power sequence, as the Tegra30 Asus
Transformer and Nexus 7 device trees already do for their Wi-Fi
modules, so that mmc-pwrseq-simple enables it before releasing the
module from reset.

Tested on an HP Chromebook 14 G3 (nyan-blaze) running v6.6.144: with
this change Wi-Fi came up on 8 out of 8 warm reboots, against 1 out of
22 before, and on 5 out of 5 cold boots (4 of them on battery), and
the clock summary shows pmc_blink enabled by pwrseq-sdhci0 (ext_clock).
nyan-big shares this file but was not tested.

Signed-off-by: Volodymyr Chapman <volodymyrchapman@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi b/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi
index 89a749c..c98de0d 100644
--- a/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi
@@ -645,6 +645,9 @@
 	sdhci0_pwrseq: pwrseq-sdhci0 {
 		compatible = "mmc-pwrseq-simple";
 
+		clocks = <&tegra_pmc TEGRA_PMC_CLK_BLINK>;
+		clock-names = "ext_clock";
+
 		reset-gpios = <&gpio TEGRA_GPIO(X, 7) GPIO_ACTIVE_LOW>;
 	};
 

---
base-commit: 97d73c8251226cf27cc6656b4c542869bb8c69fa
change-id: 20261114-nyan-wifi-32k-9964d3513b7e

Best regards,
-- 
Volodymyr Chapman <volodymyrchapman@gmail.com>


