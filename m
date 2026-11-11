Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794438103;
	b=CsB0279jYhYfOHjcxLybHUsl1+v93Lv3ymRgG+6an0VX3yD7ciBFxpEKay8SwPoiktBd
	 CnXtJA1Of7PV1/qYt35fKcXBjv1pP82V+NJvQa3yFtDCkhVrMauS/TALCwzOcRaB0KZde
	 eHes8o3OFFUsOYPL3+bWJ2dPvOob38BY20dYe77oJgpaoFDielFQ81OE0OIqyps7jeWwZ
	 pik7ajIl4yrIHdYDIrOtqkg5i1Kd5gBSJi31e8ru28SQzmsGSx+dg0XMYtkQ309CNfLH1
	 qHABYdJxYPXcT6w1WlZGEC8vmljNINqnD+TSfXJO6/GtbmtZinXRMZ80DAzS2h0duSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794438103;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=L/DNryozJcI+bS61jpTo9uGJwCePakmBfNnW7ssrmHM=;
	b=jNrgej4T0lwh/DRBbmxqqI2oJVrK32YUgkizJM8jSMzx3YyY84QrfF3FyJo0B3LB46kg
	 DhwnIq8ZQkjZdg/EDzTTYZD+p9vG5SZV4DNoHTUxCQuLUtM0p9THx3VpgL2ER9v8iS26Z
	 Bv4kPZODVlyGbHmsWibRkfsQ4O3nRstedS7MGf0DEeaxV3WdxMHz4kpKurtVQCGA3Vvrz
	 LhFGMqbtIX5xi0z76KIa9YahrHvc8RJ3uNSBicKXXEd6JZwX0kDljcMRph1iSY5TJ8zPR
	 gvVPie3QchqKPN3WL7zlDQykngtaeBpIoLH+nBMpMhHahUrxWTmbTtZlZ/KvL/Dtcxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HQMN+EXc;
	arc=none smtp.remote-ip=74.125.225.139
