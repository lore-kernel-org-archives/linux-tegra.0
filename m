Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794484754;
	b=WYKj9VtNjORSKTzqwjvcTUU17k5PG+5pYLke3lyC2sboZV/AuEz1yB/W5hb7m7DN7nAC
	 3bkmPTTr3DQrKPAqGdcZgS05SrWFzrJg5/x+hDH6zDO2bYyc1w6EzXlPLc9wqKDpx7mvK
	 sd1mSFMmNSfu6guAVsMI05KnTrONYm5NLGy1i6Y4yQ/0s6MUxLCjQfDdoi24ESVOr6wbE
	 yLlywrZJP5Cc1mr+hiAngsBERVj6j2f3j/kguH1jFa+nPuXblyWoYO46aHhfPPVVmQUtZ
	 WlT28nUdpPZOix+wSwB0KZGCYkJgFp6k7b3rCNYryCYfTgjoihYm6VU7s7QvCqE53hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794484754;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 User-Agent;
	bh=Kii4d1l8a9WqO76mq39yEuoHq+1skubE8Z+vWj++inQ=;
	b=qCHZSa0U4vNDxPE9QqJuM5M7qowP/WdOIKigjUJFvpBHC47YvvpwL7b4QyZocv3AJHXA
	 CwSLup2DcUGTFdMBMcFA0vzJKDMp2BCYHEyJRnJUYngfbGV/TfTIbrtP68jkMh+VyMxjI
	 vRh71fICcnNCeYC72vcKCSUhfOtgev/IQl2ldRVua+AZfmoVvVhJ0hQMd9wPqjfWT0HrV
	 gy8GwSoMwpEXWkGxz8LsjvQDGrIoOSfHk90qsPT8zXIVkiK/b8wSJbJLNTgggTmhq4yqL
	 FKFLWNDtZIKZQa5upUs6HeRtZaKub45JDmtbVvxHC4sWEv7ZDEaAUrZyF5ySu4VeLFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NZr9jiYM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BFD606A31C;
	Thu, 12 Nov 2026 11:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NZr9jiYM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D6321F00A05;
	Thu, 12 Nov 2026 11:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794484754;
	bh=Kii4d1l8a9WqO76mq39yEuoHq+1skubE8Z+vWj++inQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NZr9jiYMQACePlXmIejgrEHj9jfkpM7XdYH7LrYIm+P3nN3FYtwkXntutAt3tAYbH
	 IvltLuN71gbyPWXRf2r27zZc7mIDyWIOlEk+vIIb1mL//qJcmvKU8yPoqWPQu9Rduz
	 dk+PCON81vO8RZji9RPoqyuLNpPWMNvQqk9Ds/UEPHwL554Eut6UcCyqzAjh7zMteH
	 aNJ0CMDLEztnJU+PLluUS3PampaBI58wXJGinfXnWcsq9f31q2yT7TypRZwWMJUXS6
	 ki0RABOv5U29mzYd5Ct6b1T6WWjY9ZnScIXcDR11EamBvUJrfcPONZxmiOljWau9Z1
	 htrTqKjGReABA==
Date: Thu, 12 Nov 2026 06:59:11 -0500
From: Brian Masney <masneyb@kernel.org>
To: Johnny Liu <johnliu@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Douglas Anderson <dianders@chromium.org>,
	Aniruddha Rao <anrao@nvidia.com>, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 4/4] clk: tegra: bpmp: Do not cache the EMC clock rate
Message-ID: <avWqD-Rm5-85Dj5c@x1g10>
References: <20261102121202.2431928-1-johnliu@nvidia.com>
 <20261102121202.2431928-5-johnliu@nvidia.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102121202.2431928-5-johnliu@nvidia.com>
User-Agent: Mutt/2.4.2 (2026-08-30)

On Mon, Nov 02, 2026 at 12:12:02PM +0000, Johnny Liu wrote:
> EMC clock scaling is managed by the BPMP itself without kernel
> involvement. When the rate changes on the BPMP side, clk_get_rate() on
> the kernel side returns the stale value cached by the common clock
> framework instead of the rate programmed by the BPMP.
> 
> Set CLK_GET_RATE_NOCACHE on the EMC clock, identified by the per-SoC
> emc_clk_id from the BPMP SoC data, so that rate queries are forwarded to
> the BPMP.
> 
> Signed-off-by: Johnny Liu <johnliu@nvidia.com>

Acked-by: Brian Masney <masneyb@kernel.org>

