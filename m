From: Kevin Hilman <khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [GIT PULL 3/4] ARM: tegra: device tree changes for 3.12
Date: Tue, 20 Aug 2013 16:45:34 -0700
Message-ID: <8738q4j59d.fsf@kernel.org>
References: <1376673628-5867-1-git-send-email-swarren@wwwdotorg.org>
	<1376673628-5867-3-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1376673628-5867-3-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> (Stephen
	Warren's message of "Fri, 16 Aug 2013 11:20:27 -0600")
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> writes:

> This branch contains all *.dts (device tree) changes for Tegra.
> New features enabled are:
>
> * PMICs on Dalmore
> * CPU power-gating on Dalmore
> * HDMI output on Beaver
> * LP1 system suspend mode on almost all boards
> * PCIe support on numerous Tegra20/30 boards
> * USB support on Tegra30/114 boards
> * Audio capture on Beaver and Dalmore
> * Temperature sensor on Cardhu.
>
> ... along with a few DT cleanups.

Hmm, shouldn't I have a DT maintainer signoff on this stuff... oh,
wait... ;)

> ----------------------------------------------------------------
>
> The following changes since commit ad81f0545ef01ea651886dddac4bef6cec930092:
>
>   Linux 3.11-rc1
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git tegra-for-3.12-dt
>
> for you to fetch changes up to 8af3bbec752902c0480c84613d7f10e22f485977:
>
>   ARM: tegra: add Mic Jack to Dalmore device tree

Pulled into next/dt.

Kevin
