Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0261F0E28;
	Mon,  3 Mar 2025 11:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740999844; cv=none; b=ks2U9uh5Pr2VusfBhIl8C9TV6zFgpDZ4J6g8hV69t+AbTgxi5ejsI01qj0cTmeJJ8+gbNFZ36BIYdCBJpgl4B1yGMK41zNTA5jQYmje8Y1o+Dne05w23MLqleVvJm56ZNFH6dlo6tFn2QlueC0zR74gf757/s7zr/IKuGAK1DtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740999844; c=relaxed/simple;
	bh=KuJNrgV0L41NqM51p8r18I1mt8rIt7jB62RLFcUV8bc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bFHHFPJWqrJzjMlCK497H9vCT3WnDso7Tvi3qD9lxfnuQ2wUiEEgyrmSa69UeWGcwNS2wLSSfyxCRxZNm7PNk+LiP6OV+B23CUT6fap//3Fv7mCy1U0hjWCxxyKFu193stZ2hbv49UW0UrhpYQCNxWOmCWi6mcnHcmzAOzvUT4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=V8rOERi1; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="V8rOERi1"
Received: by mail.gandi.net (Postfix) with ESMTPSA id A6DF9442A0;
	Mon,  3 Mar 2025 11:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740999836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UYg0OhYtGacV1+2euRFkrodD8aiR3ZlFwLFtEbH5bs4=;
	b=V8rOERi1COiXtad2VjJsc+kUj6Z6y0+6M3Z8Aca8oFl51RYAgTUurp8mL0bv5hRvcjIr7m
	qg39TNohItoSwlghPft2YRClrT0x6wBCJRl1A3C2dzF5wliEbC66pUfGzWjKaScV5sDy0a
	r00HZwBNkvTlDKdDhJUqyrr5sFGQUWErqyHpwkkDOC7SvkcH/ZiTIqqURZwdYZ2QvRXxyC
	QGA32FNXcv5XcpWeSE4mME5PIq+XBUKqUhu7C6GeVYgANuYgqCIgph3PvEE4iImy5yUbnd
	MIXeIv/foWBijvuAYDjB/VTcmba/48RTmFzVawX1rfT6eXdxC6ipw2gNY+fh4A==
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
In-Reply-To: <0193ac44-e858-4aff-a50f-dd95dbf3de5b@web.de> (Markus Elfring's
	message of "Mon, 3 Mar 2025 11:55:49 +0100")
References: <d564cafe-d45a-40b5-9a91-a2e2b97c80d6@web.de>
	<87pliy9yyv.fsf@bootlin.com>
	<0193ac44-e858-4aff-a50f-dd95dbf3de5b@web.de>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 03 Mar 2025 12:03:55 +0100
Message-ID: <87h64a9y04.fsf@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdelkeeliecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepteehkeelvddvheehtdefkedtjeeutedthfegudekgeefleetkeettdekiefftdeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtohepofgrrhhkuhhsrdfglhhfrhhinhhgseifvggsrdguvgdprhgtphhtthhopehlihhnuhigqdhtvghgrhgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehjohhnrghthhgrnhhhsehnvhhiughirgdrtghomhdpr
 hgtphhtthhopeguvghvsehlhihngigvhigvrdguvgdprhgtphhtthhopehrihgthhgrrhgusehnohgurdgrthdprhgtphhtthhopehsthgvfhgrnhesrghgnhgvrhdrtghhpdhrtghpthhtohepthhhihgvrhhrhidrrhgvughinhhgsehgmhgrihhlrdgtohhm
X-GND-Sasl: miquel.raynal@bootlin.com

On 03/03/2025 at 11:55:49 +01, Markus Elfring <Markus.Elfring@web.de> wrote:

>> I am sorry, I do not see what gets simplified. max(max(a,b),max(c,d))
>> looks simpler than max3(a,b,max(c,d)).
>
> You would eventually like to express that a maximum should be determined
> from three (or even four?) values.

If there was a max4(), why not, but in this case I don't see the point.

> https://elixir.bootlin.com/linux/v6.14-rc4/source/include/linux/minmax.h#=
L147
>
>
>>                                        Does it bring something in terms
>> of optimization?
> Corresponding effects depend on various factors, don't they?

Ok, so I'll assume the answer to my question is "no".

Thanks,
Miqu=C3=A8l
