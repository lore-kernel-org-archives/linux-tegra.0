Received: from galaxy.gendns.com (galaxy.gendns.com [66.235.175.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAA72DCC1F;
	Fri, 21 Aug 2026 13:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.235.175.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787319920; cv=none; b=jhemewL89gkc+r7aQQDGyntPQht6E2xU4NQkElXEpU9L6dTwrH80dLE3Au2IEgHv/6uAH9u2fotVq7+vSep5ppOwxTpbayHdmixSK4hn+FttR1qfUi2AKQ8BYtPyDjom+saql/BXARz0/3VkwlDoN/EKq6bpAbzXWfu7XTyDtaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787319920; c=relaxed/simple;
	bh=+oXbM4FveHa1GYGYDAHKzM+Xlhi9P1kkAIN/Jb0g/6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s1Kj5zgi50OQhgxflnw4wpgFgA/OTMro6iFbyTqy61faepifvvn09qBgZM25DNbD7OqaT/+L2+SzZNDgik9qZBClckxzREAd2EjmZYSWBIuqFi+J8RBvf80txAv4nTaxyPZ+a9yK78w7HDyA2qT0qhikEfx4n2jctrmlmpOcGxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lechnology.com; spf=pass smtp.mailfrom=lechnology.com; dkim=pass (2048-bit key) header.d=lechnology.com header.i=@lechnology.com header.b=sr6TMcnT; arc=none smtp.client-ip=66.235.175.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lechnology.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lechnology.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lechnology.com header.i=@lechnology.com header.b="sr6TMcnT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=K/rYJ4fZhSilGNwmY064VfngAr4dpwpsHUyeKwyptvc=; b=sr6TMcnTl9qCh5RSZeO4vRlT+X
	26RoI97MTXcN3SRY64DN/xA0Nwk7zu0JS2bjkEEBU/cQ2GPOUxh2ekSdZ0RPQOtgpdJYt8rVCQhKS
	SSgN0Kmfqluqi4UksUSVNSKmV7TvNXM3pAQAI8mFQh0lZtOer/oG2tuWInECxCFn7pPbCIFuGwDCX
	WLRCP6iR1pWx5I0ckApDokkrsqs5/s2Kz8FPVOkhR9cy0ROjkwFjMlw7Gcy9I5IIm38VZmIo5KV3k
	tVUHnkY+AdMXJLCRlYFetWU5YLuUayVw3L4gcoPPbYvXMYFfRfIjB4xpWO+8s6cNyWLnjZQdN8Oqm
	CAuI31wA==;
Received: from ip98-183-112-25.ok.ok.cox.net ([98.183.112.25]:62589 helo=[192.168.1.169])
	by galaxy.gendns.com with essmtpa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
	(Exim 4.99.5)
	(envelope-from <david@lechnology.com>)
	id 1wxPYU-00000001l1l-0zsN;
	Fri, 21 Aug 2026 09:45:08 -0400
Message-ID: <1f791d6c-48c4-4266-87d0-c70438ec793d@lechnology.com>
Date: Fri, 21 Aug 2026 08:45:04 -0500
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/45] clk: davinci: Make sure clk_init_data is fully
 initialized
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 openbmc@lists.ozlabs.org, arm-scmi@vger.kernel.org, imx@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 soc@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <cover.1787239813.git.geert+renesas@glider.be>
 <f3b503ff3fda049988c3e16071bbbfabf1b04629.1787239813.git.geert+renesas@glider.be>
From: David Lechner <david@lechnology.com>
Content-Language: en-US
In-Reply-To: <f3b503ff3fda049988c3e16071bbbfabf1b04629.1787239813.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - galaxy.gendns.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: galaxy.gendns.com: authenticated_id: davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: galaxy.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 



On 8/21/26 3:53 AM, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

(had to trim the recipients to get my mail server to let me send the message)

Reviewed-by: David Lechner <david@lechnology.com>
