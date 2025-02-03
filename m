Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D371D54E2
	for <linux-tegra@vger.kernel.org>; Mon,  3 Feb 2025 19:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738610030; cv=none; b=Jc1Tl7bB3GRbtJWFkeLG1hxxY4zQNzjT+M5IwxUXyzUtsAcgGbUSO1Ua1JdoDDq8kXN67Zo5ysLSmB/b79Xb4nqPJkK0SeTKzzW3Y/SIHiMo2TRpyQt7TJB+JzmGCd+jLNUDKBybU8Y5v204i0RX/5cI9iXRlj9GFrH9mZf2ODw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738610030; c=relaxed/simple;
	bh=8JWcxXoxbQ+/d4OLTmav8rntW6yu0LESXzb02dgf9Es=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mXkr4AqOksNi9A8IXuj6LYIBrtuwYWcB6U1/xjttqBRPINLw5UqFVlhC+YcSTkn6z+RtuTxjaBI+V01U6Wjc3NuQ7eEsjoNi0QAxvS/5JWoalq2nP7Umjql7zLC/OF8hme8q/6veTm0OJee+fApuOFziwu/a8NcGeBjHas5+AJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=HadIdWr9; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="HadIdWr9"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6dcdf23b4edso40961046d6.0
        for <linux-tegra@vger.kernel.org>; Mon, 03 Feb 2025 11:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1738610027; x=1739214827; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8JWcxXoxbQ+/d4OLTmav8rntW6yu0LESXzb02dgf9Es=;
        b=HadIdWr9HD2VpmGncf26Bqet2W6d99CWCTCErVXLgZLfagpGsnYG19+7J8MgWx4Edf
         pygAcKpfXr7FfKB7tXeCj9+gRkTZZzNtXd1/jJdRwzZiqLG3/LxufAXQrnDC7O8SGGLq
         FQNuFwd6JGwS2vmWR0cbkjLTL5Zv6kTv00Fjcl/7lcePGm1TRb0fokhMnmzXIQVCgtmp
         vNtu8t8z0AXHf5k1BHLF/pDG0V72284l1ZP6xQWcs8fpx1x7QttDVeGhFUZ19obQEAuM
         J7vHu0WcukdIBktPExu8PTdny/+17770wjlNnWnZ+traENoTXa15Wfo8yBUm4wWvttXv
         v7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738610027; x=1739214827;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8JWcxXoxbQ+/d4OLTmav8rntW6yu0LESXzb02dgf9Es=;
        b=TDxTbtTGF78725KbWVw8wRHnUpOpuU8ePjaDbKakiDLF/96LOQmAX9xH+cab64fk5Y
         rG0LQyU4IxAW1Tnx56PYoyAPALYRMzw36gxCXl6ofDYvHsirOqYe04TFhOpRpG3hB9/I
         oFsBJl+SjkHdFp4pgBGConWftf9KnekpRTO2uVIi+u+2DHbNT6OPDzDYUm3AeXrPwerI
         ornjXNfL3nn/7k7CN8tb2OqTEzYtI1vyRVqX7WiI2tx17JmyYCe9QuwP4z6KU5UTV1T9
         1Eo4GvgAMSJd3KNnlJWGceaB4uaysSvpCyAOUWF5xxMDr+tXWuuPAS+G+JPBSOxmcXQb
         tq4g==
X-Forwarded-Encrypted: i=1; AJvYcCVkTV1hHbV7KWHFMPUUConxbkChodc9Tp9xhon0eYFCtU507qmatOgDnl1BPwRURfwlhPeaFCEkCQlTfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbl8RZgT2LfvctgdjQnLJaegBzmn6V4dorY5hFd4EH1zkt/VCH
	eaZY4ma03UUTQEVbz97BkDYHkINtR17GMAJP1VbBnSP8zosr4WWxYJNmzDoRIuU=
X-Gm-Gg: ASbGnctM0TGy2bASw8FgNM9JX2CsOtdlDX4pBo7Bm6anq+iABmtqOInIQaZtQWYUuP2
	bEcTguGpWQ1tYOgLJrixQiXNI04zqNkEX8sFgBGtVz/tfVN+P1XjVbvmo/lglKDS65wAiuTbyFG
	4n9AteTaTVjXWsbKSkHJVN8oxY1R0CJJeQr1wKvbNafAey+VTzhlSm6wVu510Y92UowdB9Ak8W0
	8uOxzi8dtHOHB6vhXK/nFyKzCyqKJQbUTXUKAYAs3ouIv1s98ORAd57q4bDcxSGiZY3C6dsqgcM
	wtbjGtxZ6tIKawtbBL6A8fd2y+5jP8dNekGrn18mCk8HEBh1JCa8N5qyskRYmePv
X-Google-Smtp-Source: AGHT+IH9lm7yxORMtUKnhgtCo398qO3xBrZWzG2Ji8hCZqnDx3AD/ekoAplJegHaKOf+kPYlEc3QqA==
X-Received: by 2002:a05:6214:1316:b0:6d8:7ccf:b692 with SMTP id 6a1803df08f44-6e243c19ebemr308346136d6.11.1738610027388;
        Mon, 03 Feb 2025 11:13:47 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e2549225e8sm53233546d6.88.2025.02.03.11.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 11:13:46 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tf1tC-0000000BLdk-1MYP;
	Mon, 03 Feb 2025 15:13:46 -0400
Date: Mon, 3 Feb 2025 15:13:46 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, thierry.reding@gmail.com,
	vdumpa@nvidia.com, joro@8bytes.org, will@kernel.org,
	jonathanh@nvidia.com, baolu.lu@linux.intel.com, jsnitsel@redhat.com,
	jroedel@suse.de, regressions@lists.linux.dev,
	linux-tegra@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [REGRESSION] Invalid gather when using Tegra210 media engines
Message-ID: <20250203191346.GG2296753@ziepe.ca>
References: <c6a6f114-3acd-4d56-a13b-b88978e927dc@tecnico.ulisboa.pt>
 <20250203170617.GE2296753@ziepe.ca>
 <4ea1a48c-9020-4793-ac9b-b51fc289e442@tecnico.ulisboa.pt>
 <20250203174331.GF2296753@ziepe.ca>
 <a0f776ba-bfd2-41fd-8370-14818b86bfbe@arm.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0f776ba-bfd2-41fd-8370-14818b86bfbe@arm.com>

On Mon, Feb 03, 2025 at 06:49:07PM +0000, Robin Murphy wrote:
> I'd hope the historical reasons for not supporting IOMMU_DOMAIN_DMA in
> tegra-smmu no longer apply, given that all the default domain stuff has now
> been integrated into host1x for the newer arm-smmu based Tegras.

Indeed I do see appropriate looking calls to the normal DMA API, and
the other mapping path is conditionalized by !host->domain.

So, why didn't it work for Diogo? Even in identity mode the DMA API
will return correct DMA addresses and the !host->domain path will skip
mapping them.

Poking around I wonder if there is some assumption that if other parts
of the stack, maybe the DRM driver, are using the special domain than
everyone is? It seems to blindly pass around IOVA without really
checking who is consuming it.

Christian was telling me DMABUF had some drivers that made the
(incorrect!) assumption they were all sharing translation.

It does seem like a nice project for someone who has the hardware to
rip out all of this custom domain stuff and just have the iommu layer
setup a shared dma-iommu domain.

Jason
