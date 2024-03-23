Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFC31095C
	for <linux-tegra@vger.kernel.org>; Sat, 23 Mar 2024 10:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711190511; cv=none; b=Mkdmi9NbZAInLHPGWEvif+WmbGlub77OKKTtV9Qn4zKvN0ot1l8Ofuan+EuSQtuLVWI2xcYQY3mAwcvK0YK06Mqt3d1gMRwaBZbzxldP9RdwKwEpgkDFJhtZUWvh3CG3q699BtTz5xEdIbJex/qNN6fm1bH8XtSH/mC9nbSut8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711190511; c=relaxed/simple;
	bh=M6hFOyItZwOgy5Kd6/uJLgI7Ba7+EEpjLR23hLUmnvs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jtsQ/5gbmo7tNF1YsBC6JNOO9Ik3moz8o31nsSqbceoIkxPrAjzVju16lT1/cgG1iVSMVyyjqyMEK59NRTmbFLxIcYKbx1wof+SziRBk9mqReSfcCYrt6l7YTbFeivb5gv3KZMD6uGii22ZBdmeweZ6v9Fk04ywjhz8ZFerwx8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=G0joYf1P; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="G0joYf1P"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6962a97752eso22962136d6.2
        for <linux-tegra@vger.kernel.org>; Sat, 23 Mar 2024 03:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711190508; x=1711795308; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l2gwNXawQpStaJd+f02miPwjOIqU+NiXYGgzo4fTuRc=;
        b=G0joYf1PlC49rBHKyFRWkSCDEidzynHhxJisZ+kPgFlTCcIm/xR1t1RelLsAQc/43H
         Dl2bLShyA4gN7eGoISnKFidiAvt/aO8K+Z5QNyDg0Um3CWlACNFmKeDBHlEucJmZ58wk
         NOTi48E3W53XOUFhPIq2N1d3im2E9PEvEUugY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711190508; x=1711795308;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l2gwNXawQpStaJd+f02miPwjOIqU+NiXYGgzo4fTuRc=;
        b=N1zV78mpoy6SgkIs//ja4h/IFsPaue1rZ/OjFcc7n0piiBLweGUHCGGt2RbVrTC2f3
         fvCJajDBcMtMcigO7J5ulXbL8uMTbZB+WDNeLAR/upBpFb7g8U3TmBKaeSyO3kuOgpK+
         U0Z3rAz/G40HkdZ5AiCtrjP+nUielVA8miXfTfpzIfAOlkcQjCXjn48MbtxZeT/MbDQF
         ax3EBCvpMyu1+EG7v5HxAVukuDcqB+EtUDTtWSkrpwMuVFYNVuzc396NFxUmhjaehiRS
         u7z2aBJgs7wFx+L3sIjeYsHd/YYDNLGyP47yqka1wLHL0ykVYMaFFnvimphUGhdavjn3
         EGCw==
X-Forwarded-Encrypted: i=1; AJvYcCWVgCvc7DS9FLfyIQHbNXhCpsofCCmVxCPj3stejk9HVCHUI+uTjhliBfkyxQxV2fO8JsLt+51NgcrvtTqiraebeZTs5l0a6gpNyJw=
X-Gm-Message-State: AOJu0YzeU9AfeneY5Dv5MjAMk2SVV+zyZcFDMbwIQgcNlNJUDRCNSPkf
	HX5W4QW+Xr97P88nRpLfUPAD7Htb2vPcyRxdcRGNh5n7qtSYybK9sD6rhYzWt0WaqT2eytUI0RI
	=
X-Google-Smtp-Source: AGHT+IEaPhPtGbxBcXY1FP3UFKXAsCzWgXyfVlLg736dP5Cvp8mmrWqcNtkrrNX+g2QszIFymtba4g==
X-Received: by 2002:a05:6214:4009:b0:690:9a8a:855b with SMTP id kd9-20020a056214400900b006909a8a855bmr1658907qvb.29.1711190508331;
        Sat, 23 Mar 2024 03:41:48 -0700 (PDT)
Received: from denia.c.googlers.com (188.173.86.34.bc.googleusercontent.com. [34.86.173.188])
        by smtp.gmail.com with ESMTPSA id 6-20020a0562140d4600b0068f75622543sm1998523qvr.1.2024.03.23.03.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Mar 2024 03:41:47 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/3] media: Fix gcc warnings
Date: Sat, 23 Mar 2024 10:41:44 +0000
Message-Id: <20240323-gcc-arm-warnings-v1-0-0b45cc52f39e@chromium.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOix/mUC/x3MPQqAMAxA4atIZgP9c/Eq4lBjrBmskoIK4t0tj
 t/w3gOFVbhA3zygfEqRPVfYtgFaY06MMleDMy4Y7zwmIoy64RU1S04FOZANjqYukoGaHcqL3P9
 yGN/3A1hXP2ZiAAAA
