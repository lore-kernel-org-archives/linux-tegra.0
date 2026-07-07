Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE99369D5B
	for <linux-tegra@vger.kernel.org>; Tue,  7 Jul 2026 15:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783436508; cv=none; b=OvCqLiCZR2Uac/e/oUci1DGTkb/UF2Uc9wy98rmOusJDtBYs+h9ECh48/YLHCrJ2xGJ3uZmYUn8MEbQDE+QvDusCXC5s1FgT8BrNVTdQwXibHCHejqkgCw0t6dcp11oxzRCa1aI4tl1Y2pYkGQZC0tX2HuKlvv8HD6EA5yAh0To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783436508; c=relaxed/simple;
	bh=9eKZTkFlUYkTAfdvOSFLJcZqVl5eQtDkopkEycmMNMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HQMo7Bt3043geSvS9ta4FPAmQABP2Tnu3k0EHkoosIYZv/tcxmXAjV3tWCEn0rQUAypTyZiBHkqhSE69Th0jT7roLnKX1+ylPkJizYU0HsXA0BvRtXJmsvOdBKwpm04N3zAbTW/YRsPIO+BiWkB4FbkrL+rwDQ27e0yS01AaNog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DroNPzNm; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=M6tkLx71; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DroNPzNm";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="M6tkLx71"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783436505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+FKq8JIf/PC7DPaxskAYH1TCfDD8k094qv4TPNK9Iks=;
	b=DroNPzNmEWhLC4IDSVMPnWJWbAEwY2zHj2Zsn0KgDwkfQazzhXToJTAFKrn83bmBEVDowj
	X6R9Lcye/j1e2zGxdvYDn1Zmsy4/3UnNY2EFEt8/hAjIW4XNNFQoP299Fod0b53NYbO2/H
	0mg2YsLQb1y+jdDcbundtFHDCEqvT/c=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-108-GsgsS9zmNVajQZFcvgRBOQ-1; Tue, 07 Jul 2026 11:01:44 -0400
X-MC-Unique: GsgsS9zmNVajQZFcvgRBOQ-1
X-Mimecast-MFC-AGG-ID: GsgsS9zmNVajQZFcvgRBOQ_1783436504
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-485ebc5706cso1202800b6e.0
        for <linux-tegra@vger.kernel.org>; Tue, 07 Jul 2026 08:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783436504; x=1784041304; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+FKq8JIf/PC7DPaxskAYH1TCfDD8k094qv4TPNK9Iks=;
        b=M6tkLx710gTjyXOlHg3LSkKxygiq+47Albzn7dx5+13bAqwnvsZ91/qFqPq7RVMmbN
         Dmk6JdIJa7o5cEtohNTzbOynMitl9zuO7v0L4sH8qtrSzmGyFv0DFIjpYz1ck3fB269X
         1HCMmiYSPNdo/BdCcahP9JWtv5p6hYxyvOjDnLolW8nnWfor8ahf03PTQ/eC5/9kxUbi
         ceYCKh/QNA44KpRlrA4lQXTEkCGVjGE/V11aLYJL1autEhYBKi/MCQV5zawGdSECMiOH
         vOxnOd9VYlFEm54BAMejO+M/IDVsx3Y0REGs3z4HJBUbXErkXdcuq2Te6T9ml5gSskjw
         aCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783436504; x=1784041304;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+FKq8JIf/PC7DPaxskAYH1TCfDD8k094qv4TPNK9Iks=;
        b=G3fuf2cOJ+SJ85kiCFveiITuO1KqdqnYRRvz+YgrBgwyujmXzpneyj3Mj6c8V96obC
         jVu2S17WfvZ8iacvDIitA3XK92YCkBq7/DUT9+oxMTBfG5HqpubaSDaaJxRx8pgrYy6q
         oDTSy+crF19oa2j0JAHFOO8kzdrjCqqn/bHaZLv0+PqRyL410RfRjPz+Y0LXV6xE8f0d
         WGxNfWnsMme8k7rWWpfQXKiSd/yD7x+FFIJ/VTnyjyzcDA9M4hsamSz+JjxPgTM1b4aG
         X3+XPN9gl8W1ibnMQDS9dlFSweyiOqvrjjxkmYVLv7eOimYDjb0M2dqbAWG471C3MmlF
         HCwA==
