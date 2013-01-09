From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 00/14] Rewrite Tegra PCIe driver
Date: Wed, 9 Jan 2013 22:25:17 +0100
Message-ID: <20130109222517.3c590553@skate>
References: <1357764194-12677-1-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1357764194-12677-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Dear Thierry Reding,

On Wed,  9 Jan 2013 21:43:00 +0100, Thierry Reding wrote:
> This patch series contains an almost complete rewrite of the Tegra PCIe
> driver. The code is moved to the drivers/pci/host directory and turned
> into a proper platform driver, adding MSI and DT support while at it.
> Other PCI host controller drivers can be added to that directory in an
> attempt to make it easier to factor out common code.

Thanks!

I have started basing the Marvell PCIe code on some of your earlier
versions. But apparently in this final version, you no longer have the
emulated Host bridge. Why so?

For the Marvell PCIe code, I've used your emulated Host bridge, and
added an emulated PCI-to-PCI bridge implementation, in order to get the
following hierarchy:

 + Host Bridge
   + PCI-to-PCI bridge
     + PCI Device
   + PCI-to-PCI bridge
     + PCI device

So, I instantiate one unique emulated Host Bridge, and then one
emulated PCI-to-PCI Bridge for each PCIe interface that I have.

The nice thing about that is that I can then read the configuration
space of the PCI-to-PCI bridge to find out how much I/O space and
memory space is needed for the device connected to this interface, and
at which address is has been mapped. This greatly helps my "address
decoding" problem, and removes the ad-hoc virtual space allocator I had
written.

Is there a reason for having given up on this idea? Is there still a
hope for a different PCIe implementation to use this idea?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
