Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795369894;
	b=TAuLB6DPGavb61LK7RDR38UsZ8yGR+rKrNDXlRz/bgiBs93dsjFGxzSNktZ8CTR490NL
	 Lz6WmuP/tk62pBSurGa6pEbPkRXXq3IQXBZyshbCeMkuJd9c/MNG0Bx9T+0qFzCpnoi+q
	 UrVqI2G3pXAM40OrIRmkozDSjD5Ze4WM0LCGOWF+auCr5fZvUG/+eQAH6yyvm/Zj0Y8tF
	 kqvlsZLZrTAxyB2FNLW9dBzqkyRRXhr/cAaQ1IiwrtfhfhqCVGosTuwRDmhB2ODOCo0oB
	 mL5upa1Yf03ySPOAuqmM1Qph9BhqC48zd20ie9MGoYFrQqegMOrzbPIViOk078N/iEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795369894;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=YPtwxFBFd1mNC/uRilWu00LLeGau0x3zA5+zUgwM2Yw=;
	b=ldMTUIHKnx4GD10dxpJIT+7klITi75+DW+zXYPydQYTwxoZiZKbAzX4F/f7D5l8IvS/m
	 oQeqOzvePAkVxCb3RGobEyz4o2c6PpsTbUUFR83ENbAgGYzQFVmpPMNGyi5WZurafo8iX
	 DxUwd+iVoLC1f4UfoDnDbX42yaBMWudAM8zpl0phHPBquI46/+l7kPXuTiAbGNuhCPcOT
	 NPJ4EM7B2f4cFGR7IJ0cuUBxWoJlvwu0VHd3mirVawFoafW5fig8vfki1axTPk+hl0/ai
	 DSI0BoqxoY6FRqUxX3uilEVRDMIqBP8G40evBZW5dqzD5eW51ZIp/wP92vG6g3A+vnw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TLVsc6wr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DF5606A338
	for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 17:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TLVsc6wr
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795369893;
	b=w3Sm/eiZnEEd7fk09l5go9efkDnBl8l5hINO04aqRqD9JQ4BR999mpeAiTJIO1X+0n7p
	 WgBk7s0qZHdpgs/JJUMWRnle6Xl2QZPxd2rxvCu9f99qHOocFxffeLSlK+l+XSZ7BD7Us
	 Zud7YjpRdj4o/b0BTnmL46fa09d++Jk+DQE4xkSZtla/hb0UmpsP+7OFuiaO8gRmv+0Es
	 sfZC99dWux/95Nk1hhU0Y4bbOKjEFps7yBl1WFREIt+SSQSj0X66PPcbbVs2b9MwRG+R+
	 NGQ4EAeAWTN0AcOK67BqRbe7BKAoiYxt6NzoSVPok2o7Q/8tx9D5kEY1CbzD9JatRsA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795369893;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=YPtwxFBFd1mNC/uRilWu00LLeGau0x3zA5+zUgwM2Yw=;
	b=gPKm/nz4r/fOYs8GsfKAKLQOChtHmKiNKIcu6oTh9VKlQ86hRuhiOHBACNl+8lkw4WxE
	 RTO3bP32oRlhqjnSCmL7SYrHBcYpKaeIOUABSolgpa/Ir5NagdgR/t8NIVWoHWToWEMwy
	 DIa5C7lgeGFBIw0p3oimmMV8tO9XJxRtI2DXWoEwWVdCF1Sc4bJiXqixRkE5vblZXcPd8
	 bCUcBkC7ZpDojMDbBPbMkIppUGMf7U5cDqOsntqZPLTD4BJ+FEKU+CQTTIx9cmWuQrepk
	 dBcBEgNNQWoTMh7vdomOBEtA8M7tTqKJ8r7z3jkRPkgxCOHiGnTePWcbKYmOBdrAGFg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7126E1F000C4;
	Sun, 22 Nov 2026 17:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795369893;
	bh=YPtwxFBFd1mNC/uRilWu00LLeGau0x3zA5+zUgwM2Yw=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=TLVsc6wrB0+vdjDGDocvJ05d40dRxJH39oxbcmi2a6GfGyRhPrrN2uZzMWxAHGEbM
	 f5ugODNZd/thhDSx9zge5z9FVy31lUk4I9ccU5LZu9Wnn1R3At+KSP6hlc6R3jo/X2
	 CC0Pwmt/r6FRyc1fAZjH1GT9bZN9111WXZseEP36JgEVUuV86Ntzx7svx1YHr0hIXR
	 ed3GfplcjZpLYEjiQVzBwBmHKBhlpSuVT0RmifomnKUUgD+hfdrfhh2yrjx3dmckJI
	 xVtQ3b8WeuK6JCmhoJC5h1W4Gi9m6C8YMAB17r0StMtLiwdcDYYCJsguPPNPF0iDFk
	 Y3dFqzHIfWDgQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 041F74C145;
	Sun, 22 Nov 2026 17:51:25 +0000 (UTC)
