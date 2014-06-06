From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: Fix typo in PLLE_MISC VREG_CTRL define
Date: Fri, 6 Jun 2014 13:18:36 +0300
Message-ID: <20140606101836.GY5961@tbergstrom-lnx.Nvidia.com>
References: <1402041968-21525-1-git-send-email-mperttunen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1402041968-21525-1-git-send-email-mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Jun 06, 2014 at 10:06:08AM +0200, Mikko Perttunen wrote:
> The mask of PLLE_MISC_VREG_CTRL was defined to be 2, which
> clearly cannot be a mask. Documentation shows that the field

It could be a 1 bit mask :) But yeah, it's incorrect indeed.

> is 2 bits long, so change this to 3.
> 

Cheers,

Peter.
