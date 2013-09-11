From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 09/11] tegrarcm: Add support for odmdata command
Date: Wed, 11 Sep 2013 14:12:28 -0700
Message-ID: <20130911211228.GC29868@badger>
References: <1378757761-20939-1-git-send-email-amartin@nvidia.com>
 <1378757761-20939-10-git-send-email-amartin@nvidia.com>
 <522E436F.90402@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <522E436F.90402-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Sep 09, 2013 at 02:53:51PM -0700, Stephen Warren wrote:
> On 09/09/2013 02:15 PM, Allen Martin wrote:
> > Add command "--odmdata" to pass odmdata down to the miniloader.  This
> > is used by the miniloader for things such as UART init and RAM sizing.
> > It is normally not needed and is really only useful for miniloader
> > debugging.
> 
> Does the miniloader put it into the BCT in IRAM so that the bootloader
> can also read it? If suppose we expect the correct ODMDATA to be already
> included in the BCT that tegrarcm sends though, so the bootloader
> already sees the correct value.

Yes, miniloader will update the BCT with the new value if you send
this command after downloading a BCT.  Really the only thing I'm using
this for is the side effect inside miniloader that causes it to
reinitialize the UART with the new odmdata value.  For some reason
when you donwload the BCT, miniloader does not do that, and when you
boot in recovery mode there's no initial BCT so UART never gets
initialized in miniloader and you get no debug prints.


> 
> I think usage() needs updating in this patch.

Will do.

-- 
nvpublic
