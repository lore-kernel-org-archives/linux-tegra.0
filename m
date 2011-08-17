From: Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>
Subject: Re: [RFC PATCH v2 06/13] docs/dt: Document nvidia,tegra20-pinmux
 binding
Date: Wed, 17 Aug 2011 12:43:55 +0100
Message-ID: <20110817114355.GC2909@pulham.picochip.com>
References: <1313440100-17131-1-git-send-email-swarren@nvidia.com>
 <201108161551.31389.arnd@arndb.de>
 <74CDBE0F657A3D45AFBB94109FB122FF04AEA2537D@HQMAIL01.nvidia.com>
 <201108171337.26166.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201108171337.26166.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jamie Iles <jamie-wmLquQDDieKakBO8gow8eQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Belisko Marek <marek.belisko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Guo <shawn.guo-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Sergei Shtylyov <sshtylyov-Igf4POYTYCDQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Arnd,

On Wed, Aug 17, 2011 at 01:37:25PM +0200, Arnd Bergmann wrote:
> The split I had in mind is more to the effect that the .dtsi file
> describes the set of pins that is there with their names and addresses,
> while the board specific file describes how they are set up. Does that
> make sense? I think I'm still missing some essential aspect of what the
> pinmux code actually does ;-)
> 
> I now saw that you have the full description in the
> arch/arm/mach-tegra/pinmux-t2-tables.c and arch/arm/mach-tegra/pinmux.c
> files, with all the names again, and apparently your patch set leaves
> these around. Do you think it's possible to actually move the static
> tables from there into the device tree and do the entire setup based
> on that?

The platform I'm working on has a different method of muxing for almost 
every pin (some aren't even memory mapped registers) so defining the SoC 
pin definitions in the DTS could result in some pretty horrible 
bindings.

Stephens bindings for configuring the muxing of the pins works quite 
nicely for our platform though, and I'm just about to post patches that 
abstract the tegra specific bits out.

Jamie
