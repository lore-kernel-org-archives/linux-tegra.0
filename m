From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [tegrarcm PATCH 2/2] tegrarcm: Add support for loading MTS
Date: Wed, 11 Mar 2015 15:37:44 +0000
Message-ID: <b7c1cba9c31042d4a8be3756f5f78455@HQMAIL105.nvidia.com>
References: <1421194802-28198-1-git-send-email-jimmzhang@nvidia.com>
 <1421194802-28198-3-git-send-email-jimmzhang@nvidia.com>
 <20150311104624.GP19577@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150311104624.GP19577-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Thierry Reding wrote at Wednesday, March 11, 2015 4:46 AM:
> On Tue, Jan 13, 2015 at 04:20:02PM -0800, Jimmy Zhang wrote:
> > From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >
> > The Denver CPU in Tegra132 requires microcode to be loaded before CPU
> > initialization.  There are two microcode files required, "preboot" MTS
> > and MTS proper.  Add support for loading MTS from either the binary
> > versions checked in or from the command line.

> > @@ -117,6 +131,16 @@ static void usage(char *progname)
> >  	fprintf(stderr, "\t\tminiloader\n");
> >  	fprintf(stderr, "\t--miniloader_entry=<mlentry>\n");
> >  	fprintf(stderr, "\t\tSpecify the entry point for the miniloader\n");
> > +	fprintf(stderr, "\t--preboot=pbfile\n");
> > +	fprintf(stderr, "\t\tRead the preboot mts ucode from file instead of using built-in\n");
> > +	fprintf(stderr, "\t\tpreboot mts\n");
> > +	fprintf(stderr, "\t--preboot_entry=<pbentry>\n");
> 
> Can we please change this to --preboot-entry...
> 
> > +	fprintf(stderr, "\t\tSpecify the entry point for the preboot mts ucode\n");
> > +	fprintf(stderr, "\t--mts=mtsfile\n");
> > +	fprintf(stderr, "\t\tRead the mts ucode from file instead of using built-in\n");
> > +	fprintf(stderr, "\t\tmts\n");
> > +	fprintf(stderr, "\t--mts_entry=<mtsentry>\n");
> 
> and this to --mts-entry? I know we've used underscores in the past, but
> they are very unconventional in command-line options and I mistype them
> every time.
> 
> I have local patches to convert the existing command-line options from
> underscores to dashes as well. I'll send those out after these patches
> have been applied.

I think it makes sense to accept dashes instead of underscores, but we shouldn't remove support for the existing cmdline options, so that the tool remains backwards-compatible with any scripts anyone has, and their muscle memory.
