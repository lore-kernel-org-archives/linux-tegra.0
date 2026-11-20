Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795199700;
	b=iZCKyBMVExed20aXQRJ1sEcZbuIozK9AP6lOC8DuS7vFlGmcj77le7Tztil0xudSQzDG
	 PBDW7PVKYWhlpJQ5R+ICM6PtP9EfJKGzicfDbkGYLWPyrG5Mhcsufr29l98yfCtq+6a5d
	 NCN8tfo/5gtVglZwjM47HuJOS6k7wVn/TFrLKlkLem4HHmga0cxYqGEABBDzyEOxNpcLo
	 1DWILxIhxp0YQisNUB/DIjFfubm4LErr6xyyXZ/pW+suoSrP/vN5Q7z24nP2WT8a1K4O9
	 0YK/sGReV6RDaGHA5U27G2VlgzzBt8YesF0gDDz82LdBWcaITD3pmaVEobXxrr/5IHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199700;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=jPtMMj+TNQI4z5t6onBp93FYMjBvk5RvCFaoZZ65vCY=;
	b=uFpxka734hqTlDSGm6eC94dDsrZ6gLwqZ5/RxBJOqoz2A2uZffHazErFtwXsA6+zOTh2
	 qT+yTDtNjxmULSEU2iyperlt8YdcofOA9sOCabsbxRpOGqYDeiplG5qHwyzztbITQArzH
	 jlm5nJK1e068evPuDuexgUj+h+CWS3m4jt84Xs2NmYXiIcpfCxOxYKB9RzDPCzsB96WEh
	 8W8Z19YFwAek92XGtBJ2JAF//TGKO1I+eM15OUPZ2kwu6GrD/GBPyFqSg4NGyOhUC2LK7
	 Xx71I9oppLya9ERE+oRqaDR2jYIoXk01SPh6gCkX/ASay8G6FDmlXL/lNHjDNTSFkvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	arc=none smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF7B60A2616
	for <linux-tegra@vger.kernel.org>; Fri, 20 Nov 2026 18:34:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AF7B60A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-91f0274f88cso17583796d6.0
        for <linux-tegra@vger.kernel.org>; Fri, 20 Nov 2026 10:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795199699; x=1795804499; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jPtMMj+TNQI4z5t6onBp93FYMjBvk5RvCFaoZZ65vCY=;
        b=JM5nliiElBRIEJ+B90qYXzTnYzd/+stv+wN4hwHPgqTVP8FYNDHiBWaWDvaGRGBFxN
         DqILVZ3+XhMDQbPxlO8nhrLm/3w+AS8V4/RKa0SdUR6IexGhtW/Uv60cJ4DkbyFlLhOE
         Pl5l+2oZREQoIwCUMY+E4wr8rSVuY88AyEEMkOvGbhgTCninzjOvTw2NxmuFvZ7F+iej
         DSP94PiPMzI29zQ2p9efX119ggGHZGyIOl6SqlcuiuwZZ8zvQMORhl9uXP/+Kg0BjB6g
         LN1AMmDfqP8DHpgXbQTq5ecBBCz9h9vFIy3naJJn1zHRpF8CqaAU+DUip0emRErZQjgp
         a4nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795199699; x=1795804499;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jPtMMj+TNQI4z5t6onBp93FYMjBvk5RvCFaoZZ65vCY=;
        b=e+7HiB0/rPfZclLmwjNk2vdZXsbeuJxiM74KuLZkpU02rKn0aopVwBzDv0lQmQNuME
         R2ZqB7UQ3oM3sORPchaLdD5T4g2YilzFfR/WwpzkFzGzVvVfXEASQMrla9RPloevkLyQ
         odyVwlRyBpPT0CbQEBdCuO/5QZQIjgUD1j9RcRvtq2PiMGE2U1XDFpCauKW+JiQtyMx8
         uscp58gLmhRljl+TdCCDxlasNgOBK6Up+JYk73h17I0QwUApATpzKMubMNyr1v8ymAMs
         TlXo4Zm85Q5bjRqiy/u8fRAhGxu9NpcSXlOPnyYUb9lIWK4xmiBvzXu1yckTcWO5apdS
         E7hg==
