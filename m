Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794672782;
	b=4Kou3MDpYNpP84gmdy5gKDEauEqqqVHqIdJsJVrbUzydfHhcwjp3aNlSnAoEqox3QGbe
	 Z2KYAjytVN2QOphi/1AoYbIpVB/CxxS1OAqthduTn3VlA3kXzTWVSihZzyUZZevJm0vK1
	 r80bhmZawPo3XoR1v+hEcqyLpYAGN+bHtRTKYmN5E/DMqP3tZ9VA7qjRr7d6st4W6Cgf4
	 c7biN0LGnlD3GTIzVEysyh5x91cRHcfVKvKoVSVFaBpjPoSGq/FQl9UO5DL5Gc03vBZPk
	 Ua6MnW+8wG9XIxGsOldCWFulhTZadN/hEKX1XncKVvXUF6vfSK7ZWEfc7NY5oHsZ1+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794672782;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=56atBSeIj0Xj40ZEnZAWbn+Pb+5L+CHTI8/bHXYtQms=;
	b=xgnCJMKRbuW3VRY/v2zsS8w9UmzuCtD0BJWx95E1m0CshfjbFalYo8Ukp5bpejOCsfN9
	 ygQ5+BK1YYE2YowRQjZIKPwb1cvvaarjbXh5zcME6Sr/R6XctBByw7aBxSKWKb72umbNn
	 gVccA7e25V/2Kqx3hvUMRNCnY7wf9JWOr164MKU3cC9idWtV7d/5bri3rnGCmRO8vAiCq
	 y6tYHrv3YQsiYHbwMXrMsgFF5K96b5yeaY/nTN8HflPqWzdNV9+bGvnDFSeguSIMo9MDG
	 YpRa0s9SY/S15vsjQbqyqh+QDZXSuuSJAL/JfmsqQ8zICVE3eS4S8TYC6KjXXZ5PSgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ffB9CRnJ;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DA0606A8A0
	for <linux-tegra@vger.kernel.org>; Sat, 14 Nov 2026 16:13:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3DA0606A8A0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ffB9CRnJ
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb6754bf2dso1888005e9.0
        for <linux-tegra@vger.kernel.org>; Sat, 14 Nov 2026 08:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794672780; x=1795277580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=56atBSeIj0Xj40ZEnZAWbn+Pb+5L+CHTI8/bHXYtQms=;
        b=ffB9CRnJj3ttnJ2dq+N1itpGNB91i55wPXaNLifFqo5AD/6vCWeyRNAk3FNMJVH54w
         wfhfxwYzdTUmak3aVgZtWR5HyI6bd84TVdivh8z2+Y+dAphZ3ys0xGxaJzpRmuLqxU+p
         ruMeHx407LwKUvI0qAmPdzAsXr0pfYuL8xB4qATr/khCdimDa0YbszErzkxzLwkEGu2M
         O7/nn7RoYaVFy/50e/j/pMblpiavLopMw3RlReFTD9Vs6ySRinTcVnMue2HfI9d78syV
         VlSPblnjqxWhJ3OFYN3Pix8qIKmuizpJbNUWihOOlotZ4M42cokp1OIvDQl/j1P/DDN/
         S9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794672780; x=1795277580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=56atBSeIj0Xj40ZEnZAWbn+Pb+5L+CHTI8/bHXYtQms=;
        b=0gvJYytJs1PCvVdL/zLWwoz4bRVQwBGF62J8eIRTRoaUvlBJhaNtwMeEPsCw/OPB+B
         pe+5B9eaWKxB3ktkS+zZ02YFa8bSJOPLb/DujtXoP2VGvU42sRelcrDBc3/2jVPEG7Yq
         r0Gl5+Z35YROOWe2XBxoQSaHrLDmYMhL1prc4tfI4dT6y5Tv0bL4ocF2Wa1Fpr7Q6BHG
         COgz6nfW5jXNJTQZTFIflw4jjAnU22u10aAqoYIjV4lVzd2lI+WAm/+Kd0QAOIm2CQ6V
         3qBkZFL/0m65x++ae/mvvssFHSL+FfAWv/K5e7yXBd3S/jyqcQdj/IFv+Y99XKiquB3S
         0pbw==
