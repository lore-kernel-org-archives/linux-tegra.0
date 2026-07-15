Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB17646AEF2
	for <linux-tegra@vger.kernel.org>; Wed, 15 Jul 2026 12:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118564; cv=none; b=MNagsHStQv8DvaIgtiTjGZQ+QGPnSOUL4plzEh3lzgj4LNcSHMYUl+naoEnRKxhA7dl153Igi0IsCG8jMu66qBbZ6gLh8ZerfgqQ+fn4SHoBRsTsSCWTjg/Pk4X0B9Fa3ngcmJ0lSHWhdI+27e+r+HUeaKeHnuIUrlIq4HhFqDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118564; c=relaxed/simple;
	bh=nrTsPQFoCtfwAFu3v09MuG+OELfRHAvPanIJna/kovM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HPQAgTr9FsajHx/qsIatTmJxvQM/nC1/H9+R6M4j2+q/IxoU7QmLSSNIDaPBHhixcA3CnaezhXUHCm09gzmWZBOCSYClAkHP28ttl5fcjIiwSGWrgZWrDqIoGhrX1xB/JGr/1Uw7O4tOpleUO70GSDI3kt8oDdSSzVwgdc18tQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/6T1AuL; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/6T1AuL"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39c7fd45465so44695361fa.1
        for <linux-tegra@vger.kernel.org>; Wed, 15 Jul 2026 05:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784118559; x=1784723359; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f3K5awkNoDHIG61b2HSqKFDBT2vo7+SdZ5eSrGUkQm0=;
        b=i/6T1AuL4+7M4wD05OtMljRLwCWvUp5SZ7B/UgFvSGHr8QqrireX4013n5n9GUbBu7
         5I5/j1594E9/XkerJpl5hV8WMW74LLzSDNby/hnMj8+NoOKxgSJZ6M050MRSJFumNjyB
         f7xzRK8mR+6eVpaN7sfOietGBqNTTESrmjyDtnyuY7UWLv0VaZP8/pbErklUKUsEAIsT
         QW/+3IgRHmSQ28clL3VEOVvqLoVQ/KSEaSs/QH2+jTozdJbBDhG3LeiahiaMVgSjqMN5
         84Rxr5vj3m9C/JUcjXWC5wWL+eRomFrN+V9gWxAdyYTgUn2tcyIvxfHhuxGFhIi2ckGB
         c2rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784118559; x=1784723359;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f3K5awkNoDHIG61b2HSqKFDBT2vo7+SdZ5eSrGUkQm0=;
        b=SZSnwPOKYrW8zuhV+PQ8yQ6bywzF6YbEKX3T+uHwq25uBxT8SB09K09BsYscEku9Z/
         XngMxL++7ICS9VLOtuY7ksbkxuX/rSKRBUjaK9kURd3dPZsrD+qWgfHINhMBBb3EazFK
         XTQJOM2x/yTmw85tVG8AjCjI8FqhyFkXmQR8Tr8jxDPP89eEFSJ79bIF+fzwAE4e86KD
         Sgl1VYqlufVCRmZ3maGnVJqwvAmBvq+bSEEN8Uet9O/POuNI4QQjSg6SVypElC2o9gTU
         j/WQDtUqdSeIz8hPCq1srMlvg02TgxHJNEOW65Ntm5+x2mR5LobuXrG+z1jp0K+YiKHR
         X7Pg==
X-Forwarded-Encrypted: i=1; AHgh+RoSAAgmTEUpemFGBzOfBC/paYdvYcmvctDYsJJ+nSJ4JYehG9ytByodM/PCSapYgn0Z+qcyCPVByYsonQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEQcjVZ+hLUGfXbaTUG6fLb4sT7B0M5fpRvtpxdBBTmWHOs5kp
	6NvMcrGycJayW20m4Ldj9bN8ZCiHYpWK1fUXtgp8UkcBTb1BllLPgVIe
