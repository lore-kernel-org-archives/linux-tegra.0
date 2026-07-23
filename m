Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429AA45D1AF
	for <linux-tegra@vger.kernel.org>; Thu, 23 Jul 2026 17:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784826273; cv=none; b=ZDAPLUm6VKxaNsIP/yu6+f1xrZ4tnofHK8mBwvM4zxs3/ZbLMSj8npQwUVoONR2XWxLSQ0ObMZZz4dQyzMAoIKf6UGKF8BwIUUzpsTCyGEUGCTAvWGmI/V0PVpTloKeYt2fFmF6wAhU7j3dYiF9437+M0iv1L/UQ9AurZQjOy/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784826273; c=relaxed/simple;
	bh=o9VVTo6S42mbOL5YNHeNddQl83IMRvNt9iVw7Ax1zcs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=i1tiV3C8w90LUN1/1W4MapNdP9FnZuGW9QOF+CZD4HQgRC0n7+c5/m/2s0j8Ob+R6PxX/l1Iv/+T8AtMyb1V7VhIkQGsv4ZeNAb8IiQj7m6uDazaMzPjbYUScozPxc4IeGoP5hEi7s8fs43JpWfotYF6SRJ6aBy6HVmpdn5gXqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=BGcn2pm9; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="BGcn2pm9"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47de0093c42so767077f8f.3
        for <linux-tegra@vger.kernel.org>; Thu, 23 Jul 2026 10:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784826265; x=1785431065; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jhojDdHC94+BdjAE5gd50YRzJP7qSAXpLrLf8nMSLLo=;
        b=BGcn2pm9WvAug4PR8l3FANDWOZnBQ4XdbW21YipeI3nJ4ukRiQBaauWySLaXoEROPo
         KYl4XqRUVJoStP/ov8Y2R4cynD3Uei8U7U/JNr1wxh6PHKu9iPfp+JkqsyRtiimnKIID
         u94WFQQfdiv8izgm05vPzHzcdo4Vk9kdWiKwzBpidPHKXf02aR/YRfXhapIB5D6i9zKP
         WecHCnnam4b7nQqsbx9VwAiQrqFyK840l+UkKI084tMkH5P2Ps9pXnEzoplZF157Wy1F
         bGraUumSEdCftfBBfBiVnH6T0G4KawEtzV9NMJ1YpeeG0ryczMqalGAvviv62T3ZbI9e
         2ixA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784826265; x=1785431065;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=jhojDdHC94+BdjAE5gd50YRzJP7qSAXpLrLf8nMSLLo=;
        b=VjRn9ysKylRJ/rCHfVkJtp02543qa+MDW3oK/9crBu3rBnD3+IRYn7DzF6lfv9z0UV
         wuTQUrLSsRFVqYTSNdypeh7s52VMKJhh7K10h8fYBScztcZu5tbJ/5i02IcIZp5NYJXU
         YQbYor81MU1bYXp8jZXQOLToCmaSeZLT03GFmNARFgnNTb+p85Pkzv5xgo01aP8MnzVo
         dtThJO0AY4SozYKXhICxUoNN4Bhm/q7o2lT+In1kPHMbYmPZrwu65m5BVZA04ik55KpZ
         U9hcYiXTpzNAXtJOd1sG8rkQ6d/ldpT1K72kBlPUWo8o75Tq3teRaBZ/0SfsIY3XMXOl
         sKaw==
X-Forwarded-Encrypted: i=1; AHgh+RraOLb/S2VN2fU9Y4BTZEqjBSwFLGej1ZT3nLkVfF9MF40zWVSkqJIwEHNKHmU9rGL+/8RRVTJzfekT9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcBhSiB7R3R4wVoFfAHsSmBD0O2D3NyciXgPcKiisFHLp7Y3kC
	uLGLnyTTHxzeceJlPUVvklm7TlS9U656N4yrfnMIMGN/gHERBmtIOQj0hg0KTM8AIkY=
