Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0309A470E8A
	for <linux-tegra@vger.kernel.org>; Wed, 12 Aug 2026 15:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786548383; cv=none; b=WDgrSS3EHaeg6VVNF659x0elhFBxtJKz9JMUwHcvWSptjEVcqT+PlWzfKxuVs67V12F3EiMc8h8yHkEP52+kEXvuUGIoS/0lFZyP8TvF/Fn12BzsMMYmGoeHEwRgHiaorp8Hav8Gn5ilKNycW7lWJpnOb9DN1p3kA9aZIN836ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786548383; c=relaxed/simple;
	bh=Wtk0NDE/nQLO0Kq/zxEWskh8edpJnJdJeeeQfs8GFgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NcPSFcr9orpWf5LzqKm2lcMj76TXI3mLuXREOG5enRF3k6EaaQ/jhonmiQug0gMz+ojPH558e5cZ1Jqa7vXCr91wYHPM/D38crDBedygrwDoT5pvowjjBQq3GsZULvvu6xb3M/pKTMRC4RgGtxYjpSQs0bYtik7EY3+n678M3k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=BO4rX17i; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="BO4rX17i"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49553515a8bso15986775e9.1
        for <linux-tegra@vger.kernel.org>; Wed, 12 Aug 2026 08:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786548366; x=1787153166; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UaP8njrWqNK9u1k6UNh7CmbA/RsS8a+eLHotr32/f0c=;
        b=BO4rX17i41nOdw8CbZHhpSpqE1CZy10/olhBrew2hVw6fnqThOmZQtPsRVGRdag0EL
         tnMJStBIOWInsHKNxRq+OJs5EM5BX9FcDxuJoFF4KZmWsHspgmxIT7k/a+PAUcAwqFhq
         LiRJri0yRVndwb+kYfV+YlfDCdvPt/LlnVMYG+m62gS6++YCkltfbY9mjwEId4itOnJf
         3Ax9U7Q+Q4Xr/+p4r9Ciu/8DbG6bHKySX53QAyQwcC2hEG3dHZvSSSmNpcO16U/ABceT
         y9u5/RvZSA17bHFWNDDLXGWEc0mAKirHEpjWkxa/+kCmesIk23Uur2Rkv632uavVmAcm
         csQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786548366; x=1787153166;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UaP8njrWqNK9u1k6UNh7CmbA/RsS8a+eLHotr32/f0c=;
        b=UDcgLS2zjcDSeoX9JQWl3ep5MOa7VOQtUERpNG+cin4ghtLubwpzs+T9TpSavLRUyh
         XsJ5KKlMDJHQ6X+UyVJC+pe83UB+/pw1ZFW35PTXlUouyXt36cR8VFVA6KVwZ+AUlk44
         Cw3TDnHSLMw0VS2wzy+85F+2IufkavncRv7LM0w5TgmtIrqppUCtkLQkTDS114PLs+Xy
         hnFzB0Huaiw92DMezrxcB1re0TUCKdWj7NHHk6Xd+H7V24S3WYtE1RoIE0lPetLd9Pg7
         EydsTjCv5VA/e3/l1J7+Avp8hPvFGLS5TUVRaC45dI++ISm08/1vyKQKkEQknTrHslGb
         lMZA==
X-Forwarded-Encrypted: i=1; AHgh+RrWrCghTcCCQodNgqukeABHRVYOGZBOcI65FJ8lWehT2KWRGaGxpQa1ksFLwhQJrg8Ve0TmlLl0xxekSA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7wMETYPSKEx1ITvsmV/4FI3O2Gp94MrXehwYE8xBDSew0+HuH
	JxuQArIlWFD03xUqfg4B3Wmbc9l/VJyhuSeAdshVOTFtdpOxlvel8FI9H0R1Ie/5IF8=