X-Gm-Gg: AfdE7ckBpButpdcI8BIEs0p3thHex+jMcHCLdh5imDxGuC1l95bbzJSvsktPgnxHL+Y
	Sq1mf/2T+9Fa5GfAqw+IkaWTjgZtJkucHDQ6LFHp8OafASrXUvwpv6bEcpSoxOEAUKzKhdSbyeg
	CzaY2UELlucodO+VH5WRtA/kWe1yngpAfN/HWSGpAqyPz2Qe+Ilp0r14hjcbgfAOXmy/blP4g/5
	/nN99PQXRq9s/X9G70RoxKAvq1jaGqBHlolef0L4GvkXz7Koj/NSHm+TnrAghT74b1lw8ejDddb
	9VsMXOBujcTWmALcLi3QIgE1pRLPEjb700RP1eRs+dbYi0qmsw9h8ncMYBsrOEGl+noNb3rpACe
	Yt3EsY5MLZmq3SebfRbRqIAjoDW9BUpH29Wd39v0h+IriOcRUZw3Cb7M/oejGubn4uikzy5PwlB
	9I28miXAMIiA/opJ5pzK5S3ydMc8LJ4zR6+YAwNFW50jW+HlFvx9Q3AIcDexIl0m4pI/aBhx84/
	5V5YMBECp/9ba2HpCw4rb3T15ypCd+GpxOachFT3cnZOWJ7/EPBOVuPVY5NrnJIJH4XXV5UNsBZ
	xRZMn/4luXYI
X-Received: by 2002:a05:6512:3b88:b0:5ae:bba1:f231 with SMTP id 2adb3069b0e04-5b159b6fe60mr1524076e87.17.1784118559013;
        Wed, 15 Jul 2026 05:29:19 -0700 (PDT)
Received: from ola-desktop.tail7f4623.ts.net (184.89-11-176.customer.lyse.net. [89.11.176.184])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01cab1888sm4161884e87.83.2026.07.15.05.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:29:18 -0700 (PDT)
From: "Ola Chr. Vaage" <o.c.vage@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	linux-pwm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	"Ola Chr . Vaage" <o.c.vage@gmail.com>,
	"Ola Chr. Vaage" <ola.christoffer.vage@scoutdi.com>
Subject: Re: [PATCH v1 6/6] pwm: tegra: Implement .get_state()
Date: Wed, 15 Jul 2026 14:28:48 +0200
Message-ID: <20260715122914.2815081-1-o.c.vage@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <33b13f17d7135923d08e2ff40c867803e19609b9.1784030076.git.ukleinek@kernel.org>
References: <33b13f17d7135923d08e2ff40c867803e19609b9.1784030076.git.ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello Uwe,

On Tue, Jul 14, 2026 at 02:02:40PM +0200, Uwe Kleine-König wrote:
> Subject: [PATCH v1 6/6] pwm: tegra: Implement .get_state()

I tested this on a Jetson Orin NX (Tegra234), the board from my
divider truncation report, driving a fan on the 32a0000 PWM instance.

The board runs NVIDIA's L4T 5.15 kernel, so I backported the patch
onto that tree: .get_state() returns void there, pwmchip_parent(chip)
becomes the driver's device pointer, and the per-SoC enable_reg /
scale_width indirection collapses to the fixed CSR layout (that tree
predates the Tegra264 restructure). The decode logic is unchanged from
your patch. The tree also carries my divider change from the other
thread, which is why the achieved periods in the table differ from
what your base would program.

Procedure: apply a state through the pwm sysfs interface, read the CSR
register and the clock rate independently (/dev/mem and clk_summary),
then unexport/re-export the channel so pwm_device_request() invokes
.get_state(), and compare the reported state against values computed
from the raw register:

  applied period/duty/enabled  readback         computed from CSR+clk
  45334/20000/1                46432/20496/1    46432/20496/1
  500000/250000/1              481883/240942/1  481883/240942/1
  5000/2500/1                  5020/2510/1      5020/2510/1
  45334/45334/1 (100% duty)    46432/46432/1    46432/46432/1
  45334/20000/0                enabled=0        enabled=0

The clock rate varied across the cases (3.19, 11.03 and 102 MHz), so
the scale field was exercised at several values, and the 100% duty
case reads the full 9-bit duty field (pwm0 = 256). The readback
consistently reports the achieved hardware state rather than the
requested one.

One limitation of my backport, not your code: in the disabled case I
only set state->enabled = false instead of zeroing the whole struct,
so I did not verify the period/duty values your version reports for a
disabled channel.

Tested-by: Ola Chr. Vaage <ola.christoffer.vage@scoutdi.com>

Best regards
Ola