X-Gm-Gg: AR+sD11MnH8oNzJ+1xOR+hMSisWyzqJ56TbF9UobGo05vz/FGBmgY+aIG/aQ949Nzhf
	YC6xyFaMDRDZV3yQuobbd+PH9XCvExGRzC1yP6+Mz995B5sc0YMRWoCxp4f1mnIeP2lWRZrZunj
	r+wmc5uvgAem1AR9cMVZwJv7SbpofGbCX+O06CPDEAAR9qToe2+M1e2TSDeGxDzkIRNXJ7D3PQp
	dupMEFE+HHW7mbKQaeRwvWTfmmMO4zaGU9L004SDBIEUJ9888CcmePS4p6N1RGnIywiBI7d8G4m
	zeBdCKhi3sM4oekFkeeHYCrg2DnHOOtrwaYJL1yfVrqwuiy9YGnzDNMfRgk5fu8RVt64k4z03Hr
	wMTGkvHpLs3d96BgXjiClussnW0SjfcmWSMclFVW7cT0JM5LQ0ERECeALzp51X0yyWcslALa1iD
	Rh
X-Received: by 2002:a05:6000:230a:b0:47f:8aba:8a9a with SMTP id ffacd0b85a97d-47f8d71c7eamr5497660f8f.18.1784826265170;
        Thu, 23 Jul 2026 10:04:25 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:5f98:8c28:3e2c:1c72])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f85c67339sm17937986f8f.31.2026.07.23.10.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:04:22 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Andrew Lunn <andrew@lunn.ch>,  Gregory Clement
 <gregory.clement@bootlin.com>,  Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Bjorn
 Andersson <andersson@kernel.org>,  Geert Uytterhoeven
 <geert+renesas@glider.be>,  Heiko Stuebner <heiko@sntech.de>,  Prashant
 Gaikwad <pgaikwad@nvidia.com>,  Thierry Reding
 <thierry.reding@kernel.org>,  Jonathan Hunter <jonathanh@nvidia.com>,
  Tero Kristo <kristo@kernel.org>,  linux-arm-kernel@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-msm@vger.kernel.org,  linux-renesas-soc@vger.kernel.org,
  linux-rockchip@lists.infradead.org,  linux-tegra@vger.kernel.org,
  linux-omap@vger.kernel.org
Subject: Re: [PATCH] clk: clean-up simple provider misuse of the consumer API
In-Reply-To: <amImP6sFlv-sNhMh@redhat.com> (Brian Masney's message of "Thu, 23
	Jul 2026 10:33:35 -0400")
References: <20260723-clk-provider-simple-clean-v1-1-0c9668240467@baylibre.com>
	<amImP6sFlv-sNhMh@redhat.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 23 Jul 2026 19:04:08 +0200
Message-ID: <1j5x25d4dz.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On jeu. 23 juil. 2026 at 10:33, Brian Masney <bmasney@redhat.com> wrote:

> On Thu, Jul 23, 2026 at 03:20:59PM +0200, Jerome Brunet wrote:
>> Clock provider should not be using the consumer interface.
>> In other words, a provider should not be dealing with struct clk.
>> 
>> This change targets occurrences for which the provider uses the
>> consumer interface and corresponding clk_hw interface exist:
>> * __clk_get_name() -> clk_hw_get_name()
>> * __clk_is_enabled() -> clk_hw_is_enabled()
>> * clk_get_rate() -> clk_hw_get_rate()
>> 
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>> The change being very simple, I did not think it was necessary
>> to split it into multiple changes. If you prefer it to be split,
>> just let me know how.
>> ---
>>  drivers/clk/mvebu/clk-cpu.c            |  2 +-
>>  drivers/clk/qcom/clk-hfpll.c           |  4 ++--
>>  drivers/clk/qcom/clk-krait.c           |  2 +-
>>  drivers/clk/qcom/clk-rcg.c             |  4 ++--
>>  drivers/clk/qcom/clk-rcg2.c            |  2 +-
>>  drivers/clk/renesas/r9a06g032-clocks.c |  2 +-
>>  drivers/clk/rockchip/clk-pll.c         | 24 ++++++++++++------------
>>  drivers/clk/st/clkgen-pll.c            | 20 ++++++++++----------
>>  drivers/clk/tegra/clk-tegra210.c       |  2 +-
>>  drivers/clk/ti/clockdomain.c           |  2 +-
>>  10 files changed, 32 insertions(+), 32 deletions(-)
>
> This looks good to me however can you split this up by clk subsystem at
> the very least so that the various submaintainers can pick up these up?

Will do

>
> With that:
>
> Reviewed-by: Brian Masney <bmasney@redhat.com>

-- 
Jerome
