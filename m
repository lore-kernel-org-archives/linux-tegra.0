Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32C8225D0
	for <linux-tegra@vger.kernel.org>; Fri, 26 Jan 2024 19:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706298707; cv=none; b=tx+kyQsLb+IPyi6ShETulQKoZKpVgprtWs7mt9KLC516EtFOtphgTCu/mwyOZq1CPmGzQH+NMWKVivi8YV6kt2vjI8M0Vr5iksn8yj5dG5KkYP6o7VerEFWdphghl+vdSRn+y+8YLsJHTBFu0teOg3hp9tEMbWGTSPQfgYzg/TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706298707; c=relaxed/simple;
	bh=UM9NHqrhFW/qXab9JXefHaDvEQZR/UkcaOA0AKHOLys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IHXf75zY7TCytj91oanZ9dlCBfLtYChLwmyC2ofQtWU8ApWXpQedkbKB/SJLnL234DurwK1jMXGxjjRTEURFo369B4I37ewIjJ/j4vPflaYjD59H4ys6EEvlAt20O9Rbu1bZdqkW6Wi4xnrlndHbXZOTIBl9b8ia3fCYd/wurcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=PmvQX/Mq; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="PmvQX/Mq"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6de424cef01so424615a34.2
        for <linux-tegra@vger.kernel.org>; Fri, 26 Jan 2024 11:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1706298704; x=1706903504; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p7t/Jfk6r6ijlM1clfxfASnElihaegtuTeqvVJDZ0W4=;
        b=PmvQX/Mq/m1NHJP8ilOocwEdTkeZ29a7JBTMeVAcjrNs+TViKBPdKQjPA7hYOeZ0GG
         NP2spJgSUqPelPYGRtNkbQWRhz+y63G/9IVMAIXr3WUOqUfDsidLoFj85yoUq4lawLMD
         BWGHBgWLshVRvF6SwSDPn3wZ+MT3A/DLmb32khENi5dgyTkTHv8Qx/D3bQkwH1W1NFYw
         DrXgp00y/Ej+Cf1M+r6Ez5nTd/8fMroHT3hwCSMxsNsM0XBe+lZcfULlIrWam1uJiVZ8
         kpDbQOen4oi48OqJ4p0s6z8rK2ptpjdNtjhJtBfA0cNVIkdsr1Gq0qSb52c0GWOf1UA7
         L95w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706298704; x=1706903504;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7t/Jfk6r6ijlM1clfxfASnElihaegtuTeqvVJDZ0W4=;
        b=JWqQ4AGofoNk3U9t/dqRNx/Fee4aphRObIeYuvfv9cJIjiQp4lRscXUcvG+kGYuYBm
         Hvf0AcUolcR1XfMltpwWnL9yE+EmzT1O4py6DCjs1jbzaEKu1hxsXKDL7IyA+UKZrLUb
         hNjnJCzKWNXRCPK4VwPobwBSr+T6MTlY0HZxJK+zF4SuD9NTsbgKPlBmGgA/8mowVhuw
         S9wcHRdRjYgRKHxY+uX3AZsENx+q8i6yqlzbbXmCVjihKxyo/rEUFcNYwA4WES286EmV
         tKFAXWo0oY//FurVVbt05pwz5f3dpw0o8LlaskIU9v6nfnh4mojiE38TGgljiwRW6sl/
         eAAQ==
X-Gm-Message-State: AOJu0Yw/remTAA3zhdrorDIRQxC/lkYqAjcqufhrglhQcMCjTf+dysy2
	fHkzB9K/9ec0YNDgKVUYxfO8d/WMBAwERyxfUhPcxdbyE/VZu/Y7SXSFAhIsRjU=
X-Google-Smtp-Source: AGHT+IG8No9TGeuDaqJJWT31lKXoJHAtaVdjCbPNccV/GnexH2LwAmZYe5309O0/wi7ytsY7bDXiFQ==
X-Received: by 2002:a9d:61cd:0:b0:6dd:e6d3:d393 with SMTP id h13-20020a9d61cd000000b006dde6d3d393mr233513otk.55.1706298704640;
        Fri, 26 Jan 2024 11:51:44 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-80-239.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.80.239])
        by smtp.gmail.com with ESMTPSA id p26-20020a9d695a000000b006dc87c016e4sm386606oto.60.2024.01.26.11.51.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 11:51:44 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1rTSEo-009eo3-TV;
	Fri, 26 Jan 2024 15:51:42 -0400
Date: Fri, 26 Jan 2024 15:51:42 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: thierry.reding@gmail.com, vdumpa@nvidia.com, joro@8bytes.org,
	will@kernel.org, robin.murphy@arm.com, jonathanh@nvidia.com,
	baolu.lu@linux.intel.com, jsnitsel@redhat.com, jroedel@suse.de,
	linux-tegra@vger.kernel.org, iommu@lists.linux.dev,
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] Failed buffer allocation in Tegra fbdev
Message-ID: <20240126195142.GC50608@ziepe.ca>
References: <bbmhcoghrprmbdibnjum6lefix2eoquxrde7wyqeulm4xabmlm@b6jy32saugqh>
 <20240123151508.GR50608@ziepe.ca>
 <1754c86c-704e-4c80-93c3-1b75a9a247df@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1754c86c-704e-4c80-93c3-1b75a9a247df@tecnico.ulisboa.pt>

On Tue, Jan 23, 2024 at 06:44:42PM +0000, Diogo Ivo wrote:

> Yes, this does fix the issue!

Thanks, just trying to pin down how the fix should be..

What kind of kernel are you running, 

Is this 32 bit?

Is CONFIG_ARM_DMA_USE_IOMMU set?

Is CONFIG_IOMMU_DMA set?

I'm guessing yes/yes/no?

Jason
