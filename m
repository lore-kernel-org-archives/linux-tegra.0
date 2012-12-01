From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC v2 1/8] video: tegra: Add nvhost driver
Date: Sat, 1 Dec 2012 13:44:41 +0200
Message-ID: <50B9EDA9.2000500@nvidia.com>
References: <1353935954-13763-1-git-send-email-tbergstrom@nvidia.com>  <1353935954-13763-2-git-send-email-tbergstrom@nvidia.com>  <20121128212301.GA25531@avionic-0098.adnet.avionic-design.de>  <50B73710.2040102@nvidia.com>  <20121129114704.GB6150@avionic-0098.adnet.avionic-design.de>  <50B7AB93.5060207@wwwdotorg.org> <1354265429.1479.187.camel@tellur>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1354265429.1479.187.camel@tellur>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 30.11.2012 10:50, Lucas Stach wrote:
> I'm with Thierry here. I think there is a fair chance that we won't get
> the API right from the start, even when trying to come up with something
> that sounds sane to everyone. It's also not desirable to delay gr2d
> going into mainline until we are all completely satisfied with the API.
> 
> I also fail to see how host1x module being in the DRM directory hinders
> any downstream development. So I'm in favour of keeping host1x besides
> the other DRM components to lower the burden for API changes and move it
> out into some more generic directory, once we feel confident that the
> API is reasonable stable.

host1x module being in DRM directory hinders using nvhost from anywhere
outside DRM in both upstream and downstream. I also don't like first
putting the driver in one place, and then moving it with a huge commit
to another place. We'd just postpone exactly the problems that were
indicated earlier: we'd need to synchronize two trees to remove code in
one and add in another at the same time so that there wouldn't be
conflicting host1x drivers. I'd rather just add it in final place once,
and be done with it.

But if it's a make-it-or-brake-it for upstreaming, I can move it to be a
subdirectory under drivers/gpu/drm/tegra. Would this mean that we'd
modify the MAINTAINER's file so that the tegradrm entry excludes host1x
sub-directory, and I'd add another one which included only the host1x
sub-directory? The host1x part would be Supported, whereas rest of
tegradrm is Maintained.

Best regards,
Terje
