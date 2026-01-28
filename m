Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA8E34320F;
	Wed, 28 Jan 2026 22:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769638634; cv=none; b=QpGyqrqliuMBIXxPFX7Z4lTtqIUmSrFLm7gYRZOnbz0my0atLoZRGqu74X1ApvdZ+qLpoFXzSnCskbQmCbAWLfg15ipyl1RgD62dsZBHRSSyMxh3tgbjLMIKRfX44Ake+lkIuKttDoWKBPobJM4CFnUzft/LMkusQ5J1Biw+BW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769638634; c=relaxed/simple;
	bh=YQz+cBzq/MsHDZmRgM/UQQ1FngP0gS87SaSpcUYwM1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aRj4WRnB5qPS3rJzZrbQY3V7LKDhlweGuWexycVyXIJXE41pI6poGJfOeEXTSB0VnhY+9kviI2gtKT+QdTAYqxkex0J5ud4/zvajGX1p944/mZfff9N75p5MiCJ8DhKMPATnsItWqoJDSQr/IFmxIZFpkK9vpYWIi/2vMIHa15g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YxmVjl/S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YxmVjl/S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B5FAC4CEF1;
	Wed, 28 Jan 2026 22:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769638633;
	bh=YQz+cBzq/MsHDZmRgM/UQQ1FngP0gS87SaSpcUYwM1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YxmVjl/S7jrqFM1WGBRBs5tPPu6WXQ0088dQd/wFnYBAILdgaKe0hlwhfkBNo+N1s
	 Tld7VEVCVw4ddVZgFkPQEZreJuFi2DnGSRbEa9iP162u+tcs2r/MBu0kJsiXEv8iPT
	 vocmTOENFOI02LmLbU4TIJw9d926E4yri0HIARYqhEbka+o9OL894jR0ps1GzWPizS
	 khHJMxeNSDQXXm181w1TZ4jqHeeVNsCnuteOYfTNb7r0mMl5Z8mpaCj6OwLxpy+vt/
	 v6uGcJGO4+N28+hMEJmsmNzw/RRwC3UagFKMnrZKMwukxIV9yi9ptpCCM5wyyOi5SV
	 d74a3NkJZn82Q==
Date: Wed, 28 Jan 2026 23:17:10 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Kartik Rajput <kkartik@nvidia.com>
Cc: ldewangan@nvidia.com, digetx@gmail.com, thierry.reding@gmail.com, 
	jonathanh@nvidia.com, akhilrajeev@nvidia.com, smangipudi@nvidia.com, 
	linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 2/4] i2c: tegra: Move variant to tegra_i2c_hw_feature
Message-ID: <aXqKnm3yR5G1I0Ut@zenone.zhora.eu>
References: <20260121153012.92243-1-kkartik@nvidia.com>
 <20260121153012.92243-3-kkartik@nvidia.com>
 <aXJe_2JC7KgfBgLa@zenone.zhora.eu>
 <e0d498a4-ddfe-40b3-af45-f07d2c5c2e62@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0d498a4-ddfe-40b3-af45-f07d2c5c2e62@nvidia.com>

Hi Kartik,

> > > @@ -280,7 +282,6 @@ struct tegra_i2c_hw_feature {
> > >    * @base_phys: physical base address of the I2C controller
> > >    * @cont_id: I2C controller ID, used for packet header
> > >    * @irq: IRQ number of transfer complete interrupt
> > > - * @variant: This represents the I2C controller variant.
> > >    * @msg_complete: transfer completion notifier
> > >    * @msg_buf_remaining: size of unsent data in the message buffer
> > >    * @msg_len: length of message in current transfer
> > > @@ -332,13 +333,12 @@ struct tegra_i2c_dev {
> > >        bool atomic_mode;
> > >        bool dma_mode;
> > >        bool msg_read;
> > > -     enum tegra_i2c_variant variant;
> > >   };
> > > 
> > >   #define IS_DVC(dev) (IS_ENABLED(CONFIG_ARCH_TEGRA_2x_SOC) && \
> > > -                  (dev)->variant == TEGRA_I2C_VARIANT_DVC)
> > > +                  (dev)->hw->variant == TEGRA_I2C_VARIANT_DVC)
> > >   #define IS_VI(dev)  (IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC) && \
> > > -                  (dev)->variant == TEGRA_I2C_VARIANT_VI)
> > > +                  (dev)->hw->variant == TEGRA_I2C_VARIANT_VI)
> > > 
> > >   static void dvc_writel(struct tegra_i2c_dev *i2c_dev, u32 val,
> > >                       unsigned int reg)
> > > @@ -1647,8 +1647,42 @@ static const struct tegra_i2c_hw_feature tegra20_i2c_hw = {
> > >        .has_interface_timing_reg = false,
> > >        .enable_hs_mode_support = false,
> > >        .has_mutex = false,
> > > +     .variant = TEGRA_I2C_VARIANT_DEFAULT,
> > >   };
> > 
> > in v8 I made a question at this point, could you please answer?

...

> Are you referring to the following question on v7 of this series, which I've already addressed?
> https://lore.kernel.org/linux-tegra/c3cdece5-1bf6-46eb-a668-2ee2a4358a88@nvidia.com/#t

I'm sorry, what have you addressed. It doesn't look addressed to
me. In the same series, I want to avoid adding something in one
patch and removing it in the next. It just adds noise.

Andi
