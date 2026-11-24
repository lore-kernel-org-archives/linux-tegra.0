Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540716;
	b=UxBrsX8VJCiJfKyn76c7eBUbQYYspxONLZjDZ8x8lCkTK+p0pWot8su4igdcxInVZU4Q
	 YnL+dtxsfb+Evh0l6gaSFmtkbDb4T00a1u/3LKkxRPbU+8Na0lPDBmOkBtRwgxWwiqzjM
	 M+sL7gdmIEAl6QE0sNbqlnKdku5crw9vOTkpM/bNWh6PKW2CvDatsZL9EW3N9muJLnoLs
	 g0nESW5KW7ClAj29Nwl37DhhKhlctRWtQbEBIOEfvCqbZE6/ocvwwPo8zAh40rsFqhkIi
	 cQVTmmaGzbQPmCSf0Jx1fAv9VNhMn/7fB1CoZIXMvPFT5qj68XJwjvMgSXfPoQmnCqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540716;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=nvoHQblVvTO5wjfDWw+R4A1RKcGOawuDiPZT0xUmZY4=;
	b=uyZUnhnfF6UypWnYApPddyuKTCd7GYjn9xMsbJ58jMbU9TM5VrndNnCshAsAlyAM9ntj
	 XkZy0Sq84LJ2WVACOMgbkNhhXJSMRJQOwL5bZKE7rDg+BvZvRLC0ZjxTSRopRW56LPqCf
	 ytFjO+PuysgK3Sp1xbJuOlfsUSzX6fLoU8zhcCNukxAQqMqPTvmh7GuOapX9+1IWcqJpz
	 fRKD6g2eO3aFjhPH4piadMKWOurcrXKgo17SGf7rPpjO+cU56fXbuhCnhV3iW0cX7mM0D
	 b+WCJMpsq+0FUSEpQQtXXJdD/RIofJ1B1v21tsinPAwkGP+SqLfDYpK41YSA1usS3WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EX8mlVkF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D66606A31E;
	Tue, 24 Nov 2026 17:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EX8mlVkF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43E321F000C6;
	Tue, 24 Nov 2026 17:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795540715;
	bh=nvoHQblVvTO5wjfDWw+R4A1RKcGOawuDiPZT0xUmZY4=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=EX8mlVkFDQ45BTbBIoQlcpPzpgAQL1amuGMGG2K7MEaJbt4ny4QukQE+pR/a3w7TK
	 alrApm09A9rr8JGOE0CjhWVLCrAsbbO0dodGqZwTsxHoVm1agIewe0sR1PIWoQ9Nx/
	 8VnUtG5Y0+qo6GBEU9pl8JynO08H7WBxQWjAAaZezKOBKX6nIAU4AS3dsHAaa5FT9Q
	 arjY+mu/MaXGpVMaf58edxi8G7shYeq+WZAt46JxY/5SXH5yO3VhESEhrYlMIGdKM0
	 uHPvU4VgCg+AQslxZBipoyl3RaA5/zW3IDoLZ9U25h9UJ6jXnMJjUPla+YOMkFbVr6
	 5uxqZivw5IFZw==
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] clk: tegra: tegra124-emc: Skip timings whose parent
 rate cannot be set
From: Brian Masney <masneyb@kernel.org>
To: Patrick Fischer <admin@tsv-stahl-riesa.de>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, Brian Masney <bmasney@redhat.com>, 
 Thierry Reding <treding@nvidia.com>, linux-clk@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable+noautosel@kernel.org, Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261111-upstream-clk-emc-parent-v1-1-636eea572572@tsv-stahl-riesa.de>
References: <20261111-upstream-clk-emc-parent-v1-1-636eea572572@tsv-stahl-riesa.de>
Date: Tue, 24 Nov 2026 12:18:26 -0500
Message-Id: <179554070638.342734.6160657540275227565.b4-review@b4>
X-Mailer: b4 0.17-dev-8145e
X-Developer-Signature: v=1; a=openpgp-sha256; l=1385; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=ir3UQjLHGDw/zLIAiMWv27Yk3ypbdfQgTmPg/94dMhk=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJZjz3e+avzTppv0XWBDYovxBRmsWdl2l9aU3v1jJT47
 0nTp2zi7yhlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAie1UYGb593FG5ZGL4B03u
 Xw/uGM3mOC7N/UdFJ+587ZYV0W+nvdNg+Kc5e43l1+VbWk34j5gvO6hqnMBz7VZ54r7A99MLdPL
 9AhgB
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Hi Jon / Thierry / Mikko,

> Each EMC timing names a parent clock and the rate that parent has to run
> at. On Tegra114, PLLM is registered with TEGRA_PLL_FIXED, so its rate
> cannot be changed, but the Tegra114 device trees still contain timings
> on pll_m at rates the bootloader did not set up, e.g. 792 MHz on a
> Tegra Note 7 where the bootloader leaves PLLM at 408 MHz.
> 
> emc_set_timing() calls clk_set_rate() on the parent, which succeeds
> without changing anything, and then loads the 792 MHz timing while the
> EMC runs at 408 MHz. On the Tegra Note 7 that gives a refresh interval
> of about 15 us instead of 7.7 us (DDR3 allows 7.8 us), and the clock
> core then reports 408 MHz, so later requests for 408 MHz keep the
> 792 MHz register values.
> 
> Skip timings whose parent cannot be rounded to the requested rate when
> loading them, so that the highest reachable timing is used instead.
> On Tegra124 PLLM is not fixed, so its timings should all stay; this was
> not tested on Tegra124.
> 
> Fixes: cf561283254d ("clk: tegra: set up proper EMC clock implementation for Tegra114")
> Cc: stable+noautosel@kernel.org # needs the Tegra114 EMC auto-calibration fixes
> Signed-off-by: Patrick Fischer <admin@tsv-stahl-riesa.de>

I'd like to see someone from Nvidia review this before I take it.

Brian

-- 
Brian Masney <masneyb@kernel.org>
