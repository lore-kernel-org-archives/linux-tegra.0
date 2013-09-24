From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 05/12] clk: tegra: add header for common tegra clock IDs
Date: Tue, 24 Sep 2013 11:08:30 +0300
Message-ID: <20130924080830.GI30013@tbergstrom-lnx.Nvidia.com>
References: <1379515331-19427-1-git-send-email-pdeschrijver@nvidia.com>
 <1379515331-19427-6-git-send-email-pdeschrijver@nvidia.com>
 <524082E3.8070801@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <524082E3.8070801-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Sep 23, 2013 at 08:05:23PM +0200, Stephen Warren wrote:
> On 09/18/2013 08:40 AM, Peter De Schrijver wrote:
> > Many clocks are common between several Tegra SoCs. Define an enum to list
> > them so we can move them to separate files which can be shared between
> > SoCs. Each SoC specific file will provide an array with the common clocks
> > which are present on the SoC and their DT binding ID.
> 
> So, this enum is purely something internal to the driver, and is in no
> way related to the DT binding clock IDs, nor the HW peripheral clock
> register bits, and finally is a union of all extant clocks across all chips?
> 

Yes. Although there will still be the possibility to have clocks outside this
union for a while. At least until Tegra20 and Tegra30 are migrated as well.

Cheers,

Peter.
