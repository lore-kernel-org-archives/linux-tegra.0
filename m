From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Tegra DRM with HDMI support (\o/)
Date: Thu, 11 Oct 2012 17:36:35 -0600
Message-ID: <50775803.1010209@wwwdotorg.org>
References: <20121011200705.GB27599@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121011200705.GB27599-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/11/2012 02:07 PM, Thierry Reding wrote:
> Hi,
> 
> I've finally managed to get HDMI working on Tegra20. Unfortunately
> the xf86-video-modesetting driver doesn't work on top of it yet,
> but I think that's a different error somewhere else and I'm still
> trying to figure out what exactly is going wrong. However, a
> framebuffer console can be run on top of it, as does a small test
> program that I've written for testing.

I should start out by saying that this is all very excellent news!
Thanks so much for your hard work on tegra-drm.

I have managed to get Harmony HDMI working, mostly just by copying the
obvious device tree entries from tegra20-trimslice.dts. This didn't
quite work immediately though, and while debugging this I found a few
issues...

(most files I mention below are in drivers/gpu/drm/tegra/)

1)

clock.c:tegra_clock_setup() calls clk_set_rate() on the PLL. However,
there is no error-checking, so any failure is completely silent and
simply results in the display not working without much clue as to why.
In my case, my monitor's preferred mode was 1920x1080 with a 154MHz
pixel clock, which required a 616MHz clock for pll_d. However,
mach-tegra/tegra20_clocks_data.c didn't have an entry for that rate,
so clk_set_rate() failed.

For reference, the following entry in tegra_pll_d_freq_table[] solves
this for me:

	{ 12000000, 616000000, 616, 12, 1, 8},

(although I have no idea if the "cpcon" field there is correct)

I imagine that output.c:tegra_connector_mode_valid() should be
querying the clock API to determine whether the desired mode clock is
actually possible, and rejecting the mode if not. In my case, I assume
that would have caused the code to fall back to some other mode, and
hopefully found one that did (my monitor apparently lists 51 modes in
the EDID after all).

2)

The code in clock.c uses lots of clk_get_sys() calls with hard-coded
clock names. We really should be using the common clock DT bindings
for this instead of hard-coding names. This is especially true since
the names differ on different SoCs, so there's a ton of
of_device_is_compatible(output->dev->of_node, "nvidia,tegra30-hdmi")
in this code.

3)

It sucks that our clock driver can't just calculate the PLL m and n
values; without this, we will end up with an almost infinitely large
tegra_pll_d_freq_table[]. I'll try and find out whether this can be fixed.
