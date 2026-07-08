Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FE243710B
	for <linux-tegra@vger.kernel.org>; Wed,  8 Jul 2026 16:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783528917; cv=none; b=BsDfEVMBLAMoZV0Y5v+dJxVbbz867D2GmEMydRHSUzts/FQVm/10mOP5ssk9h4Nd2EWMcdsrog4nMBZ2t5gxStozoJYHq2te+ojhXSPfa6W1GIPLzQLwJ1jDD7SKcsGDFEJHxXX9Yt4XgtDEn7oPbFX8VB7iVwbwPM7h1OV4LEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783528917; c=relaxed/simple;
	bh=hxJeTTJpCgngpttgBKLmH7ptP6ELM2r7kNGcEsfXpko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PoI0t2bFdF1Wyg0nL3ur+JUi8zAMdAbbB2qsSTJty8ZNKENqILPvhkcuDzhuiclfHkkg2tqEpxhszWZby0aJDFgGjXJGAqrZt9dNpjJKH6fdSw2djOBNa0QmDzW9n+ymV1I3BWsQRrVZJj0Z4I9AJp7x8W+bbfxXl3Xwe4eTOQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SbCly8Jc; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=klTcNqng; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SbCly8Jc";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="klTcNqng"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783528912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KeN+eUGcS7y43ntst2e5pfjhEcVMN4wZLhE8yfU/Pkc=;
	b=SbCly8Jcz7CsAGIkkhNDDOYapG4eKnngeTw1HENSCWE/nO2SFisGsPeorTWdC9uiV+kIZy
	RcWVAwp3kxCmgOuohF75S771E/X+RfgSkhzGeybMFm+LRbLjKmHo4R9ZbNl9pG8wYJbMjU
	qnJg31weL8foaouLJtCza2a13/CU5x0=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-xJb2dWKQNamN6PJrE2VmdQ-1; Wed, 08 Jul 2026 12:41:51 -0400
X-MC-Unique: xJb2dWKQNamN6PJrE2VmdQ-1
X-Mimecast-MFC-AGG-ID: xJb2dWKQNamN6PJrE2VmdQ_1783528911
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c2af04aeeso740561cf.0
        for <linux-tegra@vger.kernel.org>; Wed, 08 Jul 2026 09:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783528911; x=1784133711; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KeN+eUGcS7y43ntst2e5pfjhEcVMN4wZLhE8yfU/Pkc=;
        b=klTcNqng2n3y589/zhRXCK9iucBkPG1i/Gos/foP6On4pSkdRuMZTY2acTb7lFQrKW
         Xcb+x1zRSKoth2qwBRsQ+xnyEOLqoOd5pIDKPY+cHJoFq35FKCl0/DNFNFXaySWMwnxh
         1eN8nZD/3UZH4Yyhv+bzvuukTvm0xetO2KpdINBQ5WmfSd+9ymzqHC5cu1y+GF8pXFh1
         Ua0b7kY47FEzZgV929s1EGqGPMCWLmY8DmYQGW/6Dk2ia2Gn7lEm1BeJY3XrsZeKp9Bi
         oSplTPy1obMOiZMg80LFMfvPWtdpnuIQQ7M9LsHACM4ibvXYV8m2aplVSRPniT3d+W6T
         KBtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783528911; x=1784133711;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KeN+eUGcS7y43ntst2e5pfjhEcVMN4wZLhE8yfU/Pkc=;
        b=htAMcXR3SgRbQ2Wu2sN4OyR6H2Ky3L2do/wsoV5edvKyu476fhaAsRExzPqA9mIYnY
         evvN9faety7o2ResRGusa8IqHvqZhymMcI/XnFggRdGln/ZYEnn+IcAzxQghQcNA7uW5
         DC9d/QW4D8LBgC82KP26SA//Y8sso/V1EXuX+13gP9f1Rcw3BP6htIwujc8ZpNuLjtgP
         hg5sZUAP+gJH/s4lf4xJhkFI49+mF8aISgcJnPxFFW86W967dR1XquX8fsqG5prflRC+
         mN71WXuJxS+NpCT3yb/8upV8g1S9cqyp6V+wOur0NCG92ZaTmdFrRXEwOxYAfxKlIqz/
         O6fw==
X-Forwarded-Encrypted: i=1; AHgh+RqIjAP1qyFcfTWlFhkJOtM/EyL9TRCzgBuV5eTMFbnSoKmyCvfTrDsEkeKZXL00MFW7B8fOv53VQgOMng==@vger.kernel.org
X-Gm-Message-State: AOJu0YztehaxV7VqgHo3o+WyZp4VYM1aaFbT+X01PQAfXWBC2cA598Os
	OP3leLQY+mIhLLmfTBC/RRZL4c8jF1agSAg8abqXvH8wJs8My3zy2TnVZVIrDpW0cJJnOvKasIc
	d1gPrm7I7wnvblTHbYyp69MD01XazFFOD92wp2G5HvkTUQ9xeBvfTYYdTCv+DLBC2
X-Gm-Gg: AfdE7clMGRp154hReST2pJZezr3dtndf6YsGeGHWSxh+hEvpX6blVcXbM40dMn74fWG
	7eg+w1dlZJ3g7vNokIN/eaQynKSHwxlVrxQGd4LTboif4v6xsEEDc9HXRfFVDPp/4r4Q4dG0dHT
	YYM+vENed4A6ymyrGETEx6reghQwvk32eASktaDNwdV7Cmqzu5J8ywzhbwN7b1mRF2C/aIvYA1B
	TWVdDnfkeDAQ6qjomoNt0LuWJIjmLe5m4c+vLN8yx+wdAzAvuPWgmjBHi5cqp4dyC5YjbVxUoM7
	RzgEHX50si0jpasSlSGWg0Qfki4xFXczC3I6vYmtYrU01M4JlsdAHUsFZasuTUowUqtHZ3UsM9h
	8W9j4RTKfbu8JdTGry03GYBvekcHqiNanqTnb9RNOMkt4LA==
X-Received: by 2002:a05:622a:4cb:b0:517:f9cc:1fb2 with SMTP id d75a77b69052e-51c8b30e312mr36983831cf.19.1783528910916;
        Wed, 08 Jul 2026 09:41:50 -0700 (PDT)
X-Received: by 2002:a05:622a:4cb:b0:517:f9cc:1fb2 with SMTP id d75a77b69052e-51c8b30e312mr36983291cf.19.1783528910398;
        Wed, 08 Jul 2026 09:41:50 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c41b55495sm147695021cf.11.2026.07.08.09.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 09:41:49 -0700 (PDT)
Date: Wed, 8 Jul 2026 12:41:47 -0400
From: Brian Masney <bmasney@redhat.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>, linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: tegra: tegra124-emc: put EMC node on register
 failure
Message-ID: <ak59y2H3IsHsZ15L@redhat.com>
References: <20260708112058.750952-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708112058.750952-1-lgs201920130244@gmail.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

On Wed, Jul 08, 2026 at 07:20:58PM +0800, Guangshuo Li wrote:
> tegra124_clk_register_emc() stores a device node reference returned by
> of_parse_phandle() in tegra->emc_node.
> 
> If clk_register() fails, the function returns an error before that
> reference can be consumed and released by the normal runtime path. The
> tegra_clk_emc object is freed on this failure path, but freeing the
> object does not drop the OF node reference stored in it.
> 
> Drop the EMC node reference before freeing the tegra_clk_emc object.
> of_node_put() is safe for a NULL node, so this also covers the case where
> the phandle is absent.
> 
> Fixes: 2db04f16b589 ("clk: tegra: Add EMC clock driver")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

