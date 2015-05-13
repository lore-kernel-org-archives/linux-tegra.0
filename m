From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [GIT PULL 7/8] ARM: tegra: Devicetree changes for v4.2-rc1
Date: Wed, 13 May 2015 18:09:20 +0200
Message-ID: <3095273.etWfHSyyvC@wuerfel>
References: <1431524980-13599-1-git-send-email-thierry.reding@gmail.com> <1431524980-13599-8-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1431524980-13599-8-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wednesday 13 May 2015 15:49:39 Thierry Reding wrote:
> ARM: tegra: Devicetree changes for v4.2-rc1
> 
> Contains a couple of fixes and additions to device tree files. The most
> notable change is a fix for a misapplied patch that was only exposed by
> a recent change in the regulator subsystem that caused USB to break on
> Tegra124 recently.

It sounds like I should merge commit a4b6916cb35 ("ARM: tegra: Correct
which USB controller has the UTMI pad registers") into the 4.1 fixes
branch as well. Please confirm.

> Other than that there are a more or less random assortment of additions
> to enable various features on a couple of boards.
> 

Pulled into next/dt, thanks!

	Arnd
