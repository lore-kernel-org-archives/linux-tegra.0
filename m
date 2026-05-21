Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B7433B6F9;
	Thu, 21 May 2026 16:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779380682; cv=none; b=NldpbM4xowqn5HXR7YbRu+stcXZiCrFgZHpdfKcbp2+GvQoUQGVZ81YgOfAwxTW+8frEsvL24xp/cqTSmRqbwLp7ayTZCFCFG6WK74DI29atAkU344hHACsVxZa2aDjhTtCAfPj86m9bC0Gl6nOYxqvLt+zQu3Vk+xVD5ETnPd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779380682; c=relaxed/simple;
	bh=MLWZXLeTqSvLcz8wPu1MtFWu1KwlNVzWwtB4U3otJuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CM65XjHlDcoyg5DthAfg3gpKOuIKYHbnB9GKMJ/soTW3Zprv44/yYE1fDNchKICaNMAY+XqcFVECr1mlUuD6qovWPhqjnmX6UZjhlDBPRLYwlF8wd1KABifo5ImN9XjjquBhniOdHTzeyyLfyAynIXa/Tg1RF/RwRezVOwsU8k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oTuUMrLM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oTuUMrLM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 988511F000E9;
	Thu, 21 May 2026 16:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779380681;
	bh=ksaTnf0cqRZNXRWIsXImk13kcKMosFx8tMXi881IeTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oTuUMrLMrINhZ0HC8rI2RyPAEwsTZARy4XoUfq2JHYVySSBMhIlOSBZ70vjw6UJMD
	 3KEYhdncefsrE+EtmGcUmb+JCP9bZkYXbZdS6raEeDsuXBNTqa07PdlUpyIicOIQ8/
	 j40I2zrLvJMeXnw++vObStveSjzhIMYpR9q1c2PVHxD5xtoOio4HqvdhSUzAQCjLd8
	 qO4ExBq7TQC9yMS832pBSMFV68NCm3ZA5XLoGo8YUoQrcBGEyP1W8voUJgxoF+wS+V
	 wQJm21t/4ap+4bVdMJ5UX7L6LUy3JWspBAgUY4m7NhfMt5J8aHwbQMB3fORk7wUog1
	 w4zKSNzlJTFaQ==
Date: Thu, 21 May 2026 17:24:36 +0100
From: Lee Jones <lee@kernel.org>
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: (subset) [PATCH 0/4] power: sys-off: fix Pixel C shutdown via
 MAX77620
Message-ID: <20260521162436.GG3591266@google.com>
References: <20260514-smaug-poweroff-v1-0-30f9a4688966@tecnico.ulisboa.pt>
 <177929432727.2891971.15568098895295536822.b4-ty@b4>
 <31ef61bd-6672-440a-a52e-eedb950d3d03@tecnico.ulisboa.pt>
 <20260521104136.GA2921053@google.com>
 <f98bcd81-29c6-4df2-8040-d17686b28f45@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f98bcd81-29c6-4df2-8040-d17686b28f45@tecnico.ulisboa.pt>

On Thu, 21 May 2026, Diogo Ivo wrote:

> 
> 
> On 5/21/26 12:41, Lee Jones wrote:
> > On Thu, 21 May 2026, Diogo Ivo wrote:
> > 
> > > Hi Lee,
> > > 
> > > On 5/20/26 18:25, Lee Jones wrote:
> > > > On Thu, 14 May 2026 16:47:18 +0200, Diogo Ivo wrote:
> > > > > This series migrates PSCI and MAX77620 poweroff handling to the
> > > > > sys-off framework and fixes shutdown on the Pixel C (Smaug).
> > > > > 
> > > > > The first two patches replace legacy pm_power_off usage in the PSCI
> > > > > and MAX77620 drivers with sys-off handlers. Besides aligning both
> > > > > drivers with the modern poweroff infrastructure, this removes the
> > > > > global callback dependency and allows multiple handlers to coexist
> > > > > with explicit priorities.
> > > > > 
> > > > > [...]
> > > > 
> > > > Applied, thanks!
> > > 
> > > Thanks for applying the patches! Just a question and an observation:
> > > 
> > >   - I'm assuming you were ok with merging [2/4] despite the possible
> > >     deadlock since this risk is already present in mainline in the same
> > >     form so we're not actually making things worse, is that so?
> > 
> > Did you see the text below?
> 
> Yes, but patch 3 is not addressing the possible deadlock hence my
> question.
> 
> > Both patches 2 and 3 are applied.
> > 
> > >   - The observation is that the comment about overriding PSCI is only
> > >     true after (and if) a reworked [1/4] is actually merged.
> > >     If it isn't then patch [3/4] is actually working around another handler
> > >     in soc/tegra/pmc.c where a handler that only does work for the Nexus
> > >     7 is actually registered at FIRMWARE level for all platforms that
> > >     probe that driver (I will send out a patch shortly to only register
> > >     the handler on the Nexus 7).
> > 
> > I assume the other patches will be applied soon.
> > 
> > If this causes some kind of issue - let me know later on in the cycle
> > and I'll remove whatever patches you ask me to.
> 
> The PSCI patch [1/4] has a fundamental issue and needs a respin to be
> applied.
> 
> In connection with this it might then become easier to quirk the PSCI
> driver rather than the PMIC driver, so for the moment I'll ask you to
> drop [3/4] until I propose the changes to the PSCI maintainers and see
> the feedback and at that point we can either completely drop [3/4] or
> reapply it; sorry for the noise.

Done.

-- 
Lee Jones
