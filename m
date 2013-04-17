From: Anton Vorontsov <anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH V2 2/3] power: power_supply: Add core support for
 supplied_from
Date: Tue, 16 Apr 2013 18:55:41 -0700
Message-ID: <20130417015541.GC18418@lizard.mcd26095.sjc.wayport.net>
References: <1364852755-17425-1-git-send-email-rklein@nvidia.com>
 <1364852755-17425-3-git-send-email-rklein@nvidia.com>
 <515B4E32.8080006@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <515B4E32.8080006-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Apr 02, 2013 at 03:31:30PM -0600, Stephen Warren wrote:
> On 04/01/2013 03:45 PM, Rhyland Klein wrote:
> > This patch adds support for supplies to register a list of char *'s
> > which represent the list of supplies which supply them. This is the
> > opposite as the supplied_to list.
> 
> This patch resolves the concerns I had before, so,
> Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Thanks a lot for the work, folks! With some fixes (see comments for patch
3/3), this is now in battery-2.6.git tree.

Anton