X-Forwarded-Encrypted: i=1; AL+hErFEC6e7CgqueH0QNUlwbZA2Ui3crXBQQI+SCx/JlwmjkE5E6U+trlt0IZQXIBfH5WVd27I8JQYlVuNQbQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8fmbeKLbKQzOcH5eg0x9r+xiUX6Ju9AYxMtaz8cjGH0qPoknWU
	9tGSLszgBiulcLwqBeLbNHvoIcSSl/RBXZ4dvTwmrz+GOEIOky5FoiFx
X-Gm-Gg: AYBFou2V6hRHSgskBbEyIfZiQpbjPc0kAZyjbA/ZdqfGuxgJPT44chEswE9+SXkKKMj
	ljSUpuoO0PldzHrmheD9DSmIuQk5VPiQQIqT3B2QbI8pS/VZ/5zw4hYOIcK8bHVSzX2C/T7BPR1
	QviTgVGjK3+OISum0B1N9cFgQH6uxkpiDsMq9RI4sE12zFJeiQcoUpEdmB4M4usfJpYC6AL8x/H
	MGwdds1h39xYgD5PDfAZ5qhlDvQiN/JFUithduvn8ayQzU7RPKCiAgzTR4gymGaXEZqd3fD+wlK
	Ba9lQYsCSZlC6jtjLLUSLrgPgAEt7mGNamvVWNyobsJGLVgx7c852mcyczTxk+4tUUh5UUpyV3R
	h/yLVIg+A/4CwR/i9XjZfqQ2I9JOHJWpmS622YJ7jhJoMy7eq08E4iSekF/Bn7jvI+xMCBvxHLE
	aiq9L8qelbERXsdPkZEpawX2XiOlDhMC2lsHHXHGQhL68zKKGO2AzPVJUf9kyPleGvXiQ7n/695
	AIv9xTrwRKZoCErOXnbTg2mUBPdFub0FYV3Q2GLKsJMnUasTF1CWTfWxqEp9nXMkxu6AWjS7KEt
	NvFdcSBluOPXNpfU9mPgtUNYXhnmfqdwJodj7yxZIryZsOSFvho+i+k5m7ggSofFOBWUVgtXs+0
	kp/SDKCNrtIXt6lH42h50EyMdPSrFsOYm7yqO
X-Received: by 2002:a05:600c:3509:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4bb559f2cc3mr122972675e9.2.1794672779903;
        Sat, 14 Nov 2026 08:12:59 -0800 (PST)
Received: from DESKTOP-0KSTGNI.localdomain ([197.45.81.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5ba25b50sm101786405e9.14.2026.11.14.08.12.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:12:59 -0800 (PST)
From: Temitope obabi <obabitemitope765@gmail.com>
To: thierry.reding@kernel.org,
	mperttunen@nvidia.com
Cc: airlied@gmail.com,
	simona@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rostedt@goodmis.org,
	obabitemitope765@gmail.com
Subject: [PATCH] gpu: host1x: Remove unused host1x_channel_open tracepoint
Date: Sat, 14 Nov 2026 18:12:23 +0200
Message-ID: <20261114161223.3017-1-obabitemitope765@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Nothing calls trace_host1x_channel_open(), so the tracepoint is unused.
Remove this unused tracepoint.

Fixes: 6579324a41cc ("gpu: host1x: Add channel support")
Signed-off-by: Temitope obabi <obabitemitope765@gmail.com>
---
 include/trace/events/host1x.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/include/trace/events/host1x.h b/include/trace/events/host1x.h
index 1b6aeb7b177b..30af7ebd724c 100644
--- a/include/trace/events/host1x.h
+++ b/include/trace/events/host1x.h
@@ -28,11 +28,6 @@ DECLARE_EVENT_CLASS(host1x,
 	TP_printk("name=%s", __get_str(name))
 );
 
-DEFINE_EVENT(host1x, host1x_channel_open,
-	TP_PROTO(const char *name),
-	TP_ARGS(name)
-);
-
 DEFINE_EVENT(host1x, host1x_channel_release,
 	TP_PROTO(const char *name),
 	TP_ARGS(name)
-- 
2.53.0

