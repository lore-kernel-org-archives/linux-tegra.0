Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263842D94BF
	for <linux-tegra@vger.kernel.org>; Tue, 15 Jul 2025 11:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752579206; cv=none; b=KSTliDTwuSelSqntmo8JBID8aneWrxlRkDL+ZPCQDrAxMPsWxoHD+XzBzPCztGdrJEH7ef5ZrnGkwdetG1Diya9s5nI8c67z7evvSa7NZXNJzkbcuIrbU+UIh2M5k3cR2tLUZ/CUAIOrkn6rOUaWmFcqN2HWNeuf8EnwAg6lwfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752579206; c=relaxed/simple;
	bh=88diviApfDQpJD2jMENzqWT4d8A2upFw4c91fIkkg4c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VrQovNlsa7k+/PBf+Sgt6tAdNT0oM+UkLbFolPp0dLbI4DuY64OHh7EdrEU7jWR/yLNm+APX++4uJPzk2JWFfgWQIzfwGKpsx/Lbuc0HOwgdzRMzUOtkqrVOIajcMiFoc50d1FaO+hix4ynGI+cp27WA6meZFqI+MNL6wuZyvPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=orltr6uQ; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="orltr6uQ"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e81cf6103a6so4565418276.3
        for <linux-tegra@vger.kernel.org>; Tue, 15 Jul 2025 04:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752579204; x=1753184004; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=88diviApfDQpJD2jMENzqWT4d8A2upFw4c91fIkkg4c=;
        b=orltr6uQ8RLZm6Ygb+heN8+PDaIqWuBrHZy0Dw22TWyXQnY32LmfNLfER0s2oExrmK
         ROFiaA8EdhGQsOU/n2xVwsK4jRUOQpkqr5D9DwvghShbZCjHhidERJs36Kfw6YexAdZt
         dTHyiDV8hDbZNZBf3rLBpA23gm10zIzTAPXPNmGa7ubZX5m6eINjfCNHEh0NiVehKiFq
         aI4L6taF4sOJ+gGPnvIbaqn5SrdWsvz9LTmikPXno9/j18V8GBTbUnczk6KgxsVSE3T6
         4iNl8jnYjFrZH3N2FdqQ908IkFqHMsyTls1dbgHzf6HqsKyfvCoI1Mn8G2tOEBOcX3NT
         r0iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752579204; x=1753184004;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=88diviApfDQpJD2jMENzqWT4d8A2upFw4c91fIkkg4c=;
        b=wqzNutm+RNEgey9POZ3FdpI4ZlVwutWlbf8w6sIX5sHQp3Q7aKyIow3+MiPK23ldUA
         56QkhJ+Pdh4ifhtmiVi09qeRoW/WieGgN17rzCwpjEkmqNmxcKXDyLeqYu8YnHZHz5Yk
         hwAOH/GPPuwSEgqyEBjfoxNBHOHo/6nZxwNsP9t51NFYhnsU1IDpGwXe0tJjF/ZTlRqZ
         61LKhBDBNhy2xH8Ada/pjIMjM/2i2QnqxwGkmVSSGlDw5bTy2o40eShO6jbo42CjO7Oo
         JWRDHl2413YdeME44Z0XjxoqiemiWi+vhOf5YCG5J4W2Dht/x+afJkFzgMgrIR3wTYrN
         FelQ==
X-Forwarded-Encrypted: i=1; AJvYcCWILJm4Lkcg8libn1QZxNBEmyDajBNFmZkolQR9P5YbvbcN1KPXw8tMcoaymocdNoOjlW/4NNQ2o34xzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEQXQnImgcUUW2CDog2STumMAalP7RCF5Gvb4lS0bUYVvH98Xz
	SEPXu9k8fbFqywywiHNKU4twXsthh0x/nsnlEyrWpdgSlMlkxKNhxkWrIIKbI92VCuEfi9/0YYn
	OzUnrQZjp7nLMspU1iCog0cTLkWV2j2M1i8iyvtjkZQ==
X-Gm-Gg: ASbGnctzFs1govXs4VbnDqggoAYCDnB3NyBTj7iyKZVupQ2JTlXWpLudOP4NeM04YiV
	5wWGfq1CY+N+7cAiUgQrC+d0F956CcpUHrYrNly/lb4VAg9pgFR2cGJVZI5YH4smC/TdzpsNwkl
	gumUbpWD4ur9qcanmotlLC+kk8RQjIn0XrZiKbmjseKTheWCeQ62s6FbVY1bpGAiUBZz3Uee8hm
	rRC6AWI
X-Google-Smtp-Source: AGHT+IEyBIBuDwsQoabSLIFuYTSP2GVcw8ZsYp4a7XKGQP06kR98JNxbf6Hy9h/gvZAWrafrnCbcSntshDLjy87yAe0=
X-Received: by 2002:a05:690c:3582:b0:6fb:1e5a:fcdd with SMTP id
 00721157ae682-717d5da243fmr238268387b3.17.1752579204058; Tue, 15 Jul 2025
 04:33:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
 <CGME20250710122654eucas1p20f1179a9ff22d562d89252f924d34dae@eucas1p2.samsung.com>
 <20250701114733.636510-22-ulf.hansson@linaro.org> <212a1a56-08a5-48a5-9e98-23de632168d0@samsung.com>
 <CAPDyKFrPOgWW_=ehCjtqAUR97HoLKmgFNO3bRT50-w6A1LgGFw@mail.gmail.com> <01646690-8964-49c8-bbed-556380844b14@nvidia.com>
