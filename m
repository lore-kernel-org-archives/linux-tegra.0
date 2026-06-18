Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B9635B12B;
	Thu, 18 Jun 2026 15:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781795603; cv=none; b=at6KDCv/sE9nshwoVfMgGt7uW3aVNBimX2FkE9o4cTmanuxKZPhipnITHgrz6YygZv2Qhbc7NTMN8vAIZPvtsjYHWI1eYXXS0IwnZlBitxtZU+99lr44d/PbZQIhKjaUaGlKEQCYx1KfgM53+befKAnQFMtOBnX5hH4HQzKggLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781795603; c=relaxed/simple;
	bh=y+mYC+JiZKOg3sWA1xkfUPDNgNA3JItr41GLGsQzk/o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mOeCes0gL7PUYAXV705zxbM7Hj6QLzZlfcuSeFxhO9TE7Sp1y7GGy/7HaldJ1IgxLDDveHV+Y1Qc+84F4L2cwLgZWstPq9oukD37KWh/OFoNjjGAaRghz+MBt+uomST5GzmQEtNwvEC9KSaShpVO9P9/TpE+BtRk2RarB1yMm9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=BaDpc84z; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="BaDpc84z"
Received: from PC-202605011814.localdomain (unknown [222.191.246.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 42eee94ad;
	Thu, 18 Jun 2026 23:08:07 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Linus Walleij <linusw@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	linux-gpio@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn,
	runyu.xiao@seu.edu.cn
Subject: Re: Question: GPIO direction callbacks calling pinctrl in atomic paths
Date: Thu, 18 Jun 2026 23:08:00 +0800
Message-Id: <20260618150800.3930930-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAD++jLkL+WV+WYCy7YsQ6n8ZQH27gLHQKf+-CYiV3GU=dbgcUQ@mail.gmail.com>
References: <CAD++jLkL+WV+WYCy7YsQ6n8ZQH27gLHQKf+-CYiV3GU=dbgcUQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9edb4670a303a1kunmc4843ab0a7086
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZHRhLVhhLSB0ZSkxLGR8YSFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUlVSkJKVUlPTVVJT0lZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pPSExVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=BaDpc84zHnuTmAVyzWMm3jpttyXtERUVd3qygkLQ7bBbrWehDC6m4RUfzcjxzo4jpwV8tLZhco/5Utmkb1EcJSGHKrpHIIIxEREFb18SLS3CdDq4CBbHcGjy6rfjYKihJxMKLn3U7oKDgJfIoum3gSnv+jyRpaqhs+PBs7cGB7Y=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=r0ciEGtJ+ZM9r+cvn8Not9IkSBfHrREwC7EUYq8DykI=;
	h=date:mime-version:subject:message-id:from;

Hi,

Thanks for checking.

Thierry, thanks for confirming that Tegra does not currently provide a
gpio_set_direction callback.  I agree with your concern: even if removing
the call is technically safe for the current Tegra pinctrl implementation,
it may be conceptually cleaner for the GPIO driver to keep delegating the
direction request to pinctrl.

Linus, yes, the mutex I am hitting is the pinctrl device list mutex taken
while resolving the GPIO range.  If that lock can be made non-sleeping as
you suggested in the other thread, then this class of direction-path
warnings should be better handled in the pinctrl core instead of by
removing pinctrl_gpio_direction_*() calls from individual GPIO drivers.

I will hold back the PXA/Tegra driver-local patches for now and first
look at whether the pinctrl core locking change covers this direction
callback case as well.

Thanks,
Runyu