From: Jerome Berclaz via B4 Relay <devnull+jerome.berclaz.proton.me@kernel.org>
Date: Sun, 22 Nov 2026 09:51:14 -0800
Subject: [PATCH] soc/tegra: pmc: count the LP1 CPU power-good time in CLK_M
 cycles
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
Message-Id: <20261122-tegra-pmc-lp1-cpu-good-time-v1-1-152c7ad6113a@proton.me>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrDIBAAwK+EPXfBFWpCv1J6ULMxG5ooakoh5
 O+17XEuc0DhLFzg1h2Q+SVF4tZAlw78bLfAKGMzaKUNkdZYOWSLafX4TIQ+7RhiHLHKyuioN4N
 yyl7NBG1ImSd5//b74++yu4V9/ZZwnh/UMceYfwAAAA==
X-Change-ID: 20261122-tegra-pmc-lp1-cpu-good-time-b17680b0a56f
To: Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Joseph Lo <josephl@nvidia.com>, 
 Stephen Warren <swarren@nvidia.com>
Cc: linux-tegra@vger.kernel.org, Svyatoslav Ryhel <clamor95@gmail.com>, 
 Jerome Berclaz <jerome.berclaz@proton.me>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5348;
 i=jerome.berclaz@proton.me; h=from:subject:message-id;
 bh=PUbBsuS8p5NxxEcsj1ST5CstRP8EiMHAWu4eqX4TRzo=;
 b=owGbwMvMwCVmvC9341tRgSLG02pJDNnM2nPmn0/YsUpd/mzBO+vV722cWSOXz8/pfy/tcGVFa
 etcsZO/O0pZGMS4GGTFFFlYGwxT559gCyjUn3cIZg4rE8gQBi5OAZjI+hiG36zrpc2D2PRmT2vf
 5JPdsjJprtgF61/8c6zeu9i3LqvQzGVk6L8r4rpix4WwBx8FIhWmc00y+V9wx0B4BbvDWs4rfbd
 P8wIA
X-Developer-Key: i=jerome.berclaz@proton.me; a=openpgp;
 fpr=058031659FC80650712F9EC233BE6DB1ED151072
X-Endpoint-Received: by B4 Relay for jerome.berclaz@proton.me/default with
 auth_id=1608
X-Original-From: Jerome Berclaz <jerome.berclaz@proton.me>
Reply-To: jerome.berclaz@proton.me
Content-Transfer-Encoding: 7bit

From: Jerome Berclaz <jerome.berclaz@proton.me>

On LP1 entry the CPU rail is turned off through CPU_PWR_REQ and the
system clock is switched to the 32 kHz clock, with an SCLK burst policy
that moves SCLK to CLK_M on the wake-up interrupt (see
tegra30_switch_cpu_to_clk32k()). The PMC counts its timers on its bus
clock, so by the time it counts the CPU power-good delay on LP1 exit it
runs from CLK_M, not from 32 kHz.

tegra_pmc_enter_suspend_mode() converts nvidia,cpu-pwr-good-time with a
32768 Hz rate for LP1. On the Microsoft Surface RT (Tegra 30, CPU rail on
the TPS65911 VDDCTRL, assigned to EN1 = CPU_PWR_REQ with a 0 V sleep
voltage) 2000 us becomes 66 ticks, i.e. a few microseconds at CLK_M
(12 MHz). CPU0 is released long before the rail has ramped up and never
runs. A snapshot of the wake path taken while the system was stuck showed
the RTC interrupt pending and enabled in the LIC, SCLK in the IRQ burst
state and the flow controller out of the halt state, but the CPU0
partition still off and the CPU reset handler never reached.

Use the CLK_M rate for the power-good timer in LP1. The power-off timer
keeps the 32 kHz rate, since it runs before the wake-up. On boards whose
CPU rail stays on in LP1 this only lengthens the power-good wait to the
intended time.

Tested on a Surface RT with a 7.3.1-based kernel (libre-tegra tree) and
nvidia,suspend-mode = <1>: CPUPWRGOOD_TIMER now reads 24000 instead of
66, and LP1 suspend/resume works (20 of 20 cycles in one boot, woken by
the RTC, the power button and the Windows button; resume takes about
0.3 s). Mainline does not have a Surface RT device tree yet.

