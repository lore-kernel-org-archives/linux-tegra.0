From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/1] Add support for Tegra114 SPI boot device
Date: Tue, 11 Jun 2013 08:54:58 -0700
Message-ID: <20130611155458.GA8164@badger>
References: <1370421333-2748-1-git-send-email-pchiu@nvidia.com>
 <51AF7642.7090501@wwwdotorg.org>
 <E3E235BA220CA845AF2C1512C13F2662E45A228074@HKMAIL02.nvidia.com>
 <20130610180947.GA5844@badger>
 <51B6177D.8060506@wwwdotorg.org>
 <51B61AD7.3030904@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51B61AD7.3030904-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Penny Chiu <pchiu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Jun 10, 2013 at 11:28:39AM -0700, Stephen Warren wrote:
> On 06/10/2013 12:14 PM, Stephen Warren wrote:
> > On 06/10/2013 12:09 PM, Allen Martin wrote:
> >> On Mon, Jun 10, 2013 at 02:10:21AM -0700, Penny Chiu wrote:
> >>> Hi Stephen,
> >>>
> >>> Please let me know if I need to re-send the patch for fixing these problems.
> >>>
> >>
> >> Yes, please resend with a fixed commit message and you can add:
> >>
> >> Acked-by: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >>
> >> Stephen or I can apply to the cbootimage repo
> > 
> > I can fix up the commit description when I apply it. I'll do it in a
> > second...
> 
> It's applied now. Is there a need to tag a new version?
> 

Yes, the chromeos ebuild pulls by tag.  The version number in
configure.ac should match the tag, so I'll send a patch to bump the
version and tag it when it goes in.

-Allen
-- 
nvpublic
