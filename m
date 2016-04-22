From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 4/5] regulator: core: Add early supply resolution for a
 bypassed regulator
Date: Fri, 22 Apr 2016 12:26:57 +0100
Message-ID: <571A0A81.4010009@nvidia.com>
References: <1461255121-5245-1-git-send-email-jonathanh@nvidia.com>
 <1461255121-5245-5-git-send-email-jonathanh@nvidia.com>
 <20160422104837.GC3217@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160422104837.GC3217@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Thierry Reding <treding@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


On 22/04/16 11:48, Mark Brown wrote:
> * PGP Signed by an unknown key
> 
> On Thu, Apr 21, 2016 at 05:12:00PM +0100, Jon Hunter wrote:
> 
>> A regulator that is in bypass will fail to be registered because we will
>> attempt to get the voltage of the regulator (ie. it's bypass voltage)
>> before the supply for the regulator has been resolved. Therefore, when
>> getting the voltage for a bypassed regulator, if the supply has not been
>> resolved, then attempt to resolve it. Additionally, move the setup of
>> the regulator's supply name to before the call to
>> set_machine_constraints() so that it can be resolved.
> 
> The basic pattern here makes sense but rather than doing this
> specifically in the case where we have a bypassed supply we didn't 
> resolve yet I think we should instead always try to resolve the supply
> but ignore the error unless we actively need the supply.  I'd be
> surprised if we didn't run into other cases where we need to do this so
> it seems better to try the resolution in one place.

OK. Sorry if I have misunderstood you here, but this sounds more like
Thierry's initial proposal [0] but ignoring the any errors returned (and
we need to fix-up the locking in this patch). In the discussion that
followed I thought we agreed to only do this for the bypass case [1]. As
far as I am concerned either will work, but to confirm we should just
always try to resolve the supply early during regulator_register(), correct?

Cheers
Jon

[0] http://marc.info/?t=146003907800001&r=1&w=2
[1] http://marc.info/?l=linux-kernel&m=146038421710211&w=2	
