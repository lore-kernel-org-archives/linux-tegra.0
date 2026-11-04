Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793803346;
	b=37yf3OerNLwa0ynK7ucjsxDycUcrSa3AT2/w/0HLqPFVsiZqX493sjXhem6iDbqqnoVi
	 THioEar5jmnn6794PFK6WgLQCHHGlM4TbxGFwUPbT3byspEPds7v8RFzXBbkQVDDBD71v
	 Ye2V30KkgEUNDsQDYGboi5OQuGDY1Bg9EovuoZWVjbKJxzkPPuBtdPkVJrgDcFobtvnVi
	 l/9nyw6swb5lH/kbGMyQJ/9L8kMhMhyW2F4E0OInpBr+fXopDgE0PjZAR6k3INs30EbBd
	 +gX8cOvcK9yISqtOV/sxcR5xFCFlPigY5X75E3KbOANWLrW7Q0oUvt3C3Lq0h+R/YiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793803346;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=8ARMFZxNNi/buQN4eiuPsPm4c2kwN+KPdTFFG4SxMNo=;
	b=YwACSPw2pZO6pgd8KVp7QhKKGSi1k3rmMuOPrfPQBnTobb9AOvJMTObLv9cAwZsgqXoD
	 q2JKq/Uk+UIi5E6M+IZPSieTv82dLcDjSrTJWORkBx70VZrAqGQGJBnebiDa+e20zq37/
	 scpovIjll/7NZHwxEdK3w3tPtGwNmyEHxUpnjGffRrZP0SZvSh14jPjybHawO8H6TVzV+
	 q08mQvunkIQrQVpCL/MzTPotwLYKlQWQ6MCowoA8siYOdV6jO4JBYLLkgwAgDT0VuODPA
	 EmFnBL3yiPH6W1pwPrz55Rl8b25Q5ZeK10VjPKeHDhDWz8lyuzgFERZ2TDTjyYI3P/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=pLADRu9y;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=KG8y44Va;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=pLADRu9y;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=KG8y44Va;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C8F606A31B;
	Wed,  4 Nov 2026 14:42:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28C8F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=pLADRu9y;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=KG8y44Va;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=pLADRu9y;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=KG8y44Va
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5D7011F790;
	Wed,  4 Nov 2026 14:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793803344; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8ARMFZxNNi/buQN4eiuPsPm4c2kwN+KPdTFFG4SxMNo=;
	b=pLADRu9y5XZHglg7L1gBYy0heMvqKWsKruEjleINHaxZ+jKVxqIlHnR/QbGm5bV44raBoo
	PKnK3JQ4c/IrTaEK05yww8V30a6Yt4olT8ejHln9Zfat0XC1jThUQPKSqn6lJ4i7rc8Sg3
	+30XxotSarPlqDOyRFnhzyRch3quB4A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793803344;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8ARMFZxNNi/buQN4eiuPsPm4c2kwN+KPdTFFG4SxMNo=;
	b=KG8y44VaXrJYQKLC/qdOhIppADF02iI2eitqj2Byb4ncHpF38bHAQ5DU5KPT+vdmOPKGsR
	npjKVXmAk1xi4tDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793803344; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8ARMFZxNNi/buQN4eiuPsPm4c2kwN+KPdTFFG4SxMNo=;
	b=pLADRu9y5XZHglg7L1gBYy0heMvqKWsKruEjleINHaxZ+jKVxqIlHnR/QbGm5bV44raBoo
	PKnK3JQ4c/IrTaEK05yww8V30a6Yt4olT8ejHln9Zfat0XC1jThUQPKSqn6lJ4i7rc8Sg3
	+30XxotSarPlqDOyRFnhzyRch3quB4A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793803344;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8ARMFZxNNi/buQN4eiuPsPm4c2kwN+KPdTFFG4SxMNo=;
	b=KG8y44VaXrJYQKLC/qdOhIppADF02iI2eitqj2Byb4ncHpF38bHAQ5DU5KPT+vdmOPKGsR
	npjKVXmAk1xi4tDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DDC62134F0;
	Wed,  4 Nov 2026 14:42:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FmnmLE9E62oifAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 04 Nov 2026 14:42:23 +0000
Date: Wed, 04 Nov 2026 15:42:23 +0100
Message-ID: <87y0b8u08g.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Sheetal <sheetal@nvidia.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter
	<jonathanh@nvidia.com>,
	Mohan Kumar <mkumard@nvidia.com>,
	Sameer Pujar
	<spujar@nvidia.com>,
	<linux-sound@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	"Anupama Kunkulagunta" <akunkulagunt@nvidia.com>
Subject: Re: [PATCH] ALSA: hda/tegra: Add Tegra268 HDMI/DP codec ID
In-Reply-To: <20261104102955.1089991-1-sheetal@nvidia.com>
References: <20261104102955.1089991-1-sheetal@nvidia.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,nvidia.com:email]
X-Spam-Score: -12.30

On Wed, 04 Nov 2026 11:29:55 +0100,
Sheetal wrote:
> 
> From: Anupama Kunkulagunta <akunkulagunt@nvidia.com>
> 
> The Tegra268 HDMI/DP HDA codec reports codec ID 0x10de0037, which is
> not present in the Tegra HDMI codec driver's device table. Add this
> ID so the driver can bind to the Tegra268 codec.
> 
> Tegra268 uses the same HDMI/DP codec programming model as Tegra234.
> Reuse MODEL_TEGRA234 to enable DP MST, dynamic pin output assignment
> and HDMI interrupt trigger control for Tegra268.
> 
> Signed-off-by: Anupama Kunkulagunta <akunkulagunt@nvidia.com>
> Signed-off-by: Sheetal <sheetal@nvidia.com>

Applied now.  Thanks.


Takashi
