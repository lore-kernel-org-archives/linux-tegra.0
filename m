From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 05/14] lib: Add I/O map cache implementation
Date: Thu, 10 Jan 2013 09:17:19 +0000
Message-ID: <201301100917.19577.arnd@arndb.de>
References: <1357764194-12677-1-git-send-email-thierry.reding@avionic-design.de>
 <20130109231758.GA27065@obsidianresearch.com>
 <20130110071937.GG15212@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20130110071937.GG15212-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
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
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thursday 10 January 2013, Thierry Reding wrote:
> On Wed, Jan 09, 2013 at 04:17:58PM -0700, Jason Gunthorpe wrote:
> > On Wed, Jan 09, 2013 at 04:12:31PM -0700, Stephen Warren wrote:
> > You could decrease the size of the mapping to only span the bus
> > numbers that are configured for use via DT.
> 
> That won't work, unfortunately. The mapping is such that the bus number
> is not encoded in the uppermost bits, the extended register number is.
> So the only thing that we could do is decrease the size of the extended
> register space for *all* devices.

But you could still a method to map 16 separate areas per bus, each 65536
bytes long, which results in 1MB per bus. That is probably ok, since
very few systems have more than a handful of buses in practice.

In theory, doing static mappings on a per-page base would let you
do 16 devices at a time, but it's probably worth doing at this fine
granularity.

> > Are there any concerns about these config registers being accessed
> > from a context where a new mapping can't be made? Interrupt? Machine
> > Check? PCI-E Advanced Error Reporting?
> 
> I haven't checked but I would expect configuration space accesses to not
> happen in interrupt context. Usually they are limited to enumeration and
> driver probe.

Actually, AER probably needs this, and I believe some broken devices 
need to mask interrupts using the PCI command word in the config space,
it it can happen.

	Arnd
