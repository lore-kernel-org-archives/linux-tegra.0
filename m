Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595921E04A9;
	Tue, 29 Oct 2024 09:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730192662; cv=none; b=eoXXhTghfjR6w684GXZSLGfOCSEEG24Q05if3pS7AfIV0GG8JisAowl5c4Oe3SSnQqjhtRSkhD/G0+OFK2bGeQt2ZibDkZlHChuNSrrwYGEyj6R1dBFSFg1wq+saHUIeT9JG9KNjw6YPyi10JD+V7iZF3AszrXYrWkVFI+WOCt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730192662; c=relaxed/simple;
	bh=IEcQpgmC9PdbEk1BoI6HZttKo/ZQQ7yIuHkeP/jWgZQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HNcAVQox6b322znBRX8bmSjd1xPjrR6PJXGae9HoMGScE4MzlmGxeK2YXrbWdVaxlrHct8VTz1yxsIF8GiTxmL/JWqf9vSynxZiC/2dBtwfYyrA/Q3AyjuCweOl7ERWhNRGyGlABWvv+wQRFklQXL5Vk6g4MExtLAa7xG7rKeGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=o7QAkV3O; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ip+QCFtc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=o7QAkV3O; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ip+QCFtc; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="o7QAkV3O";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ip+QCFtc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="o7QAkV3O";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ip+QCFtc"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 5DB1B21F9D;
	Tue, 29 Oct 2024 09:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730192658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ku1JDYDBZT1obUivRyskSGSTDf0mktYxN5N3bIXkWQ=;
	b=o7QAkV3OXmTT4WcSZ+R25zlyM1IeRZveLYKgyLF1hV5HQ0vtI6NOGIWp9C75NbmNewNnWD
	WoMolsPR3gXdD0PXa0IeOJ+R7EHEWAXS/x7pJ4ogoqxZbm/FbvtcXOkhnkcJmEAy3PLiqC
	oU3RM11Dp2TSyEk6tHT6yaLppx+oaX8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730192658;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ku1JDYDBZT1obUivRyskSGSTDf0mktYxN5N3bIXkWQ=;
	b=Ip+QCFtcCOSAqB3TcPjiOdaFnve+Diu6aAPyR06YsHf0Rl2vbV7/0QSSrmrbuY+EYEnvKB
	ENZQeSyGpWp41rAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730192658; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ku1JDYDBZT1obUivRyskSGSTDf0mktYxN5N3bIXkWQ=;
	b=o7QAkV3OXmTT4WcSZ+R25zlyM1IeRZveLYKgyLF1hV5HQ0vtI6NOGIWp9C75NbmNewNnWD
	WoMolsPR3gXdD0PXa0IeOJ+R7EHEWAXS/x7pJ4ogoqxZbm/FbvtcXOkhnkcJmEAy3PLiqC
	oU3RM11Dp2TSyEk6tHT6yaLppx+oaX8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730192658;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4ku1JDYDBZT1obUivRyskSGSTDf0mktYxN5N3bIXkWQ=;
	b=Ip+QCFtcCOSAqB3TcPjiOdaFnve+Diu6aAPyR06YsHf0Rl2vbV7/0QSSrmrbuY+EYEnvKB
	ENZQeSyGpWp41rAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CE9BA136A5;
	Tue, 29 Oct 2024 09:04:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id htNSMRGlIGf3FAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 29 Oct 2024 09:04:17 +0000
Date: Tue, 29 Oct 2024 10:05:21 +0100
Message-ID: <8734kf2sa6.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Ivan Orlov <ivan.orlov0322@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] sound: Switch back to struct platform_driver::remove()
In-Reply-To: <20241029073748.508077-2-u.kleine-koenig@baylibre.com>
References: <20241029073748.508077-2-u.kleine-koenig@baylibre.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-5.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWELVE(0.00)[21];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_ENVRCPT(0.00)[free.fr,gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,zonque.org,gmail.com,free.fr,microchip.com,bootlin.com,tuxon.dev,nvidia.com,ellerman.id.au,csgroup.eu,kernel.org,linux.ibm.com,lists.infradead.org,vger.kernel.org,lists.ozlabs.org];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Score: -5.80
X-Spam-Flag: NO

On Tue, 29 Oct 2024 08:37:47 +0100,
Uwe Kleine-König wrote:
> 
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
> 
> Convert all platform drivers below sound to use .remove(), with
> the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
> 
> On the way do a few whitespace changes to make indention consistent.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
> Hello,
> 
> I did a single patch for all of sound. sound/soc was already converted
> separately, so isn't mixed in here. While I usually prefer to do one
> logical change per patch, this seems to be overengineering here as the
> individual changes are really trivial and shouldn't be much in the way
> for stable backports. But I'll happily split the patch if you prefer it
> split.

It's fine to do this in a single shot.

I suppose this can be applied for 6.13, not necessarily to be merged
for 6.12-rc?


thanks,

Takashi
