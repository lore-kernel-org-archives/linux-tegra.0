Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="v6h+6mtn";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EBqUYNS/"
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8146B112;
	Thu, 14 Dec 2023 10:44:08 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id B015E5C00C5;
	Thu, 14 Dec 2023 13:44:07 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Thu, 14 Dec 2023 13:44:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1702579447; x=1702665847; bh=X7rphW4VDo
	ZT8qg4z5kE8QsYzJauPYLpJpQftgurR88=; b=v6h+6mtncNMb4KnQJq5252fQhu
	edQcz5SLLee88IUDTtBPxn6i9wHU5LozeoKNMWgy9Y67YOO+wVyX9B8KMQ1td8K7
	epLzVPacsZN8X341znVv8Cwhxh451LYmKtBNoKvpSwbl0xU6FhI9uEfB6p3Tk7bc
	QpaJcLI+tftYM0jwzLLkBXUWgtzqCjsUoBiZAhaq7TBWo6AGhs6jFNJiVh128W9V
	ZEJlVf/VO4TQ0QFFClz8A2aqtxXWlsTNEmR00VfCGcJASufffOyu6X2gAysjVHzY
	e4f3yvrCrETJpyMGmAujFBCKbwDdbj0o2PVLzkq3Y9+BnefxGrWEkRZdlqWQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1702579447; x=1702665847; bh=X7rphW4VDoZT8qg4z5kE8QsYzJau
	PYLpJpQftgurR88=; b=EBqUYNS/hO3pSLPpAnEpJ6Sn2UwfzL5OLMaX9yGHqnDA
	E4z9s4Q2HVgM69AvG6vLlhpqiOllUMqULjHolQsAZq7kXNvgqV6sw/qwf1G2GSZ/
	7+l7RN0RAY645LCwbVN8EZiLBP1ZOH9dR6deGfyq/QVzXTA1plvZqLceH6xkziBa
	y9GosBdZLAMwtM9ZPF5SNCe13szDXWSjNL5onBjwQxruUnIsXzK14dZf5J1QsXsk
	7JN4aJaDElR4bpMxxlkGSJbylC8d65lTYB7RUr588Oib7fg2m49jmWCudUEPUXyt
	MILregVlkfcazQ50v2YPHlEFwNx2lLMBcN9TEqZSrw==
X-ME-Sender: <xms:90x7ZeNVvEAh0rNpZgCVuhTmbe6jajCo-mVArzBBioux1AVoVwwkKw>
    <xme:90x7Zc-flBTeKvTqXq1ezA6-RYiF2DL6jQzCxVEqB4yyfNmw4cip45RPqwPeMTFX0
    iajgftMZoSsX_XRPNg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudelledgudduhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:90x7ZVRdEBeWr78om2hpUGSvTDt7J8NTmC0itahInRb23UCIT39ynQ>
    <xmx:90x7ZeugJKxHg-XX26zTF2ITjfVJ4_B9e0sq2nE4n7ZG45Q0R1b0Vw>
    <xmx:90x7ZWdqE5OfXs7PpO6D7Duws9hgh6v6CVaAYkidbU0Dn7Sv34CT4Q>
    <xmx:90x7ZZuswon83KhNY6jQslMLhOZMBGdXdpwk6NsdEipo6ErvSF8gTA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 656A1B6008D; Thu, 14 Dec 2023 13:44:07 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1283-g327e3ec917-fm-20231207.002-g327e3ec9
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <d84156ff-897c-440a-bafa-75933203a3f1@app.fastmail.com>
In-Reply-To: <ZXs2jVeQtzU7668I@orome.fritz.box>
References: <20231017052322.2636-1-kkartik@nvidia.com>
 <ZXs2jVeQtzU7668I@orome.fritz.box>
Date: Thu, 14 Dec 2023 18:43:47 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thierry Reding" <thierry.reding@gmail.com>, Kartik <kkartik@nvidia.com>
Cc: "Jon Hunter" <jonathanh@nvidia.com>, "Kees Cook" <keescook@chromium.org>,
 "Andy Shevchenko" <andy@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Ulf Hansson" <ulf.hansson@linaro.org>,
 "Linus Walleij" <linus.walleij@linaro.org>, pshete@nvidia.com,
 petlozup@nvidia.com, "Yangtao Li" <frank.li@vivo.com>,
 "Rob Herring" <robh@kernel.org>, stefank@nvidia.com, pdeschrijver@nvidia.com,
 "Christophe JAILLET" <christophe.jaillet@wanadoo.fr>,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v7 0/8] soc/tegra: fuse: Add ACPI support
Content-Type: text/plain

On Thu, Dec 14, 2023, at 17:08, Thierry Reding wrote:
> On Tue, Oct 17, 2023 at 10:53:14AM +0530, Kartik wrote:
>> This series of patches add ACPI support for Tegra194 and Tegra234 in
>> Tegra fuse and apbmisc drivers. It also adds support for Tegra241
>> which uses ACPI boot.
>
> Applied, thanks.

I'm still a bit puzzled by this series, can you provide some more background?

Why does an ACPI based system require access to SoC drivers? Shouldn't
this all be abstracted by the BIOS in some form so the device drivers
can work standalone rather than calling into this driver?

      Arnd
