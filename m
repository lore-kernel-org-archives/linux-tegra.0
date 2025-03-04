Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FC727EC73;
	Tue,  4 Mar 2025 15:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741100948; cv=none; b=NdGUihLeWlEeYaHp3wyJefJJn53KQ+Prymswq7fGXmS0qiNljRCXn7mFILsL21juwBWeHoOh255RF49u+r9vgIwCRhGJ/gCi7xdyrZ8yjeMXOyCfZ24pMCxsoJfmz9hC2WWBzC+QlrMgZdG5f324t6V8cV549jJ0GKmDfpxdi2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741100948; c=relaxed/simple;
	bh=DG/AM3etG1nE9vfZIfc0a6ublPwhvIwD2A9YRgWbjkw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sW0EW161+g4OZLCB7uSOGnm22uZ+mpm+gucAHVC7jruzM372XiLZ4MKWmkji2syUj/hU0cQ19AxkXIpZbzdeSBEL3Ac8TQfhRLR4ttStlIOTlz0uo/CWXAe92jvLSHdDYTm4eXahVv8rGIzIoglfXNANgxSJA41pgwc1SxFBFjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=kc0XItSD; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="kc0XItSD"
Received: by mail.gandi.net (Postfix) with ESMTPSA id D166D43D79;
	Tue,  4 Mar 2025 15:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741100944;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DG/AM3etG1nE9vfZIfc0a6ublPwhvIwD2A9YRgWbjkw=;
	b=kc0XItSDzTYBLeiVj8NChyMYyQnpRRvxMFdALbWvrST2T4NKDBJpgwBbhyPhjtSeE9Te2j
	u9wWrrxSltQPZxpqeYPJw4uzoWInpg86JLUsVaP1Dzg7QeiRajC/4yW8cnVWVYviMehZi+
	R2hpFmNWmS7/iwaeOoMSdpWFEVXP/VibGlYOQG6XD/sAOSpQYI0wM4t8dLcOR9Ltv4bXd4
	0Ec7YTezS1dlhe1QQWlcMMnscqds/y9bDnq5okPWDIW4p7Zylx4mhpnS99d7C3QI5ho8EM
	N+e2pdeehuulTYWxI6KSVJerJ68luqbFAZ7I3QsLI8ADTCcqjN2PhCVeN2sPAg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-tegra@vger.kernel.org,  linux-mtd@lists.infradead.org,  Jonathan
 Hunter <jonathanh@nvidia.com>,  Lucas Stach <dev@lynxeye.de>,  Richard
 Weinberger <richard@nod.at>,  Stefan Agner <stefan@agner.ch>,  Thierry
 Reding <thierry.reding@gmail.com>,  Vignesh Raghavendra <vigneshr@ti.com>,
  LKML <linux-kernel@vger.kernel.org>,  kernel-janitors@vger.kernel.org,
  Qasim Ijaz <qasdev00@gmail.com>,  Natalie Vock <natalie.vock@gmx.de>
Subject: Re: mtd: rawnand: tegra: Simplify maximum determination in
 tegra_nand_setup_timing()
In-Reply-To: <10afda2a-4c52-47a8-bdfd-4bfd7bd9cb34@web.de> (Markus Elfring's
	message of "Mon, 3 Mar 2025 12:15:25 +0100")
References: <d564cafe-d45a-40b5-9a91-a2e2b97c80d6@web.de>
	<87pliy9yyv.fsf@bootlin.com>
	<0193ac44-e858-4aff-a50f-dd95dbf3de5b@web.de>
	<87h64a9y04.fsf@bootlin.com>
	<10afda2a-4c52-47a8-bdfd-4bfd7bd9cb34@web.de>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 04 Mar 2025 16:09:03 +0100
Message-ID: <87zfi0ygs0.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutddvfeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufgjfhgffffkgggtgfesthhqredttderjeenucfhrhhomhepofhiqhhuvghlucftrgihnhgrlhcuoehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgefhjedtfeeigeduudekudejkedtiefhleelueeiueevheekvdeludehiedvfeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedufedprhgtphhtthhopeforghrkhhushdrgfhlfhhrihhnghesfigvsgdruggvpdhrtghpthhtoheplhhinhhugidqthgvghhrrgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmthgusehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepjhhonhgrthhhrghnhhesnhhvihguihgrrdgtohhmpdhrtghpthhtohepuggvvheslhihnhigvgihvgdru
 ggvpdhrtghpthhtoheprhhitghhrghrugesnhhougdrrghtpdhrtghpthhtohepshhtvghfrghnsegrghhnvghrrdgthhdprhgtphhtthhopehthhhivghrrhihrdhrvgguihhnghesghhmrghilhdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com

Sorry for not being clear.

On 03/03/2025 at 12:15:25 +01, Markus Elfring <Markus.Elfring@web.de> wrote:

>>> You would eventually like to express that a maximum should be determined
>>> from three (or even four?) values.
>>
>> If there was a max4(), why not, but in this case I don't see the point.
> Do you miss such a programming interface so far?

No.

> Would you be looking for corresponding software adjustments?

No.

Thanks,
Miqu=C3=A8l
