From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] ARM: config: enable ams AS3722 power reset driver
Date: Wed, 05 Feb 2014 10:18:11 -0700
Message-ID: <52F27253.7070307@wwwdotorg.org>
References: <1389084000-17033-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1389084000-17033-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: linux@arm.linux.org.uk, thierry.reding@gmail.com, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 01/07/2014 01:39 AM, Laxman Dewangan wrote:
> ams AS3722 is used as system PMIC for Tegra124 based Venice2.
> Enable ams AS3722 power reset driver for enabling power off
> system using PMIC.

Applied to Tegra's for-3.15/defconfig branch.
