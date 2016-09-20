From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/4] ARM: tegra: nyan: Use external control for bq24735
 charger
Date: Tue, 20 Sep 2016 18:40:06 +0100
Message-ID: <00697eef-0b36-1ff5-9c7a-43c1b53b52bc@nvidia.com>
References: <20160828173246.32621-1-contact@paulk.fr>
 <20160828173246.32621-2-contact@paulk.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160828173246.32621-2-contact-W9ppeneeCTY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 28/08/16 18:32, Paul Kocialkowski wrote:
> Nyan boards come with an embedded controller that controls when to
> enable and disable the charge. Thus, it should not be left up to the
> kernel to handle that.
> 
> Using the ti,external-control property allows specifying this use-case.

So the bq24735 is populated under the EC's 'i2c-tunnel' property which
is there to specifically interface it's child devices to the host. So I
am a bit confused why this is expose to the host if it should not be used?

Again you may right and I did find the original series [0] for this
which specifically references the Acer Chromebook that needs this.
However, I am not sure why this was never populated? Is there any other
history here?

What is the actual problem you see without making this change? The
original series states ...

"On Acer Chromebook 13 (CB5-311) this module fails to load if the
charger is not inserted, and will error when it is removed."

Cheers
Jon

[0] http://marc.info/?l=linux-pm&m=145447948705686&w=2

-- 
nvpublic
