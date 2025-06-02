Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D966227BB5
	for <linux-tegra@vger.kernel.org>; Mon,  2 Jun 2025 15:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748877542; cv=none; b=rb2HE+a5uzYyRJataGTlicUdUGcH++YqDRPr5SdDNDTI4vfJ29+zJnoMyWLAhbghiEJgSiU3N1pQmf6Cg04nXlHRKkJru7qfrW3zqB1k4EL4ZSwSef/loQe+uNcfHbHEkdy24D5ZorbBbl//g+2jU1DWTnpJAHarv5ZRKt39NqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748877542; c=relaxed/simple;
	bh=oFAT+NNKGnh5VXgaLf8krwrz5XSrHjhFetyALYSIt7M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AYG6eA7/F8K09zsZ76+Deqrfm2mHMjKxWkDztN/Fv1paZi8Ib1nNcJjyCVfAvzZmhR8ZK6MtN5h44KFAJdxXOuMaRymz88/X9AEBHn0bbZTi2sT0qBfJpohciJ3P/iVlK6wMiD7aa1JbAA5BEVWf3/C5MRJ1mKY1xJyRERK+YTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hU+rxaRj; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hU+rxaRj"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-441d437cfaaso30666655e9.1
        for <linux-tegra@vger.kernel.org>; Mon, 02 Jun 2025 08:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748877538; x=1749482338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IUg1jDrh7o13xIeD5Z16HH35vSn20OCOm1MqSRrAi94=;
        b=hU+rxaRjiBH8xcwMXgSB+l4qIkG1HkLaVP6j+LFVWVqwVwDZBBJGvyPJgzLWDdv7mE
         VrAnJEvohap10Ncq54pnb/oVQmjzbuqFRO3aoreqOC0r4MQrR3VjzCKon/UgNpULpAOG
         HTfZp92bSHfXQOTPt+EuMhC0MG11rC3ACkM9a3krAIBclFU3erTondo/nXTxLrIjBRBf
         2W04mbOeTjK2qf6ri32Q5WbJK8cm002VsGG2b4UM7yP9UxvfAs1D29Q1Z+pfoxBplUOg
         Nm5W/OKUxyUseVIvnVytekk+/5SEbOL2BFjgipzscEpZaaErP/wYcf4Rjy5gZnMH93MZ
         Owlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748877538; x=1749482338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IUg1jDrh7o13xIeD5Z16HH35vSn20OCOm1MqSRrAi94=;
        b=nJZ75OTiNFKratWGhB9AZEabEpAh+MRY+r9pKCOCHQCqupXu8k+BFT51z+UPhRP9VP
         yQDOYOG3dgbumv9HZSPMwTZa3oTPsoezeXh4Zlq0AxGzNs7UyVjVp9FpOmb7iLw8EVse
         z31NKElrl5vUSQP0cj/tvcyaVOVIQB4mDnUehp25xdt97XC2FIKkS4OhsNG1mbt4uoMB
         goJwHOmak3M8O7f8X1rJUyd6Mgyccztd+l2bJGW4bTIrBnKOnPMc6F9hd897MXRMa550
         VJBJdeHaJPEXU3rGgI6rCXvtNyO/f84C7h0SGR+B5i/NU6rDuG5sNLT6jvxjphvnF9WX
         wO1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWTlJGJQblPEEXVJFj3IL/Do3NrgyyPopNYt6Mo/C5FjmscVGalfR06BYJkZdLsVZvRskoRQShneGaP7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWiwAD6Bmf6NuCHHFrKIjBTaojqebiDZElz6KJdDE3QnWwOMHJ
	rQKFN9H0/FL0Zsj5TvCDO/IJrRNZh7GWlKwVm2oBWxz1SoCVCZy7gnFv8klqc8e7KZg=
X-Gm-Gg: ASbGncvFGRcOfOHrHcG8jsJcPdGP84tmYkJ3Y0RaAlfxozu1N9CeKdrz54tPnW28W6K
	eYeZIsAXD5v7ZhxDCpnf2QzOS0btSSUq03awwHMQA4rdsKxdFb46JAXrtyOq3Kbie0vOsYh2eS+
	GzsbbhX/NTfB6OzL8DQyr14PuEy3iyWgtrv8MRT5jZwAn8VCw8rt869KFsiBWRrBveYCkwkVT0F
	d4z3/LN3GaxYdr9SxI2T/2hON5ydLtELpWTUkzBgZEUsy0AOwbqa1Ug5LXOVIlfC7oRCuDZbgST
	onVRAk1Au+uNxnGX/BISm+pXfZnjIas5jTKNFNmgf3em2t7qOnAlPDX2gKvRQp4v4yPFriPHDb7
	CIC/O5UV/s98C
