From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 1/3] ARM: tegra: Add AHB driver
Date: Thu, 26 Apr 2012 11:14:09 +0300
Message-ID: <20120426081409.GI514@tbergstrom-lnx.Nvidia.com>
References: <1335269116-9578-1-git-send-email-hdoyu@nvidia.com>
 <20120425083747.466f5c98330af8964d980b8c@nvidia.com>
 <20120425074639.GB3423@arwen.pp.htv.fi>
 <201204251215.22889.arnd@arndb.de> <4F981F6C.2050807@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F981F6C.2050807-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "balbi-l0cyMroinI0@public.gmane.org" <balbi-l0cyMroinI0@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Apr 25, 2012 at 05:59:40PM +0200, Stephen Warren wrote:
> On 04/25/2012 06:15 AM, Arnd Bergmann wrote:
> > On Wednesday 25 April 2012, Felipe Balbi wrote:
> ...
> >>> Can this driver be located under "drivers/misc"? Or is there any better place?
> >>
> >> maybe drivers/platform/arm/ ??
> > 
> > I really wouldn't want to add that directory: It has the risk of letting
> > people add random crap there that may or may not be related to ARM (the
> > company) and/or ARM (the architecture).
> > 
> > I think it could go into drivers/amba/ along with the primecell bus driver.
> > The two drivers are for two different aspects of the AMBA spec and don't
> > actually depend on one another as far as I can tell, but it's at least
> > a fitting name, and it doesn't depend on the ARM architecture, which is
> > important because the driver could be used on other architectures that
> > are connected to an AHB bus.
> 
> Hiroshi, is this driver for something (registers/features) that AMBA
> actually specifies? AHB might be part of AMBA (I'm not familiar enough
> to know), but I don't think this aspect of Tegra's AHB bus is part of
> any core AHB/AMBA specification, rather than being some Tegra-specific
> control over the bus (given that the registers and bits correspond to
> Tegra-specific devices on the bus).
> 

The HW controlled by this 'driver' is roughly: the AHB arbiter, glue logic
between IP blocks and the AHB bus and AHB memory controller slave. All of
these are tegra specific AFAIK. So I don't see much point in a generic
driver.

Cheers,

Peter.
