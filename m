Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47C531F99E
	for <linux-tegra@vger.kernel.org>; Sun, 10 May 2026 19:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778439607; cv=none; b=pq1FPTacX1DAWW14jpOVEv7c/kwgbeizgTBK5u61HaGp1rAUvZ1aHoN6osSctGhydvVkUYwhyEQZrRiaCkEorfLX8czDGG4zhr7Z6WWTto7LA8dL35YycL0X6ZWkc/CQi202cI1oqWnivk1zc7H7J+ytlWyglSKbRthexDl+41k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778439607; c=relaxed/simple;
	bh=Bvc212FwGt0vxmNS1oiSrfkzUZX2D+Zt999xDLx+UQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Li+4p7NrAtC2dhZG49mGgFGYbkyFuPG7noxkuFbNBUiIstUHjbUTmyF/+QRDvENd6oksvOqZHNTx06lBDejR0SkImqmClMSfklymyu4NpYYSsX29Dl4sk79BRjno5PdNXKArndH8a9Ip0Odx+EjcMkiJWtqnwJQDfmN9aATAaNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=l99ddn6X; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="l99ddn6X"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2b46da8c48eso325ad.1
        for <linux-tegra@vger.kernel.org>; Sun, 10 May 2026 12:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778439605; x=1779044405; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bMsfc8Zbf8JIkTQeMv/NJIxXAe3vZVoXdywLBqyZ2Qs=;
        b=l99ddn6X9gJPoncZdNaC4oLOYLv7UA/duUKGUEFNASqPh4djCId5cwZgvx3EfNh61K
         ecA4qIngJaLNmY3HvOHrb8S5ttPwjuMZaI/ufbsgURoEuum/LMuC3hXPizkoG9iNc/cT
         24j2uXJYhad3U7aQB6z3FdlahpWuerb1IoEsTGVubuLzUZEpoC17zDaX//QHQFnc9MCp
         sPcew8MNk20vy9CXLjoVKGXXc2Z6h7inOcBdE6QIf63RlKz1qXaRY5dDkGc23n1T1oBJ
         4EiPB1S/q4Px62J5z4LbaV40lr0A2LXczbiwOHpHE2gcyzKUzVb94VXYF7WFA9Orj3qr
         dQEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778439605; x=1779044405;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bMsfc8Zbf8JIkTQeMv/NJIxXAe3vZVoXdywLBqyZ2Qs=;
        b=hFX2enoJN7KBrWmL+Kkwfxrh728jcvgmXwfYORRkJvq/TZjZwR/0bKE9M1nRD0/Bkx
         GE2SqcRabCHAGqJR3/Yni0c3K4OVJWYqs2Cm0czA6w5Fw4ZSvgo+1PXegCa05dTs8/Zf
         pEXWOorcaaoXaU7c1+peBAvkxzEeCC62nl+nGvC2Kjkdk2UjXMXRIaU5adv2Uwt2uT+1
         jLtjYvBOXjCl7M5VNTqtbue/84vixMm5UgqZoPHgqiMiFpdfDs15tEVxErv4cqu5Ypjt
         MZJ4DL99cvglGMRrFu1FaSY3OOMvA+YFGrO6lA23yV+UI6q8++1gZM3Wmiozm1Da5UKX
         uXlQ==
X-Forwarded-Encrypted: i=1; AFNElJ/WnljpdP9w6VCPQio0mxCdKXrYKFGFCihBYroeUYOC5AtQgWLbW9je9pa1Ua/5NAzZVO0goHgbmVac9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFQcRp7QsBntm1wimR+wIzF2J+/VtWx/1fGelGA2jP0hrd8MhA
	sMT6niCBKAQcuk2GhudCpLzHSeayaXCXct7WTz/7PTA/oPMqr68Cx2ee4vLa6MZEjQ==
