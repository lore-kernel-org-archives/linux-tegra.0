Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795554384;
	b=OR47uioUwRq4Y6ZNCg8DPdeHeJa+x4hxu2X1TtQXA0CXpzhGKNuDra2bBiS6cJWcEwD0
	 GkwjjfzETsOBTS4HKsXJ3Ty/QuEtl6x2f9cZbdkUU06TIzbuZaMsJjnat6MsQCuFpDrNw
	 hCK8epUrPF/Vg8r5tVAj9eYtZTyjM/q2dYPqZ49tJWf2R9nv1XOo4ZYD2yptXRdlzLpv/
	 nJ3r9k9BKVq822EA00iTVCvn5yUxKnsRhMcblgFOqsPkOVSQdvqqWdtGcidS6MMQG0pDY
	 3MVSElryAhWg5zOFFoBWDMH0ksn44kU+AxOdntR4kDeLLad5WpXN/VoL0uJuMEMHagg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795554384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=mwwyg1wadSz/IGArbbVIMcgSOkUHtQo++G3SrtkcA/E=;
	b=VRouvkD2R8xN+CTPl9rVPXCzBTLtiedZif3pcsSX4SWPa3LNgjx9f25sXIqHFr/sSoq4
	 ZfPcpndVWSYAdHNV21+oSyaLM64uvID5q3Wf2fwRT/pSlN64uuDQAzwgzhQ+kzjSctI1u
	 89Xeubp9lpnBwtSxKNstCqG4TmDs9UxaWYIgt4d/rPEOmaAYvy/bz0QmjnEv5Zgx1d4KL
	 +xarvo3GaULvklgQiSeFWbPceN9gxLzonGCFadkZN1/S6sKaSKjV7krhKWvCwVK8fcJmY
	 nHi5Kqaink03c4OOZGUGeAaa1BD7NverLH7Fq67HMDvdiHnBWfu8k8uRkoDxtmLV/uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fqkTrU4n;
	arc=none smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC58606A695
	for <linux-tegra@vger.kernel.org>; Tue, 24 Nov 2026 21:06:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FC58606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fqkTrU4n
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5c1a947b4adso4068921e87.2
        for <linux-tegra@vger.kernel.org>; Tue, 24 Nov 2026 13:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795554383; x=1796159183; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mwwyg1wadSz/IGArbbVIMcgSOkUHtQo++G3SrtkcA/E=;
        b=fqkTrU4ny69e7tF0XWtdxeXgE0hs/VMk7P/hJq2x87A773A7q9BNLzevXjud+3ikPk
         RAyD4KJepcS3T/qEfPCYqswEy9t85mNYN1mw80IuxlJ0lqoEIgiRpbLEzxk+FFGuE71j
         xV+UzXmk6MZDPX7tDnBdQZFLq0AtKaClHPBiqrBcSbTePTMvkoFSfd/jTYoRtA+Q3tpZ
         t1riYQfDkNGWWhcYCB9Y4ImuSEOO5kwIN8NrhLXax4OLevrF6OffB3JfuEbS1zKd59aP
         Gprhz51IuE1BOE9nBIHRil26bx6N8CkyS3O76jTDZVMGXqzp/wsI6SqAVqcDcut3OQk0
         NKSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795554383; x=1796159183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mwwyg1wadSz/IGArbbVIMcgSOkUHtQo++G3SrtkcA/E=;
        b=1BnEfT2J7v+ntK+rEFmjko1XycGgQBrTooelZJEtoj8lUXq43OwfYLWRibtG+4AeXe
         xDlqFszvvhJdFIrW/G9eW1EoJi5P3I1iKSMLq9tKhFWBFaDiv7RwLPRj5A1EV1t20O9L
         BUpiIKIDFFgF99kcvOAfD7PR4zVbfAnMc7ofNePAiVigwXANnNmb7N66ZmenmUY0xLo3
         KfylD30LYOXwnMznaEIaOPdHk4rLsiEhWiPPLNxgZpP36cRAKg3/EDT24Cl6JP92hke3
         o6DfJ4PAvrFxURWyINuV0ugBAoPWiTIC/thr9BilseTbsJmMqjqrE18rpj+Cu89LMA21
         fDQQ==
