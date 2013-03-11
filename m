From: Shawn Guo <shawn.guo@linaro.org>
Subject: Re: [PATCH] arm: tegra: fuse: export chip id and revision
Date: Mon, 11 Mar 2013 21:51:02 +0800
Message-ID: <20130311135059.GC25910@S2101-09.ap.freescale.net>
References: <1363005441-26329-1-git-send-email-dahuang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1363005441-26329-1-git-send-email-dahuang@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Danny Huang <dahuang@nvidia.com>
Cc: linux@arm.linux.org.uk, swarren@wwwdotorg.org, ldewangan@nvidia.com, pgaikwad@nvidia.com, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Mar 11, 2013 at 08:37:21PM +0800, Danny Huang wrote:
> Expose tegra chip id and revision in /proc/cpu/chipinfo for user mode
> usage.

It should probably be done in a more generic way.  Check it out
Documentation/ABI/testing/sysfs-devices-soc.

Shawn
