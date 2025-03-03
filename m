Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37281F37D4;
	Mon,  3 Mar 2025 11:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741001138; cv=none; b=UPJC/6mHI/cP9DeZgia2GqZ5U/xJroQ9+nIP0f0v/Ppd0kkI2MGkwfyhoRNuUFKWi2oSzOfIq85PetnB7OPN6hoI2Pg8DsJ5+9EoPQBsLH+Itds0OyAdzJHvAeKAEX3qXDdNPFkOxSOVfb09zX4bx4APB0z2eG1zifqVvac7Goc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741001138; c=relaxed/simple;
	bh=B40IpQiU2fM+pVK7wquDYMb2HsNMGEC55LxsvTQcN4s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IzS22qoe88HmZwRs+lvORiXIr204KmlfnswER8YXk5NmDs1hx9mhxYbMP5LhvLbDXO6QJeadJMp9GRutJ+L+j3hHotvW2IwdXjWtM2Cw1hVAyZ9Fjg2qsCKAfO0yrMl83E3kIvWw+36lWD3JBGlKIacwBfKNYOBemouy4iGy9bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BkjwN4/t; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BkjwN4/t"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7F1F54341A;
	Mon,  3 Mar 2025 11:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741001134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B40IpQiU2fM+pVK7wquDYMb2HsNMGEC55LxsvTQcN4s=;
	b=BkjwN4/tsxmaO4+R7FAMmi485T6901iwWzyz1XQv40fA/bnC1/8MfN0e/DtKEnYmbV0ZQx
	KTmsVFoZYp5BJfaliwDBG7BiQMIAQE5waOKMctsSOMnNTH2uVUlSbiw1yo/8ZKIGIAjLQx
	zeIwltgkKYWLfJxx+9yo363ujP5Q8P86Ay3D01CuyCz7yBe19ek8111LbZHSc20hFTnXbO
	VoyWopf8T38LsZw0kFjnFpnVUWgNeCdqFqigmaBt+qXT5gkWRhSIZ8Zo+AMheKoN4h6AZR
	ZGxSBCQJkP7TX2uzMASAIOf5LCcrdPEzxhv3Iz2FOSZOd59fB2p/3zg9xNuMBA==
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
Date: Mon, 03 Mar 2025 12:25:33 +0100
Message-ID: <878qpm9x02.fsf@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdelledtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtohepofgrrhhkuhhsrdfglhhfrhhinhhgseifvggsrdguvgdprhgtphhtthhopehlihhnuhigqdhtvghgrhgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehjohhnrghthhgrnhhhsehnvhhiughirgdrtghomhdprhgtphhtthhopeguvghvsehlhihngigvhigvrdguv
 gdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehsthgvfhgrnhesrghgnhgvrhdrtghhpdhrtghpthhtohepthhhihgvrhhrhidrrhgvughinhhgsehgmhgrihhlrdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com

On 03/03/2025 at 12:15:25 +01, Markus Elfring <Markus.Elfring@web.de> wrote:

>>> You would eventually like to express that a maximum should be determined
>>> from three (or even four?) values.
>>
>> If there was a max4(), why not, but in this case I don't see the point.
> Do you miss such a programming interface so far?

No I do not.

> Would you be looking for corresponding software adjustments?

Not necessarily, unless there is some performance improvement.

Thanks,
Miqu=C3=A8l
