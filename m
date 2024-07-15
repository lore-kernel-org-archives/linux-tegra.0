Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC892188CAA;
	Mon, 15 Jul 2024 10:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721040273; cv=none; b=s3aBtw0VvtA1DWq7xLr4VxQ9MEIE+VHCRHG8rsD4TB44jFakBpd3MzKmscU3K3LZdL5q99vVft33zhAK7gicIWa13faYDBbK3a3f0snFtqY6W1LXJvAUi32I6T5kmv2xHzs6JkJs9/kpNf87W+U1mkTiTkkpH1Ny9V6rlNM1378=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721040273; c=relaxed/simple;
	bh=qjFAZY1TTcGe900zXq1VkHGLbTW98p+MUxrVFTknqq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m/GrX24r2UpNye8dkQLp04WvWtQjjHwAtjVKl6of10gqzRILwI7RqFIPQwkUbTU9jRt5b/B8aTTvmzZ/OUmWE6ooWakoXyLDUxpOmr4So05vmYNAxM+40yFVfQ0yaG2CPVAWU49G3D5lTrnApi6cn35FKZD0XkeCPYofz7ytwC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XiW8H97+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XiW8H97+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED097C4AF0A;
	Mon, 15 Jul 2024 10:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721040272;
	bh=qjFAZY1TTcGe900zXq1VkHGLbTW98p+MUxrVFTknqq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XiW8H97+/eUyQO+UirmD78Ytqi8hv41ikvZ/lRqPVrvsKGRJpmKBDpv7gODXez81v
	 NYSZ03aO/OSBjvEUO/0wcXQ7EDjF1gmscX2i10nV9iJyOG57066pE8tryVuQtirGCG
	 8oiWAyi13BMixYOUgmAhiGrIirgJpEsfPCkEJsqP4ZNuBRoOfd59zHR7BIVcztAxiG
	 Fu+uahU+DmSr+BAvrK3x9H1OdA3q/Pd0qIv1dJH9LvN18p7YusOeHc7PzHWfMMbcLC
	 dUTVoyMxJymyuZcArZSovYp59RdSlMj/H3q5Hbqx3yzVqGp/HrNIn4907zBIL/10DS
	 9WUX+4Dh67vrA==
Date: Mon, 15 Jul 2024 12:44:29 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v4 2/8] timers/migration: Move hierarchy setup into
 cpuhotplug prepare callback
Message-ID: <ZpT9jSNcCLnEScWL@localhost.localdomain>
References: <20240701-tmigr-fixes-v3-2-25cd5de318fb@linutronix.de>
 <20240703202839.8921-1-anna-maria@linutronix.de>
 <3580126.iIbC2pHGDl@steina-w>
 <4f24a2f1-0f6a-4ad4-97e3-398cd9981127@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4f24a2f1-0f6a-4ad4-97e3-398cd9981127@nvidia.com>

Hi,

Le Mon, Jul 15, 2024 at 11:39:40AM +0100, Jon Hunter a écrit :
> 
> On 11/07/2024 09:56, Alexander Stein wrote:
> > Hi,
> > 
> > Am Mittwoch, 3. Juli 2024, 22:28:39 CEST schrieb Anna-Maria Behnsen:
> > > When a CPU comes online the first time, it is possible that a new top level
> > > group will be created. In general all propagation is done from the bottom
> > > to top. This minimizes complexity and prevents possible races. But when a
> > > new top level group is created, the formely top level group needs to be
> > > connected to the new level. This is the only time, when the direction to
> > > propagate changes is changed: the changes are propagated from top (new top
> > > level group) to bottom (formerly top level group).
> > 
> > Now that this commit is integrated in linux-next I'm starting to see the
> > kernel error message:
> > > Timer migration setup failed
> > on my arm64 i.MX8MP platform (imx8mp-tqma8mpql-mba8mpxl.dts).
> 
> 
> I am also seeing the same on our 32-bit and 64-bit ARM Tegra boards.
> 
> Any feedback on this?

The patches have been reverted on -tip (still in -next?) and Anna-Maria is
working on a new version.

Thanks!



> 
> Thanks
> Jon
> 
> -- 
> nvpublic