X-Forwarded-Encrypted: i=1; AL+hErGeupDnRLLLTg8RfcvEiulM4d82Lz7gxAOVKYSt6ipL1MuHFaAoA2Tdx3YOTE/aI2YM6kbnKs6uf5sCPg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+ucwY3q+Jg7h4uHOagZBidlYGB/ITfYiDL6pvYvUwPD85IdqMD
	ZS45QUYBS9T79oo3dnUZSC2NtBzIQG/aW8qdDmM0Ky3UhqQOfa6an3fzPJUt4x1v
X-Gm-Gg: AZFdTZckuMUas5qNgZw8nFu5h98rBY6nbEzNwyTlSJjYihwTwNDD8x+NSVoRxUwd3vc
	yxsGl2nyiRDB5uWf9OXLXcwLZuBMx4HGBzUurmV9vliO/pBMkkbIPemAdZXXuNs23QkGl4gW1za
	O36KYmbs3H8+ON3+t7CaxznSgiLQ2apyLWe97qzCbLT6wQ3YIdXvGicd/LRHFIVOKADQwQEuINt
	IBnkxDGsL72cojW7tOY05xISABYS83ZZrkNEAbi0jhAvbX7kVncVwyvcOsAhM8rQW9w4czVEycy
	9dZOqR+d1Kw8FVK/7laK3Ng1cbGF2b1enFzPfMC3XbMVfWxMmLhq0H1dixj6bvsRFYVya5aJ9ss
	mP6P2Wy4tER0l5HVqjsBAezyzERIcRHOteKIl479lw9O0wcIqM3QWifPFQjGc+u8gxvkKZYkPSW
	MJcZFv08rT9A83w7JDjh/Kc0ItoXMePGSv7J/eUA4/Ts21vuWN2Qokh8rm12aw2wmlKp/I2HwP2
	HPCQP3CBc3jXt1sE6ecFkMrLVuDa3aMXi8/anqI3StPOnW7iHFb7DWQT7XhctoI5wkQx/47XmKq
	wXx+cpcsg1P+7yaeoCOFD3zbhbx3F2/EIErTWhJt
X-Received: by 2002:a05:6512:304e:b0:5c1:4bbc:45cf with SMTP id 2adb3069b0e04-5c1bc8a5cf6mr4939287e87.48.1795554382454;
        Tue, 24 Nov 2026 13:06:22 -0800 (PST)
Received: from [192.168.0.15] ([2a02:a312:c59b:a180:251a:f25f:80fa:af1d])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd041813sm4099045e87.53.2026.11.24.13.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:06:21 -0800 (PST)
From: Artur Kowalski <arturkow2000@gmail.com>
Date: Tue, 24 Nov 2026 22:06:02 +0100
Subject: [PATCH v2 4/6] soc/tegra: pmc: Add an option to keep the VDE
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
Message-Id: <20261124-t20-for-upstream-v2-4-440116846f97@gmail.com>
References: <20261124-t20-for-upstream-v2-0-440116846f97@gmail.com>
In-Reply-To: <20261124-t20-for-upstream-v2-0-440116846f97@gmail.com>
To: Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, linux-doc@vger.kernel.org, 
 clamor95@gmail.com, Artur Kowalski <arturkow2000@gmail.com>, 
 linux-clk@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6250;
 i=arturkow2000@gmail.com; s=default; h=from:subject:message-id;
 bh=8aQIWKsuUD75ETq/pPpdqwmEzRuqAG5ipSwE5lLUaJI=;
 b=owGbwMvMwCVmYeTc/TaVxZzxtFoSQzbrHycB/WsHsnlW719omFOcHeO7YP8xK/bLOl3rLuyfZ
 tgf/Iipo5SFQYyLQVZMkcXsodAXnnle7ze83NoJM4eVCWQIAxenAExkwVqGv8JHcqO/WJ92fzfl
 wPz1SjFs0XESampsyz/J3NJimZH60oWR4VrR89eSaz+3uSi0qDGLJVlU557/5Lhq9QKT1K95D40
 b+AA=
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
powered on, at the cost of its idle power. It only applies to Tegra20,
as later SoCs aren't affected. It's a parameter rather than a device
tree property, as trading the idle power for working watchdog resets is
a policy choice, not a description of the hardware. Instead of powering
the partition off when registering it, the driver runs the power up
sequence on it, which puts its clocks, resets and clamps into the same
known state without cutting its power, and registers its genpd as always
on. tegra_powergate_set() also doesn't power it off, which covers the
legacy power gating API.

Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 12 ++++++
 drivers/soc/tegra/pmc.c                         | 55 +++++++++++++++++++++++--
 2 files changed, 63 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index dce9b8f3ae980..7cf080d4c3310 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -7567,6 +7567,18 @@ Kernel parameters
 
 	tdfx=		[HW,DRM]
 