X-Gm-Gg: AR+sD108ZPrRUWMXfYbYZuAQaIOzneQObf7O8aP9MoIisa+Zu+56TVUXsBEfBqADGf5
	Eih39OQcSRo4HkaREDcSKLtv+LtvwaLxrdzNfGO3qzQPf9Lnr2QUYDjHTq4S+7LFf7vl5CdcF2J
	F1uG6vCnweJDrdcBU1WCnPj52GmI4gLmDBsAlDKJNvswo5RR71AyFvjwCq2X4MFKP1nxt77ZNJj
	8YnXbOsEiKLOU/0vGBQiPyJ5/4CWhhcMb0g11z5UklBvKOfCu25CiYUmxlC+Y9vP29bo3OJL1aw
	cJIfBKAsNPS7KSxBHIB5r7ub+PynU1W0fS41o+av8gpZfFgzrpS5azZBMDZj+072aMRKfGi0dPS
	y8kx1S9brvs4Xv7xiAOkHrhP8khCsbRIZGRdeFN3pTe3LtG81DBeOkaJvzm1x0G2PaxzfbE2mGk
	UzOIOzUHlozqN/7rw1XMVvlt66+kygjvF1ELhreBYrDqZUoLz0hHeueKzI1Mz7BFCcxsvlW83AL
	89XLlUOoyj0/9CvOZQd17/qbI0G9ueNq5QqhUz7ad2fhCudyyc=
X-Received: by 2002:a7b:ce0e:0:b0:499:726b:7375 with SMTP id 5b1f17b1804b1-4997c149ba3mr57045705e9.14.1786548366309;
        Wed, 12 Aug 2026 08:26:06 -0700 (PDT)
Received: from localhost (p200300f65f017104d1b8d865063c5703.dip0.t-ipconnect.de. [2003:f6:5f01:7104:d1b8:d865:63c:5703])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4997c9944ecsm57398145e9.14.2026.08.12.08.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 08:26:05 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-serial@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH v1 0/3] mailbox: Provide devm variants for mbox_request_channel{,_byname}()
Date: Wed, 12 Aug 2026 17:25:51 +0200
Message-ID: <cover.1786547950.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1087; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=Wtk0NDE/nQLO0Kq/zxEWskh8edpJnJdJeeeQfs8GFgQ=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqfJB/7yySQbqx1G83rWBLo8uBfFZuEr2QxFCo6 dYxinU28aeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCanyQfwAKCRCPgPtYfRL+ Tm4tB/sGKfeGvf851ZrjzdYH/y7CQMrZDskN2gFqCxqs3CbEMJPwFlqOF0Lrkz3bWQVbkwxpeyp bUKA4WZpW2Vs+ZtwzAiWnOuLdIbJIV1wkR67tXEeztaGD/84goXxqUF2luTVqGoGNRBY8RVoIwL QPHFE5xHMqSF0ugLnqyu//aOHfIg/vHFqNZ0g32Y9wWpne3GkJD+krr+1OJ0IdATnbF68Ni9PHU RWeSGrU9nmdhMvSo9FZrfpmFZF3TFdo1fIOgcU7SPGeZ0zv3FrhkFMtR35eE7wRjt6NWyhGgx4I TdNrpe8YutRjkO+FnYIpq9mZyOzwqje9sDRR78nYRq5z5qeg
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

the first patch introduces devm variants of mbox request functions.
The second patch is just a minor cleanup preparing the third patch.
The third patch demos how the simplification looks like for a driver
using mbox channels.

This series is mostly about the first patch, I'll resend the serial
patches separately once the first patch is in. (If the serial
maintainers are enthusiastic about the 2nd patch: There is no dependency
on the first and it can go in already now; the third patch has to wait
however.)

Best regards
Uwe

Uwe Kleine-König (3):
  mailbox: Provide devm variants for mbox_request_channel{,_byname}()
  serial: tegra-tcu: Make use of dev_err_probe() in .probe()
  serial: tegra-tcu: Make use of devm_mbox_request_channel_byname()

 drivers/mailbox/mailbox.c      | 44 ++++++++++++++++++++++++++++++++++
 drivers/tty/serial/tegra-tcu.c | 32 ++++++++++---------------
 include/linux/mailbox_client.h |  5 ++++
 3 files changed, 62 insertions(+), 19 deletions(-)


base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
-- 
2.47.3

