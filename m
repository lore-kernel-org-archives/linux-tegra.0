From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 1/1] ARM: tegra: configure power off for Dalmore
Date: Mon, 19 Aug 2013 10:44:53 -0600
Message-ID: <52124B85.8080808@wwwdotorg.org>
References: <1376894028-30060-1-git-send-email-bilhuang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1376894028-30060-1-git-send-email-bilhuang@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bill Huang <bilhuang@nvidia.com>
Cc: rob.herring@calxeda.com, pawel.moll@arm.com, mark.rutland@arm.com, ian.campbell@citrix.com, linux@arm.linux.org.uk, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 08/19/2013 12:33 AM, Bill Huang wrote:
> Add DT property to tell the regulator to register pm_power_off to make
> "shutdown" work.

Thanks. I've forwarded this to arm-soc for hopeful inclusion in 3.12,
since it was just a little late to get into the main set of pull
requests I sent.
