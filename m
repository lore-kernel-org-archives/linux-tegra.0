From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [v4 1/6] ARM: tegra: Use DT /cpu node to detect number of CPU
 core
Date: Mon, 28 Jan 2013 11:04:19 -0700
Message-ID: <5106BDA3.8090009@wwwdotorg.org>
References: <1359025829-22306-1-git-send-email-hdoyu@nvidia.com> <1359025829-22306-2-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1359025829-22306-2-git-send-email-hdoyu@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hiroshi Doyu <hdoyu@nvidia.com>
Cc: linux-tegra@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Olof Johansson <olof@lixom.net>, Jason Cooper <jason@lakedaemon.net>, Shawn Guo <shawn.guo@linaro.org>, Andrew Lunn <andrew@lunn.ch>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 01/24/2013 04:10 AM, Hiroshi Doyu wrote:
> Tegra SoCs does not use SCU based to detect CPU core numbers but they
> use DT /cpu node. If it's not provided or failed, it continues as a
> single core.

I've applied patch 1 to Tegra's for-3.9/scu-base-rework branch, and
patches 2-6 to Tegra's for-3.9/soc-t114 branch.
