Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDA59331EA4;
	Wed, 30 Sep 2026 12:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790772957; cv=none; b=OB/6tj9ymvvo0uPlLUYWhwVUzVNMyeRjL9sUPznBShSMkQ2GRkgEZg4FwKx5LzqMYqsHh5OCWjgGEESrBFgoqFPR02JvyQq9el4Kk56SSYJx2Hr6EN9lxZX86AKFigtEU0jLSKw28mUAbOcxBDWQm+6lmU1s6Egz6tKLiW7e3pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790772957; c=relaxed/simple;
	bh=4dpoQhE9g9uNhnyPps/uhYZnp0aN5A/DbzQlMrnt9Dw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RpXoDKQG0Hlp0j4j00J8QmlWHDJp1D6BoyZ4HXSiz8jafWMkFSSkGR2JnMtatXrbQm18TXXaMpZj55FcOxGvEKK+VFtQ+TNpjawzg36CezwqeMxB9tGmOZ+ugEXUGcfDMZF2/Ep+XEbX8TvwRVt75+VdwDgmY1BJ8NpgnuaTsNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=n7dkQ1XU; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="n7dkQ1XU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1790772940; x=1791377740; i=markus.elfring@web.de;
	bh=RmdKos7OipZYGPckmVrikKcbrA6XZlqhOXv1ZJFuiRA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=n7dkQ1XUUuVfiphvYD1ZV4tbsc5eORCC5yWFkb7MEkkFlp9loBy7CnXwHBjuWYax
	 dMTEnlMUYGIbcNCJ1pIzKOsoZys+voGiDnUK7EFKH4qqcYvIq9uKBMiJ26r4Rp/Ko
	 qndwclLfXv9wgQHgbCNgjRWVoTdotS4dcRqpmsiSSkMKfjyRBjSHfPAeFC9M+GsSL
	 pQRtAm5INdTjiUPu6j7T2EWmPnIglD2STcRp+MAQmCf+lGi6QRekfigoz1VJRbXRR
	 UqzuzehFwM7zR3u8Z7ZxDqM+f8rR8VponD6s+WwOLvAs4ZDycRuTiYfVaPLLaPnHk
	 QD9sRAtL5J+emCT14A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MMY1D-1xSjk321gd-00YrgR; Wed, 30
 Sep 2026 14:55:40 +0200
Message-ID: <9a1dd399-950f-4a5b-a94d-093f89c8c61b@web.de>
Date: Wed, 30 Sep 2026 14:55:38 +0200
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
 <1b56f03e-fab7-42a6-ac49-7b05a081639e@web.de>
 <CAGp+u1YXDCBUWJGvu7FHO-+m1K47hX0gBo=T1Vumv2GNJoBhkA@mail.gmail.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <CAGp+u1YXDCBUWJGvu7FHO-+m1K47hX0gBo=T1Vumv2GNJoBhkA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:RTEjG4DGh+eZvIInNl3w9MAFPYR5x87kOHcxeg9mcRb4FjH418R
 lM7BZ/yznp+oU2ASrv6RXFrTC2liuihxeeqp++x9L1HYN3shDYxY+B/ge21RNQv8asB46Pz
 BQ1LkCw7/OQ70QCthK7SdqpJZ5L7rcHSWerJXZ480EpS5ekuIKto8FBc8BBLy3RvpklLNbk
 O76JhoGedqvqgfIgPsL9A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:sNSo2HL699o=;LcUG1AdiwtSOwJ6MmQOfUUy7EKq
 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

>> How many contributors would be involved in the mentioned software resea=
rch so far?
>=20
> Currently, I am the only one contributing to the source code of the
> analyzer. My co-workers
> provide research-oriented discussions but not bug reviews/implementation=
.

Thus it seems that there is a corresponding research group somewhere.


> Regarding this, how would it be reflected in the patch?

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv7.3-rc5#n545


>> Do you try to follow scientific development methods?
>>
>> Will publishing requirements grow accordingly?
>>
> Yes. The source code will be made public once the research work gets pub=
lished.

Would there any research grants be involved as another related information=
 source?


>>>> Will this information trigger further collateral evolution?
>>>
>>> The collateral evolution will only affect the experimental analyzer.
>>> It does not affect the submitted patch.
>> Will opportunities be taken better into account for improved change des=
criptions?
>>
>=20
> May I kindly ask what opportunities you are referring to?

I indicated also a possibility to avoid another typo (for example).


>                                                           If you meant
> that whether
> future reports generated potentially with the help of AI tools will
> credit AI tools, then
> yes.
* Adjustments for word wrapping

* Additional tags

* How will locking analyses evolve further?


Regards,
Markus
