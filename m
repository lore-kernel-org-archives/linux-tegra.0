From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 5/9] ARM: tegra2: cpuidle: change driver initialization
Date: Fri, 29 Mar 2013 10:02:47 -0600
Message-ID: <5155BB27.4000405@wwwdotorg.org>
References: <1364553095-25110-1-git-send-email-daniel.lezcano@linaro.org> <1364553095-25110-5-git-send-email-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1364553095-25110-5-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-pm-owner@vger.kernel.org
To: Joseph Lo <josephl@nvidia.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, rjw@sisk.pl, linux-pm@vger.kernel.org, patches@linaro.org, linaro-kernel@lists.linaro.org, linux-arm-kernel@lists.infradead.org, linux@arm.linux.org.uk, rnayak@ti.com, linux-tegra@vger.kernel.org, horms+renesas@verge.net.au, santosh.shilimkar@ti.com, arnd@arndb.de, lenb@kernel.org, nsekhar@ti.com
List-Id: linux-tegra@vger.kernel.org

On 03/29/2013 04:31 AM, Daniel Lezcano wrote:
> Initialize the idle states directly in the driver structure.
> 
> That prevents extra structure declaration and memcpy at init time.

Joseph, can you please review/ack patch 5/9 and patch 6/9. Thanks.
