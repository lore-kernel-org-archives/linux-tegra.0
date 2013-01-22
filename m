From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 5/5] drm/tegra: Implement page-flipping support
Date: Tue, 22 Jan 2013 11:35:34 +0200
Message-ID: <50FE5D66.2010107@nvidia.com>
References: <1358179560-26799-1-git-send-email-thierry.reding@avionic-design.de>  <1358179560-26799-6-git-send-email-thierry.reding@avionic-design.de>  <50FE4E4F.6080506@nvidia.com>  <20130122085756.GA6315@avionic-0098.adnet.avionic-design.de> <1358846121.1540.6.camel@tellur>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1358846121.1540.6.camel@tellur>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 22.01.2013 11:15, Lucas Stach wrote:
> But even if I get this out real soon, I'm not really comfortable with
> speeding things to 3.9. I would like to review the userspace side of
> thing a lot more thoroughly, before committing to the interface. But
> maybe this can also happen in the 3.9 RC timeframe.

Ok. I uploaded the libdrm patches to gitorious
(git-OGgr7I4mDcYgsBAKwltoeQ@public.gmane.org:linux-host1x/libdrm-host1x.git). We sent out the user
space patches more than a month ago, so I expect them to have fallen out
of everybody's radar long ago.

If there's a need for us to resend the patches, let me know.

Terje
