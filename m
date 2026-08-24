Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CED35BDD5
	for <linux-tegra@vger.kernel.org>; Mon, 24 Aug 2026 15:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787584574; cv=none; b=fLojM8BMVmcreNzajUK9fn+UC3xJYKniyNxR+UrOCwrDbjIcUliXG8w5OMafPgFncSD4Hf4ScvJSyTW6Z3WINmaJ4aQGB9i5XBb7rEwDbfYe59AYS6V3/tMRiukk4g58uV1Y/G/eA3HK1x5Z6asYFwIQynIit5/O7lFgBetjjt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787584574; c=relaxed/simple;
	bh=6bkublHg1xrci+nJCRQzK3DlrDkjAVx27Om/QoC/B2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dVlas4aFpZMOapWE6MRMTLMRkARSr07xo/hojN4OBZYzfxtjeSmq0baHC3gqwninPTxnqYHlfQFUScSY3p0LUibyoH6szCdGm3n9m0JiXJYdZL7p9rcr8SnkJNOj4s8xW47c3zutQk65/F/mGAACs4BR7cTzh8hUVeVbqzhbS1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H+keKXBE; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=rmhqGAZQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H+keKXBE";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="rmhqGAZQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787584571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lwN1IBw6ISFUhBtlLGpwjjwq2qTPw+f0zNub19DhCGI=;
	b=H+keKXBEf3cpapo+if/3cZsXtTbODaE5/+atLhBJ1DCGEPRSrcxixX4ZwltaLBXJCopmbg
	o7qyk3DWbQTYCCGspn1oXwzIHKnk23E3R1UPhQPqQeyw6ELK3QKnkwtjXfYwMoPVCRExSY
	9JmhLkYWIoju4WIomF1j7UX2cAFCRCc=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-nMwbJqQTPJSdxTCNlSsGKg-1; Mon, 24 Aug 2026 11:16:10 -0400
X-MC-Unique: nMwbJqQTPJSdxTCNlSsGKg-1
X-Mimecast-MFC-AGG-ID: nMwbJqQTPJSdxTCNlSsGKg_1787584570
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52d7b3adda4so37824261cf.3
        for <linux-tegra@vger.kernel.org>; Mon, 24 Aug 2026 08:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787584570; x=1788189370; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lwN1IBw6ISFUhBtlLGpwjjwq2qTPw+f0zNub19DhCGI=;
        b=rmhqGAZQOH9nbZD3sf+zB628Ap2VMWSkxVMlJvlgidQsbqCteBIiUzDhdk09D5v81W
         lABBWPNSr5zpAQwC/fIMvMRFba1HxOo5gLXtum5dRr1GlBGd2l6urvx8/K66LK1tgUGw
         ElkIMZz6TnYUaVg/U1jl5Vrb8P1W3/wsOw+v8WIjBgXMdlMsoyJxk/Gg6pmBEd7K9063
         0Sz7MsNyTxmASen14Feelr/gj9ouqnbiPDm91hwJdpDx0klEmXr3Pasa1Vh0Yf+jpMFX
         r4GoVWikCnLke23Rc4Us7bgp+oavrKVdVnipy9twmpFepFn9C0svz/nyHehUXm4Z3U3x
         kiOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584570; x=1788189370;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lwN1IBw6ISFUhBtlLGpwjjwq2qTPw+f0zNub19DhCGI=;
        b=ia3lwejrFolHq/rIiCc8HdlOgI8pAZoiE2/pi3D1BY3HBxzNrTCmTEbBhHXuMecXLg
         NhNd+3pGWkNhkSD8KXuUdQW6BaXUXXTEp8ROe1ECfM/Ah+Edh2Bsvv1x2A9sxVKVf0aC
         GgsiCzbQXRV2WDUZc5Aa/7DADsotKYn7/LYEWCSG35rzo9CIuns0YZXXheUElhE7NStP
         okRSFwKsVxgB1y9sf/SxzYydj7FRRm87Q0lkEOy+n2y22ieBjhs6jWzBFLm7vfX/n/a4
         MXYyTgSyi3a2z9iqr+1sjr/a4HewHuhyBaIBIY6z8tltgSY9CE84WSpcuYhsHkbUe/K8
         UY7A==
X-Forwarded-Encrypted: i=1; AHgh+RojH3gaCpqpuMnF1iatuLut1OTjpAtI4g1rqRmnLnmI2oh6tquZSRh0/qpDVl9EDxsvNECPMcbvDzA20A==@vger.kernel.org
X-Gm-Message-State: AFuF++kn0OCUqCFEGfbLJVPuPpQ0JsYCn4SfYwJIhpn/pgaJJcAAkrHV
	PdVkxM5t/5lBoYVAjK4UjaGZcAWVtzJgZFzEn8es1xWnMRXbbfJnajFn6IuMvnYokWmrfqSdY2s
	UIWsGRZS6WXppufl9H66i9QTtmxSon7N0zmrIt3knXAR2FkQNrwMk7F/I8FbIVq1G
X-Gm-Gg: AR+sD11XZRnQ7+MkcgEA1RzkdgoTRlWCCX5BcKkxEqAcTOk1A3SR7tO8E7Xq+AC4kp8
	EK8/oPLFYhrsFjvujQi9bkKpFGShA536yg4eiC2sc1ezMlnegZrJ6q2JhH5rULdc06P9haVVYY1
	HuoK74JpUAyZ2/OL8VwvAzQ0+8G3zT/lqsRAwo3Dlu6V207o+FLMOwUyakf4tXwkvNpwwHVicQW
	VmhozrfbUeUR6uQgKcxPWB83zOTMXItVxDrRWbNk9HVyxeuTXe5BYFHB1mXQAwDNZg2OwHFEGcP
	uz1GjDNLccg++aLB6E+Wjt5Azv/032xZsICyTgfzWORijNItVHYJFE8sbW3EsMbGmV30su8iyFv
	Zl8BWpn/pCPdPAZPNphe9YQwA/641tFrBnCY=
X-Received: by 2002:a05:622a:1249:b0:528:a8c:aa00 with SMTP id d75a77b69052e-52df56e1163mr279729961cf.8.1787584569735;
        Mon, 24 Aug 2026 08:16:09 -0700 (PDT)
X-Received: by 2002:a05:622a:1249:b0:528:a8c:aa00 with SMTP id d75a77b69052e-52df56e1163mr279728951cf.8.1787584569268;
        Mon, 24 Aug 2026 08:16:09 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c93a4c1a1sm63772856d6.34.2026.08.24.08.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:16:05 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:16:03 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/tegra: Make sure clk_init_data is fully
 initialized
Message-ID: <aoxgM9vY01nLeX_f@redhat.com>
References: <cover.1787239944.git.geert+renesas@glider.be>
 <9bc5029f7ad84b0b1e02be231a5abd7e5fa03946.1787239944.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9bc5029f7ad84b0b1e02be231a5abd7e5fa03946.1787239944.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Fri, Aug 21, 2026 at 12:03:03PM +0200, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <bmasney@redhat.com>

