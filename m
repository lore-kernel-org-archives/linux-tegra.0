Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFD92580D2;
	Tue, 24 Jun 2025 10:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750760427; cv=none; b=Gb4wrLkl2PXaPBsthg82o8WcqtZVh52od6KiPpo6XB0B9Y9U1wnT1+ufJ7DucglmWm+TrEUVzAEYD01yHuIaVD6PVXwa78ZSxiEjxdtM+9VJ//czRhjSCeDTl91/LDfaOAgNRal6JhyzEIWEF30xsBNanW5LvfLxd8ld6WSs2Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750760427; c=relaxed/simple;
	bh=Z+0eCEvdHugg/VwpRDl8L+A1N3SEiiZqQVteudPhsqQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=hKdHMK8TXbU7EnGd9iRzXKL1MEXN0S0l7BF/iy9Gq+QNifXh+B7hSGQihAuAk42jFXLyhv8Du5gtZv25uGs9g3KDjeIOLTejOWy/d+NXxsJgIYOu05RfTU4SGghFkXNTK2gj/FO4UzZKZ9RHBFtNgJ0BPnShSG3UoOwj8si9jpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=NiherBre; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pwWoKPFK; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="NiherBre";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pwWoKPFK"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id C0DE97A0223;
	Tue, 24 Jun 2025 06:20:23 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Tue, 24 Jun 2025 06:20:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1750760423;
	 x=1750846823; bh=ElBCzijucOqAKa7d0/uO2KM3xyZiGpiuta08jzLNLPs=; b=
	NiherBre3HoczM76z1cuvfuph0LmuDoN9uQuUMCNF0enhHVuchCC/x3kXbXPzFqm
	XBG0XmWuS5vfBUkZAdNAvWTjUQSyUp6q5xkm7czMrfHrSvUtL6aJNcxHbX/EMXg9
	18Kk4t7Us0zSMLeW68hOT722NlN1Lx+s5pbP3iX9qpp66623m/X1qYEXRYnAkF9g
	6lDwFv76owhX+Xhbi9QgqDVci6Wor1Tj2Pbe+Qt9mqSZGvaE4qi1VB1es3Ijynze
	KDqNLXt7XZxsQ/BQkUCYrw4NaqEGjSBL/z46Wvlb2JBjLFPtopgFnxksn7fJLJmv
	SI+tyh9wAPGWjIkYm1h/pQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1750760423; x=
	1750846823; bh=ElBCzijucOqAKa7d0/uO2KM3xyZiGpiuta08jzLNLPs=; b=p
	wWoKPFKqyDXR1AVJuz19296wPHfUYDMMM5yhkMzUfDySrCU7nRsHtDwsoiHr51dc
	RHoM9h6ERSTirzni6cfJXBeci2Ggxho/vodm7zy4DsXXWc0sc52aZZYm6oYq4b+R
	zUwOys/JTy8Yem54yJ1WhZJQa905DrejnWE1M5/HhkzTe6NRXMnIg8mnh69tRAvC
	DMEOnuJWv7AV4LNcVoKbtpBCWhEniXZ+wAfmAQn6JCO8Gn/qoXL9/K8qhvOAyXb2
	4nLtTU4eFb8pL41MJvPuRqdNXeucVpoooHea+Dd8dFglQ/VvNmReqGUtFh+feB7G
	OggINY/Q8UoTJP92mqCGw==
X-ME-Sender: <xms:53taaN2P7JwHkUIsZ0EH9h5Lc0h5Tg5PzTKA_s-Aoh-8BFrtq7yPBw>
    <xme:53taaEHrq-eYEIeRj-nslbSB1IZAKPkiW6XwzQkHlWYC7LlDSpcz5Jh17E-OxQo_9
    V37vDIT9A9vWFEWGys>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduleeigecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedutddpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepthhhihgvrhhrhidrrhgvughinhhgsehgmhgrihhlrdgtohhmpdhrtg
    hpthhtoheprghrnhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghnihgvlhdr
    lhgviigtrghnoheslhhinhgrrhhordhorhhgpdhrtghpthhtohepthhglhigsehlihhnuh
    htrhhonhhigidruggvpdhrtghpthhtohepjhhonhgrthhhrghnhhesnhhvihguihgrrdgt
    ohhmpdhrtghpthhtohepphhohhhsuhhnshesnhhvihguihgrrdgtohhmpdhrtghpthhtoh
    eprhhosggvlhhinhesnhhvihguihgrrdgtohhmpdhrtghpthhtoheplhhinhhugiesrhho
    vggtkhdquhhsrdhnvghtpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrh
    drkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:53taaN7o205XYtVAGU6nNuFYrZg3xMkR4mIEQodwC9hDay9zb7cJNw>
    <xmx:53taaK0GZZySMKAqhJVZZycLufV2MrVZshPbefZMpfqL7azsFXMmPQ>
    <xmx:53taaAEKw8SNe0wdMPC6CuGS99jdTb7blDI6nsFOIE03naYVp-XhQA>
    <xmx:53taaL_E2pnAzHrKIWBqs20Cku--E1Cj7rL8czialxhWRWPM-eU1Zw>
    <xmx:53taaAzhtGwv-f3Q2_oBslB-lozi-Mew2mWy5vbKWQrS1-f6AwY5iNvR>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1C91C700065; Tue, 24 Jun 2025 06:20:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Tc5b092f0a4343dd8
Date: Tue, 24 Jun 2025 12:20:01 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jon Hunter" <jonathanh@nvidia.com>, "Arnd Bergmann" <arnd@kernel.org>,
 "Daniel Lezcano" <daniel.lezcano@linaro.org>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Thierry Reding" <thierry.reding@gmail.com>,
 "Pohsun Su" <pohsuns@nvidia.com>, "Robert Lin" <robelin@nvidia.com>,
 "Guenter Roeck" <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Message-Id: <5a571236-7de0-42bc-bfb2-52a57e210852@app.fastmail.com>
In-Reply-To: <3099e624-4cfb-4582-94be-3c09a9fcba01@nvidia.com>
References: <20250620111939.3395525-1-arnd@kernel.org>
 <3099e624-4cfb-4582-94be-3c09a9fcba01@nvidia.com>
Subject: Re: [PATCH] clocksource: tegra186: avoid 64-bit division
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Jun 24, 2025, at 12:06, Jon Hunter wrote:
> On 20/06/2025 12:19, Arnd Bergmann wrote:

>> @@ -267,7 +267,7 @@ static unsigned int tegra186_wdt_get_timeleft(struct watchdog_device *wdd)
>>   	 * counter value to the time of the counter expirations that
>>   	 * remain.
>>   	 */
>> -	timeleft += (((u64)wdt->base.timeout * USEC_PER_SEC) / 5) * (4 - expiration);
>> +	timeleft += (u64)wdt->base.timeout * (USEC_PER_SEC / 5) * (4 - expiration);
>>   
>>   	/*
>>   	 * Convert the current counter value to seconds,
>
>
> Guenter has also posted a fix for this here [0].
>

Right, that one looks better than mine, as it avoids another
division entirely.

     Arnd
