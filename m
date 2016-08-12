From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/4] drm/tegra: dc: Don't disable display power partition
Date: Fri, 12 Aug 2016 16:02:57 +0100
Message-ID: <352741e6-a6ec-65cd-46ea-b734415e7c23@nvidia.com>
References: <1470134069-12178-1-git-send-email-jonathanh@nvidia.com>
 <1470134069-12178-2-git-send-email-jonathanh@nvidia.com>
 <20160812134622.GA25862@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160812134622.GA25862-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 12/08/16 14:46, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Tue, Aug 02, 2016 at 11:34:26AM +0100, Jon Hunter wrote:
>> Commit 33a8eb8d40ee ("drm/tegra: dc: Implement runtime PM") disables the
>> display power partition when probing and this causes the Tegra114
>> Dalmore to hang during boot.
>>
>> The hang occurs when accessing the MIPI calibration registers (which are
>> accessed during the configuration of the DSI interface). Ideally the
>> MIPI driver should manage the power partition itself to ensure it is on
>> when needed. The problem is that the legacy PMC APIs used for managing
>> the power partitions do not support reference counting and so this
>> cannot be easily done currently. Long-term we will migrate devices to
>> use generic PM domains and such scenarios will be easy to support. For
>> now fix this by removing the code to turn off the display power
>> partition when probing the DC and always keep the DC on so that the
>> power partition is not turned off. This is consistent with how the power
>> partition was managed prior to this commit.
>>
>> Please note that for earlier devices such as Tegra114 the MIPI
>> calibration logic is part of the display power partition, where as for
>> newer devices, such as Tegra124/210 it is part of the SOR power
>> partition. Hence, in the long-term is makes more sense to handle such
>> power partitions via the generic PM domain framework.
>>
>> Fixes: 33a8eb8d40ee ("drm/tegra: dc: Implement runtime PM")
>>
>> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>
>> Please note that the hang is only seen on Tegra114 with v4.8 if the
>> patch "ARM: tegra: Correct polarity for Tegra114 PMIC interrupt" (2nd
>> patch in series) is applied without this patch. Without the fix for the
>> PMIC interrupt polarity the Palmas PMIC probe fails and the display
>> probe also fails because the regulators are not found.
>>
>>  drivers/gpu/drm/tegra/dc.c | 21 ++++++++++++++-------
>>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> I don't think this fixes the problem at the root. After looking at the
> code I think what you're seeing is caused by the tegra_mipi_power_up()
> call that happens as part of the tegra_mipi_request() from the DSI
> driver's ->probe().

No it doesn't. It is more of a bandaid. I think that this issue has
always been there but no exposed until the move to RPM for the DC. I
can't say I was too happy with it!

> Generally there shouldn't be a problem because the display controller
> will always get enabled before the encoder (DSI) and hence the power
> partition should be enabled when the actual calibration happens. The
> fundamental problem in this case is that we're actually powering up
> the MIPI calibration logic at the wrong time. So I think what we'll
> want for a proper fix is to move all register accesses out of the
> tegra_mipi_request() function and add tegra_mipi_enable() and
> tegra_mipi_disable() functions that power up and power down the MIPI
> calibration logic, respectively. That way we can move all the code
> which relies on the power partition into the tegra_dsi_encoder_enable()
> and tegra_dsi_encoder_disable() functions.
> 
> Perhaps an even better place to call these new functions from would be
> the DSI driver's ->suspend() and ->resume() functions.
> 
> An added benefit of this will be that the MIPI calibration logic could
> be powered off when DSI is disabled (provided no other user requires it
> to be powered on), whereas currently it will remain powered even if the
> DSI output is off, since the power on happens in ->probe().
> 
> I'll go write a patch.

Great! Thanks.
Jon

-- 
nvpublic
