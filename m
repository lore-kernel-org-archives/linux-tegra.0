From: "Chen, Kenji" <kenji.chen-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: RE: [PATCH v1 0/2] PCI/ASPM: Refine L1 PM Substates support
Date: Thu, 7 Dec 2017 15:00:43 +0000
Message-ID: <A7A4B3ECFA40144E98B82E71E29693557CA5BA74@PGSMSX102.gar.corp.intel.com>
References: <20171202211833.23146.5744.stgit@bhelgaas-glaptop.roam.corp.google.com>
 <20171205194050.GD23510@bhelgaas-glaptop.roam.corp.google.com>
 <A7A4B3ECFA40144E98B82E71E29693557CA5516C@PGSMSX102.gar.corp.intel.com>
 <20171207144515.GA11788@bhelgaas-glaptop.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171207144515.GA11788-1RhO1Y9PlrlHTL0Zs8A6p5iNqAH0jzoTYJqu5kTmcBRl57MIdRCFDg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>, Krishna Kishore <kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Patrick Georgi <pgeorgi-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rajat Jain <rajatja-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Yinghai Lu <yinghai-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stefan Reinauer <stefan.reinauer-7ChRSZmxDtxg9hUCZPvPmw@public.gmane.org>, Duncan Laurie <dlaurie-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

For Intel Broadwell, SKylake, and KabyLake PCIe Root Port, the threshold is recommended as it is in the commit. If the BIOS/Coreboot porting between platforms is taken into consideration, using a build definition or variables from somewhere of customizable zone is preferred. Let Coreboot guys make the call since I am working for Intel Only.

-----Original Message-----
From: Bjorn Helgaas [mailto:helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org] 
Sent: Thursday, December 7, 2017 10:45 PM
To: Chen, Kenji <kenji.chen-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>; Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>; David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>; Krishna Kishore <kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>; Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Patrick Georgi <pgeorgi-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>; Rajat Jain <rajatja-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>; Yinghai Lu <yinghai-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>; Stefan Reinauer <stefan.reinauer-7ChRSZmxDtxg9hUCZPvPmw@public.gmane.org>; Duncan Laurie <dlaurie-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v1 0/2] PCI/ASPM: Refine L1 PM Substates support

On Wed, Dec 06, 2017 at 01:55:37AM +0000, Chen, Kenji wrote:
> https://pcisig.com/sites/default/files/specification_documents/ECN_L1_
> PM_Substates_with_CLKREQ_31_May_2013_Rev10a.pdf

With all due respect, this doesn't seem to add any new information.
For example, the L1 PM Substates Control 1 register description from the above is basically identical to the published PCIe r3.1, sec 7.33.3.

So it doesn't answer the questions of:

  1) Why coreboot sets the L1.2 threshold to a fixed value, and

  2) How "(1 << 21) | (1 << 23) | (1 << 30)" relates to the Control 1
     register

> Pls also check My Intel Doc# 545845 for the bits fields description.

I don't have access to this document.  The Linux code I'm proposing is based on the PCIe spec and is intended to work on all hardware that conforms to that spec.  I'm not very familiar with coreboot, but maybe the L1 Substates code there is only intended to work on certain Intel chipsets and doesn't need to work on other hardware?

Bjorn

> -----Original Message-----
> From: Bjorn Helgaas [mailto:helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org]
> Sent: Wednesday, December 6, 2017 3:41 AM
> To: linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: Chen, Kenji <kenji.chen-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>; Thierry Reding 
> <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>; Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>; 
> David Daney <david.daney-YGCgFSpz5w/QT0dZR+AlfA@public.gmane.org>; Krishna Kishore 
> <kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>; linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Vidya Sagar 
> <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>; Julia Lawall <Julia.Lawall-L2FTfq7BK8M@public.gmane.org>; 
> linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Patrick Georgi <pgeorgi-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>; 
> Rajat Jain <rajatja-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>; Yinghai Lu <yinghai-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>; 
> Stefan Reinauer <stefan.reinauer-7ChRSZmxDtxg9hUCZPvPmw@public.gmane.org>; Duncan Laurie 
> <dlaurie-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> Subject: Re: [PATCH v1 0/2] PCI/ASPM: Refine L1 PM Substates support
> 
> On Sat, Dec 02, 2017 at 03:45:38PM -0600, Bjorn Helgaas wrote:
> > The PCIe active link power state is L0.  ASPM defines two low-power
> > states: L0s and L1.  The L1 PM Substates feature defines two 
> > additional low-power states: L1.1 and L2.2.
> > 
> > The L1.2 state may have substantial entry/exit latency.  Downstream 
> > devices can use the Latency Tolerance Reporting (LTR) feature to 
> > report how much latency they can tolerate.  The L1 PM Substates 
> > capability includes a programmable L1.2 threshold register.  If the 
> > downstream devices can tolerate the latency indicated by the 
> > threshold, L1.2 may be used.
> > 
> > If LTR is not enabled, the L1.2 threshold is ignored and L1.2 can be 
> > used whenever it is enabled and CLKREQ# is de-asserted.  Linux 
> > currently never enables LTR, but firmware may have done so.
> > 
> > The current L1 PM substates support in Linux sets the L1.2 threshold 
> > to a fixed value (163.84us) copied from coreboot [1].  I don't know 
> > where that value came from, and it is incorrect for some platforms, 
> > e.g., Tegra [2].
> > 
> > These patches change that so we calculate the L1.2 threshold based 
> > on values reported by the hardware, and we enable LTR whenever possible.
> > 
> > This is all just my understanding from reading the spec.  I'd be 
> > glad to be corrected if I'm going wrong.
> > 
> > I'm particularly puzzled about the coreboot code in
> > pciexp_L1_substate_commit() that sets LTR_L1.2_THRESHOLD:
> > 
> > +	pcie_update_cfg(root, root_cap + 0x08, ~0xe3ff0000,
> > +		(1 << 21) | (1 << 23) | (1 << 30));
> > 
> > This is writing the L1 PM Substates Control 1 register, but the 
> > shifts don't match up with any of the fields in the register, so 
> > this is an awfully funny way to write the threshold.
> > 
> > [1]
> > https://mail.coreboot.org/pipermail/coreboot-gerrit/2015-March/021134.
> > html [2]
> > https://lkml.kernel.org/r/1510492674-12786-1-git-send-email-vidyas@n
> > vi
> > dia.com
> > 
> > ---
> > 
> > Bjorn Helgaas (2):
> >       PCI/ASPM: Calculate LTR_L1.2_THRESHOLD from device characteristics
> >       PCI/ASPM: Enable Latency Tolerance Reporting when supported
> > 
> > 
> >  drivers/pci/pcie/aspm.c |   71 +++++++++++++++++++++++++++++++----------------
> >  drivers/pci/probe.c     |   33 ++++++++++++++++++++++
> >  include/linux/pci.h     |    2 +
> >  3 files changed, 82 insertions(+), 24 deletions(-)
> 
> I applied these with Vidya's Reviewed-by to pci/aspm for v4.16.
> 
> I'd still really like to hear from the coreboot folks about the rationale for the current coreboot code.  You folks are in a much better position to actually understand the hardware details.
> 
> Bjorn