The problem was investigated, and this change and its description written,
with the help of an AI coding assistant (Claude); I reviewed the change and
tested it on my device as described above.

Fixes: 95872f427eca ("ARM: tegra: add common LP1 suspend support")
Signed-off-by: Jerome Berclaz <jerome.berclaz@proton.me>
---
Found while getting LP1 suspend to work on a Microsoft Surface RT
(libre-tegra kernel tree, https://codeberg.org/libre-tegra/linux/pulls/10).
The Surface RT device tree is not in mainline yet; the maintainer of that
tree suggested sending this fix here.
---
 drivers/soc/tegra/pmc.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 721e9596b07d..f4931dc876d0 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -432,6 +432,7 @@ struct tegra_pmc_soc {
  * @soc: pointer to SoC data structure
  * @tz_only: flag specifying if the PMC can only be accessed via TrustZone
  * @rate: currently configured rate of pclk
+ * @clk_m_rate: rate of CLK_M, which clocks the PMC on LP1 exit
  * @suspend_mode: lowest suspend mode available
  * @cpu_good_time: CPU power good time (in microseconds)
  * @cpu_off_time: CPU power off time (in microsecends)
@@ -474,6 +475,7 @@ struct tegra_pmc {
 	bool tz_only;
 
 	unsigned long rate;
+	unsigned long clk_m_rate;
 
 	enum tegra_suspend_mode suspend_mode;
 	u32 cpu_good_time;
@@ -3139,6 +3141,15 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 		pmc->rate = clk_get_rate(pmc->clk);
 	}
 
+	if (IS_ENABLED(CONFIG_PM_SLEEP)) {
+		struct clk *clk_m = clk_get_sys(NULL, "clk_m");
+
+		if (!IS_ERR(clk_m)) {
+			pmc->clk_m_rate = clk_get_rate(clk_m);
+			clk_put(clk_m);
+		}
+	}
+
 	err = tegra_pmc_init(pmc);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to initialize PMC: %d\n", err);
@@ -3168,6 +3179,7 @@ static int tegra_pmc_probe(struct platform_device *pdev)
 #if defined(CONFIG_ARM)
 	mutex_lock(&early_pmc->powergates_lock);
 	early_pmc->rate = pmc->rate;
+	early_pmc->clk_m_rate = pmc->clk_m_rate;
 	iounmap(early_pmc->base);
 	early_pmc->base = pmc->base;
 	mutex_unlock(&early_pmc->powergates_lock);
@@ -5141,17 +5153,27 @@ void tegra_pmc_set_suspend_mode(enum tegra_suspend_mode mode)
 
 void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode)
 {
-	unsigned long long rate = 0;
+	unsigned long long rate = 0, good_rate = 0;
 	u64 ticks;
 	u32 value;
 
 	switch (mode) {
 	case TEGRA_SUSPEND_LP1:
+		/*
+		 * The CPU rail is switched off at 32 kHz, but the wake-up
+		 * interrupt bursts SCLK (and with it the PMC clock) to CLK_M
+		 * before the PMC counts the CPU power-good time, see the SCLK
+		 * burst policy set up by tegra*_switch_cpu_to_clk32k. Count
+		 * that time in CLK_M cycles so that the CPU rail has ramped up
+		 * before CPU0 is released.
+		 */
 		rate = 32768;
+		good_rate = early_pmc->clk_m_rate ?: rate;
 		break;
 
 	case TEGRA_SUSPEND_LP2:
 		rate = early_pmc->rate;
+		good_rate = rate;
 		break;
 
 	default:
@@ -5159,9 +5181,9 @@ void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode)
 	}
 
 	if (WARN_ON_ONCE(rate == 0))
-		rate = 100000000;
+		rate = good_rate = 100000000;
 
-	ticks = early_pmc->cpu_good_time * rate + USEC_PER_SEC - 1;
+	ticks = early_pmc->cpu_good_time * good_rate + USEC_PER_SEC - 1;
 	do_div(ticks, USEC_PER_SEC);
 	tegra_pmc_writel(early_pmc, ticks, PMC_CPUPWRGOOD_TIMER);
 

---
base-commit: 4843f6873f7c4835e62f2c73ba0fd538e57a2f22
change-id: 20261122-tegra-pmc-lp1-cpu-good-time-b17680b0a56f

Best regards,
--  
Jerome Berclaz <jerome.berclaz@proton.me>


