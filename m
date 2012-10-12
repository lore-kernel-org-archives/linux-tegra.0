From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Tegra DRM with HDMI support (\o/)
Date: Fri, 12 Oct 2012 09:16:10 +0800
Message-ID: <1350004570.3186.28.camel@markz-hp6200>
References: <20121011200705.GB27599@avionic-0098.mockup.avionic-design.de>
	 <50775803.1010209@wwwdotorg.org>
Reply-To: markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50775803.1010209-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, 2012-10-12 at 07:36 +0800, Stephen Warren wrote:
> On 10/11/2012 02:07 PM, Thierry Reding wrote:
> > Hi,
> > 
> > I've finally managed to get HDMI working on Tegra20. Unfortunately
> > the xf86-video-modesetting driver doesn't work on top of it yet,
> > but I think that's a different error somewhere else and I'm still
> > trying to figure out what exactly is going wrong. However, a
> > framebuffer console can be run on top of it, as does a small test
> > program that I've written for testing.
> 
> I should start out by saying that this is all very excellent news!
> Thanks so much for your hard work on tegra-drm.
> 
> I have managed to get Harmony HDMI working, mostly just by copying the
> obvious device tree entries from tegra20-trimslice.dts. This didn't
> quite work immediately though, and while debugging this I found a few
> issues...
> 
> (most files I mention below are in drivers/gpu/drm/tegra/)
> 
> 1)
> 
> clock.c:tegra_clock_setup() calls clk_set_rate() on the PLL. However,
> there is no error-checking, so any failure is completely silent and
> simply results in the display not working without much clue as to why.
> In my case, my monitor's preferred mode was 1920x1080 with a 154MHz
> pixel clock, which required a 616MHz clock for pll_d. However,
> mach-tegra/tegra20_clocks_data.c didn't have an entry for that rate,
> so clk_set_rate() failed.
> 
> For reference, the following entry in tegra_pll_d_freq_table[] solves
> this for me:
> 
> 	{ 12000000, 616000000, 616, 12, 1, 8},
> 
> (although I have no idea if the "cpcon" field there is correct)
> 
> I imagine that output.c:tegra_connector_mode_valid() should be
> querying the clock API to determine whether the desired mode clock is
> actually possible, and rejecting the mode if not. In my case, I assume
> that would have caused the code to fall back to some other mode, and
> hopefully found one that did (my monitor apparently lists 51 modes in
> the EDID after all).
> 
> 2)
> 
> The code in clock.c uses lots of clk_get_sys() calls with hard-coded
> clock names. We really should be using the common clock DT bindings
> for this instead of hard-coding names. This is especially true since
> the names differ on different SoCs, so there's a ton of
> of_device_is_compatible(output->dev->of_node, "nvidia,tegra30-hdmi")
> in this code.
> 

Agree. But I've no idea how to utilize this common clock DT bindings in
code. Could you give me some example codes or some reference docs?

> 3)
> 
> It sucks that our clock driver can't just calculate the PLL m and n
> values; without this, we will end up with an almost infinitely large
> tegra_pll_d_freq_table[]. I'll try and find out whether this can be fixed.
> --

Absolutely. This is a problem when I debug HDMI issues. HDMI devices
usually have a lot of video modes which require a lot of clock
definitions. Seems in our downstream kernel, the clock driver will
calculate the m/n values if the fixed clock table can't meet the
requirement. I just feel strange that why we don't upstream this part of
codes...

> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
