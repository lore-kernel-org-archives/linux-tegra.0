Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794314358;
	b=nX2ZMobZS7wnVvF4bQU1o1FKCcQF6864MpyFGaaoZ1wfhOnPiacIUvUlG0cFyFrEsLRw
	 MCeqahoO5h2eIx65WTyRFbOtHbOsHmqdZe9asmFKySOoAPH7wsAvCkXLo/V6V3BuXqtBB
	 TiGGCzvSr24wBcyWDcXJbYSR+hBDVb2HB7ijQ/mGDJC5SbbMqo0X697QhSuAPgEIil0HP
	 u6B5Uw1B1rU8NpurMiBvuMLp7Scjf1UT7nSE3nO6/POkpN8iI7IJtz3f3ym6kJ63PhFjK
	 R61l0DHeDFxXWTTyrZUdGXqSxuGd3DEqfUwNfVq3x7ZO7oB2LEeTNppUO9e6YjSBJUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794314358;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=OZA5SPU2mRDufyjwAtelDUROJpCDjs2VMU42+tn57Ec=;
	b=DmiyEZqO0Jpl0qt4nf9IAm18L4/P4QujasqOxeyd84FEmSEAA0NenxVAM0j4GbvyU/L/
	 kUvanW+cCIKGZEO4dPE2JfssdtMBQZe43+YLPnvnpp3kortZMF1SPbt0+2QO6HXPiR7kZ
	 gHzbkw4v2gNLGSoYBbx4pa7KLkwqJfKal8nLmzZ0cc/BA0hep2raByu29dE9jb5L+QiUA
	 pdLXGwSt/CStDJw6QutPXlx5oA92zzM7rGJR/9bNlKvZVSli68qjUfKNjlX9/oRPYNAcv
	 wVU3slz/rtpnroIMeHCrPdG9Ed8MUn8h+bh4KNVc1dPUi56SdcuJjreMygZ4lWeYhoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wz8+8w+j;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13914606A32A
	for <linux-tegra@vger.kernel.org>; Tue, 10 Nov 2026 12:39:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13914606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wz8+8w+j
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4b7252a32c8so20914895e9.0
        for <linux-tegra@vger.kernel.org>; Tue, 10 Nov 2026 04:39:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794314356; x=1794919156; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OZA5SPU2mRDufyjwAtelDUROJpCDjs2VMU42+tn57Ec=;
        b=Wz8+8w+jVziIDfWNptSTmLnFeI93h0avw0Xiq7bpV40LNJ18YpCROGSGMGCIUQcE/c
         CBymg2LEgIOQ5/0hNk9V/WgjGnzjFnfBX5e+ZVAdJit6StFgI+DhR/+5Fc4SH2WEw+MQ
         YRcLKRxwa6citZXQZtQ9j2d8GDdziuibjASNrPOGyeWtan8aeTbp4lgTDegGyxLojmqe
         gAk5QyD0Dx0lZwXLu112ruyhSPO65s8W0B3gNZgc+7DpMWNUnvQEe48JE+s6+P27E8LV
         5VJXXrWtFeLIHio4EH7SHZbadXfxLVjxZqNrdQduM58c/qKLRrRuzZNJMZF5+d1gmpYX
         bucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794314356; x=1794919156;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OZA5SPU2mRDufyjwAtelDUROJpCDjs2VMU42+tn57Ec=;
        b=vslT9mt7MOYs0rBQLJlLVZn2fDahYyP6cj9vECacsHlqyvCh1HFX5f301vskRYOl/P
         7eSVYD4NjpiAjZ1VJbuR3eKAlK6PlH6SqeMvk2WIFtss022TLhQ2Ow5vQ0xm4WnLWBwA
         Ht7q5FBXnCroHeJq0ybs0ekDC//ntUBH7rKejmsPlNe8CZYkmryOapY2kv9OnnChFKSp
         jgSw238ucMuXFlQd4SOSMKgy/iZyvGTL5i+YcOmZiqf2ZWUgvjvHfi06qsLbflUk62A2
         yTLklXyVbuXdyFgUqgomI1Fxn5QACveTv/BLgtRvjF6S9V9G/S0WryVt0psPwoDtnhsi
         VKYg==
