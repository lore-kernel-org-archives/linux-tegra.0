Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A21732C958
	for <linux-tegra@vger.kernel.org>; Fri, 16 Jan 2026 01:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768526543; cv=none; b=mr5twE2KlUyATWdVzKeCJO45gaVnLu3vD5Djr7cMbk+flv7g3gxBVCsuBB+TdO7PQAhy3QOKAFDcPgTbiZ7Wc2FEhjHdKARVRls4kJzYFEzH8W0/geqFmd5U5hVV5yOF7GDj9ZI0NphfATa81WIRhErAkSyMxbYjWR7OccxZnuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768526543; c=relaxed/simple;
	bh=JmS6hXMultdM7kSpg6pUvdv6eOkt62ucLYun6fJOFVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p8OrJDXGJNIl1TGhivpwNxKNRVG3gt88IE2pQxvnNML82UE4o3O8Bxkw0un69CumJoWdGZxT1BlimqSvMySj23pwTpoy+pqQ5gi1A0Fgs6JFxQ7YP7snkSkw+VDi46muOhHo0w4dvvU+XSI7RHfCBYSJvGs5RvVTa9GRirEWoDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D3O+Lmbf; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QPhHSctN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D3O+Lmbf";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QPhHSctN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768526534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I/7QQfPExfoLaF42b72uhslOlKfH5M9xECrEdJSFRnQ=;
	b=D3O+Lmbfn5BMLtCvDvnvAuInalzKgcpCxFBk+hYLzm6TVn3iqF4wgNa1kEizFsQHXdhGrq
	CuFyRrqrgJlXfy5Qh1WiLkrWhyW5QnuA6nE4bK056KvVuYAy0RD3DBrGRspmB3LSxT2521
	Jh7rhy7Oq4kNimISBi25zwaFwTsosV0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-398-YEu74jU5MVmp4LWFkX65TA-1; Thu, 15 Jan 2026 20:22:13 -0500
X-MC-Unique: YEu74jU5MVmp4LWFkX65TA-1
X-Mimecast-MFC-AGG-ID: YEu74jU5MVmp4LWFkX65TA_1768526533
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5014936958cso44172191cf.2
        for <linux-tegra@vger.kernel.org>; Thu, 15 Jan 2026 17:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768526533; x=1769131333; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/7QQfPExfoLaF42b72uhslOlKfH5M9xECrEdJSFRnQ=;
        b=QPhHSctNPh0zq6+b6NTKFI7bwJZcLf0srIPUKlG/RoeZas0fUbeDgk5dbWLGm43WF5
         TDobeTjglupgpUr79wWK8j3Qr5jyAR8WmvOAcqOjHHdPCjVeAI85D/iXy0cRFzanpqwW
         sIFKdvs+HaY0kcW61gfnA/BOHer1tWam6Bj5c/BuYqHDAyljXSMvGNSG3WQ6N68luADX
         99Rd/jyBJjljMRyWh+oEK554iF2wt/ZVgai8xTAZI5/KHd+VPRuC/XN9Q0t//BqNB5jg
         /mOJVvmwOdOiuT3TZhjFjYnZBNoVA0EsIdYW7MVEDfc7Qp+S2O88QWCBMYsxFrjv0tcs
         IVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768526533; x=1769131333;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I/7QQfPExfoLaF42b72uhslOlKfH5M9xECrEdJSFRnQ=;
        b=H5dIMknM83fgg2TPEKK9vKAfi+vGxMrF+wVNcc2vhHryG8zsr3A7qWCO8MeNaqCAmJ
         33PzjFQLyAO2v8Yg39rB0mszeC4URB7l4ePA/nEISmVQW0NcMSkoaioL40tiMwqxtJlX
         h4Tv5DIzQypD98UjF5ZZ/RELNkJnYyYnRkr+3W1BvK5/BUaKikqmNxMgfE2TfIys2AOT
         CbLMVYSqrR8ZEyE+xlYIYoIAgFRjDWSUjuSpC7tkps/ul4dB0ZhLaPDKD4tOfiEsua5S
         zZkITA8gFPXTN6grRc3ewa1n6liU78sEz8q7Y1Vi+clUgNSGyC0ykiGOC8WpoJTvu03u
         e28g==
X-Forwarded-Encrypted: i=1; AJvYcCWX6qk+8NgJzHZKt1EPEqyjG2Q7PIcO9fiqcDmkEhkecFPMeWWxXwvEL6tfxe0xhT5OMNcCAGecp35G+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHuOna4nAK5hkgFFXkzo5E5HsZyTZFzNl3Ylm2p4oJxrcmPQ1s
	JwqCfP8VNNtyV7aV9b68md3PyBygWC96XawAXSUd3GhsACParyQQfHgVBpkgxvpNMM8qZquPPIs
	ZaAvHrhgeDKNaB3hGkIbbk0b9UBPRxWXCzg+VLlvWUnwXnPR/4PXc45A7kDklGzoD
X-Gm-Gg: AY/fxX4UE1mcyGImOoHCp0A4sGAqRqcfEMxet1gOPdU9JGkW13A6hImn0eQi12V3cY2
	msC+EqCbNz/J5okCuUifexzHl8M6OmjUVyDRNI05Jd9j0eaW9K7YLrXtTdYPgCwRYCf5R9lDW/A
	YYnmYW5xsv8b484D+QCRg5d+6tE5xMYtcP75wdt2EAcaXyAxlt/p1FYiFSsRvwU6VyZ5c0zuhJ1
	veJZYLK5JuN0WBDCnx40BRbDQj7SaJ+MJ+0CKUYvWImADmUbE00i635CMF7IqgrrtmUPYpAvcNo
	OiALEqAQVBQ2OdfxPtUWWn7jWb5BvZkM7xXQ3o3tR2SwS1vlQk+Yroq2orBj2a7/8XMlXZfyFO+
	gVJH6DZSBeiMMjcHg2DgVEFFD+z3dwdhhUYIA07mxa35e
X-Received: by 2002:a05:622a:95:b0:501:466b:5141 with SMTP id d75a77b69052e-502a164b881mr20881781cf.18.1768526532870;
        Thu, 15 Jan 2026 17:22:12 -0800 (PST)
X-Received: by 2002:a05:622a:95:b0:501:466b:5141 with SMTP id d75a77b69052e-502a164b881mr20881511cf.18.1768526532495;
        Thu, 15 Jan 2026 17:22:12 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1d9f2a1sm9622621cf.10.2026.01.15.17.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 17:22:11 -0800 (PST)
Date: Thu, 15 Jan 2026 20:22:09 -0500
From: Brian Masney <bmasney@redhat.com>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com,
	sboyd@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
	mperttunen@nvidia.com, tomeu@tomeuvizoso.net,
	linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] clk: tegra: tegra124-emc: Fix potential memory leak in
 tegra124_clk_register_emc()
Message-ID: <aWmSwcza6Qv2aQBO@redhat.com>
References: <20260115050542.647890-1-lihaoxiang@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115050542.647890-1-lihaoxiang@isrc.iscas.ac.cn>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Thu, Jan 15, 2026 at 01:05:42PM +0800, Haoxiang Li wrote:
> If clk_register() fails, call kfree to release "tegra".
> 
> Fixes: 2db04f16b589 ("clk: tegra: Add EMC clock driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>

Reviewed-by: Brian Masney <bmasney@redhat.com>

