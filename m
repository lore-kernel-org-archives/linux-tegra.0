Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A431E0B91
	for <linux-tegra@vger.kernel.org>; Fri, 25 Jul 2025 18:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753467135; cv=none; b=XtlDBZ063dtvvlE4wgwCuOinjHvZRNz+zW4j3wtd8grNA6P9qVnDUVnabdbY/59Tofh4vj9+d+L5u9MLbfC3alkJ4jf08WqwV/tlZZ01Jlm2st5TKKF9FAs/L4saTuvf9W9Kap+crqHZ2qVXzSRxRGLQap5z0L4TliVsWOhalo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753467135; c=relaxed/simple;
	bh=9YaUMw2uo4BIlLWMKZ+PThCgBBHtaJO7cpthxwOFSoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nyQJ6L/YRgzoJ2pNdtFA2r4cQS+QfCOglj7xCwXxVuY5AreB4CAnVOpFqLVhRLSAoABYudHLDPbiAD/01o5C8LNBYW4zBJ0iXuPR23WymNGMhsPLCkTttox/yUOyRgGLQRdZGk56It9EBBVTaRTn9Io+Fpwc1/IGvA7EbgpysTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QZytguFe; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QZytguFe"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4562b2d98bcso4875e9.1
        for <linux-tegra@vger.kernel.org>; Fri, 25 Jul 2025 11:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753467132; x=1754071932; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9lqZ8GbVGbsyusC/rotoXs+VvnR4ndEH+/csO6rB//g=;
        b=QZytguFeukCmj0YInwqamgrRYpPBE50oZGxwvLlDOJrGMiqrn2yz1QGnQZYj3aToSP
         iQSB+ANhejsbPfSONRFlJsicwoj9Gr03CbbzMEt/s1Z1+TVm58xnGxdEbP4l5vOas/C2
         h9Y+j/jycidLsdEUuiqdz0jZJ9nhE7pZ7mPcQ9HpFoCLdWACfc4aIeQamc/MrBtQD4TZ
         2uGBV6NjphqS0VsUmqpNWIqerdUIAonQT0Ix/cdTTHtfx4fx98t7zl+QjkHHFuiwsgKW
         zkZkwnz8AH36YAcpc355Y3nAf2YykqsrDX9MQsIzsgQ/Da6cblpYyS5iYJgxDIT+Jx17
         HcmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753467132; x=1754071932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9lqZ8GbVGbsyusC/rotoXs+VvnR4ndEH+/csO6rB//g=;
        b=spCNFOX3BvPxJ547IzQa2aAXc6hknPT+Ak9DDowaLMkq3pDsQRLx1OrD7qZcC10Qxw
         glJzH9lsE76Ep1+u1dvCVRc6zjZftNDaPgyczYbyb5ROoO1wi+qfYk3LJNHgEPBoHR7G
         fVnYun2ZgKGD9YGsUlQPwyAOsA9YYohpCHRCp7icJrglvph1aZZGMbL56GKbwNhWZkHD
         KiXPQ6oKS5VSVVWNHVlL0ZRxJEtv7uWdQXl8DJczchtV+/7tqaaU/NRCevM5G1zeO9xx
         xQ1xzLfgapZNn/T0lbjYDxevInU00wb0g2oK92qQcFVFnbMIZm9TDnko8XdbB0VqMLJa
         LBVA==
X-Forwarded-Encrypted: i=1; AJvYcCUxz5D/lIvKts19ghwbQsltUvnJeSgAfcgXts8VRx2htU64y+SPBhCnvOrHVWlppy6dfWw3u5i/eGldaA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2G5FTmASagjIAYAbv4W9mhCnC1pDLVnMqQUyNSD+DWboTQhVY
	spUPol2+KVq1PNKk+VGMd7JvyCt1ISZUtYviA+0hV9msr8JVP7LAYSo333+8D+licA==
