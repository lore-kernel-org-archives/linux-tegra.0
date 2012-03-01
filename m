From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 00/10] Add tegra30 support for secondary cores
Date: Thu, 1 Mar 2012 16:35:13 +0200
Message-ID: <20120301143513.GR12917@tbergstrom-lnx.Nvidia.com>
References: <1328831277-21002-1-git-send-email-pdeschrijver@nvidia.com>
 <74CDBE0F657A3D45AFBB94109FB122FF178FACB954@HQMAIL01.nvidia.com>
 <20120229154229.GL12917@tbergstrom-lnx.Nvidia.com>
 <74CDBE0F657A3D45AFBB94109FB122FF17BDDF21F3@HQMAIL01.nvidia.com>
 <20120301114211.GP12917@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120301114211.GP12917-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Gary King <gking-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Mar 01, 2012 at 12:42:11PM +0100, Peter De Schrijver wrote:
> On Wed, Feb 29, 2012 at 11:38:16PM +0100, Stephen Warren wrote:
> > Peter De Schrijver wrote at Wednesday, February 29, 2012 8:42 AM:
> > > On Wed, Feb 15, 2012 at 10:27:43PM +0100, Stephen Warren wrote:
> > > > Peter De Schrijver wrote at Thursday, February 09, 2012 4:48 PM:
> > > > > This patchset introduces support for secondary cores on tegra30. It also
> > > > > introduces some functions for the flowcontroller and adds basic support for
> > > > > tegra30 powerdomains.
> > > >
> > > > The code looks fine to me. I do notice the following when running
> > > > "shutdown -h now":
> > > >
> > > > [   27.762124] SMP: failed to stop secondary CPUs
> > 
> > I can't seem to reproduce this at all on next-20120229 anymore. What
> > kind of repro frequency are you seeing, and does it get fixed if you
> > update to that baseline?
> > 
> 
> I see it abount once every 3 reboots. I have a an expect script which
> automates the test. I haven't tried with next-20120229 yet.
> 
> > (I tried 20 times with shutdown, and 15 of them I reverted all the CPU
> > and cache errata in case they affected the issue at all)

Tried it with next-20120229 and it works fine here. I also noticed
next-20120229 does not have https://lkml.org/lkml/2012/1/31/444
which was part of the earlier tree I used for testing. So num_online_cpus()
recalculates the number of online CPUs everytime instead of trying to only
recalculate it when there is a change.

Cheers,

Peter.
