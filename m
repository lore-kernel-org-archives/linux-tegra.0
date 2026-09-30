Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945A24229D0;
	Wed, 30 Sep 2026 07:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790752706; cv=none; b=GnRiOVDKoTp//T47Sg36oQHg0DpcCV1U8aRnmHq+hdMQUdFZaoUy2Duvtf/4to4cluFFWI1uLIdkISPz5PP12px/N0pHfWM9k3q8RhOJu3zLgL1JTh4WfJj2LIYamKlIGHyPK4aUyYbEAIEfubnxKPo6PLik0JD/m7UDpFuvBxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790752706; c=relaxed/simple;
	bh=rY0i2zxpQkZwnUprfA8bsV6W6HHOB52H7fiiswNJY78=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xn6qb44zBa+WpQIepEklIfk9HF4GQfhcpaO93Rwrx39S0PxpunoPd3eBYH+CvfmEihwqNWPsqsK1AT/xJswi3L7G+vVz2hDzuPi9I7j0efgbN3+TKNhCnBD2KTfzRcE9RrBIPZGbe4YRfC1v2hUeYX+1FXjFQEo7mHDfsEvLEho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=qyZpq06B; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="qyZpq06B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1790752695; x=1791357495; i=markus.elfring@web.de;
	bh=3pW3oftf21jP4/xu+55VZHiQS7PUuOjm5S6qFMXqisQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=qyZpq06BL+mf8FP24Xu8eUGTpfWjAcfCfELnHRphTI9y5CcEuW5rx3BLQsnthWMJ
	 TBVb2/kZZXdncBfmzIh6qguY/K2w3cgxbntGsWTUEC51IIvCDwQircguh7utfDTCl
	 C4+h7xTLOQ83Uew3ta5ixBA4xvNyiC7H1Dp0o8VR2modHTNuQJxnkt5u0iCgWqA9d
	 5A7w3+VagjHMuPHQg2WwXGtMCI9ijKJr2DSVmLMQ9nJCOm836PEA0f6APwSTrw17Z
	 AdmILmT5DeiA3ICTpA8BFT7IxDEAq4TkAfsuexBEPW/VH2kMIrXEEVxg7HSMPx7ZY
	 Qgb4jfMc+OTz+8M7IQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N9cHX-1wg48I04G5-010RyY; Wed, 30
 Sep 2026 09:18:15 +0200
Message-ID: <7edd63b2-f2a4-4b41-b698-4120beb3f891@web.de>
Date: Wed, 30 Sep 2026 09:18:13 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2] dmaengine: tegra186-gpc-dma: Read channel state under the
 lock
To: Ginger <ginger.jzllee@gmail.com>, dmaengine@vger.kernel.org,
 linux-tegra@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>
References: <20260922072233.19592-1-ginger.jzllee@gmail.com>
 <20260929194434.29937-1-ginger.jzllee@gmail.com>
 <4f327a8d-48aa-42fa-b580-3b01315f65b2@web.de>
 <CAGp+u1bger=5W8eNyAME+3JppL2bhYiYYThQY_R3NcrJC+d_CQ@mail.gmail.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <CAGp+u1bger=5W8eNyAME+3JppL2bhYiYYThQY_R3NcrJC+d_CQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:exAQ/bxhDMIq5n3OZ2jkaUnAqLj9sLq5Gkd+1seMS6pw63beCUN
 pI+fz7CzvnnQk37cFIIfVZSXZCYBV+5twVGSNIB2rEPEyXV5dNjclY2Km68tohlVuiEO9h0
 l6I3ySR8jrEbXC5z+ZXnUx1iUBuWAoJwxPd7qVtzhNds3Mu2g3HXpsLdZvaG5lLu0mkIv6V
 F5KW3jGZhMIX0wmjOcWYw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XDC13k2ASdk=;uMhKil3up2r/D0Ma1JGyCEdl19I
 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

> Yes, it was detected by a static analyzer that I built.

Would you like to share further background information for such a development tool?


>                                                         I will update
> the patch to reflect that.

Were any more of your contributions supported by advanced source code analysis tools?

Regards,
Markus