+	tegra_pmc.vde_always_on=
+			[HW,ARM] Tegra20 only. Never power off the VDE power
+			partition. After a warm reset, which doesn't reset
+			the PMC, the boot ROM of Tegra20 hangs if the
+			partition is off. The VDE driver powers it on when
+			the system shuts down for a regular reboot, but a
+			watchdog reset doesn't go through the shutdown and
+			hangs. Keeping the partition on makes watchdog resets
+			work, at the cost of its idle power.
+			Format: <bool>
+			Default: false
+
 	test_suspend=	[SUSPEND]
 			Format: { "mem" | "standby" | "freeze" }[,N]
 			Specify "mem" (for Suspend-to-RAM) or "standby" (for
diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 721e9596b07d0..abef3fed637ff 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -522,6 +522,29 @@ static struct tegra_pmc *early_pmc = &(struct tegra_pmc) {
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
+ * power. Later SoCs aren't affected, so this only applies to Tegra20.
+ */
+static bool vde_always_on;
+module_param(vde_always_on, bool, 0444);
+MODULE_PARM_DESC(vde_always_on,
+		 "Tegra20: never power off the VDE partition (default: false)");
+
+static bool tegra_powergate_is_always_on(unsigned int id)
+{
+	return vde_always_on && tegra_get_chip_id() == TEGRA20 &&
+	       id == TEGRA_POWERGATE_VDEC;
+}
+
 static inline struct tegra_powergate *
 to_powergate(struct generic_pm_domain *domain)
 {
@@ -697,6 +720,10 @@ static int tegra_powergate_set(struct tegra_pmc *pmc, unsigned int id,
 	if (id == TEGRA_POWERGATE_3D && pmc->soc->has_gpu_clamps)
 		return -EINVAL;
 
+	/* the partition is kept powered, also against the legacy API */
+	if (!new_state && tegra_powergate_is_always_on(id))
+		return 0;
+
 	mutex_lock(&pmc->powergates_lock);
 
 	if (tegra_powergate_state(pmc, id) == new_state) {
@@ -1319,6 +1346,7 @@ static int tegra_powergate_add(struct tegra_pmc *pmc, struct device_node *np)
 	struct device *dev = pmc->dev;
 	struct tegra_powergate *pg;
 	int id, err = 0;
+	bool always_on;
 	bool off;
 
 	pg = kzalloc_obj(*pg);
@@ -1346,6 +1374,7 @@ static int tegra_powergate_add(struct tegra_pmc *pmc, struct device_node *np)
 	pg->pmc = pmc;
 
 	off = !tegra_powergate_is_powered(pmc, pg->id);
+	always_on = tegra_powergate_is_always_on(pg->id);
 
 	err = tegra_powergate_of_get_clks(pg, np);
 	if (err < 0) {
@@ -1363,9 +1392,20 @@ static int tegra_powergate_add(struct tegra_pmc *pmc, struct device_node *np)
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
@@ -1385,11 +1425,18 @@ static int tegra_powergate_add(struct tegra_pmc *pmc, struct device_node *np)
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
2.56.1

