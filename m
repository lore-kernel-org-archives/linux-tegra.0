Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7028D3115B8;
	Thu, 18 Jun 2026 03:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781752294; cv=none; b=cIIo872W1qZdOPY43vCNHBomP+eikpoJfTJS7b8DJ2ks5VcWF0na2dW1XlAJ9JXRND5SLhlBNfx6GwaqXAENvM6vyZfH68Z6/xqG9f6q5Kov6OFVHJl4ck3dnp2IuIFkUsIx1m3yZAxWAsavH0yA0ltmxwqT1kjUfZeZLIGMSL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781752294; c=relaxed/simple;
	bh=wBCZjAOT5PW8KHB1TN7zoDr3JIPMx1mEs1BKqDVAc4A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sp8L8Ff1P+CK6ju8kBZ8i1/c0q5jxL3ixg/cAAxzgjjtfZS7nzruQKRhp6tiyOIkXueOj5ORdGPYSFHfhPl0xlHPsaecv5P1GHRr+3XquUwkW+uXHij3xtqg743G4yDsqgot5xsX5QK3Bc8OjfbeQc67hWNyTr+saL6h7D4XU/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=TlHSijV7; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="TlHSijV7"
Received: from PC-202605011814.localdomain (unknown [222.191.246.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 42d79375e;
	Thu, 18 Jun 2026 11:06:17 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-gpio@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn,
	runyu.xiao@seu.edu.cn
Subject: Question: GPIO direction callbacks calling pinctrl in atomic paths
Date: Thu, 18 Jun 2026 11:06:09 +0800
Message-Id: <20260618030609.958831-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ed8b196ea03a1kunm1b78450a89f0f
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaHUgZVkkdGEwYHUsZTkMfH1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUlVSkJKVUlPTVVJT0lZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pPSExVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=TlHSijV7C9k5prGIB5HsGC5Nv7b7T7icDuTebd2zp88LjqX5ji4yySq3T0S0RjpoJmGbIz/AoO/AqMVdfCk9lx4GYomnDqzfgHvOHWLwFrbwuX/aMLD7eZOWH+hOrTht2dtdu4/YjPO/MFiqiS05CoOYNGuyffL3Ui38NAKvC6g=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=qmEHdv+ZjW1OhyXd4Lmp645+aIUQmOGyLgIJSzUFmoc=;
	h=date:mime-version:subject:message-id:from;

Hi,

While auditing GPIO direction callbacks, our static analysis tool flagged
several drivers whose direction_input/direction_output paths call into
the pinctrl core even though the GPIO chip is registered as non-sleeping.
We then manually reviewed the findings against the current tree.

The class of path we looked at is:

  gpiod_direction_output_raw_commit()
    -> <driver>_gpio_direction_output()
       -> pinctrl_gpio_direction_output()
       -> pinctrl_get_device_gpio_range()
       -> mutex_lock(&pctldev->mutex)

That can be reached from shared GPIO users while a per-line spinlock is
still held.  A minimal Lockdep reproducer preserving this direction path
reports:

  BUG: sleeping function called from invalid context
  #0: ... (&global_shared_desc.spinlock) ...
  pinctrl_get_device_gpio_range
  <driver>_gpio_direction_output
  [ BUG: Invalid wait context ]

My first draft for this class was to mark the affected gpio_chip as
can_sleep, but that looks like the wrong contract.  gpio_chip::can_sleep
describes whether get()/set() may sleep, while the problematic operation
here is not MMIO value access but an extra pinctrl direction round-trip.
Rockchip history seems to support that concern: after the controller was
marked sleeping, a follow-up change stopped calling pinctrl for
set_direction because whole-chip can_sleep caused atomic get/set
warnings.

For PXA and Tegra, I am considering a small series that removes the
pinctrl_gpio_direction_input/output() calls from the GPIO direction
callbacks and leaves direction programming on the drivers' existing MMIO
paths.

For PXA, the driver already updates GPDR directly in
pxa_gpio_direction_input/output().  The proposed change would drop the
additional pinctrl direction call on variants where pxa_gpio_has_pinctrl()
currently returns true.

For Tegra, the GPIO driver already programs the GPIO controller direction
registers directly.  The Tegra pinmux ops appear to provide GPIO
request/free handling, but no gpio_set_direction hook, so the
pinctrl_gpio_direction_input/output() call seems to enter the pinctrl core
without adding a Tegra-specific direction operation.  The proposed change
would keep pinctrl involvement in request/free but not in GPIO direction.

I am not proposing the same change for MVEBU in this question.  Its
pinctrl direction hook appears to enforce GPI/GPO capability checks, so
simply removing the pinctrl direction call there would remove real
driver-specific validation and needs a different design.

Does removing the pinctrl direction calls for PXA and Tegra sound like
the right direction, or would you prefer that this be handled differently
in gpiolib/pinctrl?

The local draft subjects are:

  gpio: pxa: stop routing direction changes through pinctrl
  gpio: tegra: do not call pinctrl for GPIO direction

Thanks,
Runyu
