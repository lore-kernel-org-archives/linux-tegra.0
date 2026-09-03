Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9699C4B5157
	for <linux-tegra@vger.kernel.org>; Thu,  3 Sep 2026 14:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788444946; cv=none; b=ZVDArp4UamwEW+FTbzKR7QNnFX1upiUjARlNIhSmRoRN+mKuMh3NwecJlZAKaKD4b0WhpcisaVbX6SGToKGWUXPSTEe7OemnT4F2BPglqgcD5UaPVq5Iqb1s5Np0EvuAzwTRSyjWhQe6WWDvEOROzdLl/wY/NSCYgFRa0Io0F18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788444946; c=relaxed/simple;
	bh=hdcQUPY1jy/VCFo2GhqwL1K6LRuhDS/vAEQIqI03zcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tbhib/xP0YA1dB7Fs9H2ogW9mZt5l0LtmKMXn1bAWWV5EHwjiqyKq3e/yFdbNBkfFGD7/JwXBxTYjll80oCe3i/45Hv+gv90d/0FxRhx+17YJOTRxVzGeg84/NceqxFinDSAa9gHy0M3BETqH4jF7pDf6/wWZgCKTq9y76EMtfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c+BwwitU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c+BwwitU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7B011F000E9;
	Thu,  3 Sep 2026 14:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788444934;
	bh=UE7/jFAn49MwhEKSvcSISMlSrbk246mSQRE6/IFk4zo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c+BwwitUxBHvDJW+zqUmBNzpu8Jhbdl3z8z7gXhu7jLPeZjZ3T7Rei+WIIPtGeq6v
	 57oFC/j423TMJloPyul86+OsuRBuLpr0pn8G6/pt1ffPGW55oG6fOA8TUvHFKcODT9
	 R2qdv9rW6XjW9GsDx+1J6DFdEybpZ4lV9dE55+xn4CRF/7GAHxdtT1ISb2K5642NfF
	 vOwGcMNT/HK07wucubWkX2HijrRl2FYlpmDJA3ZopDjaHlTu6M2XRdZSXuIjjvpbZT
	 VNsyVBG9rpffzlDsNlf5MB0hVIS6didlhOo4UpMAF1nV3T8lMEkuZNpE8ILcok0UGP
	 7YHatpvg9Gj+A==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.ams.internal (Postfix) with ESMTP id 7E69D1980050;
	Thu,  3 Sep 2026 10:15:29 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Thu, 03 Sep 2026 10:15:32 -0400
X-ME-Sender: <xms:AIGZaiLscKq84t9mQusL2tubKQctaCsE3fjku3XF92kPgOyQtKqJbA>
    <xme:AIGZaoqr828WVqa1-2HBI11GpmruKAscwOkyF7b3V36-kGmsNBp1zgFZJhv42vXq7
    1OYfkj-9z_50TrcNX-cUDuZKdbQBHQAkN4BXEzMj1RGWQ__Xn9tpRt0>
X-ME-Received: <xmr:AIGZao4-BwLkjwwSxsKhktDFDp3hG9NL_nJ_oR68RGw4aqO5E2QwHATxJ54>
X-ME-Proxy-Cause: dmFkZTErKF92w5SraCU0RjI5fWKGdJ1jFpZ8UDsC3ehiQy3rh+22MaN3Xc61sskS5EqzAB
    r022D56DV39ZXrDjT4BaLM5p2OKuCfmU4aE3hvk3pfG56CK5K+YYs7WUX3RnPQ3qZ5Zq0D
    pm+z4LI5Mynpo3TfH15iJ6+cHXlprfVp+KQg/zi+rQ1kN9NUx7Xam52RAMWfCPdSW/tP9h
    sY3vahhqM6g9Ih5HOISLJjA1RqCvxztgIy7Lz2rbXMUF6ShZJJ7JZjM+lADeaz2cCAWodq
    sYLdYR54UTFkDktGXnSaDFaBd9bSdPWYtIRCSR+ZZX6ACDp9EVxYffNHoadIlURNvITFQ4
    LEPimdr/p7nz4uTaLDQzPPBVlGqoa7x4Wz8qBCa7tVrjsIe/76PKLAn9FrLx2EdN28S07B
    pi1u9kc8nLHK3T04HZc7dgXpt0KFgX0IjAkXDMlR10EU2p0MUXMyGo11jUQwVRDR68JVdZ
    FkuDT4uMnBsOb4HOEOsaEuiUzBH5N7x6w1XMnNAJCCPtFEPPWy9QU9OKb/AUAjQVTppQjw
    NQWU4Q6wXLbMBt+Qzv4iOrVjiChQ6LhZ9ACIWBNGn7ml//LmD7ocKFqH0pv/0nNTz7Gdod
    f7CRh0u/5iL9sVq4ghKd0/2fHBvfvoohpfxYwQJv8jzqdTI5yM0welR2woAQ
