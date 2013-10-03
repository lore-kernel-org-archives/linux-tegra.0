From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 00/12] Introduce common infra for tegra clocks
Date: Thu, 3 Oct 2013 12:16:36 +0300
Message-ID: <20131003091636.GJ3973@tbergstrom-lnx.Nvidia.com>
References: <1379946381-20125-1-git-send-email-pdeschrijver@nvidia.com>
 <524B08BD.2020902@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <524B08BD.2020902-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Oct 01, 2013 at 07:39:09PM +0200, Stephen Warren wrote:
> On 09/23/2013 08:24 AM, Peter De Schrijver wrote:
> > This patchset introduces common infrastructure for clocks which exist in
> > several Tegra SoCs. We also move Tegra114 to this new infrastructure.
> > Tegra20 and Tegra30 will be moved later in separate patchsets.
> > 
> > Changes since v1:
> > + move common clks allocation to patch 2
> > + adapt also Tegra20 and Tegra30 to the changes in patch 2
> > 
> > Boottested on dalmore, beaverboard and seaboard.
> 
> What commit is this series based on? I applied the two pre-requisites:
> 

9f186fbe58c749e2d4c0b334818705aa622fc76b Add linux-next specific files for 20130822

Cheers,

Peter.