X-Forwarded-Encrypted: i=1; AL+hErGgBF4id1oC9Z6ysuiUT2WEURXl8v6HNdyLSbpTLM5Mf8dJZLwDauZ5bk8KcOyFL5FthIFqH0VkYHC9hA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+I+TI3V4JqQ89azw4XGmcmYrXC6MF0l9y+MGj9eD+3G77ASooH
	iuxQuh4gbmYya+ILQKjxA05lHO7RvgPaGw0NIhSbABp1Z6206KBq+cHE
X-Gm-Gg: AYBFou0xAi8oz4JT9/B/FePcn9ye/D4rdsAxA6c9ILhNEaPQrCKpCGP6rzB/oC37CH+
	s/XIS36jONGldLilUjeFYWv2tes5ezB1MD/mp/70KAK2pNNJTWjlt+rgutWXVyXKsvtdhVYefsl
	GEl5l2fJlbOL6pLbGiFOg18MXXzaNnmgrQXOQ+sc+HUp/0P5Ut68RbBgHMxCOnzL++XtZmLugJU
	+ATRbBUdcc46vTe/MBuLHMgkTBv1kwTBg3F6eAHnYFzT7Uw/bkVqYtqcXo6oDOJzkSZDSUd2uR1
	R2CjWWCZMmPoNFXMj2K9QKfro8FEgWJKvnBLdTMLIRGUR3FlF+Q+wS6unvXDRUlzcZYv9InTqeR
	qSxDVWVTPGq8nGWGLHURyA19rVpeknQvB6E8EdHT6uA9NuQsLz62Ze5iUKps0uXbNscLNKq9cD8
	hpgxIZDen7ubLQNb3GN29orHE/3scUcpZXBTZ2u2/5ybGCIn9SzAnlgIu8Ke0T/bCQEd/Zh+62l
	qmF0PG5cqd2JMLhQoOQ4Vk1BgXxej5Yp5BjF1HraesKaADnnKk8Jsr0rGe/qr+jDO9TsfGpXW9k
	Y8iScQAbY/WiBJjh17owpNe9mSH/L1xK/iF6TRuP
X-Received: by 2002:a05:600c:4f48:b0:4a4:4d57:8462 with SMTP id 5b1f17b1804b1-4ba0234bc33mr47799765e9.24.1794314356334;
        Tue, 10 Nov 2026 04:39:16 -0800 (PST)
