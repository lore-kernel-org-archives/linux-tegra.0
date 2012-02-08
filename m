From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH v2 02/10] pwm: Allow chips to support multiple PWMs.
Date: Wed, 8 Feb 2012 09:17:20 +0000
Message-ID: <20120208091720.GI889@n2100.arm.linux.org.uk>
References: <1328541585-24642-1-git-send-email-thierry.reding@avionic-design.de> <1328541585-24642-3-git-send-email-thierry.reding@avionic-design.de> <4F31AB63.3020301@gmail.com> <20120208081508.GA6673@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120208081508.GA6673-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Feb 08, 2012 at 09:15:08AM +0100, Thierry Reding wrote:
> * Ryan Mallon wrote:
> > On 07/02/12 02:19, Thierry Reding wrote:
> > > The total maximum number of PWM devices is currently fixed to 64, but
> > > can easily be made configurable via Kconfig.
> > 
> > It would be better to make the code handle arbitrary numbers of PWMs. A
> > Kconfig knob becomes annoying when you have more than one platform
> > configured into the kernel.
> 
> AFAICT handling an arbitrary number of PWMs will only be possible once we get
> rid of the global namespace and therefore should be postponed for later. I
> may be wrong, though, so if anybody can point me in the right direction I'm
> perfectly happy to change that in this series.

One solution would be to look at how genirq handles this.  Eg, it uses a
radix tree to store the irqdescs rather than an array, and a bitmap
showing which global numbers are allocated.