In-Reply-To: <01646690-8964-49c8-bbed-556380844b14@nvidia.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 15 Jul 2025 13:32:46 +0200
X-Gm-Features: Ac12FXz0jY1_GsZu3YlFaZh6cekpAdMj0ynTxC6UAWfcpDt3cSNH9q0N_tss-DI
Message-ID: <CAPDyKFooYFVrzLEqOtwb02iyEf+c6qPB8+Us1--Y-oXbJVG+SQ@mail.gmail.com>
Subject: Re: [PATCH v3 21/24] pmdomain: core: Leave powered-on genpds on until late_initcall_sync
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Saravana Kannan <saravanak@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Johan Hovold <johan@kernel.org>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Michal Simek <michal.simek@amd.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Hiago De Franco <hiago.franco@toradex.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Jul 2025 at 12:28, Jon Hunter <jonathanh@nvidia.com> wrote:
>
> Hi Ulf,
>
> On 10/07/2025 15:54, Ulf Hansson wrote:
> > On Thu, 10 Jul 2025 at 14:26, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> >>
> >> On 01.07.2025 13:47, Ulf Hansson wrote:
> >>> Powering-off a genpd that was on during boot, before all of its consumer
> >>> devices have been probed, is certainly prone to problems.
> >>>
> >>> As a step to improve this situation, let's prevent these genpds from being
> >>> powered-off until genpd_power_off_unused() gets called, which is a
> >>> late_initcall_sync().
> >>>
> >>> Note that, this still doesn't guarantee that all the consumer devices has
> >>> been probed before we allow to power-off the genpds. Yet, this should be a
> >>> step in the right direction.
> >>>
> >>> Suggested-by: Saravana Kannan <saravanak@google.com>
> >>> Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
> >>> Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xilinx ZynqMP ZCU106
> >>> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> >>
> >> This change has a side effect on some Exynos based boards, which have
> >> display and bootloader is configured to setup a splash screen on it.
> >> Since today's linux-next, those boards fails to boot, because of the
> >> IOMMU page fault.
> >
> > Thanks for reporting, let's try to fix this as soon as possible then.
> >
> >>
> >> This happens because the display controller is enabled and configured to
> >> perform the scanout from the spash-screen buffer until the respective
> >> driver will reset it in driver probe() function. This however doesn't
> >> work with IOMMU, which is being probed earlier than the display
> >> controller driver, what in turn causes IOMMU page fault once the IOMMU
> >> driver gets attached. This worked before applying this patch, because
> >> the power domain of display controller was simply turned off early
> >> effectively reseting the display controller.
> >
> > I can certainly try to help to find a solution, but I believe I need
> > some more details of what is happening.
> >
> > Perhaps you can point me to some relevant DTS file to start with?
> >
> >>
> >> This has been discussed a bit recently:
> >> https://lore.kernel.org/all/544ad69cba52a9b87447e3ac1c7fa8c3@disroot.org/
> >> and I can add a workaround for this issue in the bootloaders of those
> >> boards, but this is something that has to be somehow addressed in a
> >> generic way.
> >
> > It kind of sounds like there is a missing power-domain not being
> > described in DT for the IOMMU, but I might have understood the whole
> > thing wrong.
> >
> > Let's see if we can work something out in the next few days, otherwise
> > we need to find another way to let some genpds for these platforms to
> > opt out from this new behaviour.
>
> Have you found any resolution for this? I have also noticed a boot
> regression on one of our Tegra210 boards and bisect is pointing to this
> commit. I don't see any particular crash, but a hang on boot.

Thanks for reporting!

For Exynos we opt-out from the behaviour by enforcing a sync_state of
all PM domains upfront [1], which means before any devices get
attached.

Even if that defeats the purpose of the $subject series, this was one
way forward that solved the problem. When the boot-ordering problem
(that's how I understood the issue) for Exynos gets resolved, we
should be able to drop the hack, at least that's the idea.

>
> If there is any debug we can enable to see which pmdomain is the problem
> let me know.

There aren't many debug prints in genpd that I think makes much sense
to enable, but you can always give it a try. Since you are hanging,
obviously you can't look at the genpd debugfs data...

Note that, the interesting PM domains are those that are powered-on
when calling pm_genpd_init(). As a start, I would add some debug
prints in () to see which PM domains that are relevant to track.
Potentially you could then try to power them off and register them
accordingly with genpd. One by one, to see which of them is causing
the problem.

Another option could be to add a new genpd config flag
(GENPD_FLAG_DONT_STAY_ON or something along those lines), that informs
genpd to not set the genpd->stay_on in pm_genpd_init(). Then
tegra_powergate_add() would have to set GENPD_FLAG_DONT_STAY_ON for
those genpds that really need it.

Kind regards
Uffe

[1]
https://lore.kernel.org/all/20250711114719.189441-1-ulf.hansson@linaro.org/
