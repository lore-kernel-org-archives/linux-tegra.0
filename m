From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 07/10] ARM: tegra: pcie: Add device tree support
Date: Tue, 12 Jun 2012 13:46:54 -0600
Message-ID: <4FD79CAE.9090006@wwwdotorg.org>
References: <1339427118-32263-1-git-send-email-thierry.reding@avionic-design.de> <1339427118-32263-8-git-send-email-thierry.reding@avionic-design.de> <4FD66410.7090001@wwwdotorg.org> <20120612062124.GE4040@avionic-0098.adnet.avionic-design.de> <4FD763C5.3090500@wwwdotorg.org> <20120612172041.GA28010@avionic-0098.adnet.avionic-design.de> <4FD7943E.60302@firmworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FD7943E.60302-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Jesse Barnes <jbarnes-Y1mF5jBUw70BENJcbMCuUQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/12/2012 01:10 PM, Mitch Bradley wrote:
> On 6/12/2012 7:20 AM, Thierry Reding wrote:
...
>> I came up with the following alternative:
>>
>> 	pci {
>> 		compatible = "nvidia,tegra20-pcie";
>> 		reg = <0x80003000 0x00000800   /* PADS registers */
>> 		       0x80003800 0x00000200   /* AFI registers */
>> 		       0x80004000 0x00100000   /* configuration space */
>> 		       0x80104000 0x00100000   /* extended configuration space */
>> 		       0x80400000 0x00010000   /* downstream I/O */
>> 		       0x90000000 0x10000000   /* non-prefetchable memory */
>> 		       0xa0000000 0x10000000>; /* prefetchable memory */
>> 		interrupts = <0 98 0x04   /* controller interrupt */
>> 		              0 99 0x04>; /* MSI interrupt */
>> 		status = "disabled";
>>
>> 		ranges = <0x80000000 0x80000000 0x00002000   /* 2 root ports */
>> 			  0x80004000 0x80004000 0x00100000   /* configuration space */
>> 			  0x80104000 0x80104000 0x00100000   /* extended configuration space */
>> 			  0x80400000 0x80400000 0x00010000   /* downstream I/O */
>> 			  0x90000000 0x90000000 0x10000000   /* non-prefetchable memory */
>> 			  0xa0000000 0xa0000000 0x10000000>; /* prefetchable memory */
>>
>> 		#address-cells = <1>;
>> 		#size-cells = <1>;
>>
>> 		port@80000000 {
>> 			reg = <0x80000000 0x00001000>;
>> 			status = "disabled";
>> 		};
>>
>> 		port@80001000 {
>> 			reg = <0x80001000 0x00001000>;
>> 			status = "disabled";
>> 		};
>> 	};
>>
>> The "ranges" property can probably be cleaned up a bit, but the most
>> interesting part is the port@ children, which can simply be enabled in board
>> DTS files by setting the status property to "okay". I find that somewhat more
>> intuitive to the variant with an "enable-ports" property.
>>
>> What do you think of this?
> 
> The problem is that children of a PCI-ish bus have specific expectations
> about the parent address format - the standard 3-address-cell PCI
> addressing.  So making a PCI bus node - even if it is PCIe - with 1
> address cell is a problem.

Couldn't you put the #address-cells=<3> underneath each port node, and
put any PCIe devices there rather than under the main PCIe controller
node? I'm not sure how the interrupt mapping table etc. would work in
that case, but that seems to solve the addressing issue.
