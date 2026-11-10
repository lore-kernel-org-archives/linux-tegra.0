Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794314364;
	b=i1GtHmrKZJEgkqiygnS+ihXEb6nVRVjR8dCZ7fg5Fz+kXxKOdtb3zQ+GeaXjMgcRcGZF
	 Gy2as8qpSxnKrwlQuZk3BPEPNbSWSgQCOCoZDiWupB9ljYZiLxhIPWq+22ZW3KVaXOKTG
	 7yBlEez5KG4qNqEb/nJ8p+Ojf8J7WUT/ktp9oIKiesAt/0f1lJ2gKqCd9KXdj1dbqjmoV
	 qPHyf/7tczNhtNtW9gJ4/QuVuNqzKJhlChQZautwubsbwXu2+LV/AdFx/FH6d/zZiv9Ox
	 kS0QeJw2qL2cNnh1sR6EBGMa9ZRaIwONJwXxspRU/Wcru5pKmpDI5wECrLL1I7v1dYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314364;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=5rbfN6ub87VSj5g3uxehcp7uqTnHm1v2JJmyLn3wnfo=;
	b=Rv6kAqpX59UVPHMCqk9fIT8V/3EMagVXAqJTqMST9m6Zqf8fIGLpuoHspuh+JsjDxPMz
	 lOp6V2C0oGfw/4wfDNwqcL/iZEd4AjU7KLwHKv3IBXgBYCORaxYtGVyxyfjfsiqniUWqt
	 WK8H1nzEZ5JtDNQ35aBysaAcgp03KM2x+r6k8jRab+O9pFGrY1TAQdZgpWGPLrWynYidf
	 kk6MGWeTqyN6BrxWaUi5Hre2fx8ufp+FMAvp8D3Zse+z4dPJGK33MdsWvkEfkLWWTEtSH
	 A6ptLpB96cH5HptFxfuMxYri15OViCIdvUj50LATfzy+cEydxpMBwuvzADHMBSl3nFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vJgDN0+e;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3524160A2635
	for <linux-tegra@vger.kernel.org>; Tue, 10 Nov 2026 12:39:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3524160A2635
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vJgDN0+e
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-49412eb1474so1246843f8f.3
        for <linux-tegra@vger.kernel.org>; Tue, 10 Nov 2026 04:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794314362; x=1794919162; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5rbfN6ub87VSj5g3uxehcp7uqTnHm1v2JJmyLn3wnfo=;
        b=vJgDN0+ePr6yw2k9O8A+b8WCk1n8P/kv/ZXD0VjZUfizwqBrbl/40OaHpk5H1JJaYy
         7ra4PRCbWwMK3nJR8w2+toz/p/aKVoW3QLepyZN9Aozs2I22xIel2jLc32MrC36Ioquu
         YRjrSInbFlxkCqiGIL6QzzLSaC4NQdjsyLuwlucZ5VlwPczbr54gOpGWWTcJRkzm2k6O
         iLJaBGZgwDnzD152JClQ58fCI0CyRSIcoPAOLXAzgFoCtV3LyIA/cZV+EBIlcmXY+0A8
         AWY5T8AWyPF65WlNL6ANqWBBWFf7qKumEmOsx0pQgGRO9qmDHY4H8Bh4BcRf750adneE
         nL8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794314362; x=1794919162;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5rbfN6ub87VSj5g3uxehcp7uqTnHm1v2JJmyLn3wnfo=;
        b=wTNFfgYiDaor5WSuAjAQ5+aF/brxjyU7n8uYgzf/l3yqreutXw3VnXpW+IK9TWHpaH
         5v6ajqKvEWSJyYgi3xS+jEjvWibG+/lZzFGuwe5FI0l+zSYqkr0rTkOq+GkICykKIOcU
         sjuIQZv7A6M/pqUBP08kMZsJ55tKTp0bigyFS+KI1SpYhunGB4cfsjp2js6pEaqhgOim
         vHsVYruul+pfY70ifY3eC801QZzyNcsdfJ0mUB1EZslKqfnTrvBfC7GC8+fMQkk2C8sW
         aCB7pEPhGfv/jz4GYXMIKonYrLzVBSLDisGt8v8ZinyzhDccQPWc6TH/dsVjeatqGzW2
         MIAA==
X-Forwarded-Encrypted: i=1; AL+hErHzIbhAHJdUWOL52pZvb2b6J7WIbwy6poYlgfUaWCac/r0phrcxEJKQnZUXreSeGLrAVp6/+NwWcMvcZA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+WV7L0jG/HEzZLMeoykqUATf1/vc44fEngoFaN5Lk4UmzOwoA6
	I/w1aKLbjrYH8scoBi2jfz2PucRWYLWf2bmiUGx9YOazL4ibonukUKzt
