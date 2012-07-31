From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3 00/10] ARM: tegra: Add PCIe device tree support
Date: Tue, 31 Jul 2012 10:18:15 -0600
Message-ID: <50180547.9040603@wwwdotorg.org>
References: <1343332512-28762-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1343332512-28762-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/26/2012 01:55 PM, Thierry Reding wrote:
> This patch series adds support for device tree based probing of the PCIe
> controller found on Tegra SoCs.

Thierry,

I think one thing that would help here would be to split up this series
into one per subsystem, and to get all the dependencies merged by the
respective maintainers. Preferably, each subsystem would export a stable
branch (perhaps consisting of just these patches) that I can then merge
into the Tegra tree and use as a basis for the PCIe driver itself.
Hopefully this approach will get more traction on all the non-Tegra
changes. Does that sound like a good plan?

Or, I can just take it all through the Tegra tree, but I'll definitely
need acks on all/most of the non-Tegra patches, since although the
patches themselves are quite small, I'd like to be sure that maintainers
are OK with the conceptual changes, like initializing PCI controllers
later than at present etc.
