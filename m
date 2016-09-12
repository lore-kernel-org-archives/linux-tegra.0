From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v3 2/2] dmaengine: tegra210-adma: Add memcpy support
Date: Mon, 12 Sep 2016 15:34:08 +0100
Message-ID: <c6da41de-ca1d-c9ce-23df-f820994a49bb@nvidia.com>
References: <cover.1473186743.git.nicoleotsuka@gmail.com>
 <c730136b708404e1257eb28bb1dc2cbf13bf6023.1473186743.git.nicoleotsuka@gmail.com>
 <bafb9b89-2b45-c419-62d4-b25a50f8d6be@nvidia.com>
 <37d4645c-6318-78bd-79bb-844fb6764a1b@nvidia.com>
 <20160908173141.GA28381@Asurada-Nvidia>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160908173141.GA28381@Asurada-Nvidia>
Sender: linux-kernel-owner@vger.kernel.org
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: vinod.koul@intel.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, dmaengine@vger.kernel.org, gnurou@gmail.com, thierry.reding@gmail.com, swarren@wwwdotorg.org, ldewangan@nvidia.com
List-Id: linux-tegra@vger.kernel.org


On 08/09/16 18:31, Nicolin Chen wrote:
> On Thu, Sep 08, 2016 at 03:19:57PM +0100, Jon Hunter wrote:
> 
>> I tried this again on my audio testing branch for tegra210 and it worked ...
>>
>> [   36.427210] dmatest: Started 1 threads using dma1chan0
>> [   37.036948] dmatest: dma1chan0-copy0: summary 1024 tests, 0 failures 2410 iops 19419 KB/s (0)
>>
>> Do you have other patches in your branch? If so it would be good to
>> understand the dependency. May be we are missing a clock somewhere?
> 
> Sorry. I forgot to mention that the TEGRA210_CLK_APE_SLCG_OVR
> clock is required for the tests. So I cherry-picked 2 patches
> from your audio branch to the linux-next:
> 	clk: tegra210: Add SLCG override gate clocks
> 	ARM64: tegra: DT: Add SLCG clock for AUD
> 
> Besides these two, there'e merely some straightforward changes
> to enable the ADMA in the defconfig and DT.
> 
> And it seems that you've submitted that patch once but it got
> hold because it wasn't so useful at that time?

Yes it was not being used at the time. It is on my list of things to do
and we need to revisit it. There was some discussion on the best way to
handle these clocks from a client perspective. I am not sure we came to
a conclusion on this. I need to find some time to look at this.

Jon

-- 
nvpublic
