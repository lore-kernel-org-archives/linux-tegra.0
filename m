Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EE99154C0F
	for <linux-tegra@vger.kernel.org>; Mon, 25 Mar 2024 14:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711376402; cv=none; b=EE3MrbXEgZJ1AS1VBldbERer+9GddJdK2VeLRkqw87DoKoHiQRvHF3BS1GurMBMY8Usgre64ORN5M5IIcNblkeSco5TN0yNeBryFUn8C7pPUXF1GpSEE9L/so/nHpqOdiWQT90qzGLharY0LxgqTLNXvKYnobrERB2a1XgcNi14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711376402; c=relaxed/simple;
	bh=JKbdbNdPOYQQqddMWH6dBM0cjrj/2ap/o5f7isOs8AY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Qw65mxcsps4A93KYYKpZYP+VJMGna2AFbadhtSoAMWuqy6aLLoebW3MaSV/gt+7o8C99eYMbG6W7H8KMIkvdAIYB8f04NuoGp71+ZP9Tx5ZOP+eMDlV+2IQ1ak7Brd1EfKj3FFgTfIAJGB07PaogJyxbmiQDPilvc6MfoazqQ3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kKsgdGtM; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kKsgdGtM"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-2297d0d6013so2473220fac.0
        for <linux-tegra@vger.kernel.org>; Mon, 25 Mar 2024 07:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711376400; x=1711981200; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mXrTB7+ol6tbk+bHTpvN5T0GXtoDHNWTCFN/jK6yyrw=;
        b=kKsgdGtMeBqh6KxpG+gcofmOArsJssJWTDAZ5iYL7xehpQMFUmuCMvIyFfmdrKZGHR
         8jm1/e0Cq4zXkbAsNvW43rk8sRZlWHgJZn2vXrtkHy5uag0hyRpviAShE/24Egv2T2AK
         YHOsVIxXzA6qXsl5nyvFkltQuO6hTur3PvbFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711376400; x=1711981200;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mXrTB7+ol6tbk+bHTpvN5T0GXtoDHNWTCFN/jK6yyrw=;
        b=CNVIAlbjbCEQFrT2RDt6a/QgUb996Nlu7eGeopBF9Rq2Bc9qKQn1fG2RhNlBUWz4eT
         DwHRawrbLXtccMll7IJ7+zfbJYuN9dKirN5HbgNG0BOzjkETijM1a1Xtwhsi5LtL3XSB
         dPT+REFzRLA+2tehddeSH/4LZcmRpyh5pFW26xy3qNjEcYvmbmijM8lvJ2C+Np4p1Hhk
         rxkdPUCfJtK6Lhr/zCWo3C/7RCz5doC9YesDeQWO/XrZfk0+8sws6CLQ0YATyLTZ5ze3
         KDWEqF93CdH/jwsUSyZBHk94LETqYE7EsEBnxqCnfqSwoAn6zQVRwPtlr1fBxOA6lG2w
         BGVg==
X-Forwarded-Encrypted: i=1; AJvYcCVXVww2cCgsQ+Yl7rA4D+RJDY9QcOownZ7qd/KT9JPqJWKbzwmNSDFJSowPYpSXW8n9bIWGNjojruXe33hWfUbxNxk2rTW+Es2Wsgk=
X-Gm-Message-State: AOJu0Ywv6qrrazoB+B2mhxC1aopsjMlF+TLJCqdVDBIlsQhU6GIwXMYE
	b6Vbvy0zXuxm3apMUcnqWU2baZGj4F9tr5kgIZW73XzF9bBJ0I3+V3MfZZQ43w==
X-Google-Smtp-Source: AGHT+IG+csagqpvPTu78ZUHHmPYI/wP0o4on29JF1NkEZT/PFJ0Ha9SsmHe27984oyp+F6/Vtl/r0g==
X-Received: by 2002:a05:6870:d0d1:b0:22a:4345:5731 with SMTP id k17-20020a056870d0d100b0022a43455731mr2324674oaa.29.1711376395371;
        Mon, 25 Mar 2024 07:19:55 -0700 (PDT)
Received: from denia.c.googlers.com (188.173.86.34.bc.googleusercontent.com. [34.86.173.188])
        by smtp.gmail.com with ESMTPSA id br11-20020a05622a1e0b00b00430a9b20a55sm2618759qtb.69.2024.03.25.07.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 07:19:54 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 0/3] media: Fix gcc warnings
Date: Mon, 25 Mar 2024 14:19:52 +0000
Message-Id: <20240325-gcc-arm-warnings-v2-0-47523cf5c8ca@chromium.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAiIAWYC/32NMQ7CMAxFr1J5xihN0wEm7oE6pMZNPTRBDhRQl
 bsTegDG96T//gaZVTjDudlAeZUsKVawhwZo9jEwyq0yWGOd6WyHgQi9LvjyGiWGjOyodZbG3pO
 BOrsrT/Lek9eh8iz5kfSzP6ztz/6JrS0aNKPriXo7dSe+0KxpkedyTBpgKKV8AZduLGezAAAA
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
Changes in v2: Thanks Thierry
- Make tegra20_vi_get_output_formats() and tegra20_vi_get_inut_formats,
  consistent.
- Link to v1: https://lore.kernel.org/r/20240323-gcc-arm-warnings-v1-0-0b45cc52f39e@chromium.org

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

