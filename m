Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C4614286
	for <linux-tegra@vger.kernel.org>; Sun, 15 Sep 2024 14:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726409291; cv=none; b=qLSS4bXWNb5ieBSCXEpFtiHTGkU/SWrXEjBtcbyNnl+eKsRRqeLnoWkOuOL07t31AyibKt0/zrVJxo5Cwh0cYx9lrgTC0AS7OPBSH7ssOtLoa8yzwjU9U5+Stxp21oT6l6o0j1dIU5fI7EdUV8J1NCzwV7pe04RbrTH2Kuvh6Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726409291; c=relaxed/simple;
	bh=GfT6dD8sFY2oQhCO9PtqTkl3lPIfLc+IuYIxo1EtG9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sOXnbzwfzOyNvJuVv20e0ucU19ZcRNprn/TaBH1N5GSNoVB9IWMYBNmkGxRoTU2XnIFft2RLrGSELfiyc3xaEnLSx0dfJmJDEKXKXa8IYXzBKjZuwxdraz8Qu7Oxz9UpylJZe6Z/IDqwPzWIj8aHg7cveUcOXPpnOkeyht4V/08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=BsstoVRS; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="BsstoVRS"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6c35618056aso16870716d6.1
        for <linux-tegra@vger.kernel.org>; Sun, 15 Sep 2024 07:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1726409287; x=1727014087; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qETOmqLs3VcWBE6fq/NLpP/VdMfGfLvWYa4naTceEbU=;
        b=BsstoVRShEMxUrH7sLstFMUcVjr3GLiPJfqCUTfB6j2SpOjmx1/khaNRiimGAQVB/h
         khiZQaeJJVdVBd60qnLpPYLWi3Ng+p+qbxXu2BPRsIjB/bPNh/+VNWbYWH8R6D29wT46
         ol/XaQiZSgVv3z54MPYHzURGn4mL9OXZLOq7bebjG98y7Rc5EX2n5mZNS3atHm2okb00
         wJRF/uKjwEga5RDQvYz01N74XRqyCFYrZ/DXr499XyFKbEPjZefN3B//NmYBJkENKL9J
         6CsCoTyXY5jqtoG3BoPvQSyHTZAgnOpNR+bC78wBl8Bfa1WZTDqGOlwsTol7LeMkIPaK
         BKuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726409287; x=1727014087;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qETOmqLs3VcWBE6fq/NLpP/VdMfGfLvWYa4naTceEbU=;
        b=kroml20bUpjqbY6XO6//o8KfcFu31s821HHYhj94x4EH37+Yss7nx/0Z8Nd2xHeboe
         /E3dq6qNE9avhJ2Djpw5fKWTrbaKWvJkFViOulfLI+ucNS9yvNXuD/lmhmRpdo4jfKV4
         O2ouPXvaKHmH8pJSjWFXbtqT71Go+pkHgdC23Pf18/E9Dp0JrAuPKUnSdGwUIT4XUEI1
         gpKMtkbJkXUtaF26rplKNPfgnDmJ34VNwHKG3G2w/dqqyF0dqWOO1HmbmsrDYvAGDeiJ
         JDoF6L0euEzEMFe3CUde6Bv3T2pmfkCmBzgAq6XzG9a/DMvC8wOxbuAG94kixWfrsStt
         5hcg==
X-Forwarded-Encrypted: i=1; AJvYcCUI+s/MWgG4gEea+hSN61GHJf8+WoD/5m+ES2DRqrSgSOHk4HhUKQkZiR+UgMrx+tGyEenFoTaPn6tPcA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0/9C3GqbXXkvntG9/thE+bISc/V1fazmVKol4tsBZowxh/BEA
	epwTP/X9M7P96S2d85RzEmmq8nlgj0B18BYCE77J+d8IHWXLovf4HNupduNl6b4=
X-Google-Smtp-Source: AGHT+IEGScRXWkjCa1MsukJtaEHzEo9sxiP6ZOXcwDMa/t01rqjqte/GHdDfO4BuPAC0Ip8flPeYYw==
X-Received: by 2002:a05:6214:5a07:b0:6c5:5326:18a5 with SMTP id 6a1803df08f44-6c57dfb94a0mr155649476d6.28.1726409287152;
        Sun, 15 Sep 2024 07:08:07 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c58c632f7bsm16033696d6.37.2024.09.15.07.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2024 07:08:06 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1sppv4-007h2G-0a;
	Sun, 15 Sep 2024 11:08:06 -0300
Date: Sun, 15 Sep 2024 11:08:06 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Lyude Paul <lyude@redhat.com>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Karol Herbst <kherbst@redhat.com>,
	Danilo Krummrich <dakr@redhat.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Kevin Tian <kevin.tian@intel.com>, dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] drm/nouveau/tegra: Use iommu_paging_domain_alloc()
Message-ID: <20240915140806.GE869260@ziepe.ca>
References: <20240902014700.66095-1-baolu.lu@linux.intel.com>
 <20240902014700.66095-2-baolu.lu@linux.intel.com>
 <a43c31da6a6989874eb0998dc937d7a611ec542c.camel@redhat.com>
 <20240905132459.GG1909087@ziepe.ca>
 <243808ad949823a0d64cd785ed05a375ccdba096.camel@redhat.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <243808ad949823a0d64cd785ed05a375ccdba096.camel@redhat.com>

On Thu, Sep 05, 2024 at 12:26:31PM -0400, Lyude Paul wrote:
> I did take the one patch - but I'm happy to push the others to drm-misc
> (provided they all get reviewed. 2/3 seems to be reviewed already but not 3/3)

Did it get lost?

$ git reset --hard next-20240913
$ git grep 'iommu_domain_alloc(' drivers/gpu/
drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c:		tdev->iommu.domain = iommu_domain_alloc(&platform_bus_type);

??

 drivers/gpu/drm/nouveau/nvkm/engine/device/tegra.c |  4 ++--
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        | 10 +++++++---
 drivers/gpu/drm/tegra/drm.c                        |  5 +++--

Now we have the other two but not nouveau?

Jason
