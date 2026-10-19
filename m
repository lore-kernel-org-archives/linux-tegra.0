Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FB745FFA8
	for <linux-tegra@vger.kernel.org>; Mon, 19 Oct 2026 08:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792399638; cv=none; b=HBl3pHEdPI2RfPDvIGPa/+q0o+uVSK8X1E8i2MU8rWoWqcH+l7P4i8p31P7Wu3EYydnGcvGd3zh0vfs33hgeyPpfT3OsfuxgBGyhs6j3ocIvMM6U0j1ah/ntNzXu9EIo9cUfAr86B1mCqv/j5a7jxX3q0Ie+m1IUic9tHGgUbvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792399638; c=relaxed/simple;
	bh=DcUe9IsmofiXAMZG6fZHBDln4Os4BoYcTTscDrnqzGk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C9mtD3DjFz9QatmdI3Q1zCPF7Wd5o+55IcHNAwYEFhSe5J0YZ3q+Y7fZHOI8YtbZXQ9+QIJ3mG49NRRoocg5+sYGqHk4Au19qGUn+9t4DBP7YBcWH9NQcPwkKww0Cg/a7p6CNFmlSr9UFgviAxHxC+vi1Gzb0lCgQxk1zmTrGVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YHhNQAGU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Pyp/7ov4; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=YHhNQAGU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Pyp/7ov4; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YHhNQAGU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Pyp/7ov4";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="YHhNQAGU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Pyp/7ov4"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 848CB1F79A;
	Mon, 19 Oct 2026 08:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792399627; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gHLSmA7VpQsCx8Al9pxjTgMv7IrJsmRb0gjmLUJNCS4=;
	b=YHhNQAGU3vpIwR6+nht7PBnuvYYt2BVmsatncL0m0/ouQnvehpsUrUMJlaKbhG6AOsZhIq
	Sx72f90f7/w5ZiI22De7dmNVU1rxlbMJyZFT2d+nJrn1UoSzq3COF8XCBf1xLKJyYYcyH2
	pQxqgEbZe16imXlhIP1JQWVGTBR4MJo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792399627;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gHLSmA7VpQsCx8Al9pxjTgMv7IrJsmRb0gjmLUJNCS4=;
	b=Pyp/7ov4nvJWeoiPhH2k98OMzBfVN3/yCWDbaEHLC7yRbHllxrXgm7ctw0CcJXkJKQh95L
	PbUo6VV23OXrzoBw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792399627; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gHLSmA7VpQsCx8Al9pxjTgMv7IrJsmRb0gjmLUJNCS4=;
	b=YHhNQAGU3vpIwR6+nht7PBnuvYYt2BVmsatncL0m0/ouQnvehpsUrUMJlaKbhG6AOsZhIq
	Sx72f90f7/w5ZiI22De7dmNVU1rxlbMJyZFT2d+nJrn1UoSzq3COF8XCBf1xLKJyYYcyH2
	pQxqgEbZe16imXlhIP1JQWVGTBR4MJo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792399627;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gHLSmA7VpQsCx8Al9pxjTgMv7IrJsmRb0gjmLUJNCS4=;
	b=Pyp/7ov4nvJWeoiPhH2k98OMzBfVN3/yCWDbaEHLC7yRbHllxrXgm7ctw0CcJXkJKQh95L
	PbUo6VV23OXrzoBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2E3EA136CC;
	Mon, 19 Oct 2026 08:47:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id n0gDOwrZ1WobdQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 19 Oct 2026 08:47:07 +0000
Date: Mon, 19 Oct 2026 10:47:06 +0200
Message-ID: <87ecdmaxh1.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: webgeek1234@gmail.com
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-sound@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/hdmi: Enable HBR capability
In-Reply-To: <20261018-tegra-hda-hbr-v1-1-b8bb1f1d8d15@gmail.com>
References: <20261018-tegra-hda-hbr-v1-1-b8bb1f1d8d15@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[8];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO

On Mon, 19 Oct 2026 04:16:31 +0200,
Aaron Kling via B4 Relay wrote:
> 
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> Tegra HDA does not set the HBR capability bit, however every SoC since
> Tegra114 does support HBR. Override the hbr setup function for these
> SoCs to unconditionally enable the feature. Since Tegra30 does not
> support HBR, this function will report invalid on that SoC.
> 
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
> Before this, any attempt to open an hbr stream resulted in a rejection
> on Tegra hardware. Looking at the downstream support, that just bypassed
> the capbility check for all supported Tegra hardware in the common code.
> This replicates that in a driver specific hook.
> 
> This has been tested on a SHIELD TV 2019 Pro trying to bitstream an
> Atmos demo video. It attempts to play, but mostly just underruns the
> entire time, with a few spurts of correct noise. My expectation is that
> issue is userspace, since that is a WIP android audio hal. But even if
> there are more kernel problems, this should be correct as a standalone
> change.
> ---
>  sound/hda/codecs/hdmi/tegrahdmi.c | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/sound/hda/codecs/hdmi/tegrahdmi.c b/sound/hda/codecs/hdmi/tegrahdmi.c
> index ebb6410a48313..c4d8d8a570542 100644
> --- a/sound/hda/codecs/hdmi/tegrahdmi.c
> +++ b/sound/hda/codecs/hdmi/tegrahdmi.c
> @@ -227,6 +227,41 @@ static int nvhdmi_chmap_validate(struct hdac_chmap *chmap,
>  	return 0;
>  }
>  
> +static int tegrahdmi_pin_hbr_setup(struct hda_codec *codec, hda_nid_t pin_nid,
> +				   int dev_id, bool hbr)
> +{
> +	int pinctl, new_pinctl;
> +
> +	// Tegra 3 does not support HBR
> +	if (codec->core.vendor_id == 0x10de0020)
> +		return -EINVAL;

I guess this will break the HDMI on old Tegra.

Better to enable pin_hbr_setup conditionally for newer chips below, so
that the older chip continues to work without HBR.

> +	spec->ops.pin_hbr_setup = tegrahdmi_pin_hbr_setup;


thanks,

Takashi
