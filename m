Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E6D4078CB
	for <linux-tegra@vger.kernel.org>; Mon,  7 Sep 2026 06:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763668; cv=none; b=fo+wxcfroBUCaeUxlzPExORUw3KTq4qv+Mu2OABVdu18HYNxDbzG6RHWlxZ8xEQul5ZyXkxnPzOm7bCXFGf3CFB5uyWm/evG44hdT0c6T+PHZ4mwk55/ffoVDk7pTEy5txb+xeF7DG2644jNjy7/J90PjnyzLsOkUNyAIpCfXG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763668; c=relaxed/simple;
	bh=x+n4CsDHf+Aujek4+a1pPXZx82JkPYNueFhs42Dc/2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X5FZrx68bEv4zW0XACpAzBpPhHz41dUEabRTnEhvvOkol+R/b+fmq5Of2bmjPVR0eSBXMF77EyUW8j3wNSdGbHaXyuDjziwKQLQA6hEk3ucBBTCXM1CZoGrYEJrvDKTHKnkMgs7KRz/N/3Ug23MQRlkMYB56kGDqobTTRfyfohY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oA4a7c+w; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oA4a7c+w"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso4231608a91.2
        for <linux-tegra@vger.kernel.org>; Sun, 06 Sep 2026 23:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763666; x=1789368466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6JqmZnYM/OOyRwgWKJJuvp7/Dkkhk+cDvs6k7nFOO2I=;
        b=oA4a7c+wtGt9Tf9+CBXzXN2NbS74KmXZwdllGkfnzo3ZN5Jobqj8hLF6ITGHbvWzMS
         DKQDcLA/Q876KwNoXj49XSpe19fufYCIf+Eki9lrp+uYuPIAQ2CA2U2qocINC6QPr2Tq
         ejz1VNebgzL+/dINYAb1m4eyIvgWU76cFcBz3DwoWAMM4LXZHZKEI0+Y/CcUysP00WdS
         DvK0huntqFjqz7MOlhli/MzeE+U84z9yUKpadYbuOeV4zO+k4E9Joyd+r7dNTAwXhWYI
         MSCq00DDjaeCgkzyhjv8AXOsMYGdc5e/SVdrxHoh0f9UAMuikkf2kcmpaHs0RoLx7IEZ
         C92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763666; x=1789368466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6JqmZnYM/OOyRwgWKJJuvp7/Dkkhk+cDvs6k7nFOO2I=;
        b=dzSyDX2dCv2oWJQ/UditFD/8FBJNKAIocdE7wlqOZ5KQSdqflSUq8uZbf0Mq95cTfA
         0jO62z1n+4+N0htbbrRSdxU4XCpKm72rHtIrRGGhVJ3N7jPu0dlpaxmQD/w4Yh3b4jL7
         pR3aimPqwsEG+EOa5MoEq9At0y4WLvSBVfcCaH+1dC24KHLijwCPphSoVl9y9uuG3D3T
         YlO7rElmEViArHnCgRDAMRmD76avxQebtnATKQM0jvnhFsnHrXwIQ058Gj86zdRfCY+N
         EEpxbT6QA2/Z74zydJCIur7WY1x2d3yuoSY6shpbvcMZeVXCFS/zBqbyZyMa7FBxL501
         DJJQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2RrMTjCZ3RalGY8X45qsPrAspgUEOzFZHBJ6Gw9TS8pkK25+lLr0KklRPiR2vdkAAtqsm7rfaZNMkGw==@vger.kernel.org
X-Gm-Message-State: AFuF++l43tvKFyMIn2h7ZaIUVb/LL/nl0nuFPmZAi9ehGnUkVXe/zA9F
	n0pttZlTNg/ptf5k0auc3rg6CxE6s7o8HFw/rrBvYXQIjljVbVfckl+N
