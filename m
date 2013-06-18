From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] tegrarcm: Add version command
Date: Mon, 17 Jun 2013 21:40:16 -0700
Message-ID: <20130618044016.GA8973@badger>
References: <1371525867-2551-1-git-send-email-amartin@nvidia.com>
 <51BFDB01.6030606@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51BFDB01.6030606-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jun 17, 2013 at 08:58:57PM -0700, Stephen Warren wrote:
> On 06/17/2013 09:24 PM, Allen Martin wrote:
> > Add command line option "--version" that prints the version number and
> > exits.
> 
> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> I assume you'll apply all these.

yes

> 
> Although...
> 
> > +static void print_version(char *progname)
> > +{
> > +	fprintf(stderr, "%s %s\n", PACKAGE_NAME, PACKAGE_VERSION);
> > +}
> 
> I wonder if that shouldn't print to stdout; it's the requested output of
> the command, not some error message.

Sounds reasonable.

-Allen
-- 
nvpublic
