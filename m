Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5E332D0DE
	for <linux-tegra@vger.kernel.org>; Thu, 20 Nov 2025 10:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763634752; cv=none; b=pbKyb3Brg++9p/u38m+HJOJHJtDGul/XRmUUBYaICtQr1wYpib2PHTyA/cRsI3cu0+3y353pVTqdvgCHYFc1PhG+9kG936AivhBZ4CVuFtSD5q+hUpBoMj+QMph2sJqGr2yXFx8bP0peLeAdKAgvWegCNDEogv52evxI5W+6cuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763634752; c=relaxed/simple;
	bh=tNSg8aCD6nZhbYliPcq+yjGCd2mcFdjJC8MiT7RY128=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aJxniQZnjSdCHToGEAeDjNofTFuaffY4DH+VXRK3dIP15M12nQcOiuadvXT++yF/qOVWyP3etoYB3XXPbCG8cWcF1KIhkoqvkYKf/8BK2DIlLlpc5lXx8Zy4i+MWlRzDKwdT5HFQ81SXyosrx/pw7rZfrOPsv/DGRUB2R74vNYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fI0flkrf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=08bR0/lq; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fI0flkrf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=08bR0/lq; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fI0flkrf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="08bR0/lq";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fI0flkrf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="08bR0/lq"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0E911209BA;
	Thu, 20 Nov 2025 10:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763634749; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k8eHdVDqFsUecB9quEOdMDvlgDb++nIgrYxStlYj8a4=;
	b=fI0flkrfILFoGqGCmrL+hhByQs1EnB/Af6T0/+jwe6UrU53WAZoUDbUrKeqtM7HNb8dyFL
	c/pmh6jEcQZqud2F/yL1KRugfwV/rkccc8AxhBZFaY2jBM6cUWF5oVVKShXpikgcIRdwSJ
	/8D5A9BqpkeuF3wzi5TyQ9VTYx0ZceY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763634749;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k8eHdVDqFsUecB9quEOdMDvlgDb++nIgrYxStlYj8a4=;
	b=08bR0/lqWXzp5rHNgUoNiighTAupKsbWenty5Rm91/5HO5X2iuQXaMN11DZb4dqRYnwOwE
	4u9pA5EfTVkACeDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1763634749; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k8eHdVDqFsUecB9quEOdMDvlgDb++nIgrYxStlYj8a4=;
	b=fI0flkrfILFoGqGCmrL+hhByQs1EnB/Af6T0/+jwe6UrU53WAZoUDbUrKeqtM7HNb8dyFL
	c/pmh6jEcQZqud2F/yL1KRugfwV/rkccc8AxhBZFaY2jBM6cUWF5oVVKShXpikgcIRdwSJ
	/8D5A9BqpkeuF3wzi5TyQ9VTYx0ZceY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1763634749;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k8eHdVDqFsUecB9quEOdMDvlgDb++nIgrYxStlYj8a4=;
	b=08bR0/lqWXzp5rHNgUoNiighTAupKsbWenty5Rm91/5HO5X2iuQXaMN11DZb4dqRYnwOwE
	4u9pA5EfTVkACeDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 351413EA61;
	Thu, 20 Nov 2025 10:32:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id y1vJAzzuHmmHXwAAD6G6ig
	(envelope-from <svarbanov@suse.de>); Thu, 20 Nov 2025 10:32:28 +0000
Message-ID: <ee9809e3-58e5-4a40-8c77-a8115f11c1d1@suse.de>
Date: Thu, 20 Nov 2025 12:32:23 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/2] soc/tegra: pmc: don't fail if "aotag" is not
 present
To: Jon Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 Prathamesh Shete <pshete@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>
References: <20251119093729.441654-1-jonathanh@nvidia.com>
 <20251119093729.441654-2-jonathanh@nvidia.com>
Content-Language: en-US
From: Stanimir Varbanov <svarbanov@suse.de>
In-Reply-To: <20251119093729.441654-2-jonathanh@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.994];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[dt];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[nvidia.com,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid,nvidia.com:email]
X-Spam-Flag: NO
X-Spam-Score: -4.30

Hi Jon,

On 11/19/25 11:37 AM, Jon Hunter wrote:
> From: Prathamesh Shete <pshete@nvidia.com>
> 
> The "aotog" is an optional aperture, so if that aperture is not defined
> for a given device, then initialise the 'aotag' pointer to NULL instead
> of returning an error. Note that the PMC driver will not use 'aotag'
> pointer if initialised to NULL.
> 
> Co-developed-by: Shardar Mohammed <smohammed@nvidia.com>
> Signed-off-by: Shardar Mohammed <smohammed@nvidia.com>
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> Changes since V2:
> - None
> 
>  drivers/soc/tegra/pmc.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)

Reviewed-by: Stanimir Varbanov <svarbanov@suse.de>
Tested-by: Stanimir Varbanov <svarbanov@suse.de>

~Stan
