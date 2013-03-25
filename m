From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] clk: tegra: Don't enable PLLs during early boot
Date: Mon, 25 Mar 2013 11:02:36 +0000
Message-ID: <20130325110236.GP4977@n2100.arm.linux.org.uk>
References: <1363953308-28828-1-git-send-email-pdeschrijver@nvidia.com> <514C7D3B.40602@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <514C7D3B.40602@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Mike Turquette <mturquette@linaro.org>, Thierry Reding <thierry.reding@avionic-design.de>, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Mar 22, 2013 at 09:48:11AM -0600, Stephen Warren wrote:
> This assumption was made long ago. I know drivers are supposed to assume
> that clocks are disabled when they're probed, but historically that
> wasn't always the case, so if the audio drivers assumed that, and then
> did clk_enable() as the first thing, they got a warning due to the
> enabling an already enabled clock and/or later attempts to disable the
> clocks wouldn't actually disable them.

No.  clocks have always been able to be enabled multiple times.  You
should only get a warning if you try and disable it more times than you
enabled it, because that's a violation of the API.

Consider two drivers sharing the same input clock.  If one driver
disables the clock more times than it enables it, then it's treading
on the other drivers need to have the clock enabled.
