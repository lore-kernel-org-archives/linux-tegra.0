Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDCC408020
	for <linux-tegra@vger.kernel.org>; Mon, 15 Jun 2026 16:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781539723; cv=none; b=MnTK2dNd73SpU+BzBfxE7zMOgj1VbG+Z1JOwkyhp9aCN+7iRz4s1CAUXx6lPSVP+UbWZnsAO7vscY5nqaCfkZaHK1j16T1H1mN1ZapMlFepB7c+u0/pOdNi7Q2NmmFfux70R8FEVB5XNEcHTRpRYg7BzsabNGGgJfYuCWmpy4OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781539723; c=relaxed/simple;
	bh=9Letx/UzMKNZ4eFux2qIWsj8N4MkzhVfSgmNa/ukmlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uppuns3ipGGtm6LC7zRGKemFmnML1hWzBcpCk9eusYVOum529gEAgnzTxDRp1He3dbG+r2NjOVM6gAWTCLSNlv2Bv9+vqOxMX+lDebkEAIPemyukmnP3Xc6P0u1JaOM9+0ikbd8t+WVdo8ARQEIWCy4CTaNYPNkQSJ2Tx9vLHy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Mx8D+o/u; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kSq1QsLP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Mx8D+o/u";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kSq1QsLP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781539721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qVWLtwh6S1XlS3cjxrMMCVmcZrnXfZk/tyqzz1m2xII=;
	b=Mx8D+o/uuLolD2yZdwVv7V/hT8QVcH4mHOGNJmeLiuNMd7g+NmZNbDQafcNBz2SY2SbG62
	ny2OXV68uawVd8sgr5af5ci0qGGgC8dP88gO0vdWCn7w7T8qgIopVtcu6kaKDt/shI5yKA
	zRO7j1WIzvbi158dg474CP0YA/8jIJ0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-511-K7wmzlGtOQul1xp5cWXPmQ-1; Mon, 15 Jun 2026 12:08:40 -0400
X-MC-Unique: K7wmzlGtOQul1xp5cWXPmQ-1
X-Mimecast-MFC-AGG-ID: K7wmzlGtOQul1xp5cWXPmQ_1781539719
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-915b6b63056so701975485a.1
        for <linux-tegra@vger.kernel.org>; Mon, 15 Jun 2026 09:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781539719; x=1782144519; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qVWLtwh6S1XlS3cjxrMMCVmcZrnXfZk/tyqzz1m2xII=;
        b=kSq1QsLPYndAgdu2i6r39rIEi7bs6CQtqeLvRTifgHqvWL8rPVONRhMhHlONgjm/qS
         oQ0fJjYQSZ4cIey4/tCgJ5cVZBm6ieuuReDRx7qIyccZDtyni1t8hixiQM5lsdh7npez
         K5ojBQlS2vSBDh83ho7U7Xc6IRuaczQetdOcBGxD4frOCJvbft0SB8ULIfD4nnshAnSc
         wICfxnfrnxv6t+eoGec/eZGzJnTu2zeXxBQdJ+cxWUqQrmier4Pjf9IxS4eu4PfuBAyZ
         V5mRjlBpHzufaOViiXgAK5ujwiiD0Ppmt1IKljW/9+Xzx0FwYqEuxWe4tulqteGSDSu+
         1+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781539719; x=1782144519;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qVWLtwh6S1XlS3cjxrMMCVmcZrnXfZk/tyqzz1m2xII=;
        b=UjB53Tx7VbHpYkMSw2vbv5TrkPyBAqI4Ed4Cy5RW952NuJVaZPQeOfgeNYGyPeyu9V
         pYoZzojwtYSAFlQ0Db6uFAbZD1W6Tedwqw7Zjq+mA2JvKVK9XfLFkjDvJS4dqNbEN9J4
         63+aErDBClyHosKXtWJRS2eCINjwen7xTle/D+craB5LWzmW+1SnuBqrVdWkurtr4VR+
         0nqdVY/4OBnq1A7OyAGcTeBRe7FSNpDPjh1QgOUzmq80Ei8stC3kzAPfr20ky9Lz60q0
         kDGIYmfhc35piFA3m0FCleKuArirCAebT4rsLtglilMby98uxwWC2z74jFNmffFth5xF
         h5iw==
X-Forwarded-Encrypted: i=1; AFNElJ889YtgZaqH5yr0YAKoVrMfyAOO4STpIl73fplqvAYXFtW8JEK0ZJlE5lmkwVKfmCOFm+Xk6e6aWoTDLQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOAHrhPGj/k/11688245a1+3HjJv2tUBZJNjwKWaoMIjd0RF2G
	1LYPkQEj3531bxyqETdPh2gZ+Fa/GVOE8Wkm3ZVF4lgOEnhUoHkRlXYekCU0ZTEndXv/kCXETHB
	DS98KEQK6mVFQx13/EzzOZGJWGGdnzn3mcJFlaXAHKKxDISZb9gJG3p6hbJBkf+mG
X-Gm-Gg: Acq92OHTH4TPLo+nVc1ZOD7kY31Gkv1mEB7Hu1NnmcHRlDE6VCZrB9AqUX7XQpeuGU6
	H4pCCKBt4e/40URWD+JWOqaPyaT3z45txQVHc5539QeaQR/5WtwcuqyCtOiup6LvD8JhKp5GE4y
	X4tI7sv5FvmdzZtJPGShuz3NGJOGiNV+1FZAjPN6h2UwyuEfviDqSv1VmwMxgc3ZnH8zqHIgzOC
	mEeRl9sd2IlwWdZbZk5R4w2pKCB84LbNUZ1bpHQvruaTIS5Oehmlao2gInODI4yDCyzfgmp2ARn
	cC1kVdSoaFabixLAHw8FeEyHpxXuJxRw65xY7PuuwJlUSLJDQ08vsCnophAAkfrj/GIetKeNhDS
	1LxgGdJKYuEdptw5Sxzmama0g0u7PEJIV+p6Itjh+4fPLHXNNs6wnaPKc
X-Received: by 2002:a05:620a:4714:b0:915:79c8:ec92 with SMTP id af79cd13be357-9161bcc580fmr2275506385a.37.1781539719263;
        Mon, 15 Jun 2026 09:08:39 -0700 (PDT)
X-Received: by 2002:a05:620a:4714:b0:915:79c8:ec92 with SMTP id af79cd13be357-9161bcc580fmr2275500985a.37.1781539718760;
        Mon, 15 Jun 2026 09:08:38 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a006441sm1215814985a.27.2026.06.15.09.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 09:08:38 -0700 (PDT)
Date: Mon, 15 Jun 2026 12:08:36 -0400
From: Brian Masney <bmasney@redhat.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
	Timo Alho <talho@nvidia.com>
Subject: Re: [PATCH V2] clk: tegra: Support unique names for multi-socket
 platforms
Message-ID: <ajAjhPmKlsIq8PXq@redhat.com>
References: <20260602084334.350895-1-jonathanh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602084334.350895-1-jonathanh@nvidia.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Tue, Jun 02, 2026 at 09:43:34AM +0100, Jon Hunter wrote:
> On multi-socket platforms each socket has its own BPMP which exposes the
> same clock names. Fix this by using the NUMA ID as a prefix for the
> clock names on multi-socket platforms.
> 
> Use 'sizeof(info->name)' in the strscpy() and snprintf() functions to
> future proof against anyone changing the size of the 'name' array.
> 
> Co-developed-by: Timo Alho <talho@nvidia.com>
> Signed-off-by: Timo Alho <talho@nvidia.com>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