To: Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Hans Verkuil <hverkuil@xs4all.nl>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4

drivers/staging/media/tegra-video/tegra20.c: In function ‘tegra20_vip_start_streaming’:
    drivers/staging/media/tegra-video/tegra20.c:624:72: warning: ‘yuv_input_format’ may be used uninitialized [-Wmaybe-uninitialized]
      624 |                          VI_INPUT_VIP_INPUT_ENABLE | main_input_format | yuv_input_format);
    drivers/staging/media/tegra-video/tegra20.c:617:22: note: ‘yuv_input_format’ was declared here
      617 |         unsigned int yuv_input_format;
          |                      ^~~~~~~~~~~~~~~~
    drivers/media/radio/radio-shark2.c: In function ‘usb_shark_probe’:
    drivers/media/radio/radio-shark2.c:191:17: warning: ‘%s’ directive output may be truncated writing up to 35 bytes into a region of size 32 [-Wformat-truncation=]
      191 |                 .name           = "%s:blue:",
          |                 ^
    In function ‘shark_register_leds’,
        inlined from ‘usb_shark_probe’ at drivers/media/radio/radio-shark2.c:306:11:
    drivers/media/radio/radio-shark2.c:212:17: note: ‘snprintf’ output between 7 and 42 bytes into a destination of size 32
      212 |                 snprintf(shark->led_names[i], sizeof(shark->led_names[0]),
          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      213 |                          shark->leds[i].name, shark->v4l2_dev.name);
          |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    drivers/media/radio/radio-shark2.c: In function ‘usb_shark_probe’:
    drivers/media/radio/radio-shark2.c:197:17: warning: ‘%s’ directive output may be truncated writing up to 35 bytes into a region of size 32 [-Wformat-truncation=]
      197 |                 .name           = "%s:red:",
          |                 ^
    In function ‘shark_register_leds’,
        inlined from ‘usb_shark_probe’ at drivers/media/radio/radio-shark2.c:306:11:
    drivers/media/radio/radio-shark2.c:212:17: note: ‘snprintf’ output between 6 and 41 bytes into a destination of size 32
      212 |                 snprintf(shark->led_names[i], sizeof(shark->led_names[0]),
          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      213 |                          shark->leds[i].name, shark->v4l2_dev.name);
          |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      AR      drivers/staging/media/tegra-video/built-in.a
      AR      drivers/staging/media/built-in.a
    In file included from ./include/asm-generic/preempt.h:5,
                     from ./arch/arm/include/generated/asm/preempt.h:1,
                     from ./include/linux/preempt.h:79,
                     from ./include/linux/spinlock.h:56,
                     from ./include/linux/mmzone.h:8,
                     from ./include/linux/gfp.h:7,
                     from ./include/linux/umh.h:4,
                     from ./include/linux/kmod.h:9,
                     from ./include/linux/module.h:17,
                     from drivers/media/dvb-core/dvbdev.c:15:
    In function ‘check_object_size’,
        inlined from ‘check_copy_size’ at ./include/linux/thread_info.h:251:2,
        inlined from ‘copy_from_user’ at ./include/linux/uaccess.h:182:6,
        inlined from ‘dvb_usercopy’ at drivers/media/dvb-core/dvbdev.c:987:7:
    ./include/linux/thread_info.h:215:17: warning: ‘sbuf’ may be used uninitialized [-Wmaybe-uninitialized]
      215 |                 __check_object_size(ptr, n, to_user);
          |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    ./include/linux/thread_info.h: In function ‘dvb_usercopy’:
    ./include/linux/thread_info.h:208:13: note: by argument 1 of type ‘const void *’ to ‘__check_object_size’ declared here
      208 | extern void __check_object_size(const void *ptr, unsigned long n,
          |             ^~~~~~~~~~~~~~~~~~~
    drivers/media/dvb-core/dvbdev.c:959:17: note: ‘sbuf’ declared here
      959 |         char    sbuf[128];
          |                 ^~~~
      AR      drivers/media/radio/built-in.a

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (3):
      staging: media: tegra-video: Fix -Wmaybe-unitialized warn in gcc
      media: radio-shark2: Avoid led_names truncations
      media: dvbdev: Initialize sbuf

 drivers/media/dvb-core/dvbdev.c             | 2 +-
 drivers/media/radio/radio-shark2.c          | 2 +-
 drivers/staging/media/tegra-video/tegra20.c | 1 +
 3 files changed, 3 insertions(+), 2 deletions(-)
---
base-commit: b14257abe7057def6127f6fb2f14f9adc8acabdb
change-id: 20240323-gcc-arm-warnings-e4c142cb5ac0

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

