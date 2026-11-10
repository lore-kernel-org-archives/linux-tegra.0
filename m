Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794314366;
	b=BVToccvOrwQG7u5nxVIyVWR9sdAKJUc+gUDSm9Tsk+wJ2/WuXidiDzdjslBXuSoIC9pw
	 b0XXcK43X7COyoWpjA2z4ybwmdriJ1v9yLPOwqZAieuBV1sDvTnLjwz94m8j9SX/S2MCg
	 t45iFpb+f/d29hUDxb0kIIDI1M+P4MK1ItBGT+ZFk3PKV06Rbmg1+U/974cZaR4d7rSD5
	 f5VpDA50IMMI7+CBkP4nn+DUXqG1APKkoHz9G9JqfsIPLrzm93+ZdnNex+jvXcttcPFpR
	 wp0RClBWBTv0vClfC1XMj7quy3OaOjdl4zZwHRe1GljjOiUn70tE1lWwF75JE1Cc/HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314366;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=HF3shcz+KksloJNRLeQSS2sTiHKjaNkcjpmTc658boM=;
	b=DNenqHEqywLCjKDqKcgNdetgG9hhCe66hdzkX+KG8l4PaDaAhv0pAEeweUArRvji00ZQ
	 8TawpjwM2hHoD4BJr1jXJKQt3xMHqbxtIHSMrBnoHC97ZNpae69bE/RA0W5qHVtIo6c+P
	 8DRKCH/JAi9Znb/F/U1yNjs51EsEuZ2htU7Hcz1lvZRaULwLdp0ysMEtcIijWGZuI24sw
	 mdDmcuys9Sk+xNbojvIQDobuFl0u8eogmOHtiBvPJiVWK2fGhY3KR8d9t0YIJiEINYHln
	 iorfZ6UaNy9nneqpYaG5k+HbkDLfAbNP0nb4T1EG0DlbOAoMhUPHUtVbICK3sFVRzMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oM+sbEHx;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A434B60A3823
	for <linux-tegra@vger.kernel.org>; Tue, 10 Nov 2026 12:39:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A434B60A3823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oM+sbEHx
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4922dbcee23so1058492f8f.0
        for <linux-tegra@vger.kernel.org>; Tue, 10 Nov 2026 04:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794314364; x=1794919164; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HF3shcz+KksloJNRLeQSS2sTiHKjaNkcjpmTc658boM=;
        b=oM+sbEHxgeep4E1/WSL78xYKJMJmf61gIjvuNsamtwPBLooV5Z1KH0D7sRrHW2Mx9w
         QM2//cd7owTL8gvqMrSUAiN3K0nIilxdaEu+b8DQVOaVyBkhotgpVFYrkKMYsiBYGHnE
         eoFMtkMe36IUM1I+hpHLPGDPf7BHIzxxvmFATZ06/A31pd01fpSfOxnDVChckVnxeC/L
         OkHMmsLFbov5ZGfYFysNtxxq8UERvPNVIHfUTWcul9kznoExgAsAIBG8kGZv4RRf5hl7
         0u06LPcZG7927rbKt+RVY4+otgbdlK1elhJT1xPyIOaFk2vxhhOx5lo/8bJUagNTsnpX
         6aiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794314364; x=1794919164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HF3shcz+KksloJNRLeQSS2sTiHKjaNkcjpmTc658boM=;
        b=sk9fpkheCkD5jpkdL3rX931/fSN4Zawucd6MG5i52kdprRLlF0YwQpazuPSdxP2OYU
         wqwRRQcxsWU7zmyRt+31u2jCsekIMXBj5sBYo01C4BWH1fd8Grc1E04c7sWT9iT8JyHY
         nNdfxl23FdrnBULFom1BnrOscMIrxFNRsnhr5hO+KFfb4oWMeSNU7axGSmUajecoDeA5
         h4a/4sgIX/vutJBV7q/gS+htdMsmmwYMNcdn4ifOix4SxnBt6iVX+I3US6bO+GSZUxRi
         vZvJ/IsMAXMry24fbDGtc/6zadKWQBjXlRURWruv0vTimlLHCT4Mu5GRv2Xfup6HQwBh
         p/gQ==
