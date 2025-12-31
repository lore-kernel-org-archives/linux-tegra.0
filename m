Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4859020299B
	for <linux-tegra@vger.kernel.org>; Wed, 31 Dec 2025 15:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767195737; cv=none; b=JDPRd1XoY7koQ4D3oQimm3L1dIHLHsYhMDj2Vd5WHfPQuUMuvjYzjiboTIZQRyBJXGW0taqdDxRWLeGwdWdA9/Xf3EwSem4EmXmldTQlDeCqJMAIlKAJpta/HNvyKGZq/SmqqzSF3w+vCOd3RQFhlL5Y+UJcflUepFdVj1d7R3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767195737; c=relaxed/simple;
	bh=Sm+IZKI6zp+FnsDeJw5OrXltyphTACRX1TEG8zdzgA0=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W0rak8kk0zwQuR6JGIwrtewf7kYXfGoSOcH+OFpzxicKm+Z3LjaO/j1OaPIKNfCWEB4VluWINqYovSqCv9PCirjLTGvW7KVEzb+6QmlXtrqQFa2KTHP2EZ4mtZqm7JPnm7Vb2haiGNnlAhcyilwOz47dcxSGC/vxxyEKzsmQ0dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=k+jmFT8S; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UVGpCY26; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=k+jmFT8S; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=UVGpCY26; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="k+jmFT8S";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UVGpCY26";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="k+jmFT8S";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="UVGpCY26"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A83E15BD41;
	Wed, 31 Dec 2025 15:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767195726; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=riDiBNKVfzakOZ6Ubn9Z+y7BFRZ5STjXUvyVPT9tRF0=;
	b=k+jmFT8Se5O2fb7PMLCrlgs524r4dpeikCPVWwoHphg7kbGsCz9i8uzLm9ZYUNvz0CF53c
	nQ0BZlHL5BAvrQiwOZKdW8eIfihLGVlA05EO7DzmiUh/fpn9osypG5xMV+/ParNa3/nsF4
	PElmIomt2zfrB3QrIjnp9qxRW/YV+0w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767195726;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=riDiBNKVfzakOZ6Ubn9Z+y7BFRZ5STjXUvyVPT9tRF0=;
	b=UVGpCY26H0ItFqXCzv1ZuhA3gussK0mJGkThHPJgTpjAnekCJg2axADsx+/nxBe355H+3u
	t1hoTXg+gdVLZJDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=k+jmFT8S;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=UVGpCY26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1767195726; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=riDiBNKVfzakOZ6Ubn9Z+y7BFRZ5STjXUvyVPT9tRF0=;
	b=k+jmFT8Se5O2fb7PMLCrlgs524r4dpeikCPVWwoHphg7kbGsCz9i8uzLm9ZYUNvz0CF53c
	nQ0BZlHL5BAvrQiwOZKdW8eIfihLGVlA05EO7DzmiUh/fpn9osypG5xMV+/ParNa3/nsF4
	PElmIomt2zfrB3QrIjnp9qxRW/YV+0w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1767195726;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=riDiBNKVfzakOZ6Ubn9Z+y7BFRZ5STjXUvyVPT9tRF0=;
	b=UVGpCY26H0ItFqXCzv1ZuhA3gussK0mJGkThHPJgTpjAnekCJg2axADsx+/nxBe355H+3u
	t1hoTXg+gdVLZJDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5A55D137FE;
	Wed, 31 Dec 2025 15:42:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id V/3jFE5EVWkJaQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 31 Dec 2025 15:42:06 +0000
Date: Wed, 31 Dec 2025 16:42:05 +0100
Message-ID: <87fr8qy7xu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Cc: perex@perex.cz,
	tiwai@suse.com,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	mkumard@nvidia.com,
	ddadap@nvidia.com,
	sheetal@nvidia.com,
	linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/tegra: fix a memory leak in hda_tegra_first_init()
In-Reply-To: <20251228140530.3739960-1-lihaoxiang@isrc.iscas.ac.cn>
References: <20251228140530.3739960-1-lihaoxiang@isrc.iscas.ac.cn>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.1 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Rspamd-Queue-Id: A83E15BD41
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,gmail.com,nvidia.com,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Level: 

On Sun, 28 Dec 2025 15:05:30 +0100,
Haoxiang Li wrote:
> 
> Add azx_free_stream_pages() to release the resources allocated
> by azx_alloc_stream_pages().

It'll be already called later at the destructor hda_tegra_dev_free()
callback, so this change would be rather superfluous or harmful.


thanks,

Takashi
