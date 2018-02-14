From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 1/2] memory: tegra: Squash tegra20-mc into common
 tegra-mc driver
Date: Wed, 14 Feb 2018 13:15:46 +0200
Message-ID: <20180214111546.GR5850@tbergstrom-lnx.Nvidia.com>
References: <cover.1518452709.git.digetx@gmail.com>
 <148ce8c56ad764fc8133e0d97e43f9639cae15ff.1518452709.git.digetx@gmail.com>
 <20180213103039.GA6764@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180213103039.GA6764@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Feb 13, 2018 at 11:30:39AM +0100, Thierry Reding wrote:
> >  	}
> 
> It's odd that we don't have an MC clock on Tegra2. I wonder if perhaps
> we just never implemented one, or it uses one which is always on by
> default. Cc Peter to see if he knows.

We do, it has DT ID TEGRA20_CLK_MC. However, it looks like the modeling is
incorrect for Tegra20. Unlike on Tegra30 where the MC clock can be either
half or the same as the EMC clock, it is always half the EMC clock on
Tegra20. This happens to work because we likely never change the MC clock
and the non-existing bit just reads as 0, which means half the MC clock.

Peter.