X-Google-Smtp-Source: AGHT+IGd9hG5YHfH76nGmto9bsoX9DJOOYs0jiBYnyQonK2UIDx2uNqiKNlTaeCJzRAT0d46DtaI3w==
X-Received: by 2002:a05:600c:4fce:b0:450:d367:c385 with SMTP id 5b1f17b1804b1-450d886f21bmr129966005e9.16.1748877537630;
        Mon, 02 Jun 2025 08:18:57 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe74111sm15619844f8f.56.2025.06.02.08.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 08:18:57 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de
Cc: Jim Cromie <jim.cromie@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Marco Elver <elver@google.com>,
	Nam Cao <namcao@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	John Stulz <jstultz@google.com>,
	Will McVicker <willmcvicker@google.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Saravan Kanna <saravanak@google.com>
Subject: [PATCH v1 0/7] Setting the scene to convert the timers into modules
Date: Mon,  2 Jun 2025 17:18:44 +0200
Message-ID: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The timer drivers are all compiled-in. The initial pre-requisite is to
have them available as soon as possible in the boot process. While
this statement made sense a long time ago, the platforms have today
multiple timers for different purposes along with architected timers
which are initialized very early. For example, a timer can be used as
a backup timer when the local timers are belonging to a power domain
which is shutted down, or used a watchdog timer when the counter are
shared, or also as a pulse width modulation counter. Another use case
is the platform user may want to switch to a timer different from the
architected timers because they have interesting characteristics in
the context of a dedicated platform (eg. automotive).

In some existing drivers, there is already the code to load and unload
a timer driver even if the Kconfig does not allow that. It means, the
need is there but partially upstream.

There were multiple attempts to configure the timer drivers into
modules but it faced the fact that we were unsure if it is correctly
supported by the time framework.

After investigating deeper in the core code it appears we have
everything set for the modularization of the timer drivers.

 - When a clocksource is registered with a better rating, the current
   clocksource is swapped with the new one. The userspace allows to
   change the current clocksource via sysfs

 - A clocksource can be unregistered

 - When a clockevent is registered with a better rating, it becomes
   the active one

 - A clockevent can not be unregistered

A timer driver can be loaded later because of all the supported
above. However unloading is unsupported because a clockevent can not
be unregistered and that will lead to a crash.

But if the timer driver has the module owner set, the core framework
will handle the refcount correctly and will prevent to unload the
module if a clockevent is registered. All the refcounting is working
in different use cases.

 - A clocksource is the current clocksource, the refcount is held

 - A current clocksource is switched to another one, the refcount is
   released

 - A broadcast timer is registered, the refcount is held

 - A local timer is registered, the refcount is held

Consequently, it is possible to unload a module which is only used as
a clocksource. As soon as a clockevent is registered, the refcount is
held and can not be released thus preventing the module to be
unloaded.

That mechanism ensure it is safe to convert the different timer
drivers into modules.

This series adds the module owner in the different driver which are
initialized with the module_platform_driver() function and export the
symbols for the sched_clock_register() function.

Cc: Jim Cromie <jim.cromie@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: "Peter Zijlstra (Intel)" <peterz@infradead.org>
Cc: Marco Elver <elver@google.com>
Cc: Nam Cao <namcao@linutronix.de>
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
Cc: linux-tegra@vger.kernel.org
Cc: John Stulz <jstultz@google.com>
Cc: Will McVicker <willmcvicker@google.com>
Cc: Peter Griffin <peter.griffin@linaro.org>
Cc: Saravan Kanna <saravanak@google.com>


Daniel Lezcano (7):
  clocksource/drivers/scx200: Add module owner
  clocksource/drivers/stm32-lp: Add module owner
  clocksource/drivers/sun5i: Add module owner
  clocksource/drivers/tegra186: Add module owner
  clocksource/drivers/stm: Add module owner
  clocksource/drivers/cs5535: Add module owner
  time: Export symbol for sched_clock register function

 drivers/clocksource/scx200_hrt.c     | 1 +
 drivers/clocksource/timer-cs5535.c   | 1 +
 drivers/clocksource/timer-nxp-stm.c  | 2 ++
 drivers/clocksource/timer-stm32-lp.c | 1 +
 drivers/clocksource/timer-sun5i.c    | 2 ++
 drivers/clocksource/timer-tegra186.c | 3 +++
 kernel/time/sched_clock.c            | 4 ++--
 7 files changed, 12 insertions(+), 2 deletions(-)

-- 
2.43.0

