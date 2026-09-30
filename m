Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34E5C4CDDEE;
	Wed, 30 Sep 2026 12:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790771207; cv=none; b=WuMF8U1+sifSopA1eNZgpjOkUW4xmmZTct461LnzTq6WTjr0OeVsz/w0LtdmK1hL1pjdRp37WPk5g5e0HLBhLRsSI/tA4X4FCv+Megy19XJQZXHcDKiORFPlbFv41kC2HfdTow1JFRL3csk213rd2LqyNUJRi2YqI/0CLqTZk7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790771207; c=relaxed/simple;
	bh=yVxRvI9JVsWe/+h24RYwqxlTmD9+UjC3L6/yrCuPLjQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VesvGhdlkrSEW8frMWlC6jR7P6AlS6kKF3BdnuzBvgsrmIIgukzqp2ZMR6G4CmMzvdF/QSRHbueKblMQ4rG852AIjCNY0HHFpw5VN514cEDY/jS0TFTEBRoZjESrlr3Nlo8BMqLYRfio3uwPO8FfAclsSsmBXKn2zTb83D19Wiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=Oagr8CmS; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="Oagr8CmS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1790771200; x=1791376000; i=markus.elfring@web.de;
	bh=9w6FdvLkFHDISQUf8R9Wx+ErljlSQRIrNMQGUpXNgTE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Oagr8CmS6GGuY7utBaJTb2973vvEr7v8MnCIE8X9qdLk+SHF/5wbyou4kKbh64k7
	 66wFb1v9fEyZq8P3nkOmNnigakUj53tNwgCw1czWH86hjXhJK3Y8dEq8dqpadHCFB
	 VH7GqJFA9cFu4z9p+kbsXSO4eraucDb4yz3kzuUHaAzRkiea/UPWCNP8UP+SSnoff
	 f0erUhUwxosrR1gNX13HfMR3XfSCYJFWKBoNyvHqO9T5tUxs1CuYiXxpngl7BHW29
	 EZMYgWeomt9WLoqySonC75yFIJL8Ft8CNbtZ/LjIlzRaMf5VlUjEsHs91u30wL8ou
	 /P6NGwFlQVHUAstPkg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N1Lwd-1wjrpN0ufT-00vqlp; Wed, 30
 Sep 2026 14:21:10 +0200
Message-ID: <1b56f03e-fab7-42a6-ac49-7b05a081639e@web.de>
Date: Wed, 30 Sep 2026 14:21:08 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3] dmaengine: tegra186-gpc-dma: Read channel state under the
 lock
To: Ginger Li <ginger.jzllee@gmail.com>, dmaengine@vger.kernel.org,
 linux-tegra@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>
References: <20260929194434.29937-1-ginger.jzllee@gmail.com>
 <20260930071916.35722-1-ginger.jzllee@gmail.com>
 <0593ff86-c6ab-4c64-88a3-e500ed335760@web.de>
 <CAGp+u1aTQvE_o=nObMb0LvuwmdFukG9qBeKGDvwcf5-ckG9xyg@mail.gmail.com>
 <cb64813e-0a11-4c14-9bea-45f8dceff115@web.de>
 <CAGp+u1Yw24hRsZfnD7sePs4C=xp-VLe1=OitaVRUrvE9tyNiiQ@mail.gmail.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <CAGp+u1Yw24hRsZfnD7sePs4C=xp-VLe1=OitaVRUrvE9tyNiiQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:zaqDEe7Z/wtfLmZd6KUx4w9WXEqBEnl21vt/UFY3LyZIwJ8oQHq
 7uIAbIYx3IZQaF3kXWJp65NuzZPXjKjH9P8tX/7Xs6XfRHRpErwDEa+fQYrg8wTMazZafK8
 hQBwb8JyH5qUGgyu99yk20333B/0eT8OYwKkZcHJNSaBktTXW2IQN1qTDz8gKFJII8ngU5Q
 SONtoHn43dQTFaFTqjbFw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:wrz1qXgXvkA=;clNzfxgy18WOpd5VMWValpS4LEQ
 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
 XLJI

>> How does this feedback fit to other known guidance?
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/process/researcher-guidelines.rst?h=3Dv7.3-rc5#n5
>=20
> I can update more information about the static analyzer (i.e., it is
> experimental and its reported log) in the patch.
> I believe this aligns with the known guidance,

Partly.

How many contributors would be involved in the mentioned software research=
 so far?


>                                                but I cannot provide
> the source code links.

Do you try to follow scientific development methods?

Will publishing requirements grow accordingly?


>>>>> Were any more of your contributions supported by advanced source cod=
e analysis tools?
>>>
>>> If you meant AI tools, then at this stage, no. For this patch, I have
>>> used AI tools to help phrase
>>> the patch better, but I did not use them for code analysis.
>> Will this information trigger further collateral evolution?
>=20
> The collateral evolution will only affect the experimental analyzer.
> It does not affect the submitted patch.
Will opportunities be taken better into account for improved change descri=
ptions?

Regards,
Markus
