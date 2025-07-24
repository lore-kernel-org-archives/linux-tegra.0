Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFBD26B2A3
	for <linux-tegra@vger.kernel.org>; Thu, 24 Jul 2025 12:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753359455; cv=none; b=gD6Zu9KI74y0n3oy2AGGZBvuPvUMTUnZMCq52E3IeAP/frxm+wq2noqStsO39PJuskSiehoVbEpzx9Xy2xijxJfb8RAxDZFi0L6sMdnmiCAiqpf6seRqpYZQjomscrW6fcYG0d2Bw9inb3tIcV23DrKo7omxRiZsS+skFTV6Wtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753359455; c=relaxed/simple;
	bh=m7JbZvMoAIlPW0dGDc5nDGqiDkrmkt29Jf4xODLXe/0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=uds6FN/eihbqvSpSHJmXy3wZKJEcBQfxl401dPyfrYs3pxBsB0/jakW25V0d1Xfw9fwzV5Kj+/gQJhnM9Z0RorQjOrL2fpnoot3SfPyQGUXrbzSJneg+GBSaXdQkAvGlV3sgunMhEdtA2KWnv/c8CAiD+dD2fN0XTTQHyyBDXQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=SgX+V9Kk; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=VMKqn3Mv; arc=none smtp.client-ip=202.12.124.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="SgX+V9Kk";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="VMKqn3Mv"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 0B5EE1D00113;
	Thu, 24 Jul 2025 08:17:30 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Thu, 24 Jul 2025 08:17:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1753359449;
	 x=1753445849; bh=4mmZ8ZhV6vN83FB+JRl0HEi96SFfXJj0YFQB8fvIjNE=; b=
	SgX+V9KkQiLAfyAY+sP3WRPce1B6LjHXtz3k/lS0/ppRY1F1eLmAC9ZI+XTrBEPm
	gPpBhYaBG2hen9mPwhEUrBA8gtxehEqhSp9N4f7ARE5ZluMLt+b7VWtsFkfDf6Et
	ZyeZtrz8lbr6b52aH0Y1RR4AXPxq72AtFqcvdJiDh/FuLfhiwXYYV21M4o7QxAYJ
	XonFetmYOIZU4L3f9ndHAyduOmXl/rK8KyFkrHj4mrM96jeuWosS2hiMgikoV+tk
	7D87wQXzZJRkczJqei7jjRH9iPA0q6ohryPNY9b44+79yYk97oDGM1YXRsp4WbXt
	DF6jDMD2oWDpl0i7RuSZvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1753359449; x=
	1753445849; bh=4mmZ8ZhV6vN83FB+JRl0HEi96SFfXJj0YFQB8fvIjNE=; b=V
	MKqn3Mvj5R2QMw8z1BbCxChtslDAwxFjoMAAYXvNb0b8qQ+7mlairQm1ZyvtOFgm
	AZuQA170zUmgd/s2/DUoxG71ZnuQguUBSyFs/08ObcUA4pmpi8GZnASJsq5rK0Wf
	wtVuP/Tkd1a6tFCXNq48GbM0wU7lRoxxYiXgSBOtMl6Mpy7XcySoXbCV5ZoBqryb
	VSvWpjYl2rZKJx8xp+Pc87MXzF/3D4ZTwqWxYWbawjFXfZbE1P7amCZ4j/7u0xER
	g8atSohmliC+VWDRcMQOAHR4CyHCj+/USMbwjFwCcnGSOZxTmL02vQGZVa0K+1aX
	4lrpLwbc7ThfuRaeZf5xA==
X-ME-Sender: <xms:WSSCaIPxJ82o-d3Clb6Qhbn8VKHbHQdCfhyqIx5KHAw1srWPI5oWrw>
    <xme:WSSCaO-it8OZI22_lCZ2xuv7pb3hAu1a4SVZBy_1BFiaYXfQ2IM8lHCsZJk3uSTp-
    aeoBC3rr6xq2P8aOnk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdektdeifecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopehthhhivghrrhihrdhrvgguihhnghesghhmrghilhdrtghomhdprhgtph
    htthhopegrrhhmsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsohgtsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtsh
    drihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehjohhnrghthhgrnhhhsehnvhhi
    ughirgdrtghomhdprhgtphhtthhopehlihhnuhigqdhtvghgrhgrsehvghgvrhdrkhgvrh
    hnvghlrdhorhhg
X-ME-Proxy: <xmx:WSSCaNW3S2Ut8RCnODSbj91mvNXi4QEftlNOUcGWgcAaCfnxJEF9oQ>
    <xmx:WSSCaE8ay2SRprM7gjjephoI-P1CWSdCxF9QRnYY6bGSzD3fD6D8sQ>
    <xmx:WSSCaO8xvyV1yy7zYBtaxmMjRC4CjCCtWErshXdqYH9WBcMplsHSvA>
    <xmx:WSSCaMTY3A6ODBlN_Y0VChVSngCoshMNyTYDQL2MJT5-Sv3PcQ_kGQ>
    <xmx:WSSCaHxO4JLgK6RTTVcSvzGqqGg1btCQm2lNU7ur5m8EtJc2w8mWccWr>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 29986700068; Thu, 24 Jul 2025 08:17:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: T5d762c921204b368
Date: Thu, 24 Jul 2025 14:17:08 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thierry Reding" <thierry.reding@gmail.com>, arm <arm@kernel.org>,
 soc@kernel.org
Cc: "Jon Hunter" <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <ba53e8c1-b097-4b02-947f-06a8e0c8ad5c@app.fastmail.com>
In-Reply-To: 
 <izdiwbkuipbzunqot7zhillohtfcm32xrk5ydu54bamumfgkpx@p6ikuhkv3bkj>
References: <20250711220943.2389322-1-thierry.reding@gmail.com>
 <20250711220943.2389322-7-thierry.reding@gmail.com>
 <izdiwbkuipbzunqot7zhillohtfcm32xrk5ydu54bamumfgkpx@p6ikuhkv3bkj>
Subject: Re: [GIT PULL 7/8] arm64: tegra: Changes for v6.17-rc1
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Jul 22, 2025, at 14:21, Thierry Reding wrote:
> On Sat, Jul 12, 2025 at 12:09:40AM +0200, Thierry Reding wrote:
>> for you to fetch changes up to d01e4f1e7aa8833f549ac61a0bbcdc395533269b:
>> 
>>   arm64: tegra: Add p3971-0089+p3834-0008 support (2025-07-11 16:57:47 +0200)
>
> Hi Arnd,
>
> it looks like you haven't pulled this yet, in which case, please hold
> off for a little. There's a missing dependency on another branch, so I
> need to redo this. I'll send an updated pull request ASAP.
>

Sorry I missed your message here and ended up pulling v1, which now
conflicted with v2. Can you change v2 into an incremental series instead?

      Arnd
