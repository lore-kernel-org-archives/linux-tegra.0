From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [cbootimage PATCH v3 5/5] Add two sample scripts to do rsa
 signing for T210 bootimage
Date: Fri, 9 Oct 2015 13:51:05 -0700
Message-ID: <20151009205105.GA22430@nvidia.com>
References: <1444333109-3671-1-git-send-email-jimmzhang@nvidia.com>
 <1444333109-3671-7-git-send-email-jimmzhang@nvidia.com>
 <5616D8CA.2040209@wwwdotorg.org>
 <797766912b984b9d840369e86e7b2637@HQMAIL103.nvidia.com>
 <561721CC.9030307@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <561721CC.9030307-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Oct 08, 2015 at 08:09:16PM -0600, Stephen Warren wrote:
> On 10/08/2015 08:00 PM, Jimmy Zhang wrote:
> > Stephen Warren wrote at Thursday, October 08, 2015 1:58 PM:
> >> On 10/08/2015 01:38 PM, Jimmy Zhang wrote:
> >>
> >> Should we update the Makefile to install the examples into some doc
> >> directory?
> > 
> > I am not sure how to change Makefile.
> 
> I'm sure Allen can give you an example quickly, although just having the
> files in the source distribution (in a sub-dir) is probably fine for now.

You can add a "doc_DATA = example1.txt" line to Makefile.am and that
will cause the example1.txt to get installed into:
${prefix}/share/doc/cbootimage

-Allen
