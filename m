Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=85.13.135.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792951056;
	b=J0E/chR5qY1K5ACFXatOT3Q+bEpznN8TaLwu2bXIl7042R0KnIXbGWI352IuPYY0M/aV
	 bQx9LgXXDeqpzNbpiQbSXirQ9i3gWM05WimkVAQkRp/wb1QHVcSGqt+GcDEj4blOBGwJt
	 37hGG35638n+kAzhbkKTqCAiW6xJRkFdPnjGZL/XyVmqM78swivYVlS/N1VxIifq5OFEI
	 iA2yE/Q9J02NK+zqlunUU23ffnUYjWV1/UZGfbzftOQP+pLAnQiNGN+GrvRmiai/PFEWu
	 JPfq3lE2YnXxyok6AHn1ph1CPQ0ttq7+QEWNzQ/KOCpdl9jbDNC3C1igMDn+BT5g/Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792951056;
	h=DMARC-Filter:DKIM-Signature:X-KAS-Sym:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Spamd-Bar;
	bh=qe6/eBLGVXTdgL2k0ma4VIUZKkBWacKfnxS3azB/5IY=;
	b=YB2lTat+zwCy5VaQlCyH0jnT3iBxeZbxOU3oYMYQuoW0KYraO4LJIbQaiYqt5C1yheYb
	 dj+dZpvngr+4yq9Oedb2AwgKAq4CUrqwMedWayTw4dnemJPDVpgfsGcPRR3XJFGsiDygm
	 ULgoddTB2ZROt90C+m71oBEVnhjmSzpHf86+l6FNIouEUptwUNNxrnii0w7TGvsDeS7/g
	 2lylyxVa5Gzj0vLSJ1HqqLOcgb/YoQgE/7vgSYqSd9S7q04MV0tMDrRekU9B6ckVjqZaj
	 ziMEW/Q5f9YJYbireflCdFpOdX6bnNzBivW9pkONDrE+sUjeqVwx0STL/BUfM7hxiFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tsv-stahl-riesa.de;
	spf=pass smtp.mailfrom=tsv-stahl-riesa.de;
	dkim=pass header.d=tsv-stahl-riesa.de header.i=@tsv-stahl-riesa.de header.a=rsa-sha256 header.s=kas202608160020 header.b=otUkrrgW;
	arc=none smtp.remote-ip=85.13.135.14