X-Forwarded-Encrypted: i=1; AL+hErFgXJvfHxP+TS5AIbCb+OleQLS7ceOp89ao7V1DzsWdw2eFBMZKJqcXA0zLtCKHceCBMwvSwdZ2+imcKA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9dbScQQ/KbTsUd1m/SLLfbXpXBXuhkHpDIBC5AK6GCqfRtuyOH
	P+Q9Gjq9sC1ASsS1bFZXYSKeXPzda/Sl9cAXP05uhTZ7TgKuDfQEkfgS4H3mbdj11q0=
X-Gm-Gg: AZFdTZc79xc208aGQU5dPmufIN1P541H9Iu5An3/BIwffZNmT/fhRc+/DylM9/dKQjz
	wmFpIbAgLedFOtZb1FAaYW9YjGMnazoMGvVU40KI8BNspmmMHBnizQsQUQgUOAHQpMi1fDwSq9F
	rjBtu24yb9Y83WQkP/KNTjbvvu38VDGaZXMdKMxuFe7kBWWgpAjt6OmKFdmgIYBQCVc/+ZytoLK
	CaVRiPLg5Xq3elPeWZp5JFaN+f9tr1bJHObJ/KzkkEMKQixAlNP3pRUMdgcHqGump8Eq4KUWAWF
	iZHHz5IOLD54hm5YNSxZiTG7LIae0ZUrwGoHG+ecD/pqBycp7rqPOs1ljGoVSvbEsotp+VnS5T/
	kgGdxxBzO3tjgrFGkUr7Rat2XydipHZf9q36MN7dSSS+q8IPf0YJ0TE3x/Atx9rNoab4mCmuOeJ
	Yy2Xm0cyoyJipKjC6lFYIcJrXRAQ2lViNJngtsmRHBOC14ubLlyZ4QSoPxUOk6w5JaUovurep8x
	cu7Qd/miojNCURKy5hYazmY8LF0AlyKVvOg0dH6kwlNXNH4qOo+HjGHyTSalJu0Cy7pTHIoNImO
	efSkVA==
X-Received: by 2002:a05:6214:4881:b0:921:152a:4e48 with SMTP id 6a1803df08f44-92134b1abb5mr65747176d6.32.1795199698766;
        Fri, 20 Nov 2026 10:34:58 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134a16754sm32821016d6.39.2026.11.20.10.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:34:58 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xUTRp-00000004jZ9-0OT6;
	Fri, 20 Nov 2026 14:34:57 -0400
Date: Fri, 20 Nov 2026 14:34:57 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jacob Pan <jacob.pan@linux.microsoft.com>
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, Alex Williamson <alex@shazbot.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joerg Roedel <joro@8bytes.org>, Jonathan Cameron <jic23@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Lukas Wunner <lukas@wunner.de>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Steven Price <steven.price@arm.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Ashish Kalra <ashish.kalra@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>, iommu@lists.linux.dev,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-tegra@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH v9 09/13] iommufd/viommu: Select vIOMMU operations before
 allocation
Message-ID: <20261120183457.GQ3115493@ziepe.ca>
References: <20261116081935.85372-1-aneesh.kumar@kernel.org>
 <20261116081935.85372-10-aneesh.kumar@kernel.org>
 <20261120094207.00002e89@linux.microsoft.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120094207.00002e89@linux.microsoft.com>

On Fri, Nov 20, 2026 at 09:42:07AM -0800, Jacob Pan wrote:
> > Temporarily disable AMD vIOMMU allocation by returning NULL from
> > amd_iommufd_get_viommu_ops() while the vIOMMU interfaces are being
> > updated.
> > 
> why? if this merged, it would break AMD driver vIOMMU functionality.
> And not temporary as I didn't see enabling in this set.

It is broken already, it is missing some series to finish it. It was a
mistake to leave it on like this.

Jason