X-Forwarded-Encrypted: i=1; AL+hErF3k3SZdRCedfA3iKwfCRZtL3smU1ZzhxfHpGssMgAi1xKtJFCFWh0qVu9pYFQSHhXM6eshQSgdOVO5/Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z8WQoPes0D5w0RJAyBL5bqDsDLlYaOm9BdemDx0SaTH+5RMh8CI
	XiLzePC3SW8pM4g+Tc+YU+wfyGZnrxa3M/73noxWiOd2AvRrmbp5GyOC
X-Gm-Gg: AYBFou3DkdZ0isb1t0rZKLRYfvqHvNNjy78cH+tKl/2eF60dGXWVU88iqrhPtPBDmVs
	nvk20vIgM7AzvR3cJiOHfOj2um1zGqB2U+8tQ6oTpX4sVw47oq61qG9C9IA3Zl2iGVMGu46L7jA
	USUFjMF3PkdNHXnVDjZbRGpHzvjDi1D704/rMoktOhU6LFkK/lN2KQFn6Doidy8TUefnMme7IOn
	KiRjDBSCnkCsgy9mdwVMxMMWEUQojYKy0+0iLEPStzQInUCRwklwganmCpA0VJpxNLCT9CF00f3
	fChWR6YmyLKo2U6miVtcgRLX+IWEtXs0OEf7UrA8pBqzXnfv90Ru1m9/K3qvn33rLZrgkF10tYk
	3u+2/X6YXklyb4t0BQazvjgqfY8GaWk5Dq1hdkTpzBL4ZeWQyVAhp0x6GX2Sr715Zb4lFTOFXyb
	c1pztPPr8f2cBVYTiePN/PPowbdXULd9BkK5ACDAcDWCOAM9NTrWv8JrB56hHNR8phuCa2zxjwG
	GkUAsksVHj8zS2XPz7/0fQfw/X90uFrhCcmTmleEaCcIccS1ZlZvB5rLYhU1HJ4+OuMiv0M7Dwi
	qn0qu7TIUJEjNkLEgnYGDNsGnP2+8se4RMOpSGkNQZpu9RmxsVYXjv+6Ug7/vw==
X-Received: by 2002:a5d:5f47:0:b0:498:be72:6370 with SMTP id ffacd0b85a97d-498be7263e8mr2599460f8f.10.1794314363923;
        Tue, 10 Nov 2026 04:39:23 -0800 (PST)
