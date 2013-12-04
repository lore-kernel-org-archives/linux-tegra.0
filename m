From: Mike Turquette <mturquette@linaro.org>
Subject: Re: pull request for clk-tegra-next
Date: Wed, 04 Dec 2013 10:38:36 -0800
Message-ID: <20131204183836.29850.8249@quantum>
References: <20131128141826.GW26617@tbergstrom-lnx.Nvidia.com>
 <529E1659.2070103@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <529E1659.2070103@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "rob.herring@calxeda.com" <rob.herring@calxeda.com>, "pawel.moll@arm.com" <pawel.moll@arm.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Quoting Stephen Warren (2013-12-03 09:35:21)
> On 11/28/2013 07:18 AM, Peter De Schrijver wrote:
> > The following changes since commit 6ce4eac1f600b34f2f7f58f9cd8f0503d79e42ae:
> > 
> >   Linux 3.13-rc1 (2013-11-22 11:30:55 -0800)
> > 
> > are available in the git repository at:
> >   git://nv-tegra.nvidia.com/user/pdeschrijver/linux.git clk-tegra-next
> 
> Mike, this series is a dependency for my patch series that converts
> Tegra drivers to use the standard module reset API rather than a custom
> API (which is implemented in the clock driver). If you could either
> merge this pull request, or at least ack that it's OK for me to merge it
> into the Tegra tree as a dependency, that'd be helpful. Thanks.

Stephen & Peter,

Taken into clk-next.

Thanks!
Mike
