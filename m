From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 2/2] clk: tegra20: Enable lock-status polling for PLLs
Date: Tue, 4 Sep 2018 12:06:36 +0300
Message-ID: <201809041206.37080.digetx@gmail.com>
References: <20180830184210.5369-1-digetx@gmail.com> <909e2a52-4116-9ee7-db23-8ea1dfffade0@gmail.com> <20180903080111.GR1636@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180903080111.GR1636@tbergstrom-lnx.Nvidia.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Monday 03 September 2018 11:01:11 Peter De Schrijver wrote:
> On Fri, Aug 31, 2018 at 12:45:17PM +0300, Dmitry Osipenko wrote:
> > On 8/31/18 12:29 PM, Peter De Schrijver wrote:
> > > On Thu, Aug 30, 2018 at 09:42:10PM +0300, Dmitry Osipenko wrote:
> > >> Currently all PLL's on Tegra20 use a hardcoded delay despite of having
> > >> a lock-status bit. The lock-status polling was disabled ~7 years ago
> > >> because PLLE was failing to lock and was a suspicion that other PLLs
> > >> might be faulty too. Other PLLs are okay, hence enable the lock-status
> > >> polling for them. This reduces delay of any operation that require PLL
> > >> to lock.
> > >>
> > >> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > >> ---
> > >>
> > >> Changelog:
> > >>
> > >> v2:	Don't enable polling for PLLE as it known to not being able to
> > >> lock.
> > >
> > > This isn't correct. The lock bit of PLLE can declare lock too early,
> > > but the PLL itself does lock.
> >
> > Indeed, it locks but can't be polled for the lock-status as it doesn't
> > have the lock-status bit.
> >
> > Do you want me to adjust the commit description or it is fine as is?
>
> I think it's better to adjust it.

Okay. I expect to get a review from you for the other clock (and related) 
patches too and will send the new version once all the current patches will 
be reviewed. Please take a look at them once you'll have some free time, 
thanks.

> > It is also a bit odd that PLLE has "lock_delay = 0", is it correct?
>
> That seems odd yes..

:)
