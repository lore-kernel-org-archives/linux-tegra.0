From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] pci: tegra: set up PADS_REFCLK_CFG1
Date: Mon, 01 Jul 2013 09:52:49 -0600
Message-ID: <51D1A5D1.8020906@wwwdotorg.org>
References: <1372365722-3318-1-git-send-email-swarren@wwwdotorg.org> <20130628193318.GA21290@manwe>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130628193318.GA21290@manwe>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/28/2013 01:33 PM, Thierry Reding wrote:
> On Thu, Jun 27, 2013 at 02:42:02PM -0600, Stephen Warren wrote:
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> 
>> The registers PADS_REFCLK_CFG are an array of 16-bit data, one
>> entry per PCIe root port. For Tegra30, we therefore need to write
>> a 3rd entry in this array. Doing so mays the mini-PCIe slot on
>> Beaver operate correctly.
>> 
>> While we're at it, add some #defines to partially document the
>> fields within these 16-bit values.

>> diff --git a/drivers/pci/host/pci-tegra.c
>> b/drivers/pci/host/pci-tegra.c

>> +#define PADS_REFCLK_CFG_REFCLK2_TERM		2  /* 6:2 */ +#define
>> PADS_REFCLK_CFG_REFCLK2_E_TERM		7 +#define
>> PADS_REFCLK_CFG_REFCLK2_PREDI		8  /* 11:8 */ +#define
>> PADS_REFCLK_CFG_REFCLK2_DRVI		12 /* 15:12 */
...
> Also can we make sure that these make it into the next version of
> the TRM? It's good already to have symbolic names, but a
> description of what they mean would be even better.

These registers will probably make it into a TRM for a future chip,
but it's quite unlikely we'll release updated TRMs for existing chips:-(

>> +	/* Configure the reference clock driver */ +	pads_writel(pcie, 
>> +		PADS_REFCLK_CFG_VALUE | (PADS_REFCLK_CFG_VALUE << 16), +
>> PADS_REFCLK_CFG0); +	pads_writel(pcie, PADS_REFCLK_CFG_VALUE,
>> PADS_REFCLK_CFG1);
> 
> If using an intermediary variable as shown above, would it hurt if
> we wrote the same value again for ports 2 and 3 instead of leaving
> the higher 16 bits unset? Given that we can write the entry for
> port 2 on Tegra20 which doesn't have a third one I'd expect the
> same to be true for port 3. That way, perhaps if some future
> generation of Tegra gets a fourth port the code won't have to be
> updated. And of course we save a few characters and instructions by
> reusing the "value" variable.

I actually meant to guard the additional write based on the number of
ports in HW. I'd certainly prefer not to write to port 3's registers
when port 3 doesn't exist. I doubt I'd be able to get a solid sign-off
that this would be guaranteed problem-free.

I'll fix up the other issues and repost.
