From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC 0/5] PCI: tegra: Overhaul regulator usage
Date: Tue, 08 Apr 2014 13:21:49 -0600
Message-ID: <53444C4D.2080800@wwwdotorg.org>
References: <1396622969-17837-1-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1396622969-17837-1-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/04/2014 08:49 AM, Thierry Reding wrote:
> The current device tree binding for the regulator setup on Tegra PCIe is
> not accurate. While it does work for current use-cases, that's likely by
> accident rather than design. This series replaces the existing set of
> power-supply properties with a new set that accurately describes the
> inputs of the IP block (depending on SoC generation).
> 
> As a heads-up, this breaks backwards compatibility with prior versions
> of the device tree bindings, but I don't see a reason why that should
> keep us from fixing this properly. Not many people are currently using
> these bindings and those who are are most likely tracking upstream
> development closely enough not to be impacted by this.
> 
> I've aimed to keep the series bisectible, which has the downside of
> interleaving patches to unrelated trees (ARM and PCI). I'm hoping that
> perhaps we can find a way to merge this as a whole to keep it possible
> to bisect across the series. Although again, I guess it wouldn't be all
> that bad if that wasn't the case, given how little PCIe is actually
> being used.

I'd be happy to put this series into a branch in the Tegra tree, given
suitable acks from Bjorn on the PCI changes.
