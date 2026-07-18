Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EC11A23A6
	for <linux-tegra@vger.kernel.org>; Sat, 18 Jul 2026 23:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784416567; cv=none; b=n4w8CnvDvHBB7ZiArsx3x/+airMWw9u6Pfrt/5nv4bTHsYKoTBPzh4YPCCA0uLRkMX5cQMgxpU8EuOVElVxiT+5GrVBvW6UOWetqdOk27j3RiSqzHuAh0IEWYtpoECHWjN8WPPkvub6rM850BeciNDWFaABTBOiwf2jGZj6i4/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784416567; c=relaxed/simple;
	bh=YziOsZAuz5FyhRvti4+0bqRF5BJSUN2tM+fuVXppn10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CEupoRGoM0zASmO670MiQ8S3YfCmsjNsMz/2xVWaumrZV83syit/5K0R3N2Mw59Zl4nZmSd0tHANNEPobDOtQtnkszsQtfVT5Kflzf9E/NqMQgX3xLg5IkN2xn0i0qQZdfolquWuEYAQjt8QNWbIOiIoRbAE6p2T+K7EYZHZwIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=K4D68k/8; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="K4D68k/8"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-51c2a76536bso94783781cf.1
        for <linux-tegra@vger.kernel.org>; Sat, 18 Jul 2026 16:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1784416565; x=1785021365; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YziOsZAuz5FyhRvti4+0bqRF5BJSUN2tM+fuVXppn10=;
        b=K4D68k/8SxVenT4xZI1ts70pz89i3H2IqaEK+ww5XO8dYYYJCOyetLAKKd32xDrxSV
         o6O8RRAd5k3Xci4A3HnOXkifv6CX3vFjQ1ByAYCYQLpm8pV8pM0YUdDIEnqwAPWnvvuz
         K6GsUBBtuOKBaqoIE+mEh0+zjijD7Z+sGbtfRKuWr0w6zJP0qGD8o4paoSo15dSgxP/s
         wjxZv5bJBwnjsXdaD3ejToiB+A9xNkJvj+Im2AreAhT3OInnrmbzd9rbiIlmlvNJ6+xO
         JZJLeRqWvX2DRqMOernngAkFVH0Tawo9NEyNyHqppcBMMw4Hi/593PvtG9hviM07LkhS
         AGeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784416565; x=1785021365;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YziOsZAuz5FyhRvti4+0bqRF5BJSUN2tM+fuVXppn10=;
        b=ALJKmiiwPAsGIEZvmQdZ3+mQWuxJROh+ln42gHWebTxVbSHv1SgxA6B39FWTDObV0B
         htA5/4aTDWDg8Xz/8cyHPtSdbM/avn0gDrGxXhbZewZVws8OZTQaYorCpeWWquNr/QqE
         pEOIuKxLJwyx1Hw9cleOU08eMJU7iI8AcODIkN+Y0j1CIy1rSOHzW39ENS2ecWrT3otY
         Z2+Xv+mdN3AbeKYCI+EMxTwfHnedqknANbbmGFXIX9W6av8HMUl08WQiRcaps/lyBJft
         DxcRPWa0eCBCxqqUtGvzC39xha7w1EsWlO7m90QAoSBlaPa8CmYPljP+B40vniL0WQ6d
         6zIQ==
X-Forwarded-Encrypted: i=1; AHgh+RqIMd0oTbRq3onsYr5kSbG3XCEPIzm94qYPGQTdQUY8G6LPonauo/PPJMK0q/z2sZGZb7pJd1dBXaXtvA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCff1XNpzkCB6N3AzA7w5N/qO7yQxD0QXM3jOyHs0uo2a1OciR
	ojx58+VKRYrjEbyE1sbKi0Q6Y8TCY1wjZ6wplYAMs59ni72dI1hbnRDVLDdzDfQXLBtFYAcRx0f
	qDeTH
X-Gm-Gg: AfdE7cm0ymuVOiX8cI8LhtoO1RZMTF+RWdULGS/b1fFVK2h+Bx5QzC71hGan8TxyhR1
	EbHHu9QeAQFFpnHqNZrVkagX1mmBbzMdBTBhvq+bFTD+vwoU7h0SG1fmRH5W5yZOg4P0knfstyI
	MlzpK/XC9MP3VmdxttiRvvj+seXKQcdEPBMZzaBYJz5KH5QR9QZ5C0H/pGblGJ9ci6GiFBksXvt
	HUto6zZpQ24g3VD5qYMzjRCsn/HqD/GMCk9rgGXJjhgJ84eMNNwpuBw7yV+6JPkI1vrBiAYWDaH
	KGhHkH8nOdJUc/WKGV6LmQ25eu4og2EhvtLlcgV+X38v8MMPAjKGU2NWZR1vn8xoU8BCX3Ao9W8
	iGdpMogczg1xlV0nX2xb80fXccqNAorvw9qVCejsa3wTh+kti6VJCdhwpwbjQ
X-Received: by 2002:ac8:59c6:0:b0:51c:18e4:38ab with SMTP id d75a77b69052e-5213ee7eda4mr74584161cf.66.1784416565170;
        Sat, 18 Jul 2026 16:16:05 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5214fae3268sm40901021cf.24.2026.07.18.16.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 16:16:03 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wl8Ae-00000006ef0-0ssw;
	Sat, 18 Jul 2026 13:45:48 -0300
Date: Sat, 18 Jul 2026 13:45:48 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Ashish Mhetre <amhetre@nvidia.com>, catalin.marinas@arm.com,
	will@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	robin.murphy@arm.com, joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v7 2/3] iommu/arm-smmu-v3: Introduce CFGI/TLBI-repeat
 workaround infrastructure
Message-ID: <20260718164548.GI701389@ziepe.ca>
References: <20260714104202.1664187-1-amhetre@nvidia.com>
 <20260714104202.1664187-3-amhetre@nvidia.com>
 <20260717201841.GC701389@ziepe.ca>
 <alqbxaKVYFX1BZR5@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alqbxaKVYFX1BZR5@nvidia.com>

On Fri, Jul 17, 2026 at 02:16:53PM -0700, Nicolin Chen wrote:
> Given the use cases on Tegra264, instead of patching the iommufd
> path as this patch does, perhaps we should simply spit a WARN in
> arm_vsmmu_init():

Nope, in this case you need to make the errata discoverable through
the viommu info so the VMM can validate the right DT is used, or apply
the WAR itself before submitting commands to the kernel.

Some kind of new flag in the viommu struct I guess

Jason
