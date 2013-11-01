From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/3] clk: tegra: Properly setup PWM clock on Tegra30
Date: Fri, 1 Nov 2013 18:47:09 +0200
Message-ID: <20131101164709.GA22111@tbergstrom-lnx.Nvidia.com>
References: <1383061872-27899-1-git-send-email-treding@nvidia.com>
 <1383061872-27899-3-git-send-email-treding@nvidia.com>
 <52701062.30405@wwwdotorg.org> <20131030210023.GB7686@mithrandir>
 <52717C4F.6000202@wwwdotorg.org> <20131030225443.GB6939@mithrandir>
 <20131031153923.GW22111@tbergstrom-lnx.Nvidia.com>
 <20131101093840.GF27864@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131101093840.GF27864-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> > 
> > And also not validated. Also by policy PLLC2 and PLLC3 are used for scaling
> > IP blocks. So I don't think it makes sense to use them for PWM?
> 
> But the policy is already defined in the clock initialization tables, so
> we could still setup the clock to exhibit all the possible HW choices
> and simply not use those excluded "by policy".
> 

That's only the 'default'. Nothing prevents a driver from doing a clk_set_parent().

Cheers,

Peter.
