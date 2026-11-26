Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795731299;
	b=vv25FnICctY/tRynectJiNXwlfwlU4554J+0vMq1kP9vVJhPakoNhF6Zx+vTGp7jQ4cM
	 MK8Ch39UUPELhcwT5aSeVp/8Z0liTs0tabHUZ2WTeJ0YPS5Bra3+UJY6b7n1Bf8VcNQQb
	 yaIazDEy22Q2IPimfiTuYu2wThOtsXS2VYHCHcrIEJnyC2kluZyjywL55mLAdnJ1A4+fp
	 TsJuDagVw1Yvafmdnt8f2SQ5Xc2Ew8ip+A5gXDfrKdKk7ch7qfFKWW4ZSE+sdfqlDVVOo
	 XEyj0WGk1KKp3r1rrf3PhNLQIk77EXJRg0S6dgW4er4N3aEaJLQ4tqm9Xsbah++dxUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795731299;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=lRS+sPalX3iPRJ04ezITgBCUZ5dvVe3IrVJM6Oq6w1g=;
	b=Zuvlhr5rymOtRaEpZJ0ghHU1twcLxTdjEFmNS7yis+mmP9uwZl216Rkyk5DhOTUT0gZd
	 Y8mtBr4mU8c/kb2s10t88AVeGpDeNhZdvPhU6iDvZTEP5/qKCJlbxfDKBy3oUXBy3fvH7
	 FutWNVkjcOqVR/ElgHfsCoMcvh+uxoT2XZgMla4pOKcfz7f4zgCSD8h0Tr65hSVZaowi4
	 TToQuKVr5tn74lR3vAsZ+wK7+QuqacxbvBEYtjPKBw/DYTQB9YmJhqtME4AOvxrYbLAgy
	 lxRs4NDLczvQnr5jWXX5zuE1DcrXlEYHOSuTtwUv6Hi1b8g8UlSos31SNp2E9kdoyeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WKaHfFvf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39569606A31C;
	Thu, 26 Nov 2026 22:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WKaHfFvf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B09D1F000C1;
	Thu, 26 Nov 2026 22:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795731298;
	bh=lRS+sPalX3iPRJ04ezITgBCUZ5dvVe3IrVJM6Oq6w1g=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=WKaHfFvfGKlW3OZvIm4Q30MymZZltSs4JK2vI00I3KaXLLo9lrlSvApx2hdmv1vPR
	 sNmFOXKRo7mGdW7sv14lNmJJXqxndZ51mYgkChoL8UMGWc7qh+te71B7nKjDHrxkQd
	 phXFa0Am4Ch3hW8dLYzPwVh2SyJ0TgjC52RvMzsCU8M0Ravy2ciqeqxaQn160n0SWs
	 1IotD3+Jbqc47r4+y5H9Q5TMSghO3R6aOCODnXy7oMMQ1+e5PIMjTHsjGE1lJgvKhn
	 pK+N/KNqj7BmPmo3f9dCb0U7/c61y/uGBmhR0kfL36u3eWrHD5mJ+B6Llkh24Az9dX
	 o2KRY2xa8HLdg==
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v1 1/3] ASoC: tegra: Consolidate remaining separate
 codec machine drivers into tegra_asoc_machine
From: Mark Brown <broonie@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 =?utf-8?q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>, 
 Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org
In-Reply-To: <20261116093805.73715-2-clamor95@gmail.com>
References: <20261116093805.73715-1-clamor95@gmail.com>
 <20261116093805.73715-2-clamor95@gmail.com>
Date: Thu, 26 Nov 2026 22:14:52 +0000
Message-Id: <179573129232.838304.962697835199951671.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=413; i=broonie@kernel.org;
 h=from:subject:message-id; bh=t04cI2pjFilwfzrJQHZY/pA5FFsg9MzDWsfcp+FY1Fg=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI51sc52lf3bxGVWMCdm1+cpVB6wVZ7ycmAqC3MJVvub
 +q44/O2o5SFQYyLQVZMkSUui/tlfcnrNXwHF7bBzGFlAhnCwMUpABNpE2T4Kxn3lMf8Muu93B2C
 mhsr7n+Y2/DDPlS9q7tNZ/oHs0SBrYwMR0+eeL4vNr1UI6WX+ZSt5osLDrbbdv0WF7gbUZCXXB/
 KDgA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> Merge individual machine drivers for WM8903, WM8962, and WM8994 codecs
> directly into tegra_asoc_machine.c, removing separate driver source files
> (tegra_wm8903.c, tegra_wm8962.c, tegra_wm8994.c) and simplifying the build
> system. This follows the unified machine driver approach used by other
> Tegra audio machines.

This needs a rebase against current code.

-- 
Mark Brown <broonie@kernel.org>
