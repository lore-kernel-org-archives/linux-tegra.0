From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 1/2] ARM: tegra: dalmore: populate key mapping
Date: Mon, 13 May 2013 13:29:02 -0600
Message-ID: <51913EFE.6030103@wwwdotorg.org>
References: <1365594454-20614-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1365594454-20614-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 04/10/2013 05:47 AM, Laxman Dewangan wrote:
> Keys on Dalmore interfaced through Tegra KBC controller
> in key matrix topology.
> 
> Add the key mapping for the keys.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> ---
> The system is booted on Dalmore SKU1000 with the fastboot.

I don't intend applying these two patches.

For Dalmore, there are two SKUs, one using KBC and one using GPIOs for
the buttons/keys. The SKU that uses GPIOs is far more common, so we've
decided to support that one upstream.

We aren't actively pursuing Pluto support upstream; it's likely that
I'll send a patch to remove tegra114-pluto.dts in the near future.
