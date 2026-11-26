Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E6C606A321;
	Thu, 26 Nov 2026 11:25:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39E6C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=n/PF2T+D
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795692296; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=elNVPfoWAwlGwn13qqkhQrSLLzq/aOTJrmsb/gQZ0x4=;
	b=n/PF2T+D75N0KEFrulJTDkGjPmBe9LQAiYOuRDFmIgu7Toahn4mZCrGkhbaWbb9gwrBlQn81VUSD1AoUta7xHnnrszQRZ8EkE6+Vli0Xwdt0Ht6gv6/CEwO/hMoEOsRb2n+JUE+oAzw/Zdh1PN6EQQQFiIkkLOYkKT7XjBSLiGs=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=jiangtianfeng@linux.alibaba.com;NM=1;PH=DS;RN=11;SR=0;TI=SMTPD_---0XFUK8n0_1795692286;
Received: from h68d07384.sqa.eu95.tbsite.net(mailfrom:jiangtianfeng@linux.alibaba.com fp:SMTPD_---0XFUK8n0_1795692286 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 26 Nov 2026 19:24:56 +0800
From: Jiangtian Feng <jiangtianfeng@linux.alibaba.com>
To: akhilrajeev@nvidia.com
Cc: andi.shyti@kernel.org,
	digetx@gmail.com,
	jiangtianfeng@linux.alibaba.com,
	jonathanh@nvidia.com,
	kkartik@nvidia.com,
	ldewangan@nvidia.com,
	linux-i2c@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	thierry.reding@gmail.com,
	thierry.reding@kernel.org
Subject: Re: [PATCH] i2c: tegra: Fix HS mode clock calculations
Date: Thu, 26 Nov 2026 19:24:41 +0800
Message-ID: <20261126112445.3761174-1-jiangtianfeng@linux.alibaba.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126100707.54364-1-akhilrajeev@nvidia.com>
References: <20261126100707.54364-1-akhilrajeev@nvidia.com>
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

Hi Akhil,

Thanks, this version addresses both the non-HS timing overwrite and
the HS timing/divisor selection.

You are right that my 457.7/412.1 kHz figures were calculated from the
requested clk_rate, not from the post-rounding clk_get_rate(), so they
do not by themselves prove that the calibrated divisors need changing.

Could you share the intended post-clk_set_rate div-clk rates, or the
relevant firmware rounding/table entries, for Tegra256 and Tegra264 at
a 3.4 MHz request? With the default Fast divisors, the master code
stays at or below 400 kHz if the actual rates are at most 208 MHz and
52.8 MHz, respectively.

If that is the case, I agree that we should leave non_hs_mode unchanged
and I will drop the cap in favor of your smaller change. If the actual
rates are higher, we can treat the master-code issue separately using
the actual clock rate.

Best regards,
Jiangtian
