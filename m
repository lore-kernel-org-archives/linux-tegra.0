From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH v2 2/6] ASoC: Allow the DAPM routes to be stored in
	device tree
Date: Sat, 10 Dec 2011 12:49:23 +0000
Message-ID: <20111210124921.GA20568@opensource.wolfsonmicro.com>
References: <1323291510-22338-1-git-send-email-swarren@nvidia.com> <1323291510-22338-2-git-send-email-swarren@nvidia.com> <20111208043149.GA31372@opensource.wolfsonmicro.com> <74CDBE0F657A3D45AFBB94109FB122FF17518605B1@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF17518605B1-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Dec 09, 2011 at 01:52:00PM -0800, Stephen Warren wrote:

> I'd originally made this property specific to the Tegra+WM8903 machine
> driver, and you'd asked me to make it generic. Is there room to use
> the binding above for the Tegra+WM8903 machine driver only, in order
> to get the driver converted to DT, then define/implement something
> completely generic to replace it, i.e. the stuff below?

I was asking for the code to be generic, not the binding itself.  If the 
code could for example take a property name as an argument that'd allow 
other bindings to use the same code without having to have a generic 
binding which has bits which depend strongly on some Linux specific
machine driver.

> This would be a fair bit of work to implement, but what are your thoughts
> on the binding example below? It's very strongly based on ASoC, but since
> that's so strongly based on the HW, I think you can consider it a pure
> HW model rather than something derived from the way the driver works.

It's starting to get an idiomatic way of representing the external
nodes, HDA is probably a good source of inspiration :)  We do need to
have a think about the jacks, though - simple ones are fine but
multifinction is more fun.
