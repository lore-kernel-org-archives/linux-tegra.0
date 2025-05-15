Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0A72101AE
	for <linux-tegra@vger.kernel.org>; Thu, 15 May 2025 10:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747306095; cv=none; b=cUm5QkP5jNOn/S9T28D4R0q60RzQtQtJty24/IrO29eNZCOFMSDGt+6h2MxyWCqvyLBcvAgUm5UcSXgvz5fFU7+F752cb5fX3XmyjivEQ06UyKWebci3vEdqe2Y8tMFyu+qGjTl5rYGpb2L5fbaoOaK8SNzvPOhUDbW+yRCBnfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747306095; c=relaxed/simple;
	bh=HSHAc1esZ7JGsghsuy8H2Bqb4SKoBoPV4DVt5e5AQzY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tsxihwP/1C9m1HN2oRg7EexrclmUbrPqds+r8+LunGDtWK31PyLXXZ8tzJtv8z7E6ccgzoGp4nq5r3eaR5HBDD7tUmcBQCvueceNDpg0OzfWYC5vLsmd6miMcBJKg++58W2Zs0uFQHeiJxYHjbEFCerxLyMKqb9BURK2/ffZclY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=W19INCcK; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=r1ZTN2ys; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=zLyRDf5b; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=lkp2QJLL; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="W19INCcK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="r1ZTN2ys";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="zLyRDf5b";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="lkp2QJLL"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8E659211EB;
	Thu, 15 May 2025 10:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747306091; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HxihgeIkFF/rHdS4s6GW49xNqzW9yrSrX50YJnkKkME=;
	b=W19INCcKMU0cm1jbKIcq3MNJwuidUTyN6mqfMl4C4sHfkDXbIDop1030mBRAVj+kWEQREt
	UlP2HALnjEmIObe3G1opjfrKaUM3rdy5srgBXoOVaR/GVwPPGeDUjV20fsPTNwyujEwtIm
	GJMGb0VgpxO9eB93YxQa6u18WwN+OGg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747306091;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HxihgeIkFF/rHdS4s6GW49xNqzW9yrSrX50YJnkKkME=;
	b=r1ZTN2ysZtn+sQTHBpO2VA81MsO4mL2VZ5KYluF+/HzOb8P8mEL8QR7MwaR3o8RYgtlT6c
	qqITH2vUydsrdbBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=zLyRDf5b;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=lkp2QJLL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747306090; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HxihgeIkFF/rHdS4s6GW49xNqzW9yrSrX50YJnkKkME=;
	b=zLyRDf5barxYam1WigUEvSI4oBX5+kb04uTjPyO3LkFBt6gcc36dNuxDym7d4aP0QqXchs
	30X+tixwai45imR5yoKXdwoW2GMmuwcNY2zJ6ag208/vqkXUTS49ODVeuZ6AsLKXLFFxjG
	MBkY1kJWSdAqJ1V42QEpVr4xhytJ9c8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747306090;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HxihgeIkFF/rHdS4s6GW49xNqzW9yrSrX50YJnkKkME=;
	b=lkp2QJLLaQ7SBT8+8MqXoC9dcranJYUti3dAGzkSUYYuyZNd6CgPbDdD+IdElLE/MRXPWe
	J5ksK9zkW+nkavBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2A3B8137E8;
	Thu, 15 May 2025 10:48:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +igNCWrGJWjRZwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 15 May 2025 10:48:10 +0000
Date: Thu, 15 May 2025 12:48:09 +0200
Message-ID: <87msbervyu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Sheetal ." <sheetal@nvidia.com>
Cc: <lgirdwood@gmail.com>,
	<broonie@kernel.org>,
	<robh@kernel.org>,
	<krzk+dt@kernel.org>,
	<conor+dt@kernel.org>,
	<linux-sound@vger.kernel.org>,
	<devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>,
	<thierry.reding@gmail.com>,
	<jonathanh@nvidia.com>,
	<perex@perex.cz>,
	<tiwai@suse.com>
Subject: Re: [PATCH 0/2] HDA: Add Tegra264 support
In-Reply-To: <20250512064258.1028331-1-sheetal@nvidia.com>
References: <20250512064258.1028331-1-sheetal@nvidia.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 8E659211EB
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
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
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,nvidia.com,perex.cz,suse.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	DKIM_TRACE(0.00)[suse.de:+];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,nvidia.com:email]
X-Spam-Score: -2.01

On Mon, 12 May 2025 08:42:55 +0200,
Sheetal . wrote:
> 
> From: Sheetal <sheetal@nvidia.com>
> 
> The patch series is to add support for Tegra264 in HDA driver.
> 
> Mohan Kumar D (1):
>   ALSA: hda/tegra: Add Tegra264 support
> 
> Sheetal (2):
>   dt-bindings: hda: Update Tegra compatible requirements
>   dt-bindings: Document Tegra264 HDA Support

Applied all patches now to for-next branch.


thanks,

Takashi
