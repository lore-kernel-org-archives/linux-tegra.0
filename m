Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E20F199B9;
	Wed, 30 Oct 2024 13:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730296127; cv=none; b=m53Df08ZixU6PwTN98Lk9KzaFq8bKviKMy8N9TikcLY4HLQePs7yu04/N1h2TX4xICq0Kg2wk/nYqPBy0mJ9xq2vHcUu0Yi5eRaCiocfA0jmscZ56svvhTtkB4QfrcGCTe5Ur82Og9PH3RLXGcsCEA5QTY5V5qgP63cSji+uHa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730296127; c=relaxed/simple;
	bh=dLWpuJbJgWdigN9QmLFw+YaTXgAyQpiMq5oSI+FBn1s=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PEY+BaAQV+q22r4Q6HF+9L7cRQ5aZQO2gOYrA8+7SXYXW3fx5nNWPmli4DuXCuuxwDIa+2Vwp7XVyVZYq617yVilII2YHO5woPFLK0g8IlGWrxbNbY4DbUEK5y06pgPDGB0HekXDzZhHFacNT9ykYYnhsCGT4HglIaLxQcCUSbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=b85UkjG+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=n6xdAIGd; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=b85UkjG+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=n6xdAIGd; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="b85UkjG+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="n6xdAIGd";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="b85UkjG+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="n6xdAIGd"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A977221F21;
	Wed, 30 Oct 2024 13:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730296123; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KujEQvcemIfAE3TfZJ4xsL+24D2dtfUtYqPmGW4GE8g=;
	b=b85UkjG+Fw9dOoARUdsSpml+OacZxumFjg49UWHcDnjcLeRJMtrKJbzUbIXB7SMib/t/7b
	7MGW9LacBsXIAWZtBX9wj8jaXImpcFB0eVpf1iirVAuzSe+jDkpHkNlC+JkIEU71W7d/wF
	SKXL243SdNksQ8GVsQYrRAhKWbKBjko=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730296123;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KujEQvcemIfAE3TfZJ4xsL+24D2dtfUtYqPmGW4GE8g=;
	b=n6xdAIGdff0vZvxsrUzs4lNayiLsrlaAhPWZ0MXBXz37G/JlcPhYlJjQSLpp6Wq3tMHCio
	B8vcCFHuEHZEsiAA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1730296123; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KujEQvcemIfAE3TfZJ4xsL+24D2dtfUtYqPmGW4GE8g=;
	b=b85UkjG+Fw9dOoARUdsSpml+OacZxumFjg49UWHcDnjcLeRJMtrKJbzUbIXB7SMib/t/7b
	7MGW9LacBsXIAWZtBX9wj8jaXImpcFB0eVpf1iirVAuzSe+jDkpHkNlC+JkIEU71W7d/wF
	SKXL243SdNksQ8GVsQYrRAhKWbKBjko=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1730296123;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KujEQvcemIfAE3TfZJ4xsL+24D2dtfUtYqPmGW4GE8g=;
	b=n6xdAIGdff0vZvxsrUzs4lNayiLsrlaAhPWZ0MXBXz37G/JlcPhYlJjQSLpp6Wq3tMHCio
	B8vcCFHuEHZEsiAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 35CDD13AD9;
	Wed, 30 Oct 2024 13:48:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id yCb1Czs5ImcJeAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 30 Oct 2024 13:48:43 +0000
Date: Wed, 30 Oct 2024 14:49:46 +0100
Message-ID: <87sesdya2t.wl-tiwai@suse.de>
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
X-Spam-Score: -1.80
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:email,imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Level: 

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

Applied to for-next branch now.


thanks,

Takashi
