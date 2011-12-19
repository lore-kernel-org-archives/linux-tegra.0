From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH v7 00/14] Add support for tegra30 and cardhu
Date: Mon, 19 Dec 2011 14:21:29 +0200
Message-ID: <20111219122129.GA2840@tbergstrom-lnx.Nvidia.com>
References: <1323875032-18221-1-git-send-email-pdeschrijver@nvidia.com>
 <20111218044831.GB4336@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20111218044831.GB4336@quad.lixom.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Randy Dunlap <rdunlap@xenotime.net>, Russell King <linux@arm.linux.org.uk>, Colin Cross <ccross@android.com>, Stephen Warren <swarren@nvidia.com>, Gary King <gking@nvidia.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Sun, Dec 18, 2011 at 05:48:31AM +0100, Olof Johansson wrote:
> On Wed, Dec 14, 2011 at 05:03:12PM +0200, Peter De Schrijver wrote:
> > This patchset adds support for the tegra30 SoC and the cardhu development
> > board.
> 
> Thanks, applied to for-3.3/dt (first patch) and for-3.3/soc (the rest).
> I didn't want to split up too much between the branches and make
> cross-dependencies since that defeats most of the idea behind topic branches,
> so I left it at that.
> 
> I rebased for-3.3/soc (which only had one patch on it before) to be on top of
> rmk's devel-stable and for-3.3/dt, and will tell Arnd about those dependencies
> when sending up the branches -- other SoCs have similar dependencies already so
> it's not a problem.
> 
> I had to do some minor touchups, including redoing the move of board-dt.c due
> to other changes to the file. Please check final contents of the branch and let
> me know if there's a problem.
> 
> Also, the defconfig needs to be updated to enable t30 support as well as move
> over to the new config option for t20. I'll post a patch in a few minutes.
> 
> Please let me know how the branch looks as soon as practical, since the
> clock is ticking on getting the branches into arm-soc in the next few
> days for the upcoming merge window.
> 

Branch boots fine on my cardhu board.

Cheers,

Peter.