X-ME-Proxy: <xmx:AIGZasLidSv0DXFxh5JPvrH5Ux1qY_aQl4u22nbqCF9GZ3kucGim6A>
    <xmx:AIGZanj3AtD1m37ZXq-jKYDCRqWooy_CblfBEDB6TmhDV7OkK3MKwg>
    <xmx:AIGZamE06pqtIuoh4IP8aQr-5RT7BbR0q5gg9Ole010yWLx2NRa7WQ>
    <xmx:AIGZahK7njsyz9hMrYSumJcVgs6cd7-LBvmsCrhVZ6tx29XgaE3zGQ>
    <xmx:AYGZau-96BT_qVQxXb8inT1hClOKq08StbYnWVF-ykZPH1tJdu53fNbT>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Sep 2026 10:15:28 -0400 (EDT)
Date: Thu, 3 Sep 2026 15:15:27 +0100
From: Kiryl Shutsemau <kas@kernel.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Jason Gunthorpe <jgg@nvidia.com>, 
	Pranjal Shrivastava <praan@google.com>, Mostafa Saleh <smostafa@google.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Krishna Reddy <vdumpa@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Breno Leitao <leitao@debian.org>, Kyle McMartin <jkkm@meta.com>, 
	Usama Arif <usama.arif@linux.dev>, kernel-team@meta.com, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] iommu/arm-smmu-v3: Add a cmdq_entries module
 parameter
Message-ID: <aplvJIuarj_ZrAx9@thinkstation>
References: <20260902121724.3494954-1-kas@kernel.org>
 <20260902121724.3494954-2-kas@kernel.org>
 <aphbV1FSoop1YGOQ@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aphbV1FSoop1YGOQ@nvidia.com>

On Wed, Sep 02, 2026 at 10:22:31AM -0700, Nicolin Chen wrote:
> On Wed, Sep 02, 2026 at 01:17:23PM +0100, Kiryl Shutsemau (Meta) wrote:
> > +/**
> > + * arm_smmu_queue_max_n_shift() - pick the log2 depth of a queue
> > + * @hw_shift: log2 depth the hardware allows, capped for natural alignment
> > + * @ent_sz_shift: log2 of the queue entry size in bytes
> > + * @want: number of entries asked for, or zero to use @hw_shift
> > + *
> > + * @want is rounded down to a power of two. It never sizes a queue below one
> > + * page, because coherent DMA is page granular: a shallower queue occupies the
> > + * same memory as one that fills the page, and arm_smmu_init_one_queue() stops
> > + * shrinking at a page too.
> 
> Well, since we want the cmdq depth, why not name the parameter
> "max_cmdq_depth"? Then, no rounding and more straightforward.

The max_ prefix is better, thanks. cmdq_entries does not say it is a
ceiling.

On the units, the page floor has to stay whatever we call the parameter.

Ask for 8 entries and max_n_shift comes out as 3, which the
CMDQ_BATCH_ENTRIES check in arm_smmu_device_hw_probe() rejects with
-ENXIO. The floor gives you 256 entries on a 4K kernel instead of a failed
probe.

So log2 removes the rounding but not the flooring, and the number asked for
still is not always the number you get. I would rather keep entries than
make people convert.

The rounding is not silent, either: arm_smmu_init_one_queue() already
prints "allocated %u entries for cmdq", so the effective depth lands in
dmesg whichever unit the parameter takes.

On the name itself, "depth" reads to me as a number of entries rather than
its log2, so max_cmdq_depth=8 meaning 256 seems more surprising than the
rounding it replaces.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
