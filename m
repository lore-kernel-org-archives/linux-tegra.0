From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: [PATCH 9/9] ARM: omap3: cpuidle: enable time keeping
Date: Fri, 29 Mar 2013 17:05:38 +0530
Message-ID: <51557C8A.4060607@ti.com>
References: <1364553095-25110-1-git-send-email-daniel.lezcano@linaro.org> <1364553095-25110-9-git-send-email-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1364553095-25110-9-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: rjw@sisk.pl, linux-pm@vger.kernel.org, patches@linaro.org, linaro-kernel@lists.linaro.org, linux-arm-kernel@lists.infradead.org, linux@arm.linux.org.uk, rnayak@ti.com, swarren@wwwdotorg.org, linux-tegra@vger.kernel.org, horms+renesas@verge.net.au, arnd@arndb.de, lenb@kernel.org, nsekhar@ti.com
List-Id: linux-tegra@vger.kernel.org

On Friday 29 March 2013 04:01 PM, Daniel Lezcano wrote:
> The TIME_VALID flag is specified for the different states but
> the time residency computation is not done, no tk flag, no time
> computation in the idle function.
> 
> Set the en_core_tk_irqen flag to activate it.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> ---
Acked-by: Santosh Shilimkar <santosh.shilimkar@ti.com>