Received: from dd13108.kasserver.com (dd13108.kasserver.com [85.13.135.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EE6606A31A;
	Sun, 25 Oct 2026 17:57:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90EE6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tsv-stahl-riesa.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tsv-stahl-riesa.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tsv-stahl-riesa.de header.i=@tsv-stahl-riesa.de header.a=rsa-sha256 header.s=kas202608160020 header.b=otUkrrgW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tsv-stahl-riesa.de;
	s=kas202608160020; t=1792951045;
	bh=qe6/eBLGVXTdgL2k0ma4VIUZKkBWacKfnxS3azB/5IY=;
	h=Date:Subject:To:Cc:From:In-Reply-To:From;
	b=otUkrrgW43iNCQgjpnHAUrYRxWZvL7BdMI2TB++vh1DK9NpqHFN/jtNRt9UL7VTyO
	 PzInhL+74dncTr7L/jjEINnS/nP1XxWGmv/dvfmndvYs/eA13lB4pG8+DsHvsgC+Tl
	 n3PiVi6jJdJTmsagmWTppZlEZFha6fkiIhlgoPQktK2XO5baScylE/0/kuEhks2XzY
	 8ZtqHovsswkrkQD2EmbFFwqk2ByYC2INcj0k9a8y4qTJGUhAJ3Uihd7KB1hPx8wLQ5
	 aeE7OhXLjV/cIypKj5OIdgetd4Xh3Dzx5rnzL+bxSdxg64fkcJcsbEigX2eYGZfF/u
	 GAECEOXr8x1+A==
X-KAS-Sym: v3:f51bdf72230551df:josnWiVTgmBszf+wJwpLyS0y+K14qpSOQdoU8G3QEBvIb
	0WwgEC9i/8Gu08SAGV9KdjJddWkX3gX2uvaSVh70TXtKL+JtTAZbi5FtkKx07DQqhXAB4H0O6n1
	RMKkS+sj3nbTa+pgtbCI19/nF4FiXTK10zvj6hfC0MGdy6X66CpKhXGzuElcPyth2Ej1wGscp+t
	wvFsWLo5aNRM7WwHY5ApVFpwSsGXTVkHJTClBQNGKn/Ej+j6vo6fReIt72QGI4V+CAdjN78qWMM
	LgEscqNmEkRKwirRcIJexQPGXmeZWa4O2x3isNXVY0qH5BjY7VRGrcse7CSbPkHPnCD7V65Q==:
	dJ806LpPAcYoLGYx4bVJq6YD6AzYYrNLkbwY8gP+N34VKpXMJ8Gl3AUaIrBKNdE4nf0YPfTvQrz
	jEprDIK78/06Alk5NWsraE/h/xUQdD21gsdn0XrscpxvwXpXCJ9h++xO6GHPBcXwPYtp7oI89ea
	SJN7Snxh2tZhtl3jFKPLNE0lfrK0ep51PAkeKzOEaa6imCYDJHYN6f2XwuEwk6oj8ipq0bxK1QL
	deZA26wvD/0wQxBVYwQ+ETC4/qRFly0ztR7JAjo6gUE3rCUqt5FohZ4o1VxptRA/X2E9QYSaVwL
	l5ASRDQVyHl7aVUxMEsz4zEqspaoyoOQSaeZKwTC6djZf2wuQ192dkoU7VVnFW+Jf1C/xkLNGVd
	v5sgdSf+TZ12bnShIQWJ0O+eusfdO028JziKt3YiYPVsAeSMWhWkUMZMdz/+BC+bDG7DB0NSUgm
	F+EStcJQaUqkbINDqnlr4qlSUhI/wX1RELfU2mGUR+EUpKW7KHd04OgDDIljKIouPVTbJEhblJ+
	jTEupmU6HetzYxKvBYOvGe6iW07BVVIIXELQoGgL8Tem9eAEtNJJn0RxyAT5S0i5r6HJRRbd3Wg
	rZuMq/VJHKAXReMI3JSIiq8O3LXVsgT0fA==
Received: from [192.168.2.173] (dslb-188-098-190-192.188.098.pools.vodafone-ip.de [188.98.190.192])
	by dd13108.kasserver.com (Postfix) with ESMTPSA id C7F27782A893;
	Sun, 25 Oct 2026 18:57:24 +0100 (CET)
Message-ID: <258d0c04-fbf9-4de4-b009-8feff88dc69d@tsv-stahl-riesa.de>
Date: Sun, 25 Oct 2026 18:57:19 +0100
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
Subject: Re: [PATCH] clk: tegra: Fix Tegra114 MIPI calibration clock parent
To: Mikko Perttunen <mperttunen@nvidia.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, clamor95@gmail.com
References: <20260930-b4-dalmore-fixes-mipical-clk-v1-1-0518be6c7979@nvidia.com>
Content-Language: en-US
From: Patrick Fischer <admin@tsv-stahl-riesa.de>
In-Reply-To: <20260930-b4-dalmore-fixes-mipical-clk-v1-1-0518be6c7979@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Bar: /

On Wed, Sep 30, 2026 at 02:18:34PM +0900, Mikko Perttunen wrote:
> Register the gate with pll_p_out3 as its parent. Also drop
> CLK_SET_RATE_PARENT at the same time: the parent canonically runs at
> 72 MHz so we shouldn't change the rate.

I ran into the same problem on a Tegra Note 7 (P1640) and ended up with
the identical change. Before it, every DSI enable logged

  tegra-dsi 54300000.dsi: MIPI calibration failed: -110

and enabling PLL_P_OUT3 by hand made it go away. With this patch there
is no timeout at boot or across DPMS off/on cycles.

Tested-by: Patrick Fischer <admin@tsv-stahl-riesa.de> # Tegra Note 7 (P1640)

While testing I also found that tegra114_mipi_power_down() never drops
the clock enable it takes, so with this patch PLL_P_OUT3 stays on after
the first DPMS off. I sent a fix for that:

https://lore.kernel.org/all/20261025-upstream-host1x-mipi-clk-v1-1-6bc6e755b4cb@tsv-stahl-riesa.de/

Thanks,
Patrick
