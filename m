From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 1/1] amba: tegra-ahb: Fix warning w/o PM_SLEEP
Date: Mon, 26 Nov 2012 14:01:15 -0700
Message-ID: <50B3D89B.8090607@wwwdotorg.org>
References: <1353501697-25345-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1353501697-25345-1-git-send-email-hdoyu@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hiroshi Doyu <hdoyu@nvidia.com>
Cc: linux-tegra@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 11/21/2012 05:41 AM, Hiroshi Doyu wrote:
> Fix build warning w/o PM_SLEEP.
> 
> Change-Id: Id5b7d089de835025b5708fa345a75990fd976363

Thanks, applied, with commit description fixed up to remove the Change-Id.
