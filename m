Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36847361DDC;
	Sun, 13 Sep 2026 07:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789283395; cv=none; b=E35vKHeLP9juKaXdwN/1N4MjXKxjwoTj2KVLw1tSDeo5z2BFU2Bp0KHBZmNxMn+eLkUTu1CuKsVVdP9aTpoG3MajOG064x9MDBXKBQyFy574EvBW7yN3en2+6l0UZGXdQ4fontTEJ+Leid0Ml/0hAMm/Jj6Xfii5h7+rNaqSPz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789283395; c=relaxed/simple;
	bh=PopjpSs2nhAGEyT8mXbyWfAR7ppIUuBsRTrv7fhOCIk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nk8KXo8p4FGz5gESgniGFGFqT5hhBmAcy+AExiTwyTskpIKpYEyWcseVIuUHoU1AxpvxbdsyWonLv7cxIK8vWwDaicwiG6tERUwljk7H6iTg/SpR6BZkOeYDyDkpPXdjdRiWMPI2ycIGCQ0uv4Eo18PjQrBBfjhFnxuBXcsB0gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HLAPeRox; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=toILyq7p; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HLAPeRox; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=toILyq7p; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HLAPeRox";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="toILyq7p";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HLAPeRox";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="toILyq7p"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 3A2C521D99;
	Sun, 13 Sep 2026 07:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789283392; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RlqWo7CRgnWlLwtEjdg8T0bqVaDjgK5PyseZ5wcAHk0=;
	b=HLAPeRoxHFWRv9i2AyoKoI2BWqaoDWH6uhkDai5f1etzHAgnuMofe9yxZrhprg4JYRTUjT
	orvN+FuY6D1h5vfujn8bV1s3vs8z4S/bdAK68wRetqLvf4/qFIj6xRHssCSi5L1W4AOS5U
	VJKRv26reeCfuLyCnj0O5gJNyAr8u8s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789283392;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RlqWo7CRgnWlLwtEjdg8T0bqVaDjgK5PyseZ5wcAHk0=;
	b=toILyq7pwHmHZQ1ejlOWheaBuMb+pqvhiSMwVD3dDeDzU4YWdqozShmcXzXy78dqna1DwU
	qpGbHvSb+BbuYzBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789283392; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RlqWo7CRgnWlLwtEjdg8T0bqVaDjgK5PyseZ5wcAHk0=;
	b=HLAPeRoxHFWRv9i2AyoKoI2BWqaoDWH6uhkDai5f1etzHAgnuMofe9yxZrhprg4JYRTUjT
	orvN+FuY6D1h5vfujn8bV1s3vs8z4S/bdAK68wRetqLvf4/qFIj6xRHssCSi5L1W4AOS5U
	VJKRv26reeCfuLyCnj0O5gJNyAr8u8s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789283392;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RlqWo7CRgnWlLwtEjdg8T0bqVaDjgK5PyseZ5wcAHk0=;
	b=toILyq7pwHmHZQ1ejlOWheaBuMb+pqvhiSMwVD3dDeDzU4YWdqozShmcXzXy78dqna1DwU
	qpGbHvSb+BbuYzBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C469F13675;
	Sun, 13 Sep 2026 07:09:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id D/2gLT9MpmrMPAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 13 Sep 2026 07:09:51 +0000
Date: Sun, 13 Sep 2026 09:09:51 +0200
Message-ID: <87jyopwrsw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: David Cemin <dcemin@nvidia.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/acpi: add runtime PM suspend/resume to the ACPI controller
In-Reply-To: <20260912182120.1156356-1-dcemin@nvidia.com>
References: <20260912182120.1156356-1-dcemin@nvidia.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Flag: NO

On Sat, 12 Sep 2026 20:21:20 +0200,
David Cemin wrote:
> 
> The hda-acpi platform driver never enables runtime PM, so
> pm_runtime_force_suspend() in hda_acpi_suspend() skips the runtime
> callbacks. On resume the controller is therefore never re-initialised:
> azx_init_chip() is called only at probe time, so after S3 the codec
> verbs time out and audio is dead until the driver is rebound.
> 
> Add explicit runtime_suspend/runtime_resume callbacks and invoke them
> from the system-sleep paths, mirroring the pattern used by snd-hda-intel.
> Tested on an arm64 platform with the NVDA2014 controller: resume latency
> drops from 81.5 s to 3.6 s and audio is live immediately after wake.
> 
> Signed-off-by: David Cemin <dcemin@nvidia.com>

Applied to for-next branch.  Thanks.


Takashi
