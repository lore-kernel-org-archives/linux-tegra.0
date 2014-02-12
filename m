From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH] ARM: tegra: don't timeout if CPU is powergated
Date: Wed, 12 Feb 2014 12:20:29 -0700
Message-ID: <52FBC97D.8040809@wwwdotorg.org>
References: <1d5ea6b7df4573d866779857922ac650fe59af60.1392078805.git.stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1d5ea6b7df4573d866779857922ac650fe59af60.1392078805.git.stefan@agner.ch>
Sender: linux-kernel-owner@vger.kernel.org
To: Stefan Agner <stefan@agner.ch>, thierry.reding@gmail.com, josephl@nvidia.com
Cc: dev@lynxeye.de, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 02/10/2014 05:44 PM, Stefan Agner wrote:
> When booting secondary CPU(s) which are not yet powergated, a wrong
> check lead to a timeout after 100 jiffies. With this patch, we only
> delay powergating if CPUs are still not powered yet.

I've applied this to Tegra's for-3.15/soc branch.