X-Gm-Gg: AYBFou03jENgd77W2uyNMIpMaG4bCZNpizCtgJOeEW3gSCwqII+dSgCbGzYoNYZSV2P
	lSkdex6WWSQ7I7UA2WXXExZ2KJToIhnAMGh7uTxs/6TtkGVG3M4ngUCZlqsb6PBRiyOad6rUbh+
	wqB8A7cQUjGkHrpv5uhN0/JYQzsbGtEIR7IodDq/AF8wJbtIGpFp8gLYrlhnpoHl0K4T1Qf3euF
	2LZvjrIYd25LAbqTIicTzb9KKlUXvl5ld5uPe4HJC3SohrV5+LoYhSi6XgdvaQKFQySe9R6xS+b
	QTaCQCa7bvQTNiXsy0IeePN3KOh3AzDix0IJ+LPcpaxu7zj6GWFKLAGGVD7QAxmxVTB8RkugdmR
	p6LPX7aIGJhIhUECG4CDEP1wxxsp41G5W7IWW9oqgaIECc8aCKNh+72bs2uKRVqbo0fw79dbwOZ
	hMfD9qriFLCh8T3bCqNGQrqUMrv47PAZat/qrAs+Od5jhpY8GxvT5p9LQJVxJsl7SQQ5SjQo0Ly
	OIsRL3NN6jC/oK8D3igq7tFLdEtQNFRL5B6yiwrRc6qTdNI81AIA3BC/2Pdmi70uSS3rOR98c2I
	yxHct6LkxBMXRwbuLSP8s+gnuHL7AXop2BmIVdWy
X-Received: by 2002:a5d:588b:0:b0:494:6f49:246d with SMTP id ffacd0b85a97d-4982fd3e42bmr4685475f8f.24.1794314362448;
        Tue, 10 Nov 2026 04:39:22 -0800 (PST)