X-Gm-Gg: AYBFou0WUpN1OdaA8oNBEPnU34UfiBSjlha25//owHJQLa1h8PI1d73SLTPaWJSJuUv
	N3tbUxMHSX+y5pgP1kDqMVcn4w90acJ3lHMf/p/ZJTVj9awwp97sP1T1tzyHxNEJtXygFMa+s+A
	ZD9Oq2XXjCtRXTyqFKowmO+A0ICn7avslHhCSFblaFZhpZ91vZQi8opZxrUEsup+7DNZ0h5ANtE
	X+UJfouM2jXzFBRV1+PiwncRryfmTu+ipS5vg8EfEW3MhsRnCL7PXmqjwR/udki/L5zNY4j6ufb
	wsMaqblZ0w1F4rjaiXrGchlba8q4Zew1zx+rNWXooIoFAJfhbxJYxUm7V4GfJ1m96KwLOYEZ5kZ
	xqfbcJE2H1AM6ZGHsk2MhbCT9ai6+leSsp0trVBHs0rWTnO8kEFM+WD4K2Lj779H8q7cDN5+EQp
	e7ud8Hhqk3+g0cht6lDgXWAIvrb2nCt2oMnI97fZ5HB0vk08QR4GNEQdnNkjZ5vjo1WV73lyhXt
	/0B9pvCkop/WHEp8L5mZp3j
X-Received: by 2002:a17:90b:268d:b0:398:bdb0:adb7 with SMTP id 98e67ed59e1d1-39b261e1beemr34790323a91.16.1788763665963;
        Sun, 06 Sep 2026 23:47:45 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333c9db92b1sm24811158eec.9.2026.09.06.23.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:47:45 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Eduardo Valentin <edubezval@gmail.com>,
	Keerthy <j-keerthy@ti.com>,
	Christian Loehle <christian.loehle@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-pm@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH 2/5] thermal: fix typos in comments
Date: Mon,  7 Sep 2026 12:17:22 +0530
Message-ID: <20260907064725.10686-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907064725.10686-1-hemanth.selam@gmail.com>
References: <20260907064725.10686-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/thermal/thermal_core.c              |  2 +-
 drivers/thermal/thermal_of.c                |  4 ++--
 drivers/thermal/ti-soc-thermal/ti-bandgap.c | 12 ++++++------
 include/uapi/linux/thermal.h                |  8 ++++----
 4 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/thermal/thermal_core.c b/drivers/thermal/thermal_core.c
