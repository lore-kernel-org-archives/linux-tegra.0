Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB19383C93
	for <linux-tegra@vger.kernel.org>; Tue,  2 Jun 2026 18:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780424599; cv=none; b=K2cHXzMIgjXAi5/Df/NYOEgrFCamDaMq95laMb1H2PPNqdYT3NQ7bIDIOUPDNr+1GhTMhLf0dxFaCHbT6OKfxpduuMEfPpcPGYFnlBGgtyIbRtiyPxylYlyEOlMEGubvX9Jc6iXm1ftS1rOz4NMmJscj2AMJtunIetq8q619FmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780424599; c=relaxed/simple;
	bh=cUXMsrDGeIBWOIuQbUfBOaNvH8JEbkg0nFIQzIgttYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JO/ZAAegy4PYfs/6U3bLLWHzbwq2Agoat2fUBYGJmPqsvBFNb4dhKwlPgzM2q63HDAC+pbVanvvmJAtk5/xTCbOstCVqZVoTRZcGBfKcVfG/YRcLcG+Gi6c+K4mcQyVFp/ki9d64ur1wjhKXAPPzyjln7+h4O8Biv/D2jfxkACU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Pv4o86r4; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Pv4o86r4"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8ce9df49c5fso40530586d6.1
        for <linux-tegra@vger.kernel.org>; Tue, 02 Jun 2026 11:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1780424597; x=1781029397; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tbha56/7IbU9o6lT6g3eE33GSrujKbwp5wEl1xMrKQA=;
        b=Pv4o86r4kByRlIpx2s863lbvah2CPfPVypsIQcoPzWizA6CR7LgtWu5t2SvE0lWcig
         VCjpsGWi7uAr91ZifowWE+DtVB/0GILP9Wv/sJvdav8t/aXIKYfwnvohmoXGEC6vaDor
         ELTf8Ejh19zSeGuD8eQUb4d5VqXNDGFBrF+qnoUzOn9krpQmQfXp3se97wKFT6UBSwb2
         yxkGavt9V2SlpTAstbAAqfFzU/6x7gDSj1a5rUGST2KlUrtwMNO0XWa9pQtFyI3iR07w
         VtZrj/litSA4GVNExQuU4x8AWN/wESgImNXFfW0wnqWlyjqBEaqBhCNWrbiEbH67KRnu
         y7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780424597; x=1781029397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tbha56/7IbU9o6lT6g3eE33GSrujKbwp5wEl1xMrKQA=;
        b=Jl4sBuAJtJ2UozTO5P1k2WqaMTypS2bOQVwApx+7dcSOncHQUtWk/kKbYWGsscQmJc
         M9Fp2Zed1RaZTolnkxWQO2Xs1yrTihya36aLbFuh80m4djHTRdZmV7hFYvWfVhwr6w3i
         WZsxz00oPXMuBvwWgL0PaS3wd+7wgmnzHuqug+gPiG7QM92dQmxwqriiFFivkNQr9pdn
         f9BPK6P5yS806eabMHcPxqh7gLNos8ztq2rWwJQXHyuHQxjdQDJBw+cE164eddqGnQI4
         4MoaLeVFQF3eVdL80gAUfYapecg6U8v1AXBNhGenPe2o4aKyco6Nm97LQBnj1TwRIvtt
         bYAA==
X-Forwarded-Encrypted: i=1; AFNElJ8eFLv1We+/T5STI5Hb724uXSuwNMBD40KDTl3XyODAtSkbmD8meZM3EWonCNeYakInXpAzO927lefP5A==@vger.kernel.org
X-Gm-Message-State: AOJu0YziShN6Px/F1fRmNKaKR5ARIHTJKd/sjoABlA+ZwLKOCZtX23kC
	8BcvRuPcXP9YYmgQNrJ4rcMnjOGuB39AI32sOwFWKZ0ecahyV4pe1uTxmuoaJ/6CYiQ=
X-Gm-Gg: Acq92OF3JvHgDP8hoI6q/Mly6qmiWwUnQK/RYS44iWAXCtBIbjUZz7QuieIAZlYg/MP
	ApbPIY3nPYLhIkmO2lX2SipP/g+t306qYcccYXx6uwlsCEpyhNaw2snfLWHWx1fi0XTmwyXBpgH
	/qLkQx6YD46S6MrNXpatbpgzJCDAeXI3bPRdoOimz0fbGkZiLwvl/35enDcblLVNJGrawZRA4/t
	JfMvo6v9559OlinZEIDb0v0AMa/9I/hqhjzpMntPUUSHKIrCAWj2XN78nL9Oj5CgFQeqhGCa7i1
	dsEzFr8+dYXDU9T4++ja5pcSeaAL2NAkE7wzvsYsMfZHfbQ+ybUN0pL4JfQgleO4a1Atdd1jMrz
	0uBmqxHM07lMfF/J4xPeOQ7l7us5R1oPJ5cOeqW9u0T7CTTmEX1QIbWn8ehVy7QF1yx+vt6YUjz
	xCq9YNBt6EjWuGcLri6r7JBIHHIaqzlV8OTHF7zI8W1D6o9POrKsdrKzcpiFQoFEZKsMXzh1eEZ
	ewh4nl1H96Xd7h2
X-Received: by 2002:a05:6214:300b:b0:8cc:f3e7:7c1d with SMTP id 6a1803df08f44-8cecb3420aemr11414386d6.32.1780424596822;
        Tue, 02 Jun 2026 11:23:16 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ccea2587a5sm134235176d6.46.2026.06.02.11.23.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 11:23:16 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wUTlj-00000004Mz7-1ui4;
	Tue, 02 Jun 2026 15:23:15 -0300
Date: Tue, 2 Jun 2026 15:23:15 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: Ashish Mhetre <amhetre@nvidia.com>, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, nicolinc@nvidia.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 0/3] iommu/arm-smmu-v3: Tegra264 invalidation
 workaround
Message-ID: <20260602182315.GH2487554@ziepe.ca>
References: <20260601104845.995005-1-amhetre@nvidia.com>
 <ah8FYa0hdkkAFQVp@google.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ah8FYa0hdkkAFQVp@google.com>

On Tue, Jun 02, 2026 at 04:31:29PM +0000, Mostafa Saleh wrote:
> On Mon, Jun 01, 2026 at 10:48:42AM +0000, Ashish Mhetre wrote:
> > Nvidia Tegra264 SMMUs are affected by an erratum where a TLB entry can
> > survive an invalidation that races with concurrent traffic targeting
> > the same entry. The hardware-recommended software workaround is to
> > issue every CFGI/TLBI command (each followed by CMD_SYNC) twice. The
> > second issue must execute only after the first issue's CMD_SYNC has
> > completed, giving the sequence:
> 
> This seems quite intrusive, will the TLB entry survive if you push a
> full invalidation instead?

It's 36 lines and completely contained to the insides of the command
sumbissions code??

Stuff like this is why I was guiding you to use the more code exactly
as is for pkvm. Historically there have been many invalidation related
errata, and invalidate twice seems to be a theme in fixing many of
them.

Jason
