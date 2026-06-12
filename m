Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FDB37474A
	for <linux-tegra@vger.kernel.org>; Fri, 12 Jun 2026 09:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781255602; cv=none; b=lcyYToAPcu1Z/VG3S4RiGqymOahMjCvA6sVhl/zVeycpyzrgwkekL2y7E17LsaXTAj5jBl8kj/TpmXueaE8ilUemaL9D5vu9dNSErh3h4Shf2QBz8zUDnZnk904jf4nLVuLzeVUocx4TWgUQkwapysYZXEbh9Z2a9BQtCVRffWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781255602; c=relaxed/simple;
	bh=Y9dUTCoTYnKLTmKuIOuA+rJ/lZUgJ+LD4vOVSi6eNQM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rc2nm5NZGWXNOoCJQdblMi7UVSJSx/DkYA2ASG+9qrljDD9L8Xcm5FQ+C1sxfSuJIAwHVt06OkQpih5zNHfDp4kqNh/cCclVELIE9BrNu7+A29Rfn3S0Gw83MqG4WNI8DdGiS10nAsv/s/XZOsHHwB40lw5DdtELR5PEDqu5hU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=15OXmydK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=9aZxwJeM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=yjO1bTF2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=X8eqOKx+; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="15OXmydK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="9aZxwJeM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="yjO1bTF2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="X8eqOKx+"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 98CD7759D0;
	Fri, 12 Jun 2026 09:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781255598; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HUBGKpvVFFKsulJGYMUMgai8gu/QgCMQk+8ulouLTS8=;
	b=15OXmydKXeGvGQy9ayL8cB2ZEdRu5qRyLQkwv828Ig85Ram6oY9sRzzTsjKfEp7WxRmyff
	zpLSLDenMh/qj2XkdbsKFyKz7B8lg217MGH5IybAzKSo9UrrzcLO9XTJs5+DJzvakNYUDb
	6085h+JAB/BKAdlhPQzGyrT1olJwTjE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781255598;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HUBGKpvVFFKsulJGYMUMgai8gu/QgCMQk+8ulouLTS8=;
	b=9aZxwJeMxgzH1DPgsvJ7KxtM3JHglb3JM3SZyUcwr0ViiG0VcdlHotoRzulIVkiRQGbosY
	Ua/gdoc5U/cBfWCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=yjO1bTF2;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=X8eqOKx+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1781255597; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HUBGKpvVFFKsulJGYMUMgai8gu/QgCMQk+8ulouLTS8=;
	b=yjO1bTF2lI/MZ7CbbtaiolI2aa76bmAFW3kkcWf7ZiNUEfRJsx5pN1DJaEMgXBRgVDNAIn
	Ec1cLA5hPcIdhWUDK9G1i+pLNdp9OcslLw2UYsW9gmE9/bd6bCmT8IQFBiLloXwk7VHFl2
	arD0KSgsTzqvLe5IFad4zaLCKsKl2D0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1781255597;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HUBGKpvVFFKsulJGYMUMgai8gu/QgCMQk+8ulouLTS8=;
	b=X8eqOKx+uqV1kIZyFiv1zUjI7yCrWEUoAJq15P63DdHXf2sRyfNSMFq9CNcZzlo7cJgH3V
	EVqdT0aQ30C61tBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4C0B4779A7;
	Fri, 12 Jun 2026 09:13:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EfIuEa3NK2occQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 12 Jun 2026 09:13:17 +0000
Date: Fri, 12 Jun 2026 11:13:16 +0200
Message-ID: <87ldcki0k3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	notify@kernel.org
Subject: Re: [PATCH RFC 0/4] ALSA: Consolidate CEA channel allocation data
In-Reply-To: <20260612-alsa-cea-channel-allocation-v1-0-b1bcbb6b1051@gmail.com>
References: <20260612-alsa-cea-channel-allocation-v1-0-b1bcbb6b1051@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 98CD7759D0
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org

On Fri, 12 Jun 2026 06:53:22 +0200,
Cássio Gabriel wrote:
> 
> HDA HDMI and Intel HDMI LPE maintain separate copies of the ordered
> CEA-861 channel allocation descriptors, ELD speaker expansion, and
> allocation selection logic. The Intel implementation originated from
> the HDA code, but the copies now differ in supported allocation ranges
> and fallback behavior.
> 
> Move the common data and transformations alongside the PCM DRM ELD
> helpers, then migrate both users while preserving their established
> behavior. HDA retains the complete CA range and channel-count fallback.
> Intel HDMI LPE retains its CA 0x1f limit, ELD speaker bits 0 through 6,
> and lack of fallback for incompatible ELD data.
> 
> The descriptors and their derived channel counts and speaker masks
> become compile-time constants. This removes duplicated mutable
> initialization and provides one authoritative allocation table without
> changing the existing allocation-selection policy.
> 
> No hardware was available to test this patch series.
> 
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
> ---
> Cássio Gabriel (4):
>       ALSA: pcm: Add common CEA channel allocation helpers
>       ALSA: hda: Make CEA channel allocation interfaces const
>       ALSA: hda: Use common CEA channel allocations
>       ALSA: x86: Use common CEA channel allocations

This looks like a nice cleanup.  There is similar code in
sound/soc/codecs/hdmi-codec.c, too.  Can we integrate it further in
future?


thanks,

Takashi
