Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36CD2E336A;
	Tue,  1 Apr 2025 12:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743510719; cv=none; b=Bkax1GNRIwpdge8jLzcM4kr1/gvxO19B7U1ssf/Gle1p2tQqpkQwPP0qDad5piP8lQopPcGpYDc5NXGG0VYZ7uioi/SbcH4EHRZgubiDynKQyYiuM+hCRokZA5NihK/TPFmqxiks06KQ+sXlySaT7vhu5ivjgg86Z7uVhg78xKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743510719; c=relaxed/simple;
	bh=e8Pt8SAdt8WiGEQXf1RN9YG6UNRDRbEDoi032Y4NLh4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IKOO/cuSSVqYslI42OrGoSOzN8aozWoLe5rAAO0+7Wk9S9qf2NB+ZwA71XVA+/6YpUtkb9gSeqGBqQbysLm8fIXnVZbrHRgfzMF7RSamik/hBu4hNK3lhuIyZw7d8S9ZrQ0YW6Tk/GBokN/Gio+WfN0/wITsMk+rzjDAIXyZKDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PESru5/K; arc=none smtp.client-ip=217.70.183.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PESru5/K"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4445E441A4;
	Tue,  1 Apr 2025 12:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743510714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e8Pt8SAdt8WiGEQXf1RN9YG6UNRDRbEDoi032Y4NLh4=;
	b=PESru5/KuLmCSyA7z95d84dFOw+XqBOHg4HrRwYpqL4B78A4zKJ8+DRiPP16jtgW70GimD
	DOBiaWr8ksa4mJv7XAsKZLUoo7+VXQzYEQiJPI1pUb5yZMdIPUhu0FtT/vOY0cBKRL6PG4
	U1f6J6yLK4/JC3BNbqHFXePIgt6r2Wl55C1VKVholpJoNHHvDe5GM36dcA3j2Z2lu3X41l
	eqOYLOIccbUGGYTj0PrF6vwBhdY6E9anazrDWJttESNzU7BmQu0XxTlNGvO8kb0tdHW3WF
	UiVErrsX2RpO5tFzcK6yx0ZwL+Fr5dNu5eNog0lyzOIX8F/CLBhG64GlBqvW7w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <shao.mingyin@zte.com.cn>
Cc: <jckuo@nvidia.com>,  <vkoul@kernel.org>,  <kishon@kernel.org>,
  <linux-phy@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <thierry.reding@gmail.com>,  <jonathanh@nvidia.com>,
  <linux-tegra@vger.kernel.org>,  <yang.yang29@zte.com.cn>,
  <xu.xin16@zte.com.cn>,  <ye.xingchen@zte.com.cn>,  <xie.ludan@zte.com.cn>
Subject: Re: [PATCH 1/2] phy: marvell: a3700-comphy:
 =?utf-8?Q?Use=C2=A0devm=5Fplatform=5Fioremap=5Fresource=5Fbyname?=
In-Reply-To: <20250401193836885cYSO33OlICvYYYmEMlB5J@zte.com.cn> (shao
	mingyin's message of "Tue, 1 Apr 2025 19:38:36 +0800 (CST)")
References: <20250401193836885cYSO33OlICvYYYmEMlB5J@zte.com.cn>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 01 Apr 2025 14:31:52 +0200
Message-ID: <87cydwt64n.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukedvjeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeelvddrudekgedruddutddrudelfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudekgedruddutddrudelfedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtohepshhhrghordhmihhnghihihhnseiithgvrdgtohhmrdgtnhdprhgtphhtthhopehjtghkuhhosehnvhhiughirgdrtghomhdprhgtphhtthhopehvkhhouhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkihhshhhonheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqphhhhieslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrr
 dhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhivghrrhihrdhrvgguihhnghesghhmrghilhdrtghomhdprhgtphhtthhopehjohhnrghthhgrnhhhsehnvhhiughirgdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com

On 01/04/2025 at 19:38:36 +08, <shao.mingyin@zte.com.cn> wrote:

> From: Xie Ludan <xie.ludan@zte.com.cn>
>
> Introduce devm_platform_ioremap_resource_byname() to simplify resource
> retrieval and mapping.This new function consolidates
> platform_get_resource_byname() and devm_ioremap_resource() into
> a single call, improving code readability and reducing API call overhead.
>
> Signed-off-by: Xie Ludan <xie.ludan@zte.com.cn>
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks,
Miqu=C3=A8l
