From: Thomas Gleixner <tglx@linutronix.de>
Subject: RE: [PATCH v1] clocksource: tegra: Add nvidia,tegra30-timer compat
Date: Tue, 4 Feb 2014 20:10:05 +0100 (CET)
Message-ID: <alpine.DEB.2.02.1402042004000.24986@ionos.tec.linutronix.de>
References: <1391203779-5676-1-git-send-email-achew@nvidia.com> <52EFC652.9000209@linaro.org> <643E69AA4436674C8F39DCC2C05F763863199852C7@HQMAIL03.nvidia.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <643E69AA4436674C8F39DCC2C05F763863199852C7@HQMAIL03.nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Chew <AChew@nvidia.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, "abrestic@chromium.org" <abrestic@chromium.org>, "dgreid@chromium.org" <dgreid@chromium.org>, "katierh@chromium.org" <katierh@chromium.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, 3 Feb 2014, Andrew Chew wrote:

> > From: Daniel Lezcano [mailto:daniel.lezcano@linaro.org]
> > Sent: Monday, February 03, 2014 8:40 AM
> > To: Andrew Chew; tglx@linutronix.de; swarren@wwwdotorg.org;
> > thierry.reding@gmail.com; abrestic@chromium.org; dgreid@chromium.org;
> > katierh@chromium.org
> > Cc: linux-kernel@vger.kernel.org; linux-tegra@vger.kernel.org
> > Subject: Re: [PATCH v1] clocksource: tegra: Add nvidia,tegra30-timer compat
> > 
> > On 01/31/2014 10:29 PM, Andrew Chew wrote:
> > > There are some differences between tegra20's timer registers and
> > > tegra30's (and later).  For one thing, the watchdogs don't seem to be
> > > present in tegra20.
> > 
> > "don't seem", so it is an assumption ?
> 
> No, this is not an assumption.  It has been verified by other NVIDIA engineers
> since I proposed this change.

So why is your changelog saying "don't seem to be" ?
  
> > > Add this compatibility string in order to be able to distinguish
> > > whether the watchdogs are there or not.
> > 
> > Sorry but I don't get the connection between declaring the tegra30_timer
> > and the log. Can you elaborate please ?
> 
> I don't know what you mean by "the log".  Was that a typo?  Anyway, I

Daniel refers to the changelog.

> have a watchdog driver that I intend to follow up with, that binds
> with tegra30-timer.  I don't want this driver to be able to bind with
> tegra20-timer, because the driver won't actually work on tegra20.

So the changelog should say:

  Tegra30 and later have more timer functionality than Tegra20, but
  share the clocksource core code.

  Add a separate devicetree entry which defaults to the tegra20 code
  for now. This is preparatory work for adding new tegra30 specific
  functionality.

Thanks,

	tglx