X-Gm-Gg: Acq92OHOD2QmSloLmpqczHweZzx/pNENwNC2IWZFlPPpMUlpD5myJBj7QTeCji7QKWb
	RqHG+3wSDZl7sGDbhxo2PSQQAqq6Wwh0JOezO3N/zeEaOVhDZKEavLg8nEwXCn0+k/tVe185tmG
	wZ0BCBNK5Pz+g25r5XOJEr/GGHydDVuI46RN5S8AAwb4q3G+PwlHid9pHUdf3+ZcdJ0LeWaSlu0
	yg3jYX1uJu15bl6XZnoU38Rweh/sIrvZpM+s0QzTqF2lKrQasYjhJwk+l2lDATXmmVtwQMPECW2
	voL+2BDECsoaLEpArQQMjVxl8nTNxDqQ2YuJrXtfZ60rrDgoGQ5K6TXb909fY8ohbeNDlI5l003
	tMCwoE2EhIakZ0bPolVeV1bpCW7rp/G91dhX4ezP//loG0aU2LB9lymOmyC8ZVop2Ki7WM/Q5Xm
	X2gHUJo3gotZ+88Pnb5pQu1Mw0xhk5Bm+ALaMFpNThWLkpYWMUV2DOKj+lVFW/i6EbVN4k
X-Received: by 2002:a17:903:8ce:b0:2b4:641a:6b7c with SMTP id d9443c01a7336-2bc7868490cmr2499495ad.13.1778439604484;
        Sun, 10 May 2026 12:00:04 -0700 (PDT)
Received: from google.com (44.234.124.34.bc.googleusercontent.com. [34.124.234.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839685a8125sm18060689b3a.61.2026.05.10.12.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 12:00:03 -0700 (PDT)
Date: Sun, 10 May 2026 18:59:57 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Krishna Reddy <vdumpa@nvidia.com>, Will Deacon <will@kernel.org>,
	David Matlack <dmatlack@google.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Samiullah Khawaja <skhawaja@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: Re: [PATCH 6/9] iommu/arm-smmu-v3: Directly encode simple commands
Message-ID: <agDVrTUTAIt1DpZ6@google.com>
References: <0-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <6-v1-b7dc0a0d4aa0+3723d-smmu_no_cmdq_ent_jgg@nvidia.com>
 <af3KDBt8vhClSKEF@google.com>
 <20260508173736.GH9254@nvidia.com>
 <af5C_ax1a3LbtL1Q@google.com>
 <20260508233629.GI9254@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508233629.GI9254@nvidia.com>

On Fri, May 08, 2026 at 08:36:29PM -0300, Jason Gunthorpe wrote:
> On Fri, May 08, 2026 at 08:09:33PM +0000, Pranjal Shrivastava wrote:
> > > > > +static void arm_smmu_cmdq_batch_add_cmd_p(struct arm_smmu_device *smmu,
> > > > > +					  struct arm_smmu_cmdq_batch *cmds,
> > > > > +					  struct arm_smmu_cmd *cmd)
> > > > 
> > > > Nit: Same here, why not  __arm_smmu_cmdq_batch_add_cmd? I understand
> > > > that _p just means we'll aceept ptr.. but the name's kinda wonky.
> > > 
> > > Which becomes a fairly widly used public entry point, so I didn't want
> > > to have the __
> > > 
> > > Though there is no external user of arm_smmu_cmdq_issue_cmd_p()
> > > 
> > 
> > It's just that we're calling "arm_smmu_cmdq_batch_add_cmd_p" at one
> > place and using `arm_smmu_make_cmd_<cmd_name>` at the other. It makes
> > one think what's "_p" in issue_cmd, only to realize "_p: pointer variant
> > 
> > I guess I didn't like the new _p ones but I guess it's fine. Happy to
> > leave it at your discretion.
> 
> I don't much care for the _p (and yes it means pointer variation) but
> do like it better than __ and failed to come up with another idea :)
> 

Yea, I can't come up with much either (without __ or _p), maybe we could
leave this as is..

The only alternatives in my mind are arm_smmu_cmdq_issue_cmd_ptr() which
is similar.

Thanks,
Praan
