Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D827F35956
	for <linux-tegra@vger.kernel.org>; Mon,  3 Feb 2025 17:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738602382; cv=none; b=iVFYAnqSJTtII8k1vWC+h2qRQLL60KNsLDbUjOE05UlVL78xiks1fcWCPuWDu/wsPjZB188w6IcBx8rBeR0DspVlX0XV/FbQAHBLTGPrl61f1rccJEDKm95/WjCPfd3VgOjDmlUXK+OgspvA74kCU4+Gkle/VJjYoCcQqzLYpCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738602382; c=relaxed/simple;
	bh=OoY0Jqmx53z2/JPowGHa76X7V+6+EmclWVr7Gf83+ls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mdRIa7SOjy0zR3DCjfEC0BjwvHx58YPb6gkhnSaB7p3hkKZmIM0K/BwE7+OzNQqwVaYwaSSVJ4LZfkwPKk7fmldUFbqn3wBUuS0TOEU0sF88JortN1J7CHnwE1I6wYC3SU/7GMl6EV49Eqj2trvIDDWjh9H0pADX/L6qEsnBEcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=N744XKdD; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="N744XKdD"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7b6f53c12adso407881485a.1
        for <linux-tegra@vger.kernel.org>; Mon, 03 Feb 2025 09:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1738602379; x=1739207179; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vuZWIvTMSblyfqLMdc5xTbKGrB3oNMPelT8jaZlHlBk=;
        b=N744XKdDM1FiebfdNLQOk/pOB5UczPoFJNW6xAWaPQIxPq45N4wbSGsrjhDIWN/6r7
         RzQrmDvwFonKDG27T8C7ne2MXnVbIH7mRGhYOzx1Bdbu1/OfuFh1q1XM0BNM9S+ZI4PA
         +pAEMKXCtCv1n31Yya7Xq9r8QKZw+dlLfoBSdGPJskLH4GDEyBm6YJLAyn3OYgu/AyCc
         nJSM0KGJazaYLsMsvV2PDQ2tUnu5xWcj7eZimN6Ce8il1OCOAJpz5xoQ7vJ6MuN2b7WX
         jM7IVXkfhSpYC8W2OOH90RK4fSwmOK5FePEmWAHoczV/vwFY7SgxyR2a9mmkXo4nzytV
         xBNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738602379; x=1739207179;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vuZWIvTMSblyfqLMdc5xTbKGrB3oNMPelT8jaZlHlBk=;
        b=NKrF6t1c9N69Iqtmd+RjlWby31uuhhKv24ANc6nTWPPOUajJ5bwRUpeexH8d7T4BYR
         PsNlJxXDT2HOcSZ7hv0lb2relGd/HGGt68e7q8xxY28TZcdnQ7K9hYqJoYQ69ZKbLmEM
         Cds0X3g1m4SFYLcN9VRQdX05PGjHwV70oSTTQC+iC48af7Pash48ICLLO8QWDzIA7WZP
         MKpvRuk6FoP8TnnNgAD68kmn1CmF9ww8U3FK+84/8MW1kS14j1wT5HpZekNbbUGWHmCn
         OiquQ9ZdVbDNz3vBpIcgNeGBmfbkP8V+ZpiOod4lH+uUcCxWBPi1cBUcPAF36eVsk5rJ
         +5Dg==
X-Forwarded-Encrypted: i=1; AJvYcCWux3xJ9S5qFNq1COYLVW9b76/gtYxAU11NPt2521KwI17p6ZYkfqe3z9TIy3R9CFZkeltdfwBqb05AxQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHrikLFuorWRdf8OisvwLoagq+rwAf+CkjRuaWv4YeSDnYTEYC
	6m+RpHBWyRnSctOg4EW63eUB+kdHVTokI6Ae8tQSjeGmcqL29paZwgz0+cmUF3M=
X-Gm-Gg: ASbGncvQJSK1teb/WxTsA5jLb2WCXwZMtJZbfARcIOjdTHLjajgyQaN1zvXQWeMLY5u
	BGLJLb2sslGZIDsk9o7NGpe/zJeSkw32c0xMZ15TEgaM46rzozanv+OXhyY8GbFdP0girBAXkiu
	+UiZhMkqoMqf25cc7aB2lle/thbzrpr4ki+hfJG6SHgRCJ+5k6/lcEjLt5d5PkNRP9cV89LYhBA
	uCmj6A5Fnx6o0IVTQtf+EK9lHbiRGpdYQzRqSwplBJVXdfby1WW/V6MqH3KYEQ70N0gm7Y7Tvtd
	H9A/G7AEjDLUfjohfzNz6LA8Jp3dtQZvPeElSLYZ5tGjz4S+ri7aafxNAbnKVCIl
