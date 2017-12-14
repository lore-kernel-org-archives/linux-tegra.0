From: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V3 1/3] PCI: tegra: Apply sw fixups to support ASPM-L1
 Sub-States
Date: Thu, 14 Dec 2017 17:39:23 -0600
Message-ID: <20171214233923.GP30595@bhelgaas-glaptop.roam.corp.google.com>
References: <1510492674-12786-1-git-send-email-vidyas@nvidia.com>
 <1510492674-12786-2-git-send-email-vidyas@nvidia.com>
 <20171120212151.GC16362@bhelgaas-glaptop.roam.corp.google.com>
 <42e1cd97-c886-4e21-c13d-8861238b9644@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <42e1cd97-c886-4e21-c13d-8861238b9644-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Dec 14, 2017 at 10:02:15PM +0530, Vidya Sagar wrote:
> On Tuesday 21 November 2017 02:51 AM, Bjorn Helgaas wrote:
> >On Sun, Nov 12, 2017 at 06:47:52PM +0530, Vidya Sagar wrote:
> >>Programs T_cmrt (Commmon Mode Restore Time) and T_pwr_on (Power On)
> >Please use the exact names used in the spec.  In this case, I think
> >that would be "Port Common_Mode_Restore_Time" and "Port T_POWER_ON"
> >(from the L1 PM Substates Capabilities Register, sec 7.33.2).
> >Searching the spec for "T_cmrt" isn't going to find anything useful.
> I'll take care of this in next patch
> >These look like things that maybe should be in the DT because they
> >depend on external component values, so you might need different
> >values depending on what board the Tegra is on?  Same for clk_m?
> I'm afraid not. These are fixed for Tegra including clk_m.

That's actually a *good* thing :)  If they're fixed and can be
embedded in the driver, that's better than having to extend the DT.

Bjorn
