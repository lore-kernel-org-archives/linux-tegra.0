Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.13.135.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792966590;
	b=PqId58wuZ5da7R/ibyaClcmc6QY1Nsz2Nt5ROcHFgqrCizSgQV9VrXwAAmNI/s20cTvC
	 3ZHArZogHt96VL2z4BP3lIO2vRYKYjvLwH0uLUiUT60ibiZpacfnPtlIGpA/J/7r0gedD
	 z6abQ+TfqOKwTYvG2FTHYLZZKUMJZWN9Tuf9QsZYScMMZxvv1kDgyYtdki9SiSciZXOyR
	 G2WxSg67KuxkVLLkEdWOOfIJh8SxY0X+BNFNGZccI13BfRCdNsuTd0RA2ndULtti6+5H8
	 rLZNv055phwXMxHgXOhmpklVny4yqcvK50wG90cXly53/GrrLGCb1hN3IZRUJzftYAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792966590;
	h=DMARC-Filter:DKIM-Signature:X-KAS-Sym:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Spamd-Bar;
	bh=ODRnPrsSh43Oc4mE8eGN57TH6Ko1bbZfQFSlWAEeeSM=;
	b=3aq/RUTf5IRqDmzZlV0gPK0VemboevCf9fzAfS9gNz8h3+SOYCDqrJj66tZ2tVLMTHIk
	 PYvDIn+z7pf9SirtZx/PUMxtH09jg+1T1Mw89vh7E916nL3aixdFpDk1o2A9pAbyR4OQ6
	 DVPfLtKhXW0lph9Ltc1I9p3VF/PwLx/f70xGEWcoi8raP1tP8fDQzR6xwj6XVexOIt5Di
	 31yX3zuWFNLJm32g/lpg1Oid14QMz37673hIItsIEvEbm2CG/ySe9Ao2JlHdjh54Vg6cF
	 buymJD6j83fpE/Vo/dkRKXISWHLDW5G7NfHlwyeGFQ6+u+X9IkhIQ0nGGaesu2ZvnXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tsv-stahl-riesa.de;
	spf=pass smtp.mailfrom=tsv-stahl-riesa.de;
	dkim=pass header.d=tsv-stahl-riesa.de header.i=@tsv-stahl-riesa.de header.a=rsa-sha256 header.s=kas202608160020 header.b=SWptSH7l;
	arc=none smtp.remote-ip=85.13.135.14
