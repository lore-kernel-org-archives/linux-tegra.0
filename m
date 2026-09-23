Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FF4443C17;
	Wed, 23 Sep 2026 19:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790192704; cv=none; b=u4ujNhq0ul4VERs5AGkqAXn24N+mGKDpJRaagNwc8fTtHKgy6uDzUB/9Nm3BZC8IRdhS4elFcGEN3QaJ0axK2soShfSsUQP74M2dXgJa3X9ZELU/WyMIcsM3oDSPmqYzTK6+NDMGcmbdFxJ4gyIchBdJC6gG8G1fwJ3YSAhbIWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790192704; c=relaxed/simple;
	bh=huhCRsebjKCjl/EMLYl3IK5DBNT+ddh/qEeg54Q6X48=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=aM0308aWTwVTjp+N2KvFhWdee0obhnS9FrkTW0SoF55InKONFNlxm3x50O1n/JseoXJQJt8As4SUOyneXehYjo/k1Il2F4vfb5jp43TEybpx9+8OCw7YPO6SVzTJQBHumpkTJ+49sOrEo5tFTzI4yDBUXp9wOeKeC9JKHcAFLzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=s8D3yffJ; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="s8D3yffJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1790192681; x=1790797481; i=markus.elfring@web.de;
	bh=huhCRsebjKCjl/EMLYl3IK5DBNT+ddh/qEeg54Q6X48=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=s8D3yffJCmgbySMyVJOORMOHIvXVqGidSgtSZF4g0c79cwrh9/I6uYlhlCwjiWQR
	 h8lRJ83YKvR3+58rO0IDqscdZmFJHD9Qdkj8HsDMOA0fPr2uyAUx6vucljSz+6t29
	 QIWrIhAnQ+O1LlpLfwwGdxktBXY6fXXW7RSgHtPrV8K/qwLNgAjxoe6edTTEAxzvv
	 zEE7KHWor0WPeati2f4EQDxiY1owu9XLRnQg7nRZhaJ/V8DZUMak8Y8OkcE0sbQsQ
	 14QWPOPmjKZYpr7xphElaWMhUiyxju+DakRkUssuaLRkVIoQIkPQEHVnPficxjB1x
	 lpLQwKNjgB33uZFchA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mdf8F-1wagJ60BHt-00fdZi; Wed, 23
 Sep 2026 21:44:41 +0200
Message-ID: <3f2f67e7-2f08-4540-bcff-bf6b22a2717a@web.de>
Date: Wed, 23 Sep 2026 21:44:39 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ginger Li <ginger.jzllee@gmail.com>, dmaengine@vger.kernel.org,
 linux-tegra@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>
References: <20260922072233.19592-1-ginger.jzllee@gmail.com>
Subject: Re: [PATCH] dmaengine: tegra186-gpc-dma: Read channel state under the
 lock
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260922072233.19592-1-ginger.jzllee@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:hAlK6Cs78fbe3xtMbW/4nqOmOwIX1YJgXfPQWRT4H0L9dCsLUYt
 0ygTrY12kquZQdWjMwHOIBh2/001+wNc71vpfHSxn9F7EBcfz8QaC3ZGNZkoRRpr23G3xvM
 YLWffDadu6IWhVVn55A8q3fi6uTpVtju6VDY8CHBu/z8ykyV4RIAvpzFdSuRIx8KWrfpkGG
 90+9OLitBnELYTqBYtTAQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RswdTp0m6Xg=;7+lsIAu6wDd/y0qTLITCweQzUpu
 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
 lv4xxtQbvtofKTmDDc0EuPtIF13C/MwL0Gw==

> Fixes: ee17028 ("dmaengine: tegra: Add tegra gpcdma driver")

Why did you specify a short hash for such a tag?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v7.3-rc4#n157

Regards,
Markus