Received: from mail-wm2-f11.google.com (mail-wm2-f11.google.com [74.125.225.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D08606A881
	for <linux-tegra@vger.kernel.org>; Wed, 11 Nov 2026 23:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32D08606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HQMN+EXc
Received: by mail-wm2-f11.google.com with SMTP id 5b1f17b1804b1-4a5f76661b5so14412995e9.0
        for <linux-tegra@vger.kernel.org>; Wed, 11 Nov 2026 15:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794438101; x=1795042901; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L/DNryozJcI+bS61jpTo9uGJwCePakmBfNnW7ssrmHM=;
        b=HQMN+EXchlp4xbB8rF7Pnhq5g3JiXeEDSFSEP0fBPwP0YzTauuIlfszcErHxeIsqW3
         MuKG422qmxlKr/spOL6wWrxqiB2S3Waay/nHqfQSCfYpQAF9JTo2IoJk+IfN6aGgFdLp
         ql/vlnC1a69YhJWurBaDDynrC3hNOtdQ1yZrGpzI0/Lah3dINozucyAOMb0JkX6AOS1L
         C0aU5/rl8dSG6oDzwjUNLuPBM8Oec2bA/GyksTjki9+nQXx0THaY351VKHkFz+kXbme2
         Jadh3OnGIokbBQoMOm4vVgSC3aNuQj46gfUgIMBu7/8Mvk/BZ4ScOv09WVofy+Ci0eua
         rtGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794438101; x=1795042901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L/DNryozJcI+bS61jpTo9uGJwCePakmBfNnW7ssrmHM=;
        b=PXRG2HwYdbnT5UbahrbVKIjCgfZBP5OqMjzKPoID9T5ulyTZNN83P7ywM3wqvIHfu7
         DIdN69cjycofY3940t7WH/cTJX8PHcj6u0g7Nv+gIJSNHgz2e9yQXPCcBM2vsCRqdYHt
         F18izSwlkoydkhPvqRK67KZU0oF74q/md8B7YGcNKCOJm5qOkc7RMK2QDbtWjm04I6LZ
         cjA5aBVk3PSmCHQRap92H0bgPCfO9oXuXmyNo051Z9qSt/04sNvMDrsxdA5qTvPuADB8
         SkaOF8kaDI5Xdnd4miD1fXFncIPldwiThDw9GaE4w0OsNfkYzUWRLR2wA+S9UMqPkfUI
         beuw==
X-Forwarded-Encrypted: i=1; AL+hErHoaHexWvwvkyrOAS9MS599JmwQsOC4X0Vat+BvcSHMxN7ZE20SVMSUstYwk4bCRH7YnTzWEuFtwrGjwA==@vger.kernel.org
X-Gm-Message-State: APuU4Z94kvCQ9yqOGTe4Jy2EM9UOtH68fzBKb8Q/dU7UvIQPPHum+DZO
	uV1IQiwdO+oHS/ImQ3pi1DAbze4SDho25QF050RrABy6FiA21BzWRZ14d1+uqeYOgQ4=
X-Gm-Gg: AYBFou2rLNbONQsD5Oie3HaB/5kiAERJohGGnm/WLNhOryMIa8fbRLpdrjKJz5yvqHB
	Cy5vY4bzQcEWP75zVnIArO0R9dW1H8NnRYAomgDZipP8Ot8HtwKuxPHsQx/HobSknDSonr5AQZX
	9OKn2GeT8N29MyS9JI2WuzaOSPgvK0OW0bZVTtyDVaDLFNBLBsp4O6KdROSsOFoT2ixHA6zJ1D4
	nZkdRXE4irRXGeHEC1SOw8BqcUWQTle9+OGW+ggQRNH9P5XH2UsvB5OkJEHo2ue+DG4TnNSIY7v
	HTW9meuYICYLGDGe1Tp0jcu/py9keLLlq5y77RQeXwWBocoMBCy1QOfGauCF0gvTNqvH/giX/Gm
	sdlX3s2UUR2xNX6gL0XHNxQV/+vJ9YuJH4RaCnyFr/OqxeI5ptOKS1IOyeuNV+nsGMXWpvRJOyc
	dCFgHoy4RmAEHwmLR2pyPluKZHxsuyChOQ2sHLsn1CY31bl1AwrgSP5D8ngJ0XJKLPbyyhl4XUE
	OYKZzo+c/oaFx9cPk+LmSZCtfXao5a1FNbhaNDJUavJ0ig5gLMGvFHzs9RR6RfjJssYhQp5Crfk
	tS345QacvYLvzfuv67klfwezSxHQ0RLJWPcS
X-Received: by 2002:a05:600c:64c6:b0:4a1:e69d:90e8 with SMTP id 5b1f17b1804b1-4ba0937fedcmr69091665e9.22.1794438101294;
        Wed, 11 Nov 2026 15:01:41 -0800 (PST)
Received: from cachyos-x8664 ([105.98.136.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e265a0csm22047415e9.9.2026.11.11.15.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 15:01:40 -0800 (PST)
From: Mohamed Anis Ben Azza <benazzaanis783@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marc Dietrich <marvin24@gmx.de>
Cc: linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	ac100@lists.launchpad.net,
	linux-kernel@vger.kernel.org,
	Mohamed Anis Ben Azza <benazzaanis783@gmail.com>
Subject: [PATCH] staging: nvec: kbd: bound keycode table lookups
Date: Thu, 12 Nov 2026 01:01:34 +0200
Message-ID: <20261111230134.200561-1-benazzaanis783@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nvec_keys_notifier() indexes code_tabs[_size][code] using values taken
directly from the embedded controller's event message without checking
them against the tables:

 - _size is a 2-bit field (0..3) from the message header, but code_tabs[]
   only has entries for NVEC_2BYTES and NVEC_3BYTES. NVEC_VAR_SIZE is
   rejected, but the reserved encoding 3 is not, so code_tabs[3] reads a
   pointer past the end of the array and then dereferences it.

 - code is msg[1] & 0x7f (0..127), but code_tab_102us[] has only 126
   entries and extcode_tab_us102[] only 110, so scancodes at or above
   those sizes read past the end of the tables.

Reject any size encoding without a table and any scancode beyond the
end of the selected table, dropping the event as is already done for
the power button.

This only matters for an EC that sends malformed or out-of-spec
events, so it is a robustness fix rather than a security issue.

The issue was found and the fix drafted with the help of an AI coding
assistant (Claude). It was compile-tested with
ARCH=arm LLVM=1 tegra_defconfig + MFD_NVEC/KEYBOARD_NVEC at W=1 with no
new warnings, and the lookup logic was exercised in a userspace harness
under AddressSanitizer for all 4 size encodings x 256 scancodes: the old
code reports a global-buffer-overflow, the new code none. It has not
been tested on real Tegra/AC100 hardware.

Fixes: 32890b983086 ("Staging: initial version of the nvec driver")
Signed-off-by: Mohamed Anis Ben Azza <benazzaanis783@gmail.com>
---
 drivers/staging/nvec/nvec_kbd.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/nvec/nvec_kbd.c b/drivers/staging/nvec/nvec_kbd.c
index d2b91318f..9b976f0f5 100644
--- a/drivers/staging/nvec/nvec_kbd.c
+++ b/drivers/staging/nvec/nvec_kbd.c
@@ -28,6 +28,11 @@ enum kbd_subcmds {
 static unsigned char keycodes[ARRAY_SIZE(code_tab_102us)
 			      + ARRAY_SIZE(extcode_tab_us102)];
 
+static const unsigned int code_tab_sizes[] = {
+	ARRAY_SIZE(code_tab_102us),
+	ARRAY_SIZE(extcode_tab_us102),
+};
+
 struct nvec_keys {
 	struct input_dev *input;
 	struct notifier_block notifier;
@@ -59,8 +64,11 @@ static int nvec_keys_notifier(struct notifier_block *nb,
 	if (event_type == NVEC_KB_EVT) {
 		int _size = (msg[0] & (3 << 5)) >> 5;
 
-/* power on/off button */
-		if (_size == NVEC_VAR_SIZE)
+		/*
+		 * NVEC_VAR_SIZE is the power on/off button; the fourth
+		 * encoding is reserved. Neither has a keycode table.
+		 */
+		if (_size >= ARRAY_SIZE(code_tabs))
 			return NOTIFY_STOP;
 
 		if (_size == NVEC_3BYTES)
@@ -69,6 +77,9 @@ static int nvec_keys_notifier(struct notifier_block *nb,
 		code = msg[1] & 0x7f;
 		state = msg[1] & 0x80;
 
+		if (code >= code_tab_sizes[_size])
+			return NOTIFY_STOP;
+
 		if (code_tabs[_size][code] == KEY_CAPSLOCK && state)
 			nvec_kbd_toggle_led();
 
-- 
2.56.0

