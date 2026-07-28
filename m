Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D99441626
	for <linux-tegra@vger.kernel.org>; Tue, 28 Jul 2026 15:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785252555; cv=none; b=pdePlNX249HgzePmYyagNJ2y7Fq+BiNRlapgP+oqyL0u348svMy9KPep/paFP8TEDATw4s7LJ6TY5mx6lkJZmlFONSq718o3lPzCVaMBnNydo4vHA0tuPyMBzl2SEtqFfk0ccj1aYToa/Fs1zNDFCZEgDuU34Wm2exgit8TpzI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785252555; c=relaxed/simple;
	bh=/+INa7ZlMC4ieTPEvDlWC7+3VrTM7mDlWZK4SeQR3sc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R80XvwwE0/MkrpT3MhwzKxCslYt/vjmMDXQsHvpcHQkmOJX0LcZ/4hQ2NdI8pkTKGT9dLV5raCBeVo3vNaA7Cg2IPy8IiOL7Me5AQsTT05jVbjPoGsZXCoTUUe5C2m5r/ZlSNBCrDa4q+rZjP5cA4Ci2enSbYhfmxvhqdAYvOz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oAlYYz/5; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oAlYYz/5"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cfff5f88dbso22270295ad.3
        for <linux-tegra@vger.kernel.org>; Tue, 28 Jul 2026 08:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785252553; x=1785857353; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PzbL4t6BnXoSVwqqWngh+8MvV6fDYlOWZnFi/BUq+NQ=;
        b=oAlYYz/55nq+icSHzpcQkukM9ZFPXXUWtWCA87VllcYoPtyrtMMluG3j2/+T/gSQb/
         deK8j0BjN+fkXuWDulgtDaZcOwlQjzzNF4EKoMKrHgNB/rA3sC5B0lkgCbjwm0mERmE8
         kIX7HXXko1Dola0GX9m4etMoM78z4flJeiO1Au9siChr3MNJFlYzFClsv6DVHrV4FrnD
         1m6dXMIcXwEg9adPVFn5ovIdx7urHvlJgAIbxxs14EWXJz/EcBViASDXf2Vx4T1TfHeE
         5YnmUz7bEtuu/k+w4GZw7P52EnsJmgr6YCrTbcMfXxbo5HntkuIb0cJ3TpTXe17hpvBt
         Ipkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785252553; x=1785857353;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PzbL4t6BnXoSVwqqWngh+8MvV6fDYlOWZnFi/BUq+NQ=;
        b=COQuKBBzZbOCgYi26nbjAjM5wd6HJ5fsV2KdnMTvVlEm5k8/L1kNWqkfxjlnMu5/Qr
         UTUHfAPkSXscvPP2rhOPqzaOMzsSn9BJZy7TUHCLGAbOHXs0XgzAAf0QChR0h0THA2VT
         NILIj+RFeD88Yu8IAW+7CxY8zHa+zgzNWJJHUaJq15HZoqE6WQwE1kZgY4Vsf1XgSGr0
         t0x5IbUBTOFs1mLYaKFdTa68FDL78/Uu3xB7jSD4AEn9XIWy5QkSfefUJ3dnJ+XlpbgM
         fwJhRj/4Bez2eTbCpUk0OZqTy34XTz/NkKXatbp85HCmDm9n7jv7HqKTa390cm/87L3y
         R1ug==
X-Forwarded-Encrypted: i=1; AHgh+RoW88TtaVZ2DKG02p7wP0JoBsAf9x4MYNz2uHyMlO9m4Ol2gderHMa1ciwmfroRiOovG57c1dhTaCrA1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVsmi+++yTIHCpsbj7yLgt4A2BKPEhjKZmONChan6OC5tg3Bxo
	E7YrmJULkr5MT6lLNdR3yiQ6sSFf6tUDA28HsWZhKS5Mm2aGEGrkMc1Y
X-Gm-Gg: AR+sD1046H06lk2dekcJyzw6QNo1ZZvqHK9eqFX5Vd8kifiaVpdHy9GSWAdQcJSFyO3
	qA6/em60h5igfPpjFtuJ0HO2p27/xEPMAk97ecZddOTvJQEhrYJikEPP8ABYNUBZfDRR5tfa9pl
	KYeGPd/OxM4TXf/uAef3T8fcPSYI1kC1W9AFXZYtCEQtLs2AQy+cSmF4HUM5bt74vSYaBP2e/04
	7ZmdMsyj2GxTETdk+p5McnJrJVb+qkCcfDMaR+Jijl4Gnr4nlWkHjXs8xX3jYZSoVlfzQ/dywqP
	/itEHMQ/+0+pYSyihDd4OysWqiEEYw+m36QjepDkLWYKrRGXz8eypjsq3hOkRFBytd5IkpBAaB1
	RhetISjco25e4o/kmQ4rRkAi/Kke67OSb3JqcVcqs6ThiyMIx9huVPRKsbhtUfbvAlyafNqBdlp
	/NZe6kA078hksvxQCSeLlVUg39xyLznqYRuiZad2Pk3AVt1L7mVsWhhaY=
X-Received: by 2002:a17:902:f547:b0:2cf:c543:2c7e with SMTP id d9443c01a7336-2d0175cdaa3mr28817615ad.10.1785252553080;
        Tue, 28 Jul 2026 08:29:13 -0700 (PDT)
Received: from localhost ([172.216.252.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b8d6sm54099535ad.3.2026.07.28.08.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 08:29:12 -0700 (PDT)
Date: Tue, 28 Jul 2026 18:29:06 +0300
From: Dan Carpenter <error27@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Artem Lytkin <iprintercanon@gmail.com>, linux-staging@lists.linux.dev,
	marvin24@gmx.de, linux-tegra@vger.kernel.org
Subject: Re: [PATCH RESEND] staging: nvec: use strcmp() instead of strncmp()
 with magic length
Message-ID: <amjKwgaQc0sM4UW8@stanley.mountain>
References: <20260723161823.23921-1-iprintercanon@gmail.com>
 <2026072836-swerve-splotchy-bf8d@gregkh>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026072836-swerve-splotchy-bf8d@gregkh>

On Tue, Jul 28, 2026 at 09:09:23AM +0200, Greg KH wrote:
> On Thu, Jul 23, 2026 at 07:18:23PM +0300, Artem Lytkin wrote:
> > Replace strncmp() with a hardcoded length of 30 with strcmp().
> 
> I thought we were trying to get rid of strcmp() usage?  Why add it
> back?

I don't think we're trying to get rid of strcmp().

strncmp() is for prefixes and and strcmp() is for whole words.
They're not the same.  strncmp() with a fixed string always
seemed like nonsense to me and it causes a static checker in
unpublished Smatch checks because we've seen that bug where
people wanted to check the prefix but used the wrong number of
characters.

regards,
dan carpenter
