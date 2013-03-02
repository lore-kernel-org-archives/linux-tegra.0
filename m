From: Anton Vorontsov <anton-9xeibp6oKSgdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC v2 2/3] power: power_supply: Add core support for
 supplied_nodes
Date: Sat, 2 Mar 2013 14:48:33 -0800
Message-ID: <20130302224832.GA16720@lizard.sbx05280.losalca.wayport.net>
References: <1361488272-21010-1-git-send-email-rklein@nvidia.com>
 <1361488272-21010-3-git-send-email-rklein@nvidia.com>
 <5127D083.6020308@wwwdotorg.org>
 <5127EA13.9010403@nvidia.com>
 <512FB473.8060309@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <512FB473.8060309-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Feb 28, 2013 at 02:48:03PM -0500, Rhyland Klein wrote:
[...]
> Anton, David, would you be adverse to the changing of supplied_to
> from being a
> list of batteries stored in a charger to being a list of chargers
> stored in batteries?

I wonder if we can support both ways?..

Thanks,
Anton
