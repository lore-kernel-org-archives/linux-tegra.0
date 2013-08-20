From: Kyle McMartin <kmcmarti-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: tegra on 3.11
Date: Tue, 20 Aug 2013 16:50:08 -0400
Message-ID: <20130820205007.GL27560@redacted.bos.redhat.com>
References: <20130820150418.GI27560@redacted.bos.redhat.com>
 <5213C0F2.9060909@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5213C0F2.9060909-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Aug 20, 2013 at 01:18:10PM -0600, Stephen Warren wrote:
> On 08/20/2013 09:04 AM, Kyle McMartin wrote:
> > Hey guys,
> > 
> > Just a quick note, I needed to pull in the patch from
> > http://marc.info/?l=linux-tegra&m=137404750420372&w=2 in order to get
> > trimslice booting from its internal SATA when using dtb to boot.
> 
> Oh dear, I can reproduce this. It looks like I didn't notice this since
> I was probably testing linux-next with Mikko's patches applied on top in
> my local branch:-(
> 
> If that patch gets applied to v3.11, then it'll cause nasty merge
> conflicts with Mikko's other USB-related patches when v3.12 comes
> around. Plus, the patch is rather large for this late stage in the
> v3.11-rc series. I think the best way is to add regulator-always-on,
> regulator-boot-on properties to the relevant VBUS regulators. I'll try
> sending a patch for that...

Thanks, we've hit another issue in Fedora where that may or may not be
the kernel (life on the bleeding edge, sigh.) but I'll re-build a known
working kernel with your patch instead of the backport and let you know
if it works for us.

regards, Kyle
