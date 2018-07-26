From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: tegra clock updates and fixes
Date: Thu, 26 Jul 2018 08:22:55 -0700
Message-ID: <153261857589.48062.4721112255504541100@swboyd.mtv.corp.google.com>
References: <20180720134532.13148-1-ben.dooks@codethink.co.uk>
 <16564340083ea64de8c956ba65ea59f8@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <16564340083ea64de8c956ba65ea59f8@codethink.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Ben Dooks <ben.dooks@codethink.co.uk>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Cc: linux-kernel@lists.codethink.co.uk, jonathanh@nvidia.co, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, thierry.reding@gmail.com
List-Id: linux-tegra@vger.kernel.org

Quoting Ben Dooks (2018-07-26 06:32:29)
> On 2018-07-20 14:45, Ben Dooks wrote:
> > Hi, this is a set of clock updates and fixes we did when developing
> > the tegra20/tegra30 auto support. The audio change is due to using
> > the tegra in clock-slave mode (this hasn't been done before)
> > =

> > We have also implemented the clock reset status callback as it is
> > used by some of the driver work we did.
> =

> Is it possible to look at applying the bits of the series that are
> not currently under discussion? If so should I post a smaller series?
> =


Just send it again please. I'd prefer to see some reviewed-by tags from
Nvidia folks on bits that are good to merge.