Received: from [192.168.0.15] ([2a02:a312:c59b:a180:251a:f25f:80fa:af1d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498363e0019sm5050033f8f.38.2026.11.10.04.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 04:39:22 -0800 (PST)
From: Artur Kowalski <arturkow2000@gmail.com>
Date: Tue, 10 Nov 2026 13:39:09 +0100
Subject: [PATCH 4/6] soc/tegra: pmc: Add an option to keep the VDE
 partition on
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-t20-for-upstream-v1-4-5923449951fe@gmail.com>
References: <20261110-t20-for-upstream-v1-0-5923449951fe@gmail.com>
In-Reply-To: <20261110-t20-for-upstream-v1-0-5923449951fe@gmail.com>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org, 
 clamor95@gmail.com, Artur Kowalski <arturkow2000@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5931;
 i=arturkow2000@gmail.com; s=default; h=from:subject:message-id;
 bh=RSQhcdhD8zd+9Se8dJwIejTDi+AayGM5TfcHzNLktNA=;
 b=owGbwMvMwCVmYeTc/TaVxZzxtFoSQ9ZngaL411+TulkmKqkpO84Ijl1zaLtWRkLnz06JSXcYX
 ZoPBUV1lLIwiHExyIopspg9FPrCM8/r/YaXWzth5rAygQxh4OIUgIkkHmH4Z9WfdiH5M3fwglqr
 Y2eFCkRVDf7l8MT9cdjAFjYzJ+rpIob/KaVhHkurBb7JPDyhsKkgou9QRtOWDr5JFiaznyZFR+5
 mAQA=
X-Developer-Key: i=arturkow2000@gmail.com; a=openpgp;
 fpr=F60710C8D69E03A01A2801CD87A47D20C2709637

After a warm reset, which doesn't reset the PMC, Tegra20's boot ROM
hangs if the VDE partition is powered off. The driver powers the
partition off when it registers it, and genpd powers it off whenever
the VDE is idle. The VDE driver powers it on again when the system
shuts down, since commit 8f0c714ad9be ("media: staging: tegra-vde: Turn
ON power domain on shutdown"), which covers regular reboots. A watchdog
reset doesn't go through the shutdown, so it still hangs the system
instead of rebooting it.

Add the vde_always_on module parameter, which keeps the partition
powered on, at the cost of its idle power. Instead of powering the
partition off when registering it, the driver runs the power up
sequence on it, which puts its clocks, resets and clamps into the same
known state without cutting its power, and registers its genpd as
always on. tegra_powergate_set() also doesn't power it off, which
covers the legacy power gating API.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 12 ++++++
 drivers/soc/tegra/pmc.c                         | 54 +++++++++++++++++++++++--
 2 files changed, 62 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 0b3c140babd9..81af8aa1482a 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -7571,6 +7571,18 @@ Kernel parameters
 
 	tdfx=		[HW,DRM]
 
+	tegra_pmc.vde_always_on=
+			[HW,ARM] Never power off the VDE power partition.
+			After a warm reset, which doesn't reset the PMC, the
+			boot ROM of Tegra20 hangs if the partition is off.
+			The VDE driver powers it on when the system shuts
+			down for a regular reboot, but a watchdog reset
+			doesn't go through the shutdown and hangs. Keeping
+			the partition on makes watchdog resets work, at the
+			cost of its idle power.
+			Format: <bool>
+			Default: false
+
 	test_suspend=	[SUSPEND]
 			Format: { "mem" | "standby" | "freeze" }[,N]
 			Specify "mem" (for Suspend-to-RAM) or "standby" (for
diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 2c70eedf514e..807977f52449 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -522,6 +522,28 @@ static struct tegra_pmc *early_pmc = &(struct tegra_pmc) {
 };
 #endif
 
+#ifdef MODULE_PARAM_PREFIX
+#undef MODULE_PARAM_PREFIX
+#endif
+#define MODULE_PARAM_PREFIX "tegra_pmc."
+
+/*
+ * After a warm reset, which doesn't reset the PMC, Tegra20's boot ROM hangs if
+ * the VDE partition is powered off. The VDE driver powers it on at shutdown,
+ * but a watchdog reset doesn't go through the shutdown and hangs. Keeping the
+ * partition powered on makes watchdog resets work, at the cost of its idle
+ * power.
+ */
+static bool vde_always_on;
+module_param(vde_always_on, bool, 0444);
+MODULE_PARM_DESC(vde_always_on,
+		 "Never power off the VDE partition (default: false)");
+
+static bool tegra_powergate_is_always_on(unsigned int id)
+{
+	return vde_always_on && id == TEGRA_POWERGATE_VDEC;
+}
+
 static inline struct tegra_powergate *
 to_powergate(struct generic_pm_domain *domain)
 {
@@ -697,6 +719,10 @@ static int tegra_powergate_set(struct tegra_pmc *pmc, unsigned int id,
 	if (id == TEGRA_POWERGATE_3D && pmc->soc->has_gpu_clamps)
 		return -EINVAL;
 
+	/* the partition is kept powered, also against the legacy API */
+	if (!new_state && tegra_powergate_is_always_on(id))
+		return 0;
+
 	mutex_lock(&pmc->powergates_lock);
 
 	if (tegra_powergate_state(pmc, id) == new_state) {
@@ -1319,6 +1345,7 @@ static int tegra_powergate_add(struct tegra_pmc *pmc, struct device_node *np)
 	struct device *dev = pmc->dev;
 	struct tegra_powergate *pg;
 	int id, err = 0;
+	bool always_on;
 	bool off;
 
 	pg = kzalloc_obj(*pg);
@@ -1346,6 +1373,7 @@ static int tegra_powergate_add(struct tegra_pmc *pmc, struct device_node *np)
 	pg->pmc = pmc;
 
 	off = !tegra_powergate_is_powered(pmc, pg->id);
+	always_on = tegra_powergate_is_always_on(pg->id);
 
 	err = tegra_powergate_of_get_clks(pg, np);
 	if (err < 0) {
@@ -1363,9 +1391,20 @@ static int tegra_powergate_add(struct tegra_pmc *pmc, struct device_node *np)
 	 * If the power-domain is off, then ensure the resets are asserted.
 	 * If the power-domain is on, then power down to ensure that when is
 	 * it turned on the power-domain, clocks and resets are all in the
-	 * expected state.
+	 * expected state. A power-domain that is kept on is powered up instead,
+	 * which puts it into the same state without powering it off.
 	 */
-	if (off) {
+	if (always_on) {
+		err = tegra_powergate_power_up(pg, true);
+		if (err) {
+			dev_err(dev, "failed to turn on PM domain %s: %d\n",
+				pg->genpd.name, err);
+			goto remove_resets;
+		}
+
+		dev_info(dev, "keeping PM domain %s powered on\n",
+			 pg->genpd.name);
+	} else if (off) {
 		err = reset_control_assert(pg->reset);
 		if (err) {
 			pr_err("failed to assert resets: %d\n", err);
@@ -1385,11 +1424,18 @@ static int tegra_powergate_add(struct tegra_pmc *pmc, struct device_node *np)
 	 * the domain and skip the genpd registration.
 	 */
 	if (!IS_ENABLED(CONFIG_PM_GENERIC_DOMAINS)) {
-		WARN_ON(tegra_powergate_power_up(pg, true));
+		if (!always_on)
+			WARN_ON(tegra_powergate_power_up(pg, true));
 		goto remove_resets;
 	}
 
-	err = pm_genpd_init(&pg->genpd, NULL, true);
+	if (always_on) {
+		/* as tegra_genpd_power_on() does after powering up */
+		reset_control_release(pg->reset);
+		pg->genpd.flags |= GENPD_FLAG_ALWAYS_ON;
+	}
+
+	err = pm_genpd_init(&pg->genpd, NULL, !always_on);
 	if (err < 0) {
 		dev_err(dev, "failed to initialise PM domain %pOFn: %d\n", np,
 		       err);

-- 
2.56.0

