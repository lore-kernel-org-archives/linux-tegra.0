Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843E2225419;
	Thu,  6 Feb 2025 07:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738828654; cv=none; b=e5qC9/yFSElxVcCL7YDTVURO0EUoO2RwNcinn8J072MKbzmdhRiiC+QCCS64q+3i61RErtpOmEExpxUwybcESOCDC7R4VnOel10XhomjQpefpLhS9P31qKr4/CFpvxYDAxVBKArvEEJ/9tckHq0kZkhZVq/G06YohM1Q5GthD38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738828654; c=relaxed/simple;
	bh=39lJj/rYaa6b4DYxpGmi+0oPY1rIW/US0+1a1DLMoSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q9Sa4LxpZmVYHFLHq9Xmg9CZdWpnCjvy0Z8tmaCA71gB/+1f9HdicUevptqi9KqXspCEu0LvW09c6UMaxkFoeo19dabX3MAGK64JRYmgDfUrdfOlS4ShzkXGz+joHMxzRMG51TeTX6DDsXk3DtNaSwVqHLAfs3kwmAaOGTIO3GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1txTOlkC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=86WS+XUc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1txTOlkC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=86WS+XUc; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1txTOlkC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="86WS+XUc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1txTOlkC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="86WS+XUc"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B1CA721161;
	Thu,  6 Feb 2025 07:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738828649; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KDYCmBOGb4xTAklwCidsim6czDQYd5zcQdD1tQKuGyU=;
	b=1txTOlkCv21S2vTjLJ68cZxl4jsQ9ELFo/3lM7aE8z9MUmN/ZfUvuFHosGpCWUYqa3ZfYZ
	9OAk/1R5sB6jCPKj4lheu+LybPTLxbeOLNccjYC19a9Jg3HcywlKiOKoGbz+Ws77xJqFWl
	JgtWjDEzXQc3tBDjKMZjxUeug3yIoQM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738828649;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KDYCmBOGb4xTAklwCidsim6czDQYd5zcQdD1tQKuGyU=;
	b=86WS+XUcHnvTFYUQUcShqzKdwDJyOWE7MEKQ9TG8amX86ECJ8RUpO/X14DKvP0q3yTgmqA
	CkcRsjz1W4Fxd9Bw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738828649; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KDYCmBOGb4xTAklwCidsim6czDQYd5zcQdD1tQKuGyU=;
	b=1txTOlkCv21S2vTjLJ68cZxl4jsQ9ELFo/3lM7aE8z9MUmN/ZfUvuFHosGpCWUYqa3ZfYZ
	9OAk/1R5sB6jCPKj4lheu+LybPTLxbeOLNccjYC19a9Jg3HcywlKiOKoGbz+Ws77xJqFWl
	JgtWjDEzXQc3tBDjKMZjxUeug3yIoQM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738828649;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KDYCmBOGb4xTAklwCidsim6czDQYd5zcQdD1tQKuGyU=;
	b=86WS+XUcHnvTFYUQUcShqzKdwDJyOWE7MEKQ9TG8amX86ECJ8RUpO/X14DKvP0q3yTgmqA
	CkcRsjz1W4Fxd9Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 63B8513697;
	Thu,  6 Feb 2025 07:57:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id oE1eFmhrpGcBKgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 06 Feb 2025 07:57:28 +0000
Message-ID: <73bad044-f5fc-40ea-9e32-571912573a5f@suse.de>
Date: Thu, 6 Feb 2025 08:57:10 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/12] Documentation: Update the todo
To: Anusha Srivatsa <asrivats@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrew Jeffery
 <andrew@codeconstruct.com.au>, Stefan Agner <stefan@agner.ch>,
 Alison Wang <alison.wang@nxp.com>, Xinliang Liu <xinliang.liu@linaro.org>,
 Tian Tao <tiantao6@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu
 <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Marek Vasut <marex@denx.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Alain Volmat
 <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-aspeed@lists.ozlabs.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20250205-mem-cocci-newapi-v1-0-aebf2b0e2300@redhat.com>
 <20250205-mem-cocci-newapi-v1-12-aebf2b0e2300@redhat.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20250205-mem-cocci-newapi-v1-12-aebf2b0e2300@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -2.80
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.998];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[redhat.com,jms.id.au,linux.intel.com,kernel.org,gmail.com,ffwll.ch,codeconstruct.com.au,agner.ch,nxp.com,linaro.org,hisilicon.com,google.com,pengutronix.de,collabora.com,denx.de,rock-chips.com,sntech.de,linux.alibaba.com,foss.st.com,nvidia.com,synopsys.com,raspberrypi.com,igalia.com,lwn.net];
	TAGGED_RCPT(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[55];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[]
X-Spam-Flag: NO
X-Spam-Level: 

Hi


Am 05.02.25 um 21:08 schrieb Anusha Srivatsa:
> Update the Documentation to be more precise.
>
> v2: Update for clarity
>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
>   Documentation/gpu/todo.rst | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 256d0d1cb2164bd94f9b610a751b907834d96a21..03fcd086889acbd1294669b260292ffc79e97e2f 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -441,13 +441,13 @@ Contact: Thomas Zimmermann <tzimmermann@suse.de>
>   
>   Level: Intermediate
>   
> -Request memory regions in all drivers
> --------------------------------------
> +Request memory regions in all fbdev drivers
> +--------------------------------------------
>   
> -Go through all drivers and add code to request the memory regions that the
> -driver uses. This requires adding calls to request_mem_region(),
> -pci_request_region() or similar functions. Use helpers for managed cleanup
> -where possible.
> +Old/ancient fbdev drivers do not request their memory properly.
> +Go through these drivers and add code to request the memory regions that the
> +driver uses. Problematic areas include hardware that has exclusive ranges like
> +VGA. VGA16fb does not request the range as it is expected.

I'd keep both, old and new text, and turn them into a single paragraph. 
The old text explains what to do and the new text gives examples.

Best regards
Thomas

>   
>   Drivers are pretty bad at doing this and there used to be conflicts among
>   DRM and fbdev drivers. Still, it's the correct thing to do.
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)