Received: from [192.168.0.15] ([2a02:a312:c59b:a180:251a:f25f:80fa:af1d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498363e0019sm5050033f8f.38.2026.11.10.04.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 04:39:23 -0800 (PST)
From: Artur Kowalski <arturkow2000@gmail.com>
Date: Tue, 10 Nov 2026 13:39:10 +0100
Subject: [PATCH 5/6] soc/tegra: pmc: Add a partition power off notifier
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
Message-Id: <20261110-t20-for-upstream-v1-5-5923449951fe@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6965;
 i=arturkow2000@gmail.com; s=default; h=from:subject:message-id;
 bh=qF8CXXbZUQJjzOTRVbw07s4VS5+pdb02OBLUNzvZ+sk=;
 b=owGbwMvMwCVmYeTc/TaVxZzxtFoSQ9ZngaKupkAftk1HIzJfhZtNnLfM6Y9YowF3EuP03TesW
 JnbWz53lLIwiHExyIopspg9FPrCM8/r/YaXWzth5rAygQxh4OIUgIlULGf4n5fsYmi2X3qt5U/D
 1f0Jq0NKWzk6DQ+kzWvy53gWHjeDi+F/+JZNkYfeLd5WHJZf/ay9b8mMe8bfX3O0uny+aOKleuI
 pGwA=
X-Developer-Key: i=arturkow2000@gmail.com; a=openpgp;
 fpr=F60710C8D69E03A01A2801CD87A47D20C2709637

After a watchdog reset, which doesn't reset the PMC, Tegra20's boot ROM
hangs if the VDE partition is powered off. Unless booted with
tegra_pmc.vde_always_on=1, the PMC driver powers the partition off when
it registers it, and genpd powers it off while the VDE is idle. The
Tegra watchdog driver will need to stop the watchdog before that
happens.

genpd notifiers can't be used for this: they only reach devices attached
to the domain, which the watchdog isn't, and the partitions are powered
off before their genpds are registered. Add a notifier that is called
before a partition is powered off, from tegra_powergate_set(), which all
power off paths go through.

When a notifier is registered, it is also called for every partition that
is already powered off, except one kept powered on with
tegra_pmc.vde_always_on, which the PMC driver powers on when it registers
it. A lock is held across both the notification and the power off, so a
partition can't be powered off unnoticed while a notifier is being
registered. Registration uses the early PMC, so it works before the PMC
driver has probed, which is when the partitions are first powered off.
The notifier, including the hook on the power off path, is therefore only
built on 32-bit ARM, the only architecture with an early PMC.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
---
 drivers/soc/tegra/pmc.c | 104 ++++++++++++++++++++++++++++++++++++++++++++++++
 include/soc/tegra/pmc.h |  19 +++++++++
 2 files changed, 123 insertions(+)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 807977f52449..1d9a6aeb0e57 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -31,6 +31,7 @@
 #include <linux/irq.h>
 #include <linux/irq_work.h>
 #include <linux/kernel.h>
+#include <linux/notifier.h>
 #include <linux/of_address.h>
 #include <linux/of_clk.h>
 #include <linux/of.h>
@@ -520,6 +521,34 @@ static struct tegra_pmc *early_pmc = &(struct tegra_pmc) {
 	.base = NULL,
 	.suspend_mode = TEGRA_SUSPEND_NOT_READY,
 };
+
+/*
+ * Notified before a partition is powered off. The lock is held across the
+ * notification and the power off, so that a notifier being registered either
+ * sees the partition still powered or is notified.
+ */
+static DEFINE_MUTEX(tegra_powergate_nh_lock);
+static RAW_NOTIFIER_HEAD(tegra_powergate_nh);
+
+static void tegra_powergate_power_off_begin(unsigned int id)
+{
+	mutex_lock(&tegra_powergate_nh_lock);
+	raw_notifier_call_chain(&tegra_powergate_nh,
+				TEGRA_PMC_POWERGATE_POWER_OFF, &id);
+}
+
+static void tegra_powergate_power_off_end(void)
+{
+	mutex_unlock(&tegra_powergate_nh_lock);
+}
+#else
+static inline void tegra_powergate_power_off_begin(unsigned int id)
+{
+}
+
+static inline void tegra_powergate_power_off_end(void)
+{
+}
 #endif
 
 #ifdef MODULE_PARAM_PREFIX
@@ -730,8 +759,14 @@ static int tegra_powergate_set(struct tegra_pmc *pmc, unsigned int id,
 		return 0;
 	}
 
+	if (!new_state)
+		tegra_powergate_power_off_begin(id);
+
 	err = pmc->soc->powergate_set(pmc, id, new_state);
 
+	if (!new_state)
+		tegra_powergate_power_off_end();
+
 	mutex_unlock(&pmc->powergates_lock);
 
 	return err;
@@ -5166,6 +5201,75 @@ int tegra_pmc_cpu_remove_clamping(unsigned int cpuid)
 	return tegra_pmc_powergate_remove_clamping(early_pmc, id);
 }
 
+/**
+ * tegra_pmc_powergate_register_notifier() - get notified of partition power off
+ * @nb: notifier block
+ *
+ * The notifier is called with %TEGRA_PMC_POWERGATE_POWER_OFF and a pointer to
+ * the partition ID (unsigned int) as data before a partition is powered off,
+ * from a context that may sleep. Its return value is ignored. It is also
+ * called for every partition that is already powered off before this
+ * function returns, so a partition is either still powered once the function
+ * returns or the notifier has been called for it. A partition that is kept
+ * powered on (tegra_pmc.vde_always_on) is never reported, as the driver powers
+ * it on when it registers it.
+ *
+ * This works before the PMC driver has probed, as the PMC is set up early on
+ * 32-bit ARM, so it covers the partitions that the driver powers off when it
+ * registers them.
+ */
+int tegra_pmc_powergate_register_notifier(struct notifier_block *nb)
+{
+	unsigned int id;
+	int err;
+
+	mutex_lock(&tegra_powergate_nh_lock);
+
+	err = raw_notifier_chain_register(&tegra_powergate_nh, nb);
+	if (err)
+		goto unlock;
+
+	/* the base is switched to the driver's mapping under this lock */
+	mutex_lock(&early_pmc->powergates_lock);
+
+	if (early_pmc->base && early_pmc->soc) {
+		for (id = 0; id < early_pmc->soc->num_powergates; id++) {
+			/* powered on when the driver registers it */
+			if (tegra_powergate_is_always_on(id))
+				continue;
+
+			if (tegra_powergate_is_powered(early_pmc, id) == 0)
+				nb->notifier_call(nb,
+						  TEGRA_PMC_POWERGATE_POWER_OFF,
+						  &id);
+		}
+	}
+
+	mutex_unlock(&early_pmc->powergates_lock);
+
+unlock:
+	mutex_unlock(&tegra_powergate_nh_lock);
+
+	return err;
+}
+EXPORT_SYMBOL(tegra_pmc_powergate_register_notifier);
+
+/**
+ * tegra_pmc_powergate_unregister_notifier() - unregister a power off notifier
+ * @nb: notifier block registered with tegra_pmc_powergate_register_notifier()
+ */
+int tegra_pmc_powergate_unregister_notifier(struct notifier_block *nb)
+{
+	int err;
+
+	mutex_lock(&tegra_powergate_nh_lock);
+	err = raw_notifier_chain_unregister(&tegra_powergate_nh, nb);
+	mutex_unlock(&tegra_powergate_nh_lock);
+
+	return err;
+}
+EXPORT_SYMBOL(tegra_pmc_powergate_unregister_notifier);
+
 bool tegra_pmc_core_domain_state_synced(void)
 {
 	return early_pmc->core_domain_state_synced;
diff --git a/include/soc/tegra/pmc.h b/include/soc/tegra/pmc.h
index 53f6d02889db..c574a6e81a1a 100644
--- a/include/soc/tegra/pmc.h
+++ b/include/soc/tegra/pmc.h
@@ -231,14 +231,33 @@ static inline void tegra_pmc_enter_suspend_mode(enum tegra_suspend_mode mode)
 #endif
 #endif
 
+/* event of the partition power off notifier, data points to the partition ID */
+#define TEGRA_PMC_POWERGATE_POWER_OFF	0
+
+struct notifier_block;
+
 #if defined(CONFIG_ARM) && defined(CONFIG_SOC_TEGRA_PMC)
 bool tegra_pmc_core_domain_state_synced(void);
+int tegra_pmc_powergate_register_notifier(struct notifier_block *nb);
+int tegra_pmc_powergate_unregister_notifier(struct notifier_block *nb);
 #else
 /* needed for COMPILE_TEST */
 static inline bool tegra_pmc_core_domain_state_synced(void)
 {
 	return false;
 }
+
+static inline int
+tegra_pmc_powergate_register_notifier(struct notifier_block *nb)
+{
+	return -ENOSYS;
+}
+
+static inline int
+tegra_pmc_powergate_unregister_notifier(struct notifier_block *nb)
+{
+	return -ENOSYS;
+}
 #endif
 
 #endif /* __SOC_TEGRA_PMC_H__ */

-- 
2.56.0

