From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 1/2] ARM: tegra: Fix build error for gic update
Date: Mon, 04 Feb 2013 10:01:15 -0700
Message-ID: <510FE95B.20207@wwwdotorg.org>
References: <1359976100-28871-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1359976100-28871-1-git-send-email-hdoyu@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hiroshi Doyu <hdoyu@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-tegra@vger.kernel.org, Sami Liedes <sliedes@nvidia.com>, Russell King <linux@arm.linux.org.uk>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On 02/04/2013 04:08 AM, Hiroshi Doyu wrote:
> Fix build error in board-dt-tegra114.c(next-20130204)

Hiroshi, which tree should this patch be applied to? I assume it needs
to go through arm-soc since that's where the Tegra and GIC patches meet?
