Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793886969;
	b=0fPi75inr9BJ/ZSjfaTN8TNiG4m1RzdMV1nHUhaL0w+FbQm/ywI4efusGo2GmO+yW9Pk
	 S8kyz7ExCvCihll2OIV7mpN4pggei8onPKazg0fO8MOtwpUWIGles8kOe+7SFcMJ2hbA/
	 YEmezEqG+SyCkti53WTRNH/BfumZGyewX4aH2wmexA6HxBtilkez+TqhRpa9JJZmNqrdL
	 iytoxof/YtBDzLHLwaJbQBTRkpZEu+gXs/gQh5JsFPeGITxU0rCEk4rEo35TkE0py/NV5
	 +7pBtPxI9kQEDR7LIGRCcX7HIw+q9V9a6ts4BcJutAj0cuT3ekYYS2hZw7+LgD8L1Jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793886969;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=TAD50w4Kgmmwo5lPSjT+aAIMNVyfykU0qm7hKIpfWJE=;
	b=i7D3uF4qBRgpqakc7oHyYJ0TdmjYH2FRD+AcnpI/oHIxXOnpxqogmclxKrcDvif35FqP
	 YaGYjOCjAnJVJZMxFTzCfNTEprKNi+Qz3uIj2YykFib/CUG+5YjlXK0+T8I82Bz5GeuIA
	 fWeujhYOFPNUtsbIIUL4b1d5sAinnQpH+VBmBTuKQTEd4yc8w1frGM7PHQ7QDtN7ecOEM
	 wZOxyiNsj3rO6XhHvxlhd0gXZMkQtVQlavdBRq5BspinkKqSY+iLGwJ3kupzoIGGOPceC
	 CdHE0C9TWgOJgoOneK9/OXSwFYAkJzOnsGCMJdK9HOq7f63yUEmN7VBLoNyhWa3+b4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XdeYV5o4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F56606A326;
	Thu,  5 Nov 2026 13:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XdeYV5o4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 184911F00919;
	Thu,  5 Nov 2026 13:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793886968;
	bh=TAD50w4Kgmmwo5lPSjT+aAIMNVyfykU0qm7hKIpfWJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XdeYV5o4FFKHNhtNT2A9GVAg5b4ZTBernk7rOs899cnx0TEnmoFSNbIWbOIzMlz0U
	 Bdx0KdRvGTGYsyyKqjdb++QSlk09uMeGIcyXWfghAe9vGOgNOc4+2bpzkC2kwQg7d8
	 IM9ll6b+qbZ8Ca04ggAzXfOQ08U1pi41yqrBzT+kTZ6vgp/a1hTmK1q3hLbkk/QYaD
	 3H9ueTpy5SCuojkzBHsZ8xDYvCitMF5kSeEEkPolxgnyLKNpnGAXZl+Wf1ehzYR1Cy
	 +eD7M7VEq8XKyERZVIl2hAt1bgH0fM73uiyd4WoOLVVB4+Du3fNvL05/QzYOM50dmc
	 Zq+trhgrr2g6Q==
Date: Thu, 5 Nov 2026 13:56:02 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>, arm <arm@kernel.org>,
	soc@kernel.org, Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Mika Westerberg <westeri@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
	Sizhe Liu <liusizhe5@huawei.com>
Subject: Re: [GIT PULL 4/7] firmware/tegra: Changes for v7.4-rc1
Message-ID: <20261105-tan-stingray-of-amplitude-cf5cff@sudeepholla>
References: <auslF5pwDHtcNoCy@orome>
 <bcad1d7e-387d-4251-8974-7f0dcd2f9734@app.fastmail.com>
 <autADOKsSVVMn6r9@orome>
 <CAJZ5v0iyaHGj2b7H8g0nqrxvz8GpXiE6hkVp9RM7KF+KDckjrA@mail.gmail.com>
 <autmcaraWcXIoRfZ@ashevche-desk.local>
 <20261104161125.00000523@oss.qualcomm.com>
 <20261105-inventive-partridge-of-maturity-793a2e@sudeepholla>
 <8f45711b-d415-4694-a47a-12d4b7427e0f@app.fastmail.com>
 <20261105-quizzical-wine-oryx-e6f91a@sudeepholla>
 <aux_4NxiWvD9uVev@orome>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aux_4NxiWvD9uVev@orome>

On Thu, Nov 05, 2026 at 02:31:31PM +0100, Thierry Reding wrote:
> On Thu, Nov 05, 2026 at 10:23:24AM +0000, Sudeep Holla wrote:
> > On Thu, Nov 05, 2026 at 10:54:42AM +0100, Arnd Bergmann wrote:
> > > On Thu, Nov 5, 2026, at 10:30, Sudeep Holla wrote:

[...]

> > 
> > I’ve quickly reviewed the patch; it does implements a custom method BMRQ
> > rather than a standard or out-of-the-box solution. More details on this is
> > used based on my understanding below.
> 
> To get everyone on the same page: in a nutshell, BPMP is a separate
> processor that handles various aspects of power management (Boot and
> Power Management Processor). The CPU communicates with it over a shared
> memory region and a mailbox/doorbell for signalling.
> 

I interpret this as PCC is used where needed and that aligns well with
my understanding.

> > > How does this relate to the EC and PCC interfaces in ACPI systems?
> > > 
> > 
> > I am still evaluating how the BPMP driver is intended to operate on ACPI
> > systems. In the meantime, I share the same questions noted above. The current
> > commit message lists several driver features that may not be required for
> > ACPI, which has introduced some clarity issues regarding the intended design.
> 
> My understanding is that an ACPI systems, as opposed to DT where we do
> this all through kernel drivers, the inter-processor communication is
> done via AML. This is because standard power management operations use
> this same mechanism to enable clocks, deassert resets, etc.
> 

Thanks for confirming this. I think we are almost aligned with respect to
the expectations from any ACPI system firmware.

> > > In current mainline, I see that the bpmp driver is used on DT systems
> > > by the tegra specific cpufreq, memory and pci drivers, but I would
> > > expect that on ACPI those all use shared drivers. Are there any other
> > > users that are not already covered on ACPI?
> > > 
> > 
> > For ACPI systems, CPUFreq operates through CPPC via PCC, MEMIO, or
> > supported backends.
> > 
> > My understanding is that the BMRQ method is called by tegra_bpmp_transfer(),
> > which supports Tegra-specific drivers for power domains, clocks, resets,
> > I2C, PCIe, and memory. On ACPI, these can be abstracted through PCC
> > OpRegions as part of standard methods like _ON/_OFF or other device state
> > methods. Although device/memory DVFS is trickier since the ACPI
> > specification lacks standard methods for it today, the commit message
> > implies these components are largely unused on ACPI systems.
> 
> I think this goes back to the disconnect from the patch thread and
> earlier in this discussion: the intent was very much to encapsulate all
> the power management within standard ACPI methods, and that's working
> fine, hence why clocks, resets and power domains are not getting exposed
> on ACPI systems.
> 

Agreed and I think we are aligned.

> However, there's no equivalent in ACPI to expose these MBWT knobs, hence
> the need to expose this through BPMP directly.
> 

IIUC this is Memory Bandwidth Throttling and shouldn't that align with
Arm MPAM and resctrl framework in the kernel ? We now have MPAM via PCC,
so if the firmware exposes the right interface, you must be able to reuse
that. Even otherwise, shouldn't to make this fit with resctrl ? What am I
missing ?

-- 
Regards,
Sudeep
