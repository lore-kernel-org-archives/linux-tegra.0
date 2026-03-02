Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA3B392C42
	for <linux-tegra@vger.kernel.org>; Mon,  2 Mar 2026 10:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772445609; cv=none; b=D17GH29IC9qlBH0P0Y9IhkHp4k6H3DBklScJqivLw193umt0vD43ZKoWAcFBnqqRyNQdWaese7/23YaN5C9ip0tSXzjYye/pOP06YdjLw2x//bMy0OqScp9U/fc+VU4LVfFjt/BKojjcklfwQvEpdIxfaZo+0PTLMLQ9+TeY6xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772445609; c=relaxed/simple;
	bh=//RDafJ77aefXPhkb+CPc5dlvrRnRxlG7eUHg7CVqbM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kDIrz1MCW58nAQz8B2WbNsGFRJsSet9CB7HkZ+PzX8VNIL2sCnziV7/iRbVBNF8LHuF6koyaNW5HgrXpfno6iIuNEXJKBhl4ZNcVmdPXUOlh2z863+8NYYV30gf9PiZhSk3QK8eBdXFPf2Ilx+JITH6wNpS/MhryI2a3W8gNLLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NQAaulIO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=L5mPdj2x; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=NQAaulIO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=L5mPdj2x; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NQAaulIO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="L5mPdj2x";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="NQAaulIO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="L5mPdj2x"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 30CC93F823;
	Mon,  2 Mar 2026 10:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772445606; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gaoltdEYOEBqUxm7stCACiLNkbc75IZQL+NDstyFaXk=;
	b=NQAaulIOo85lN6Wnk1DOD1IaOZqAcTSg0PSbOjOLZNSn+Gz6cgCJ1XVrbtoq4L9PP8jscN
	meX/rVtPJzdjOpEiafjei7w+tIpR7hKa1vH5RE1kP5PtgX+Lo0F7UWLOWwYDRqBx6l0F4Q
	ysBOctHrTDCdzLbP3HtciqTm0lEK4DU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772445606;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gaoltdEYOEBqUxm7stCACiLNkbc75IZQL+NDstyFaXk=;
	b=L5mPdj2xAKi0jhs4vRFuiAShzGj2bfZz1iltEcNwbzpeBZ28MI8JtuZABfbkD540ngA104
	9hltk+Fdvp3ijoCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1772445606; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gaoltdEYOEBqUxm7stCACiLNkbc75IZQL+NDstyFaXk=;
	b=NQAaulIOo85lN6Wnk1DOD1IaOZqAcTSg0PSbOjOLZNSn+Gz6cgCJ1XVrbtoq4L9PP8jscN
	meX/rVtPJzdjOpEiafjei7w+tIpR7hKa1vH5RE1kP5PtgX+Lo0F7UWLOWwYDRqBx6l0F4Q
	ysBOctHrTDCdzLbP3HtciqTm0lEK4DU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1772445606;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gaoltdEYOEBqUxm7stCACiLNkbc75IZQL+NDstyFaXk=;
	b=L5mPdj2xAKi0jhs4vRFuiAShzGj2bfZz1iltEcNwbzpeBZ28MI8JtuZABfbkD540ngA104
	9hltk+Fdvp3ijoCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E91B93EA69;
	Mon,  2 Mar 2026 10:00:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +RXEN6VfpWl1EgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 02 Mar 2026 10:00:05 +0000
Date: Mon, 02 Mar 2026 11:00:05 +0100
Message-ID: <87jyvumtzu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Sheetal ." <sheetal@nvidia.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"Thierry Reding" <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	<mkumard@nvidia.com>,
	<linux-sound@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] ALSA: hda/hdmi: Add Tegra238 HDA codec device ID
In-Reply-To: <20260302084217.3135982-1-sheetal@nvidia.com>
References: <20260302084217.3135982-1-sheetal@nvidia.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.27
X-Spam-Level: 
X-Spamd-Result: default: False [-3.27 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.17)[-0.871];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

On Mon, 02 Mar 2026 09:42:17 +0100,
Sheetal . wrote:
> 
> From: Sheetal <sheetal@nvidia.com>
> 
> Add Tegra238 HDA codec device in hda_device_id list.
> 
> Signed-off-by: Sheetal <sheetal@nvidia.com>
> ---
> Changes in v2:
> - Resend as standalone patch; v1 was incorrectly sent with
>   Change-Id and wrong series numbering (1/3)

Applied now.  Thanks.


Takashi