X-Google-Smtp-Source: AGHT+IHtkWAUnkfVOKNEiqf19ccBm1Q+QVdFtpLSmy/QlTYdKKUNZLguQC7dP7RffulvHSXZ4Pw1WA==
X-Received: by 2002:a05:620a:190f:b0:7b6:de8e:da27 with SMTP id af79cd13be357-7bffcd73612mr2894890985a.44.1738602378723;
        Mon, 03 Feb 2025 09:06:18 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8bba69sm549451085a.8.2025.02.03.09.06.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 09:06:18 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1teztp-0000000BDBO-2UbK;
	Mon, 03 Feb 2025 13:06:17 -0400
Date: Mon, 3 Feb 2025 13:06:17 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: thierry.reding@gmail.com, vdumpa@nvidia.com, joro@8bytes.org,
	will@kernel.org, robin.murphy@arm.com, jonathanh@nvidia.com,
	baolu.lu@linux.intel.com, jsnitsel@redhat.com, jroedel@suse.de,
	regressions@lists.linux.dev, linux-tegra@vger.kernel.org,
	iommu@lists.linux.dev
Subject: Re: [REGRESSION] Invalid gather when using Tegra210 media engines
Message-ID: <20250203170617.GE2296753@ziepe.ca>
References: <c6a6f114-3acd-4d56-a13b-b88978e927dc@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c6a6f114-3acd-4d56-a13b-b88978e927dc@tecnico.ulisboa.pt>

On Mon, Feb 03, 2025 at 02:55:12PM +0000, Diogo Ivo wrote:
> Hello,
> 
> Commit c8cc2655cc6c introduced a regression when trying to use the media
> accelerators present on the Tegra X1 SoC.
> 
> I came across this regression when testing the branch [1] that leverages
> the NVJPG engine in the Tegra X1 for decoding a JPEG file. After commit
> c8cc2655cc6c we see the following error messages after submitting a job
> through the TEGRA_CHANNEL_SUBMIT IOCTL:
> 
> [   46.879757] tegra-nvjpg 54380000.nvjpg: invalid gather for push buffer
> 0x0000000108f08000

What driver is this? The message comes from 
   drivers/gpu/host1x/hw/channel_hw.c

But what driver is 'tegra-nvjpg' that is bound to 54380000.nvjpg ?

Is it the stuff in 
 drivers/gpu/drm/nouveau/nvkm/engine/nvjpg/

I don't see "tegra-nvjpg" in the kernel?

Can you share where the failing command was sent to the device?

> Please let me know if you need more information on my side and I'll be
> happy to provide it.

It is still ARM64 & CONFIG_ARM_DMA_USE_IOMMU=n

?

I'm guessing it is the same basic issue as fae6e669cdc5 ("drm/tegra:
Do not assume that a NULL domain means no DMA IOMMU"), except in the
host1x not DRM code. It looks to me like the same pattern was copied
there.

How about this:

diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index be2ad7203d7b96..090b1fc97a7309 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -361,6 +361,10 @@ static bool host1x_wants_iommu(struct host1x *host1x)
 	return true;
 }
 
+/*
+ * Returns ERR_PTR on failure, NULL if the translation is IDENTITY, otherwise a
+ * valid paging domain.
+ */
 static struct iommu_domain *host1x_iommu_attach(struct host1x *host)
 {
 	struct iommu_domain *domain = iommu_get_domain_for_dev(host->dev);
@@ -385,6 +389,8 @@ static struct iommu_domain *host1x_iommu_attach(struct host1x *host)
 	 * Similarly, if host1x is already attached to an IOMMU (via the DMA
 	 * API), don't try to attach again.
 	 */
+	if (domain && domain->type == IOMMU_DOMAIN_IDENTITY)
+		domain = NULL;
 	if (!host1x_wants_iommu(host) || domain)
 		return domain;
 

(if not can you investigate this function's flow compared to a good
kernel?)

Jason
