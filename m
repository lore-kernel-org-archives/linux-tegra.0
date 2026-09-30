Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E9C3E40FE;
	Wed, 30 Sep 2026 07:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790754391; cv=none; b=lf8qmHoJUMqVk6ro6VZuOJMVgSytjbLTJdgNU5CqdyKnUcl7q5b1WHGU4YMbObQ6fC5AmK+UptfGrP+TVF78Z8sPnjM2HOrLaORL8INChdca3IMRjJvp9rJsoEKX33rz5OVcWHnEE+MMb5NZem2stEJhOWujzxeyzH4o43RRVmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790754391; c=relaxed/simple;
	bh=shid/21P1tsH3DW/1wrJMHkPxDLTQWhCFILz0XlmI80=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IfMvm4Qv0IwcYXZ8mqrvzjveUktwlyabhgq5u5gNuKNYERgviw7IDfwntCpiREBLwnG5rtjD8ZZAAtBvlC443phpgV1IjpMwQjdMdtWFPA0HnTO/f52VcQWFnV8ceBVsizdblDvF/JSoztJfIZATdUWFP6LzzTA1OT50vyU9uv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=MmTwl905; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="MmTwl905"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1790754387; x=1791359187; i=markus.elfring@web.de;
	bh=B+rYqodLToEYfGWMW5OgoPbSu+DA6smkfwhCYrZomsU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=MmTwl905SuknjWQDzB2XoxYqkbTyKsORBcUFCCeljgfDU9H/OdSN+vul/B9K8kzA
	 gUyjbvj0PNs3lOx+qXC0ez4eURw0KYeB4+hC5tZKTKEZMDxgUBcd3Eutdj3mNs6CG
	 UT6Kl/LoAo7LRr6+rI3Aw9OdbOBWon/0d93MD8pJWdFaIWI/N8oAT3MPY7kqphOVP
	 09lmaMN9eFxh03MtdwutnOxyIjXvVg1n+0YGxLFa6ukCeCKVLl2r89xtqF7YvbIBs
	 LZOJuwhFJto0BSDpKIHhHmu/enKcfAazZKHC1Bhlp1aG2EWaIb67RE1BbMkdNqNb8
	 W9HI5ts56q+DBuFj7A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MAtsZ-1x13Wd3ZiD-00HWz3; Wed, 30
 Sep 2026 09:46:26 +0200
Message-ID: <cb64813e-0a11-4c14-9bea-45f8dceff115@web.de>
Date: Wed, 30 Sep 2026 09:46:25 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3] dmaengine: tegra186-gpc-dma: Read channel state under the
 lock
To: Ginger <ginger.jzllee@gmail.com>, dmaengine@vger.kernel.org,
 linux-tegra@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>
References: <20260929194434.29937-1-ginger.jzllee@gmail.com>
 <20260930071916.35722-1-ginger.jzllee@gmail.com>
 <0593ff86-c6ab-4c64-88a3-e500ed335760@web.de>
 <CAGp+u1aTQvE_o=nObMb0LvuwmdFukG9qBeKGDvwcf5-ckG9xyg@mail.gmail.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <CAGp+u1aTQvE_o=nObMb0LvuwmdFukG9qBeKGDvwcf5-ckG9xyg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4Hoz3nMBzgsvyTcsOU80MRdUvaMz6qCp133dXivMZj6WdJkMvps
 581xXdMN+j7Y1hJ7zNYnr9A0zlaKTIWYLVyPa3UAHz3U9PwQJ3C07I/ycbRqLyhOjYOFZL9
 xJnH+obydkD1X61tDncFcVaKn98ogJYGEKA35ebJkdOMeXGgLEM86ZPX2RQkgFYv1JKEqi2
 M2FKsg+t2DxtZIMkxXZNA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:fm3WG0+k6J4=;ECLJaRzDTeP0/nhn/kbhOtoCY6O
 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
 ZLq7

>> Under which circumstances will additional background information become=
 available?
>=20
> The static analyzer is a research-based one, built upon the LLVM IR.
> The analysis is founded
> on a symbolic model (not an ML model) for concurrency bugs.

Thanks for such a hint.


>                                                             And due to
> the anonymity
> requirements, I am afraid I cannot reveal further information.

How does this feedback fit to other known guidance?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/researcher-guidelines.rst?h=3Dv7.3-rc5#n5


>>> Were any more of your contributions supported by advanced source code =
analysis tools?
>=20
> If you meant AI tools, then at this stage, no. For this patch, I have
> used AI tools to help phrase
> the patch better, but I did not use them for code analysis.
Will this information trigger further collateral evolution?

Regards,
Markus
