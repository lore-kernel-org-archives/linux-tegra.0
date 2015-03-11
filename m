From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: l2c: Maintain CPU endianness for early resume
 function
Date: Wed, 11 Mar 2015 13:12:42 +0000
Message-ID: <20150311131242.GB8656@n2100.arm.linux.org.uk>
References: <1421757420-20983-1-git-send-email-digetx@gmail.com>
 <20150311101845.GL19577@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150311101845.GL19577-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Bob Mottram <bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Mar 11, 2015 at 11:18:46AM +0100, Thierry Reding wrote:
> On Tue, Jan 20, 2015 at 03:36:55PM +0300, Dmitry Osipenko wrote:
> > In big endian CPU mode l2x0_saved_regs structure stores registers values in BE
> > format. In order to maintain BE CPU mode, these values and immediate constants
> > must be converted back to LE format before writing them to cache controller.
> > 
> > Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> > ---
> >  arch/arm/mm/l2c-l2x0-resume.S | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> 
> Hi Russell,
> 
> Did you get a chance yet to review this patch? It's a dependency for
> enabling big-endian support on Tegra. As such, I wonder if you would be
> willing to ack it, so that I can take it through the Tegra tree along
> with the rest of the patches.

Yes, it's fallen through the cracks.

Acked-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>

Thanks.

-- 
FTTC broadband for 0.8mile line: currently at 10.5Mbps down 400kbps up
according to speedtest.net.
