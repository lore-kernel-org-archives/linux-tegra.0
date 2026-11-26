Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.118
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795675156;
	b=pRVXJiCAwJkVztkkvNx2RtxTd2FkiioQO5A14HInMCYYmadPCMkIabDb2tCV3o6rwDxQ
	 /X8NMXIQpZ/t8EVuorqv46vhmYBtJ/yC8mT8pGfXV5e8dOA4LoOlGi7K4Gp6oZU5vJULx
	 qyyS1OjKvvh2BtxJ6GI4Ao6lNq9BqEXNmWO0qIPRGmFmXpLvrYlUMHC+5XbiV9fmm9Og8
	 KNWyrEqvgRlQ4vZRcPxlPjH+cM5tAQTNtWLAwGz5SkbqUbeO+inJv4YRYJKr0xZdFtM6j
	 EZo9gbP7214nqgXUuKZXfXs3pclYi06yWpEAMHPIfmCjUWJHAYCoEHstSsse622o+qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795675156;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dftc91sv8lhXnl13ZdWvaSWDpxemIpFXOTe5QiXlahs=;
	b=CTsUK77YjbqWg1mVZNXHcB/it/WvRxx2fkgn2nPWiPyoxMDTEeFWmXnB8BjKBKfpY/aR
	 3ZOOamvFodMwrDT0FfjqqbKwwkLwGDW2FhxQ7f66N86klJqqjzNOFWot3z6GLvlLan8ph
	 pRKEAEmg52MKm8YsY91rht6+vQmV3voyAiummGPbo/bYhxp4goavYGDndk516OZ3hxoep
	 qIT6OZl04G8ssN5iNVwTwT5X/951Zd54A4Ufz0pN64zM2ICUQ8n5N6PJW0ppXodrsK5QZ
	 m9I7v3kpvIhHQlixcp+X7HIDg/R7emormuD82fvxP/cW3qCNUfR+sT6fv44kEBCjIDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=AIF1ePDN;
	arc=none smtp.remote-ip=115.124.30.118
Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF082606A326;
	Thu, 26 Nov 2026 06:39:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF082606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=AIF1ePDN
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1795675146; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=dftc91sv8lhXnl13ZdWvaSWDpxemIpFXOTe5QiXlahs=;
	b=AIF1ePDN4dJH/V08cfDPT1fuZRwZO4xAfBfOGYJy8ov539DkPmJoMNO/a6TAMHGvO/Oq6BKR6YHhtQKWgn05nwNulAppHzTviOX3vWsMsBtz7bsx9dt2ZqkyH6hho9jrMDbcxYKDylOQr1pENIIaKPPkiOrolhxyhgIhQ87fJOg=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R301e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=jiangtianfeng@linux.alibaba.com;NM=1;PH=DS;RN=9;SR=0;TI=SMTPD_---0XFTjJEV_1795675132;
Received: from h68d07384.sqa.eu95.tbsite.net(mailfrom:jiangtianfeng@linux.alibaba.com fp:SMTPD_---0XFTjJEV_1795675132 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 26 Nov 2026 14:39:05 +0800
From: Jiangtian Feng <jiangtianfeng@linux.alibaba.com>
To: akhilrajeev@nvidia.com
Cc: andi.shyti@kernel.org,
	digetx@gmail.com,
	jonathanh@nvidia.com,
	kkartik@nvidia.com,
	ldewangan@nvidia.com,
	linux-i2c@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	thierry.reding@kernel.org
Subject: Re: [PATCH] i2c: tegra: Fix HS mode clock calculations
Date: Thu, 26 Nov 2026 14:38:52 +0800
Message-ID: <20261126063852.3251618-1-jiangtianfeng@linux.alibaba.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126062125.45424-1-akhilrajeev@nvidia.com>
References: <20261126062125.45424-1-akhilrajeev@nvidia.com>
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

On Thu, 26 Nov 2026 06:21:25 +0000, Akhil R wrote:
> Thanks for sharing the patch, but I had a different change which should fix
> the issue.

Thank you for pointing me to your earlier patch. Moving clk_multiplier
before the HS register setup fixes the non-HS timing overwrite.

Could you clarify two cases that appear not to be covered by that version?

For an HS request, the multiplier still uses non_hs_mode rather than
clk_divisor_hs_mode. Is that intentional for the controller, or should HS
use its own timing/divisor?

At 3.4MHz on Tegra256 and Tegra264, the default Fast divisors also produce
master-code frequencies of about 457.7kHz and 412.1kHz. Is a separate fix
needed to keep the master code at or below 400kHz?

Our patch attempts to cover both cases by selecting the HS timing/divisor
for HS transfers and increasing the non-HS divisor only when necessary to
cap the master-code rate. I would appreciate your feedback on whether this
matches the controller behavior and how best to align with your patch.

Best regards,
Jiangtian