Received: from dd13108.kasserver.com (dd13108.kasserver.com [85.13.135.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE62F606A31A;
	Sun, 25 Oct 2026 22:16:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE62F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tsv-stahl-riesa.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tsv-stahl-riesa.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tsv-stahl-riesa.de header.i=@tsv-stahl-riesa.de header.a=rsa-sha256 header.s=kas202608160020 header.b=SWptSH7l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tsv-stahl-riesa.de;
	s=kas202608160020; t=1792966586;
	bh=ODRnPrsSh43Oc4mE8eGN57TH6Ko1bbZfQFSlWAEeeSM=;
	h=Date:Subject:To:Cc:From:In-Reply-To:From;
	b=SWptSH7legcR79UnQvmH8b0+TF6jzJpIIC2o38vTp0DnPx2ZFJaMRSmezKOFqhhh7
	 EI43/9Eq2xtmURsiBFsR6xmguSXC7lF2wv8vyrBR57ohBij6CAM7QaK+Nm/hOfQM3I
	 MWa4UCUIuPCKC4ULAwMCnI9Zoh1MD1lFlM6WJ3DOETwpisYxNYGMqhOCtS6btUbDFk
	 KLy6yMVCZrJmFZDBY654HyavBgLtlP0MFAoh48VoSjI0X3tRCCxwv/IfrvUfFRpXGK
	 s0LRnZgpU2WCG1q37OaqDcXnYApHIsO+k1v1j+Ohua9x1bHFh62fX7blOu4jmA4QJe
	 wiZ43LJITxjQA==
X-KAS-Sym: v3:f51bdf72230551df:ic0cwRf+uZi9e7OSVB9LLQ5din6XoyVS/0jbXGcna+8Pv
	yWztFZ5DbW5u7MAlRptgwijped6wiQBYmXmW1zVmSXrx4lkAjNF2GfgfvJE8qE0BbtMt/u7qEbv
	c6m79OCY8h6kALmFGKEoBodsTf82BZJsD6LinvqIE8yt3FPW/gQ0fVOsR5k5KIaas006uua92K4
	BEK8OGLvRSLmDjt/zVgSv3QFyQptiQEB3SqnDtWDlKvQQ7QHrKlWtpZqEsy9lVh5NaL+QKsxEk+
	jU5H3JiUVTnRtNuXL13aGZOwP8nwMxtCc/Q4fVNmpcK6/0Z0H5yM9b98GxCpxv9Ein0Vpobg==:
	KRgxXdT0THj2zXUr1De0t+g6Q6KurI4ZPOiZyhpX3zH4eUGhebj+1YMEWN4D27O7Nu3IXfUZstL
	wXSS/Ee3Kfu6bTwqAp3qbelBWP0/ZGkDaKPwO6j1E5paD71Lye/B2j4Q8ySi12klPwZD5wL0he7
	pVFnKwgNEhot7vZzaMobankBCRWJwte6BEk8wryHtfXDUXooNNg5rjckHI5/L2UUrPtSiby4YBi
	69jDmQmWkf+Ay5q4V1ChAikzEjJMvImA5ds8U3/ntrg8PDTskmVCHblrNh4+fjPD+TdlWHEEg5I
	e7bMprIkWpuUQ6uWYXDbS6ywny6EI+AhrRIKY96EzWTsuRQclbHrzRaXd9gYSfrrULFD7W26tg6
	+iocRsRSKIHHqvz14+5JTm4AuTYAdWc0ujxMFsiLpZu7mMHvooZmVx5rEtrkxjku0uJzxO31kDx
	L0HCsrgXmtZwkKihihiCRYUo7JXpTIWVZeUy1vAgsHyab3U/LrBpYfEbB9EPNBtHCUizFwAEwEK
	mRoiuPOc45Kx20287htFd7fTcXqll97hHHzzJlUxvjavg1ZgiqyRaH5Liql3lJGt6jKb+rHvXU3
	vqKxl7ieAWyk2AjTyCD9N/tuXf21tA/aNA==
Received: from [192.168.2.173] (dslb-188-098-190-192.188.098.pools.vodafone-ip.de [188.98.190.192])
	by dd13108.kasserver.com (Postfix) with ESMTPSA id DFE38782A82B;
	Sun, 25 Oct 2026 23:16:25 +0100 (CET)
Message-ID: <510d6922-5aad-4b54-8085-9a769a1a934b@tsv-stahl-riesa.de>
Date: Sun, 25 Oct 2026 23:16:24 +0100
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: tegra: Fix Tegra114 MIPI calibration clock parent
To: Mikko Perttunen <mperttunen@nvidia.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, clamor95@gmail.com
References: <20261025-b4-dalmore-fixes-mipical-clk-v2-1-0a2d1118f930@nvidia.com>
Content-Language: en-US
From: Patrick Fischer <admin@tsv-stahl-riesa.de>
In-Reply-To: <20261025-b4-dalmore-fixes-mipical-clk-v2-1-0a2d1118f930@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Bar: ---

On Sun, Oct 25, 2026 at 10:45:41AM +0900, Mikko Perttunen wrote:
> Fixes: 07314fc108e1 ("clk: tegra: Special-case mipi-cal parent on
Tegra114")
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>

Sorry, I replied to v1 earlier by mistake. Carrying the tag over to v2,
the code is unchanged:

Tested-by: Patrick Fischer <admin@tsv-stahl-riesa.de> # Tegra Note 7 (P1640)

Thanks,
Patrick
