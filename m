Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793974715;
	b=4PKEmcRYZLzTYjML2x6OsSLfoOhPgDUSGJg1T4SUwXLCIc/kphUASPJwx/LfhbZKAv8h
	 YA2GvUIHD3xTzt7lLt5Vy/ImilPkMOVZZ6R02Ga/U0cpjaOzf/MzEhlRE7WEcjuBXzTQI
	 9XevqeGhE4k1U39lv37EmJlNbvrO6X98HZ4tR7qBpkynTqI6x40x0Qh4OhQAZms9hjpVt
	 hi+AjQNIRi8+03dKIvxHJm7hsX2nhNOEw6+GYSY2u+BH1KFnBEY5BnXguFvhtawouHbxH
	 PqAD6/JGamUKWt8mB55x0Sd7qgEpY4XUiiTEpgAAAySkbDAtf1IdS6GMZV/sy50aTfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974715;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=7S+9RgY93JvfsmpfMt79G6lnT3XmXxLl1v05pwqLE8Y=;
	b=lrXaRuUHH/IDfMWfrl6j+Ultj3mn+r62yV6jxt30MKPevtxo2kAQeY+PIpiGcSZuKi6L
	 UtPkP66TLZez5q8a5rqls9nTlgsy6342Ey38FY3Fgaw/7y8XhE14XOxtFRT09MAsCLxE5
	 XH8dG/gStDpL7zVosVrJLVf8N5eW5ZCtJ720/JSKMBg+Mg0u721jX5WpR2GAH/xTFndaJ
	 HTGeH666VwnP+4gYxbv57k1j3fP4h9+unaqOnhBnCELJzJ6qRo/KVxXrnltIWOO2hr+k4
	 cskw3aiATNoCBLHfecvJb4dIB0jTSQiR1zu+tmCp3me75pZX43RUVoZY1/SrEnGrzuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=EsodKSgY;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="NA/Ksgji";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=EsodKSgY;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b="NA/Ksgji";
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792C1606EE84
	for <linux-tegra@vger.kernel.org>; Fri,  6 Nov 2026 14:18:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 792C1606EE84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=EsodKSgY;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=NA/Ksgji;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=EsodKSgY;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=NA/Ksgji
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CC4CE1F7F5;
	Fri,  6 Nov 2026 14:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793974705; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7S+9RgY93JvfsmpfMt79G6lnT3XmXxLl1v05pwqLE8Y=;
	b=EsodKSgYraLu/WdK9PxKiRL3p1/UgzUbYW+TlwZPukyoNoI5LhPrdFlSN3TWaeGowONLfh
	vzbG1pdrdKwQZsgPKvc26Gi6gkD/N3sbA7SotuOZGNiioY6CsNKxM/Avw5Jc4NgNQlv9pK
	sh9XctZ6f5oLHNsszrULmRP5DR13/Q8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793974705;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7S+9RgY93JvfsmpfMt79G6lnT3XmXxLl1v05pwqLE8Y=;
	b=NA/Ksgjic8y1YYWmVF2sihSmvOvow3yWKcwgM8PviZ/UWBX59oP70Eko+P0gqN7O1qMu9z
	b0/byRehdUGXKiBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793974705; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7S+9RgY93JvfsmpfMt79G6lnT3XmXxLl1v05pwqLE8Y=;
	b=EsodKSgYraLu/WdK9PxKiRL3p1/UgzUbYW+TlwZPukyoNoI5LhPrdFlSN3TWaeGowONLfh
	vzbG1pdrdKwQZsgPKvc26Gi6gkD/N3sbA7SotuOZGNiioY6CsNKxM/Avw5Jc4NgNQlv9pK
	sh9XctZ6f5oLHNsszrULmRP5DR13/Q8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793974705;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7S+9RgY93JvfsmpfMt79G6lnT3XmXxLl1v05pwqLE8Y=;
	b=NA/Ksgjic8y1YYWmVF2sihSmvOvow3yWKcwgM8PviZ/UWBX59oP70Eko+P0gqN7O1qMu9z
	b0/byRehdUGXKiBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 57696134F4;
	Fri,  6 Nov 2026 14:18:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id p/bcDbHh7WqFaAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 06 Nov 2026 14:18:25 +0000
Date: Fri, 06 Nov 2026 15:18:24 +0100
Message-ID: <87jymqoxfz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cen Zhang <zzzccc427@gmail.com>
Cc: perex@perex.cz,
	tiwai@suse.com,
	thierry.reding@kernel.org,
	jonathanh@nvidia.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	tiwai@suse.de,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com
Subject: Re: [PATCH v4 0/5] ALSA: hda: Wait for PCM files on codec teardown
In-Reply-To: <pm-pmb-a4703edca61d34aa679b-v12-b75145090f6bcd7cf145-0@gmail.com>
References: <pm-pmb-a4703edca61d34aa679b-v12-b75145090f6bcd7cf145-0@gmail.com>
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
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[perex.cz,suse.com,kernel.org,nvidia.com,vger.kernel.org,suse.de,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[11];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30

On Sat, 31 Oct 2026 06:14:25 +0100,
Cen Zhang wrote:
> 
> When an HD-audio codec is unbound while the card stays registered, the
> codec remove frees its PCMs while files can still use them, and the
> probe and remove of codecs on one bus can run at the same time.
> 
> Following Takashi's suggestion on v2, this version fixes both in the
> HD-audio layer: patch 1 serializes the codec probe and remove and the
> card registration on a bus, and patch 5 makes the codec teardown wait
> until the files opened on its PCMs are closed.
> 
> Patches 2 and 3 add the file to the card while the PCM minor is looked
> up, so that the wait does not miss an open between the lookup and
> snd_card_file_add(), and record the device a file was opened for. The
> teardown waits only for the files of its own PCMs, because the card
> files also include the control device, which a sound server keeps open
> for as long as it runs. Patch 4 makes an open fail once its PCM is
> disconnected, so that a late open does not get a working stream and
> hold off the teardown.
> 
> Cen Zhang (5):
>   ALSA: hda: Serialize codec probe and remove on the same bus
>   ALSA: core: Add the card file while looking up a minor
>   ALSA: pcm: Add the file to the card while looking up the minor
>   ALSA: pcm: Refuse to open a disconnected PCM
>   ALSA: hda: Wait for the files of the codec PCMs before freeing them

Since it's slightly intensive change, I applied to for-next branch
(i.e. for 7.5).


thanks,

Takashi
