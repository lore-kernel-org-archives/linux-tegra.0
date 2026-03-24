Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C548370D78;
	Tue, 24 Mar 2026 08:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774341922; cv=none; b=RiPNMyniB+Rql4Fv6q3ipV28x6cQhMuidZzKmE2TnK3kTlNIduB3wgh7OmcbJWbCcrNt7SFTqs6b23cf61YH/D21AM2e9vvrCWFTy+CekRA/Tz3Hvv5+ZuWcnqBxZWnNdudBhb+5sR42aI1RDJPH5yBnVv2flarIa9hMgO2D3Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774341922; c=relaxed/simple;
	bh=PPl/rC2OPLdnK/BWcMFaxt/YnKgshXcEJ8ivDfLY7fY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LA7CuVCO7AlKKfqJt5tOyPGJPDLp/NEU9EMfn2eG2sm9+0IOgztmlYxqUKOGWqbfanQ5qGollxODYjSBtQpgveRK2xWcFWtGKMyBQVQhB4qwYQk6ijn4iCosHMglXDj8raxzXQ9RokbkCBVdgcvgm1910tSwgxA9px9PW9q54Mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eJqB4X8W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eJqB4X8W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCD75C19424;
	Tue, 24 Mar 2026 08:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774341921;
	bh=PPl/rC2OPLdnK/BWcMFaxt/YnKgshXcEJ8ivDfLY7fY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eJqB4X8WYlPyGiXK2O72S3SKONpGWaKEpkxoGJ27JTZsE1lPhe7Q39be9Hv6pPMKG
	 ALJEOMY/OdEkWXpEWlJJh/Pn7rwVLFl+J4a+4HDZWmuvWq53YjhiUQWc5bZ4K8OyND
	 7fOLFjcUMvSdOBDYTFMyude1IDU8Qkia0mG2sTLGykgzkF3zwFyw9zhDiPt2MNQb+Q
	 gTRnKdOkcpoQBgC/ORayqvOFe5ZYYkE8tPxs+kH5msRm8S6U2hDEtVvEStWvfuI7cC
	 vMEmsn2ByBeE/8+byN/E8XEAFD/FCiA0CJl0o8muSPEme+Zgdr/1o4eWjLnZESpfVH
	 cqH8jFw1OGq8g==
Date: Tue, 24 Mar 2026 09:45:16 +0100
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	mark.rutland@arm.com, bjorn.andersson@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com, mani@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH] firmware: psci: Set pm_set_resume/suspend_via_firmware()
 for SYSTEM_SUSPEND
Message-ID: <acJPHGIW1fb7whsu@lpieralisi>
References: <20251231162126.7728-1-manivannan.sadhasivam@oss.qualcomm.com>
 <d7a8271e-f6a5-491c-be2a-7ebc7d37645d@nvidia.com>
 <b5860d64-6eed-453e-8261-2c8b0c5571c4@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b5860d64-6eed-453e-8261-2c8b0c5571c4@nvidia.com>

On Mon, Mar 23, 2026 at 10:10:00AM +0000, Jon Hunter wrote:
> Hi Mark, Lorenzo,
> 
> On 12/03/2026 19:00, Jon Hunter wrote:
> > Hi all,
> > 
> > On 31/12/2025 16:21, Manivannan Sadhasivam wrote:
> > > From: Konrad Dybcio <konradybcio@kernel.org>
> > > 
> > > PSCI specification defines the SYSTEM_SUSPEND feature which enables the
> > > firmware to implement the suspend to RAM (S2RAM) functionality by
> > > transitioning the system to a deeper low power state. When the system
> > > enters such state, the power to the peripheral devices might be
> > > removed. So
> > > the respective device drivers must prepare for the possible removal
> > > of the
> > > power by performing actions such as shutting down or resetting the device
> > > in their system suspend callbacks.
> > > 
> > > The Linux PM framework allows the platform drivers to convey this info to
> > > device drivers by calling the pm_set_suspend_via_firmware() and
> > > pm_set_resume_via_firmware() APIs.
> > > 
> > > Hence, if the PSCI firmware supports SYSTEM_SUSPEND feature, call
> > > the above
> > > mentioned APIs in the psci_system_suspend_begin() and
> > > psci_system_suspend_enter() callbacks.
> > > 
> > > Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > > Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
> > > [mani: reworded the description to be more elaborative]
> > > Signed-off-by: Manivannan Sadhasivam
> > > <manivannan.sadhasivam@oss.qualcomm.com>
> > > ---
> > > 
> > > This patch was part of an old series that didn't make it to mainline
> > > due to
> > > objections in the binding and exposing CPU_SUSPEND as S2RAM patches:
> > > https://lore.kernel.org/all/20241028-topic-cpu_suspend_s2ram-
> > > v1-0-9fdd9a04b75c@oss.qualcomm.com/
> > > 
> > > But this patch on its own is useful for platforms implementing the S2RAM
> > > feature in PSCI firmware. So I picked it up, tested on Qcom X1E T14s and
> > > resending it.
> > > 
> > >   drivers/firmware/psci/psci.c | 10 ++++++++++
> > >   1 file changed, 10 insertions(+)
> > > 
> > > diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
> > > index 38ca190d4a22..e73bae6cb23a 100644
> > > --- a/drivers/firmware/psci/psci.c
> > > +++ b/drivers/firmware/psci/psci.c
> > > @@ -539,12 +539,22 @@ static int psci_system_suspend(unsigned long
> > > unused)
> > >   static int psci_system_suspend_enter(suspend_state_t state)
> > >   {
> > > +    pm_set_resume_via_firmware();
> > > +
> > >       return cpu_suspend(0, psci_system_suspend);
> > >   }
> > > +static int psci_system_suspend_begin(suspend_state_t state)
> > > +{
> > > +    pm_set_suspend_via_firmware();
> > > +
> > > +    return 0;
> > > +}
> > > +
> > >   static const struct platform_suspend_ops psci_suspend_ops = {
> > >       .valid          = suspend_valid_only_mem,
> > >       .enter          = psci_system_suspend_enter,
> > > +    .begin          = psci_system_suspend_begin,
> > >   };
> > >   static void __init psci_init_system_reset2(void)
> > 
> > 
> > I wanted to ask what the status of this patch is?
> > 
> > It turns out that since commit f3ac2ff14834 ("PCI/ASPM: Enable all
> > ClockPM and ASPM states for devicetree platforms"), this fix is also
> > need for Tegra platforms that have NVMe devices to ensure that they are
> > suspended as needed. There is some more background in this thread [0].
> 
> 
> Any feedback on this? I am not sure if this patch is purposely being
> ignored, but if so, I would like to understand why.

It fell through the cracks, apologies.

Lorenzo
