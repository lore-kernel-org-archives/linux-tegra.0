Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048E151617F
	for <linux-tegra@vger.kernel.org>; Tue, 13 Oct 2026 15:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904503; cv=none; b=qbAhaRJGwb6aFRqdOKbZjrSEu6dMYDfNTn8R0u8mdf+NNNb/Q1qomRibBfCQc6cEW8PCD1zNh8JjmSSO5O4dNJTSHQ/HCEy4alN/tsZsGvm3BP7lUH4Xa+kL8XGwAtNmYdbJezoBbBVXkGhuocNvqlnUoQgscmJEmoWuroZJWNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904503; c=relaxed/simple;
	bh=VgO+C+8KDYSTE6ugGfRNQKKkE0G27if6p6FDk0jABBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NJ6PPbRxIzli/sn9AHP3137sVI3AgFdmSJ+gs+kYvAdGO7VW3spPJ0DMcazQPPpsYNBN6f2bujbMZDbYZU32jKJNNmxfhujPlpAU3kC0OCj46CVr+R38QT7fdOYpB7AFc1lm1zzQo2oPjfZ8chp7cvl+9vhTqjbBJXVg8PBTBUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Pri0HHGe; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Pri0HHGe"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-53397325663so31887061cf.1
        for <linux-tegra@vger.kernel.org>; Tue, 13 Oct 2026 08:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1791904501; x=1792509301; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5Kz+IQfSF4Bo0R4irbQAkdmm6GDBbYpLf1oqZAlKJ38=;
        b=Pri0HHGegmXriEZla+YoNwvO9Pz/wZj7gSbnxqVwOQhypuH5HZrRYlu+somg/mDrqv
         gRsIy5o9u0lLS8ozZmr+1mIYVtk4CKbLB5MFeOMRm573PpffeO/QZQb/EFWYGWEr4Xck
         Pp2BN5RzutvBm/2bieQiJYQtoyD6skdUghgRbW4SEK65DnEE4BlGoZDj03tR/lRsdBtQ
         HDvMAlQze+B815jn0CPg/AWE6MRar7kRUbqDq/BXvhIbjVlTTI/vBVYkWJ8/WMNwLflz
         eVnxL5UEarKh4Sk6sqSp1k3/Hzr1KOZqmnjFp6exYUDeclJE3GKgljIiL642PO/c9WSW
         7+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791904501; x=1792509301;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Kz+IQfSF4Bo0R4irbQAkdmm6GDBbYpLf1oqZAlKJ38=;
        b=NaQWyptpwxL/eslHj0U9aOKyckxW48hN+uA2SCmHhM44yruhkHC0YrqwOsVbe+/2R2
         5jDtuFAflA91+EHoTuK67kQ5t0H5ia9B174MHDJitkj6fMMy+BHfbX4P4lZ6AF7Xj9X9
         NiBDNR99YXzAkNOu930Zqw65zo5W7HVYhewOQaDYIJs/fvVTOvIrtBlbLBwmBegtiDH7
         lV1e3MR/yWZQFE36IDcZjfsec8oGno4+gIgAPsh25OI4kwwVZTsft6lbrQ0jWbvh1Jk4
         epVXzaglvhEajGvOCzxtHqDw1XiwkH456TXasYxZMfyjuSzH3t01d7CyYYgpd9NGnt/i
         Rz3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwlTAke9VxPQk8hO3KfzXUaWVcJwJvU9ISt/w880qG1RnWxeSUw0MOKfZaqZi7Sq33LkO1ekqFcTrUz6A==@vger.kernel.org
X-Gm-Message-State: AFq9FYJvh7sosPrvrwWphvgiYd6Cswk3yamHHhkgo39lUKEB8hoQxw8H
	3S6WtKc5G9TeBODlZz3vKNX2SHBfqy4j8KrvSNMfpdI5LZErzM9ydfTzq+eZdl/xd8k=
X-Gm-Gg: AYBFou0hbyE5F8zs8SfCT33e/F+gIiuWDTN+EVYZ+wjEj0hzxUpvAO2s9rHvBuU7OYk
	NYklBl9DStn4Yq72FhVdWMISsVSKZ/lOuqfw0NqAoG/wswx/3kSk2vSPNQLJhtcdW6t9VuaTneF
	PA16jhhuPLayb8PLbrZHooO+yakW98jnxvp7CvIA/QA6It+dB49qWX5YF495ZjXOem/GsEan5SI
	RO2VUryYfh/Mf17NiYhPWSABOCWmjIl/Ha+dDQ4DH5Nat7uFlcp6wl5jHxzKdThJER4xEhROD/J
	7bDSOcSAWfIc3n0OSGHUZTbAX+xNi8+urPmjzaihSimBqoQ6RXRjr5kvmqJX1NLR854jcXGzSch
	8a6CduE185/uEzhN2JwxU7RYspox3Vmwese1dexr5yAX2SmLpz9u0a4M2lG2RplbdefHO7w3jln
	+wMVtXumKFRaC2snws7fMx8lg6XATMd9aqTi3dM36t2H2IhJohmws8Dan4LbzNw/v3CCGPaoj2D
	Dmq9pSR1A5yuzUP1kx9lvY1gNhpgVicvmqmnk9/Hfw9p9/XOBMug6uWT7sml1MO1G8=