index 82e2f0d8a26d..5db52de33398 100644
--- a/drivers/thermal/thermal_core.c
+++ b/drivers/thermal/thermal_core.c
@@ -1662,7 +1662,7 @@ EXPORT_SYMBOL_GPL(thermal_zone_device_unregister);
  *
  * Return: On success returns a reference to an unique thermal zone with
  * matching name equals to @name, an ERR_PTR otherwise (-EINVAL for invalid
- * paramenters, -ENODEV for not found and -EEXIST for multiple matches).
+ * parameters, -ENODEV for not found and -EEXIST for multiple matches).
  */
 struct thermal_zone_device *thermal_zone_get_zone_by_name(const char *name)
 {
diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index 0217a49b08ae..f6566b5b916c 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -349,10 +349,10 @@ static bool thermal_of_should_bind(struct thermal_zone_device *tz,
 }
 
 /**
- * thermal_of_zone_unregister - Cleanup the specific allocated ressources
+ * thermal_of_zone_unregister - Cleanup the specific allocated resources
  *
  * This function disables the thermal zone and frees the different
- * ressources allocated specific to the thermal OF.
+ * resources allocated specific to the thermal OF.
  *
  * @tz: a pointer to the thermal zone structure
  */
diff --git a/drivers/thermal/ti-soc-thermal/ti-bandgap.c b/drivers/thermal/ti-soc-thermal/ti-bandgap.c
index ba43399d0b38..5c028d25a565 100644
--- a/drivers/thermal/ti-soc-thermal/ti-bandgap.c
+++ b/drivers/thermal/ti-soc-thermal/ti-bandgap.c
@@ -332,7 +332,7 @@ static inline int ti_bandgap_validate(struct ti_bandgap *bgp, int id)
  * ti_bandgap_read_counter() - read the sensor counter
  * @bgp: pointer to bandgap instance
  * @id: sensor id
- * @interval: resulting update interval in miliseconds
+ * @interval: resulting update interval in milliseconds
  */
 static void ti_bandgap_read_counter(struct ti_bandgap *bgp, int id,
 				    int *interval)
@@ -352,7 +352,7 @@ static void ti_bandgap_read_counter(struct ti_bandgap *bgp, int id,
  * ti_bandgap_read_counter_delay() - read the sensor counter delay
  * @bgp: pointer to bandgap instance
  * @id: sensor id
- * @interval: resulting update interval in miliseconds
+ * @interval: resulting update interval in milliseconds
  */
 static void ti_bandgap_read_counter_delay(struct ti_bandgap *bgp, int id,
 					  int *interval)
@@ -394,7 +394,7 @@ static void ti_bandgap_read_counter_delay(struct ti_bandgap *bgp, int id,
  * ti_bandgap_read_update_interval() - read the sensor update interval
  * @bgp: pointer to bandgap instance
  * @id: sensor id
- * @interval: resulting update interval in miliseconds
+ * @interval: resulting update interval in milliseconds
  *
  * Return: 0 on success or the proper error code
  */
@@ -427,7 +427,7 @@ int ti_bandgap_read_update_interval(struct ti_bandgap *bgp, int id,
  * ti_bandgap_write_counter_delay() - set the counter_delay
  * @bgp: pointer to bandgap instance
  * @id: sensor id
- * @interval: desired update interval in miliseconds
+ * @interval: desired update interval in milliseconds
  *
  * Return: 0 on success or the proper error code
  */
@@ -471,7 +471,7 @@ static int ti_bandgap_write_counter_delay(struct ti_bandgap *bgp, int id,
  * ti_bandgap_write_counter() - set the bandgap sensor counter
  * @bgp: pointer to bandgap instance
  * @id: sensor id
- * @interval: desired update interval in miliseconds
+ * @interval: desired update interval in milliseconds
  */
 static void ti_bandgap_write_counter(struct ti_bandgap *bgp, int id,
 				     u32 interval)
@@ -486,7 +486,7 @@ static void ti_bandgap_write_counter(struct ti_bandgap *bgp, int id,
  * ti_bandgap_write_update_interval() - set the update interval
  * @bgp: pointer to bandgap instance
  * @id: sensor id
- * @interval: desired update interval in miliseconds
+ * @interval: desired update interval in milliseconds
  *
  * Return: 0 on success or the proper error code
  */
diff --git a/include/uapi/linux/thermal.h b/include/uapi/linux/thermal.h
index 46a2633d33aa..36f3da2d6a7c 100644
--- a/include/uapi/linux/thermal.h
+++ b/include/uapi/linux/thermal.h
@@ -81,11 +81,11 @@ enum thermal_genl_event {
 	THERMAL_GENL_EVENT_CDEV_STATE_UPDATE,	/* Cdev state updated */
 	THERMAL_GENL_EVENT_TZ_GOV_CHANGE,	/* Governor policy changed  */
 	THERMAL_GENL_EVENT_CPU_CAPABILITY_CHANGE,	/* CPU capability changed */
-	THERMAL_GENL_EVENT_THRESHOLD_ADD,	/* A thresold has been added */
-	THERMAL_GENL_EVENT_THRESHOLD_DELETE,	/* A thresold has been deleted */
+	THERMAL_GENL_EVENT_THRESHOLD_ADD,	/* A threshold has been added */
+	THERMAL_GENL_EVENT_THRESHOLD_DELETE,	/* A threshold has been deleted */
 	THERMAL_GENL_EVENT_THRESHOLD_FLUSH,	/* All thresolds have been deleted */
-	THERMAL_GENL_EVENT_THRESHOLD_UP,	/* A thresold has been crossed the way up */
-	THERMAL_GENL_EVENT_THRESHOLD_DOWN,	/* A thresold has been crossed the way down */
+	THERMAL_GENL_EVENT_THRESHOLD_UP,	/* A threshold has been crossed the way up */
+	THERMAL_GENL_EVENT_THRESHOLD_DOWN,	/* A threshold has been crossed the way down */
 	__THERMAL_GENL_EVENT_MAX,
 };
 #define THERMAL_GENL_EVENT_MAX (__THERMAL_GENL_EVENT_MAX - 1)
-- 
2.48.1