X-Forwarded-Encrypted: i=1; AFNElJ99xolW5srTdt/VDHu6yzNJc6XijqHMX7lqoB+YnHDxwPG1OHQtwRNa7VeaAymRAov90oRVaWKSgqUAKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRrGqzb6GddEPgduOZtAC5TOi/uKdt1fwfRJfHmItpj+bHdIsv
	tgqB3V4SiJQGSOa3Q/VxRK/+FZMGgB7T+SgsCMM8Y1p5ftVh3KEcpQJPF0R1CYV0jBZsHs7q4un
	GyXn+LVYMfHGn5P6GKhBnO5X5WWJBzCi+YkKSIl1N0+VMBIGpRKIOQd1CPNoXHoUqK0YsITI9
X-Gm-Gg: AfdE7cnxHVINzSo+F52BaXrXDdVF9hinWIxtIK8C87BYZfN19+AYD+ZgWm7/1EAPX1V
	G3IUI6MFfRPkdSeUEkMNe9MS1hHQW1vy9p8PVDDCwpzlj1A4fibIJCK65wgGB1Zk2ycGAWwKF+E
	25ag+0AD1Ny7vu+5bbcbr5UwKuLpnDUdON5+h2DDmCdCkWp8G2AOCgWbMMZZeK3sZRUBF2eLCQC
	teHD1HeVxwH3rh0WMhBr69G91cJ1oLAGw2fCsoGHDnzp3cxzbeufdtumWeVx+67PgXvFyx3Ca6k
	FpsGWbHgx00vURyAMv08pJjXpC+Pu2LKlA8EbgQXa1BpYaxvyVTgZ0p8q7m/DmzCRuro+xD8cHG
	uAlMQOg0C
X-Received: by 2002:a05:6808:c3f4:b0:486:caa4:ea44 with SMTP id 5614622812f47-4a07812f826mr2322306b6e.6.1783436502747;
        Tue, 07 Jul 2026 08:01:42 -0700 (PDT)
X-Received: by 2002:a05:6808:c3f4:b0:486:caa4:ea44 with SMTP id 5614622812f47-4a07812f826mr2322287b6e.6.1783436502199;
        Tue, 07 Jul 2026 08:01:42 -0700 (PDT)
Received: from redhat.com ([2600:382:850a:55b4:731e:b0d4:e0cc:410])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-44cfb5e6660sm13216001fac.15.2026.07.07.08.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 08:01:39 -0700 (PDT)
Date: Tue, 7 Jul 2026 11:01:36 -0400
From: Brian Masney <bmasney@redhat.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-tegra@vger.kernel.org,
	Timo Alho <talho@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH V2] clk: tegra: Support unique names for multi-socket
 platforms
Message-ID: <ak0U0HQG-jLlNF5J@redhat.com>
References: <20260602084334.350895-1-jonathanh@nvidia.com>
 <ah7F_QDw5hT2KdWB@orome>
 <f1be738e-25fd-4d4b-9854-cdf34412bcd0@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1be738e-25fd-4d4b-9854-cdf34412bcd0@nvidia.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

Hi Jon,

On Tue, Jul 07, 2026 at 07:28:38AM +0100, Jon Hunter wrote:
> On 02/06/2026 13:01, Thierry Reding wrote:
> > On Tue, Jun 02, 2026 at 09:43:34AM +0100, Jon Hunter wrote:
> > > On multi-socket platforms each socket has its own BPMP which exposes the
> > > same clock names. Fix this by using the NUMA ID as a prefix for the
> > > clock names on multi-socket platforms.
> > > 
> > > Use 'sizeof(info->name)' in the strscpy() and snprintf() functions to
> > > future proof against anyone changing the size of the 'name' array.
> > > 
> > > Co-developed-by: Timo Alho <talho@nvidia.com>
> > > Signed-off-by: Timo Alho <talho@nvidia.com>
> > > Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> > > ---
> > > Changes since V1:
> > > - Use NUMA ID as a prefix and not a suffix for the clock name.
> > > 
> > >   drivers/clk/tegra/clk-bpmp.c | 10 +++++++++-
> > >   1 file changed, 9 insertions(+), 1 deletion(-)
> > 
> > Reviewed-by: Thierry Reding <treding@nvidia.com>
> 
> 
> Please let me know if you have any comments on this or if this is OK to be
> picked up now?

I made a pull for Stephen last week for various clk patches that were
missed during the last merge window. I included your patch.

https://lore.kernel.org/linux-clk/akLzCVzbMbUsgDda@redhat.com/

I'm going to collect up stuff at rc6 this development cycle and assemble
another pull then.

Brian