X-Received: by 2002:a05:622a:e4d5:20b0:535:a5f9:752c with SMTP id d75a77b69052e-535a5f97acemr137130051cf.75.1791904499634;
        Tue, 13 Oct 2026 08:14:59 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b7e32cesm100542321cf.28.2026.10.13.08.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:14:58 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xGeDS-00000009ss0-0PwU;
	Tue, 13 Oct 2026 12:14:58 -0300
Date: Tue, 13 Oct 2026 12:14:58 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Robin Murphy <robin.murphy@arm.com>, Nicolin Chen <nicolinc@nvidia.com>,
	Will Deacon <will@kernel.org>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH RFC v6 5/5] iommu/arm-smmu-v3: Wire up shared-SID STE
 ordering and feature gating
Message-ID: <20261013151458.GL14213@ziepe.ca>
References: <20261011-smmu-shared-sid-v6-0-cb76b89dc612@nxp.com>
 <20261011-smmu-shared-sid-v6-5-cb76b89dc612@nxp.com>
 <aszfVNP6DGzWYdK0@shlinux89>
 <as1zR1wc7ERxvR1F@nvidia.com>
 <e8c22eb2-ed1f-47c7-b2ac-c56ead1cba8b@arm.com>
 <20261013124400.GI14213@ziepe.ca>
 <as5ERENDfgC6FB0b@shlinux89>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as5ERENDfgC6FB0b@shlinux89>

On Tue, Oct 13, 2026 at 10:46:28PM +0800, Peng Fan wrote:
> Hi Nicolin, Robin, Jason
> 
> On Tue, Oct 13, 2026 at 09:44:00AM -0300, Jason Gunthorpe wrote:
> >On Tue, Oct 13, 2026 at 12:22:06PM +0100, Robin Murphy wrote:
> >> If we're not going to support PASID for shared streams (which I suggest we
> >> don't...) than we shouldn't strictly need to worry about CD tables anyway.
> >> So rather than having to special-case CD table sharing for shared streams,
> >> perhaps it might make sense to generalise back to a "default" per-domain CD
> >> for non-PASID use, which can then get switched for the private per-stream
> >> cd_table if and when a device does enable PASID?
> >
> >If we have stared STEs then the group becomes the per-STE data
> >structure not the master.. We don't have any way right now to do that,
> >but it would make some sense for the group to store the shared CD
> 
> Thanks for the detailed feedback, reply you all here.
> 
> For the CD table question: since shared-SID masters are in the same
> group and always use the same domain, the CD content is identical.
> With skip_shared_ste(), only stream->master's STE (and thus its
> cd_table) is active in hardware.  The other masters' cd_tables are
> allocated but never referenced by the STE.
> 
> I see two options:
> 
> A) Keep skip_shared_ste() and add arm_smmu_cd_owner() to redirect
>    all cd_table operations to stream->master. This is a minimal
>    change that works for our use case (platform devices, no PASID,
>    no domain switching).
> 
> B) Drop skip_shared_ste() entirely and share the CD table at the
>    group or domain level. This is cleaner but a larger change.
> 
> I'm leaning towards (A) for now to keep the series focused on the
> simple shared-SID case.  Would that be acceptable, or do you prefer
> we go with (B) from the start?

I think the skip is in the wrong place perhaps?

The group is always guarenteed to have all the masters in it.

So we could split them into primary masters and secondary ones. The
secondary ones are all the devices thare share SIDs with the primary.

The group list is guarenteed to have all masters in it, so we can
simply fully skip attach from the secondary. It is guarenteed by the
group that a primary will have already attached to the STE with
exactly the same domain so the secondary just needs to do NOP.

If you do that then all these questions go away since there is only
ever one thing writing the STE, it is always stable and no issue.

This does leave a problem for master remove to switch the STE to one
of the secondaries, but that sounds like it could be managed through
the release domain mechanism, just nominate a secondary to be primary
and execute an attach on it in the normal way. The hitless STE
mechanism will make it work safely.

Jason