X-Gm-Gg: ASbGncvWGT+PlDadXU3OO7Br0jOqwGrV4I/QGvPfLsKRLAAh/PAp0fUiM2nZkYuPst6
	fFzv0ZuOMS6BP1LoAcRSiPxWNWOEm9K5Mru8O2t5uOCWrnAUUqoHrNOkmIorZLQ7V16dDFRi9W7
	8xMeXHGt1scIYMuJNtAFL/K8NOv8FSrU9vnAtmYEmiKF3jlEH1PEZ2kKSYqEzUVqFEibPAafWX1
	gg3PgI+ivqy2fQgMO92do76NmU142YiqoQeJS1rIZtV5FMH5nb0PlXqUIrZBve222AzzwfqJuts
	20R4/HRvRCIJTYz2fGe5A90lAepy7chzYwAK0C74eVt7XkkU9NR+KKECBS/QGnpDASoagc/SZX9
	h3/QnTTgg/JtLF+10gL6NFB5Go5PWaOiyvesIp/tRvvzxlO8RQpj5tJMINg==
X-Google-Smtp-Source: AGHT+IE7dLSNdxnS09UIaiZLtGTzBKRWFvjjxpSelV/vNcmga84rxmjNvK3BLMJqQyO32AXbSKfYAg==
X-Received: by 2002:a05:600c:5289:b0:455:fb2e:95e9 with SMTP id 5b1f17b1804b1-4587c1f7c41mr47125e9.6.1753467131632;
        Fri, 25 Jul 2025 11:12:11 -0700 (PDT)
Received: from google.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458705377e5sm61620255e9.7.2025.07.25.11.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 11:12:11 -0700 (PDT)
Date: Fri, 25 Jul 2025 18:12:07 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Pranjal Shrivastava <praan@google.com>, jgg@nvidia.com, will@kernel.org,
	joro@8bytes.org, robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 2/2] iommu/arm-smmu-v3: Replace vsmmu_size/type with
 get_viommu_size
Message-ID: <aIPI9xv-HxTPWMUp@google.com>
References: <20250721200444.1740461-1-nicolinc@nvidia.com>
 <20250721200444.1740461-3-nicolinc@nvidia.com>
 <aIDlsUvF2Xbdelvx@google.com>
 <aIEkZoTOSlQ0nMKd@Asurada-Nvidia>
 <aIEwzM7mKUI8-h9U@google.com>
 <aIKd1owebUNQeN1-@google.com>
 <aIKqaGMMpsIuAVab@Asurada-Nvidia>
 <aINL66r_1NO3Nx-f@google.com>
 <aIOvt+atxTQp57R/@Asurada-Nvidia>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIOvt+atxTQp57R/@Asurada-Nvidia>

On Fri, Jul 25, 2025 at 09:24:23AM -0700, Nicolin Chen wrote:
> On Fri, Jul 25, 2025 at 09:18:35AM +0000, Mostafa Saleh wrote:
> > > > > > On Wed, Jul 23, 2025 at 01:37:53PM +0000, Pranjal Shrivastava wrote:
> > > > > > > On Mon, Jul 21, 2025 at 01:04:44PM -0700, Nicolin Chen wrote:
> > > > Had the
> > > > vintf_size rejected it, we wouldn't be calling the init op.
> > > 
> > > A data corruption could happen any time, not related to the
> > > init op. A concurrent buggy thread can overwrite the vIOMMU
> > > object when a write access to its adjacent memory overflows.
> > 
> > Can you please elaborate on that, as memory corruption can happen
> > any time event after the next check and there is no way to defend
> > against that?
> 
> That narrative is under a condition (in the context) "when there
> is a kernel bug corrupting data" :)
> 
> E.g. some new lines of code allocates a wrong size of memory and
> writes above the size. If that memory is near this vIOMMU object
> it might overwrite to this vIOMMU object that this function gets.
> 
> This certainly won't happen if everything is sane.

I see, but I don't think we should do anything about that, there are
100s of structs in the kernel, we can't add checks everywhere, and I
don't see anything special about this path to add an assertion, this
kind of defensive programming isn't really helpful. We just need to
review any new code properly :)

Thanks,
Mostafa

> 
> Nicolin