Received: from [192.168.0.15] ([2a02:a312:c59b:a180:251a:f25f:80fa:af1d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498363e0019sm5050033f8f.38.2026.11.10.04.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 04:39:15 -0800 (PST)
From: Artur Kowalski <arturkow2000@gmail.com>
Subject: [PATCH 0/6] watchdog: tegra_wdt: Add Tegra20 support
Date: Tue, 10 Nov 2026 13:39:05 +0100
Message-Id: <20261110-t20-for-upstream-v1-0-5923449951fe@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/yXMQQrCMBAF0KsMf92BJGgbcxVx0capjmBbJqkIp
 XcXdfk2b0MRUylItMHkpUXnCYl8Q8j3froJ6xWJEFxovXeRa3A8zsbrUqpJ/+TDqRty1x59jBk
 NYTEZ9f0rz5e/yzo8JNfvg33/AB/jS+l0AAAA
X-Change-ID: 20261108-t20-for-upstream-497bc765188c
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4066;
 i=arturkow2000@gmail.com; s=default; h=from:subject:message-id;
 bh=T2iP2KMR8ZGTOcw9sKv5YtssoUQpg/rlCJarXcwIR1M=;
 b=owGbwMvMwCVmYeTc/TaVxZzxtFoSQ9ZngUKDBQlPouvfurE4vZo4c4ayHdOLveyN34S/hf1b5
 vvjG9/GjlIWBjEuBlkxRRazh0JfeOZ5vd/wcmsnzBxWJpAhDFycAjCRCbMY/lkt7jy9ep5b//s5
 13bo+Ty3sFBZl7xDW27x1P7A/4fyguUYGQ5JnmK9k3Owbsa6YpU8v4rilYZJK78fMlrlnDOzcrl
 3ERMA
X-Developer-Key: i=arturkow2000@gmail.com; a=openpgp;
 fpr=F60710C8D69E03A01A2801CD87A47D20C2709637

The motivation is to improve recovery from kernel hangs which have been
steadily driving me to the doorsteps of psych ward for a few months.
Those events are rare, some happen at boot, others while trying to use
tablet for something real like reading PDFs, browsing web (to the extent
possible without working GPU accel), or just using it as thin client for
another device.

As all my attempts to hunt down even slightest hints of what went down
have fallen fouly (device just refuses hang with UART connected),
therefore this patch series is born in the hope it will finally enable
me and others to catch those bugs (use wdt and pstore).

This series adds Tegra20 watchdog support to tegra_wdt. Tegra20's boot
ROM hangs if VDE partition is off after warm reset (for normal reboots
this is handled by 8f0c714ad9be). The series offers two mitigations:

- By default, tegra_wdt stops the watchdog for good before the
  partition is powered off for the first time, using a new PMC power
  off notifier (patches 5 and 6). A watchdog started by the
  bootloader still covers the early boot (until PMC driver comes up).

- Booting with tegra_pmc.vde_always_on=1 keeps the partition powered
  on, so watchdog is fully usable at the expense of higher power
  consumption.

This has been tested on ASUS TF101:

- with tegra_pmc.vde_always_on=1, watchdog stays on, the device has been
  idling for more than hour (heartbeat 10 s, pinged by userspace every 8
  s), no issues encountered. Suspend/resume works. On timeout device
  reboots normally, u-boot still works after warm boot, Linux boots.
  Tested both with userspace opening watchdog device without pinging,
  and by crashing the kernel (panic=0).
- with tegra_pmc.vde_always_on=0 watchdog is permanently turned off when
  the PMC driver powers off VDE partition for the first time, after that
  userspace is denied opening the device with -EBUSY. No issues
  encountered.

Another series for fixing some other issues with warm reboots (not
related to watchdog itself) will follow shortly.

Patch 4 got flagged by checkpatch (WARNING: ENOSYS means 'invalid
syscall nr' and nothing else). I kept it as-is to keep consistency with
existing stubs. If this is not desirable just tell me.

---
Patch 3 depends on patch 1 and should not be merged before or watchdog
driver will conflict with clocksource driver.

To: Daniel Lezcano <daniel.lezcano@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
To: Jonathan Hunter <jonathanh@nvidia.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>
To: Guenter Roeck <linux@roeck-us.net>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
To: Randy Dunlap <rdunlap@infradead.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org
Cc: linux-tegra@vger.kernel.org
Cc: linux-watchdog@vger.kernel.org
Cc: linux-doc@vger.kernel.org
Cc: clamor95@gmail.com
Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>

---
Artur Kowalski (6):
      clocksource/drivers/timer-tegra: Keep Tegra20's watchdog timers free
      watchdog: tegra_wdt: Move SoC specific parts into match data
      watchdog: tegra_wdt: Support Tegra20
      soc/tegra: pmc: Add an option to keep the VDE partition on
      soc/tegra: pmc: Add a partition power off notifier
      watchdog: tegra_wdt: Stop on Tegra20 VDE power off

 Documentation/admin-guide/kernel-parameters.txt |  12 +
 Documentation/watchdog/watchdog-parameters.rst  |   5 +
 drivers/clocksource/timer-tegra.c               |  40 ++-
 drivers/soc/tegra/pmc.c                         | 158 +++++++++++-
 drivers/watchdog/tegra_wdt.c                    | 330 +++++++++++++++++++++++-
 include/soc/tegra/pmc.h                         |  19 ++
 6 files changed, 540 insertions(+), 24 deletions(-)
---
base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
change-id: 20261108-t20-for-upstream-497bc765188c

Best regards,
--  
Artur Kowalski <arturkow2000@gmail.com>

