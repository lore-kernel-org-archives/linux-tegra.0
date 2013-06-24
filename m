From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Fix Beaver's PCIe lane configuration
Date: Sun, 23 Jun 2013 22:21:07 -0600
Message-ID: <51C7C933.7020600@wwwdotorg.org>
References: <1371846232-31163-1-git-send-email-swarren@wwwdotorg.org> <20130622104545.GA15586@manwe>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130622104545.GA15586@manwe>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/22/2013 04:45 AM, Thierry Reding wrote:
> On Fri, Jun 21, 2013 at 02:23:52PM -0600, Stephen Warren wrote:
>> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> 
>> Beaver's PCIe lane configuration most closely matches x2 x2 x2
>> rather than x4 x1 x1, since clocks 0 and 2 are used, and lanes 0
>> and 5 are used, and the only way those align is with a x2 x2 x2
>> configuration.
> 
> Looking at the schematics again I have to agree. Thanks for
> catching this.
> 
>> Also, disable root port 1; there's nothing connected to it. Root
>> port 0 is the on-board PCIe Ethernet, and port 2 is the mini-PCIe
>> slot.
>> 
>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> --- This is to
>> be applied to Thierry's WIP PCIe driver branch.
> 
> I've applied this to my tegra/next branch and will squash it into
> the Beaver patch that's already there.
> 
> You mention another fix that might be required for PCIe on Tegra30 
> (additional write to the PADS_REFCLK_CFG1) register. Did that turn
> out to fix communication of the third port?

Yes, I have the 3rd port working. I'm just waiting on some internal IP
review in order to say something more useful in the commit description
than "here's an opaque register write that fixes something".
