Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02C9286A9;
	Fri, 23 Jan 2026 14:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769177145; cv=none; b=SxH2glGT9+pBq84pkwcveuh46qiJ+xGMexejoN961sgSZlcjIU4GXu36TlKPf6PyeLlx3Y4Mf+5fD5oRdrlWXV7PMcKQ1HXk1RbZf4Hmvo5NBLvE7OSuD+M3OnURdQqx+q6aAZlwvWlrsmTwtVenAAFHHgrvFtex+OS7hQpKmuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769177145; c=relaxed/simple;
	bh=nVDifRkA9q/UKIww2yn3PYRg5spzUZZ/bc51GIZC75Q=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=L13zgZ73CBZkkN1GLoG/vSWcHphBd2U5atnZ2vYGSQdF8g97NJQovpud2tCZp2Z+QpEldzqUfSWhhg3zuuKt5O5g4XovDb/Mt4xCNNctwA66Ib7Nzl+rZ76h+a5sorK5YnqwwQbw2pBOqj053cq4KCXmA3eXI8W5h1Jn6SvWMT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=LyJOxKes; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="LyJOxKes"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1769177130; x=1769781930; i=markus.elfring@web.de;
	bh=nVDifRkA9q/UKIww2yn3PYRg5spzUZZ/bc51GIZC75Q=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=LyJOxKes8ytLHoCgDYh41hX7ypwOEuA9fQrZS03/vwr1b4h6M/JpGNL+gjnRFTqW
	 nqYTjj910uM+TUltSJN04c+8RR+OogphjSuQNy6ACcPhcZP13dcY0NfAgU6ztP7FG
	 TUXPGOd3p4ogTLyrAhn5EeVr57SEFRFI4i6hem7hhrZdzVtx4lNPCXnHMOff88rqy
	 3Eh2X0fRxO3I8YBxZNhvuRsQ0VPVed2fqj/RYF3JJ+d9C2JoOTMl86JewpQ/giKst
	 ab+JxVmII2NFVUYqJQ8AXg0paJzJ5lS2tP++N/YZPqks4TLYJ6AShPFRsBaQ9UnK+
	 /QXvdeOGRxHSO7A+mA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.224]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M91Pe-1vfSZj3XqI-009Q3O; Fri, 23
 Jan 2026 15:05:29 +0100
Message-ID: <f31a2eda-a801-443e-9f1a-63984b9006f9@web.de>
Date: Fri, 23 Jan 2026 15:05:27 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Felix Gu <ustc.gu@gmail.com>, linux-clk@vger.kernel.org,
 linux-tegra@vger.kernel.org, Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: LKML <linux-kernel@vger.kernel.org>, Thierry Reding <treding@nvidia.com>
References: <20260123-tegra124-v1-1-5e0a5b499d1f@gmail.com>
Subject: Re: [PATCH] clk: tegra: tegra124-emc: Fix reference leak in
 tegra124_clk_register_emc()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260123-tegra124-v1-1-5e0a5b499d1f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:D93/79rsBqm37cV1uCSfFrNs0+nPy9YrAHQyrtUoZG6rosBrcOX
 wZMIyGRP+JThMkH8F3hSwcnc5yN/Iuq5wsa+G76lgTJo7nIjgh2zWqUqThdIoKP6aaHRgnB
 UyovhYHiIfGatENo4wetSehvWkEITOLtEc7E3xC55nWX+JfV4EENcMhQLjxH+dZnSsIJZ1v
 woglHXcmpL2btLkzf0w0A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/60asjD092A=;1ZdQJ6/RyFSIMCRH9gTAS4A9R8R
 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

=E2=80=A6
> Add the missing of_node_put() call in the error handling path.

https://elixir.bootlin.com/linux/v6.19-rc5/source/drivers/clk/tegra/clk-te=
gra124-emc.c#L540-L542

How do you think about to avoid a bit of duplicate source code here?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/coding-style.rst?h=3Dv6.19-rc6#n526

Regards,
Markus
