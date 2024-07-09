Received: from fhigh5-smtp.messagingengine.com (fhigh5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D98A19755E
	for <linux-tegra@vger.kernel.org>; Tue,  9 Jul 2024 14:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720533696; cv=none; b=MADPi0aFMAx6+h6Vmr8BmMkm0y440xBjrd92ZKIrj4aSDXsdmcFVrFzHLKafLxCy0keKQQaCl+9LQK5LXp9MTyW/hM7syHLH3mwkA2ee5M2Peu9WA/wJcLT+WgA7EtpVGDgQOoZCw8Yi0huQ++rJYEBIZ3ommfENJN6wMs5iT/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720533696; c=relaxed/simple;
	bh=iqFt7rBpjKl+zcOjI0TKLOpk5Hm8EOQIZELFZKv7ohg=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=YNI+YWZqtfjO0IAlokjFihrxzre8vKSQi4BODEQFH4SzCKip8GNpLnoaw8GFnt3VZ0iBswrM/2kpuILVMGmLbYedC9Ig6iUHajE0U0gjJ/E2kWtQ3Vf9UdMW5JNkDEbJ3NgpBalgyv4bMd7acZ8oFYWT9w6nJO8iVZhLgMqBSzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=f+OIxBCF; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=BlKeo6kJ; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="f+OIxBCF";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="BlKeo6kJ"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 322FF1141690;
	Tue,  9 Jul 2024 10:01:34 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 09 Jul 2024 10:01:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1720533694; x=1720620094; bh=68ypJHInm/
	MzQxfMJr91caOG/rGannrTHNTtL/OiTEg=; b=f+OIxBCFD3c804IGAYkpzrgugr
	/Tl71mEZ7u3Lbb8S/OCgeL9ne/J2+b3UT/n14GD0cvKULffM5rwijX5hE5tscoMp
	43G40O5HChLgpCMCvuz2UPSwWwcGW1lKyFQ2HR0kEsjE2nhFS4Q0vTMiyp0q78AW
	fRJH12K3N7Uhn5mmr4IwcanHFHN6nggewxcnaL8LRwuthBQ+Dj0SdRdPR9D3zFjg
	111U9nHnTxex8VlJWQWmRiWKZjSg5HMXk2J2EszZ97jvDUxGtpfGy1foqLnhR+S4
	VEsrBx7jUAI7CpcteQ7WtryM17FIN/iAi/v432KG+vL/3hv4cj7Xv5MM5SOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1720533694; x=1720620094; bh=68ypJHInm/MzQxfMJr91caOG/rGa
	nnrTHNTtL/OiTEg=; b=BlKeo6kJzlvC9fPl1miMFocE/jfLlJM8apHTLX4aNwxl
	w7vHm3PlRG9AV/hrxliruPefmr4wn3PA27H6g2YaX+JegtpQhIunkW7by1ErrafL
	tLCVtEqktq802P2Xk1QhpDKJV3BR02oJA61HmxPHA2FFk+UvfSgkDgZGAWKkV5CK
	twWTrp9my5ombBFgGAjm4jrWOofNieGmxyc302nNYNA3O5c6hQ9kbQ5Zeo2KWQM0
	wL9+giBOIxsd53x6bhASJ+3zGBUY9PLsZGrWdmy9i0a9quWYBhIcO0tHAFghVDmB
	EjFUsOf5tCzvnjJD3PT95VhOfiqPWcg/+mEKZoVAdg==
X-ME-Sender: <xms:vEKNZpZVtgSECd5wTVy1-ThpxBbPuksGlitXwtjVRvCQvuv3Pi18gQ>
    <xme:vEKNZgZRxRSlRQPFIumxhMsxM_CMHddkkI9RhisxkkS3tnwlKrdXg2fsysurgBexf
    SuLWg2eJcTEwreHhUg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdelgdejudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:vUKNZr87t_tJdZmnEkUTQV92OpYlZYsJqoYbxjDxKWRctlDRdhj09Q>
    <xmx:vUKNZnp2qce5hO3oqP_o4dQG2qZwed8sqsixLpCyfoa-GsRSY5tlcg>
    <xmx:vUKNZkrSVISJHQvsXHCvPA-7VZzUjZHxmPSBZl2YPINQVPsUTFiUZA>
    <xmx:vUKNZtShKhaExISB_YqJFUJuyaJf7WJk6wKup4WDN6EWT3Q3mRg5rw>
    <xmx:vkKNZpA--nufj_2MtgzfS_M5ook3qnOfjHzmqV-DrTN0olfUQh9vxM5j>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id D6F61B6008F; Tue,  9 Jul 2024 10:01:32 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <211ba53e-5cd5-4a38-867c-5eab9356b2ff@app.fastmail.com>
In-Reply-To: <20240628210818.3627404-1-thierry.reding@gmail.com>
References: <20240628210818.3627404-1-thierry.reding@gmail.com>
Date: Tue, 09 Jul 2024 16:01:12 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thierry Reding" <thierry.reding@gmail.com>, arm <arm@kernel.org>,
 soc@kernel.org
Cc: "Jon Hunter" <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 1/4] soc/tegra: Changes for v6.11-rc1
Content-Type: text/plain

On Fri, Jun 28, 2024, at 23:08, Thierry Reding wrote:

> ----------------------------------------------------------------
> soc/tegra: Changes for v6.11-rc1
>
> This is a simple change that condenses two function calls into one in
> two places to save some boilerplate.
>

Hi Thierry,

I have merged all four tegra pull requests, but for some reason
patchwork did not notice this, so there was no automated reply
and I manually marked them as "Queued" in patchwork now.

Maybe double-check that the contents I have are indeed
what you sent me.

     Arnd
